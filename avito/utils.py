import numpy as np

def train_validation_holdout_split(df, seed=11):
    np.random.seed(seed)
    user_ids = df['user_id'].unique()
    num_users = len(user_ids)
    np.random.shuffle(user_ids)
    train = df[df['user_id'].isin(user_ids[0:int(num_users * 0.7)])]
    validation = df[df['user_id'].isin(user_ids[int(num_users * 0.7):int(num_users * 0.85)])]
    holdout = df[df['user_id'].isin(user_ids[int(num_users * 0.85):])]
    return train, validation, holdout
