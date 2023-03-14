#!/usr/bin/env python3
"""A module to list all documents"""


def list_all(mongo_collection):
    """list all document in Mongo collection"""
    return mongo_collection.find()
