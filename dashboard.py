import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
from sqlalchemy import create_engine
engine = create_engine("mysql+mysqlconnector://root:AniRedd%402141@localhost:3306/cohortiq")
def load_data():
    users = pd.read_sql("SELECT * FROM users", engine)
    sessions = pd.read_sql("SELECT * FROM sessions", engine)
    return users, sessions
users_df, sessions_df = load_data()
st.title("CohortIQ: Churn Dashboard")
st.sidebar.title("Filters")
platform = st.sidebar.selectbox("Signup Platform", ["All"] + list(users_df['signup_platform'].unique()))
sessions_df['session_end'] = pd.to_datetime(sessions_df['session_end'])
users_df['signup_date'] = pd.to_datetime(users_df['signup_date'])
last_sessions = sessions_df.groupby('user_id')['session_end'].max().reset_index()
df = pd.merge(users_df, last_sessions, on='user_id', how='left')
df['days_since_last'] = (pd.to_datetime("2025-07-01") - df['session_end']).dt.days
df['churned'] = df['days_since_last'] > 30
if platform != "All":
    df = df[df['signup_platform'] == platform]
st.metric("Total Users", len(df))
st.metric("Churn Rate", f"{df['churned'].mean():.0%}")
st.subheader("Churn by Referral Source")
churn_by_ref = df.groupby('referral_source')['churned'].mean().sort_values()
st.bar_chart(churn_by_ref)
if df['churned'].mean() > 0.5:
    st.error(" High churn rate detected! Send marketing a passive-aggressive Slack.")