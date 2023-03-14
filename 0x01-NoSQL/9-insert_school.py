#!/usr/bin/env python3
"""Inserts a document into a collection"""


def insert_school(mongo_collection, **kwargs):
    """Inserts a document into a collection"""
    return mongo_collection.insert_one(kwargs).inserted_id
