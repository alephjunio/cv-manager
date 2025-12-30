package db

import (
	"context"

	"github.com/alephjunio/cv-manager/config"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

func New(databaseName string) (database *mongo.Database, err error) {
	env := config.GetEnv()

	if env.DBUrl == "" {
		env.DBUrl = config.DB_URL
	}

	if databaseName == "" {
		databaseName = env.DBName
	}

	if databaseName == "" {
		databaseName = config.DB_NAME
	}

	clientOptions := options.Client().ApplyURI(env.DBUrl)
	client, err := mongo.Connect(context.Background(), clientOptions)
	if err != nil {
		return nil, err
	}

	err = client.Ping(context.Background(), nil)
	if err != nil {
		return nil, err
	}

	db := client.Database(databaseName)
	return db, nil
}
