# Threat Composer | ECS Project
<!-- Project badges -->
![CI/CD](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-blue)
![Terraform](https://img.shields.io/badge/IaC-Terraform-purple)
![Docker](https://img.shields.io/badge/Container-Docker-blue)
![AWS ECS](https://img.shields.io/badge/AWS-ECS-orange)


## Description

The objective of the project was to containerise and deploy an application using Docker, Terraform and ECS Fargate using HTTPS and a custom domain.


## Architecture

![architecture diagram](./images/ecs-diagram1.drawio.png)


## Deployed Application 

![Screenshot of https://zaitech.uk](./images/tc-tm.zaitech.uk-works.png)

## 📌 Overview

ThreatComposer ECS is a DevOps-driven deployment of the ThreatComposer application using **AWS ECS**. It is designed for scalability, security and automation.

This project focuses on:
- Containerized workloads 
- Infrastructure as Code
- CI/CD pipelines
---

## Features

- Containerized ThreatComposer service
- ECS Task Definitions & Services
- Secure networking
- ECS Fargate

## 📁 Repository Structure

```text
.
├── app/            
├── ├──docker/             
├── terraform/              
│   ├── ecs/
│   ├── vpc/
│   └── iam/
├── .github/workflows/    
├── images/                   
└── README.md