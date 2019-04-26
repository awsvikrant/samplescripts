# ECR Image Pushed at in localtime

When you describe aws ecr image, "imagePushedAt" is the date and time, expressed in standard JavaScript date format, at which the current image was pushed to the repository. This script will help give output in local time. 

```
aws-support:~/Documents/python$ aws ecr describe-images --output json --repository-name hello-world | python ./localtime.py | jq .
{
  "imageDetails": [
    {
      "imageSizeInBytes": 49364795,
      "imageDigest": "sha256:19b4de06b1d5bc96b051eb9a7a12ef37d577011d7150b707db1b83db48972e68",
      "imageTags": [
        "cac6497"
      ],
      "registryId": "012345678912",
      "repositoryName": "hello-world",
      "imagePushedAt": "2018-12-19 10:07:42"
    },
    {
      "imageSizeInBytes": 49364767,
      "imageDigest": "sha256:a58dc8305dfb5e011713bb2b123e6842f2cd120ae2bf5c7642da5d389fda2e6d",
      "imageTags": [
        "8ca4045"
      ],
      "registryId": "012345678912",
      "repositoryName": "hello-world",
      "imagePushedAt": "2018-12-19 09:42:29"
    },
    {
      "imageDigest": "sha256:ac9f70d676e71d3cf325a8906b4c660d9b197cb732535752ff83da3a970c939d",
      "imageSizeInBytes": 49364795,
      "repositoryName": "hello-world",
      "registryId": "012345678912",
      "imagePushedAt": "2018-12-19 09:53:47"
    },
    {
      "imageDigest": "sha256:a4085eb8f208ef51b8140e73c098948cf189d5d2ba18e5bdbd58620aed03cd3d",
      "imageSizeInBytes": 49364781,
      "repositoryName": "hello-world",
      "registryId": "012345678912",
      "imagePushedAt": "2018-12-19 10:50:46"
    },
    {
      "imageSizeInBytes": 49364795,
      "imageDigest": "sha256:75b2ddcfc4cc3be3b3f0b0594ead17752bb3a1af4165592da40220ae29338efc",
      "imageTags": [
        "45c5bb9"
      ],
      "registryId": "012345678912",
      "repositoryName": "hello-world",
      "imagePushedAt": "2018-12-19 10:03:22"
    },
    {
      "imageSizeInBytes": 49364781,
      "imageDigest": "sha256:f812399375048b48893ac275a8c349e12b2d970fc133a14dc27332638af64c4d",
      "imageTags": [
        "e8c1b7d"
      ],
      "registryId": "012345678912",
...
...
...
      "imagePushedAt": "2018-12-19 10:54:16"
    },
    {
      "imageSizeInBytes": 49364801,
      "imageDigest": "sha256:31a9448c1fb3a716a7e164f8091fdaac226c837a2d6aec1777c8dbf1e4610bf8",
      "imageTags": [
        "5b59673",
        "latest"
      ],
      "registryId": "012345678912",
      "repositoryName": "hello-world",
      "imagePushedAt": "2018-12-19 14:03:15"
    },
    {
      "imageDigest": "sha256:06916fbeba5d477d2b264d143deec2ded60046ee12d1862b3675b45a364886d3",
      "imageSizeInBytes": 49364769,
      "repositoryName": "hello-world",
      "registryId": "012345678912",
      "imagePushedAt": "2018-12-18 22:32:35"
    },
    {
      "imageDigest": "sha256:4a4339f7d48d697c5068d4e572e30cbac554d4ddc8fe4b09bc3bba265f340209",
      "imageSizeInBytes": 49364799,
      "repositoryName": "hello-world",
      "registryId": "012345678912",
      "imagePushedAt": "2018-12-19 11:02:56"
    },
    {
      "imageSizeInBytes": 49364688,
      "imageDigest": "sha256:63dba1dad8fe8a920226a631f8189d736b4a5129c2d2edc046a46f36ffc0091c",
      "imageTags": [
        "52444f0"
      ],
      "registryId": "012345678912",
      "repositoryName": "hello-world",
      "imagePushedAt": "2018-12-18 21:54:06"
    },
    {
      "imageDigest": "sha256:51a8a6354f411b1775b4857bf1ac856141660c4fbf81db20ac1d922b6a96b3a8",
      "imageSizeInBytes": 49364801,
      "repositoryName": "hello-world",
      "registryId": "012345678912",
      "imagePushedAt": "2018-12-19 11:06:05"
    },
    {
      "imageSizeInBytes": 49364769,
      "imageDigest": "sha256:2ece035ef88d72159d5b3b4e9d7676098c1a4e8316bd5fe0b778190d4eb987e4",
      "imageTags": [
        "3861e84"
      ],
      "registryId": "012345678912",
      "repositoryName": "hello-world",
      "imagePushedAt": "2018-12-19 09:49:41"
    }
  ]
}
aws-support:~/Documents/python$ 
```