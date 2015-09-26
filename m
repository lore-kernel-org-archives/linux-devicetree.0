From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH 0/4] WCNSS Peripheral Image Loader
Date: Fri, 25 Sep 2015 22:26:29 -0700
Message-ID: <1443245193-8597-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series provides the minimum changes needed to use remotproc on the
Qualcomm platform, it then introduces the Peripheral Image Loader for
the WCNSS core.


The implementation depends on https://lkml.org/lkml/2015/9/24/723

Bjorn Andersson (4):
  remoteproc: core: Make the loaded resource table optional
  remoteproc: Add additional crash reasons
  remoteproc: qcom: Introduce WCNSS peripheral image loader
  dt-binding: remoteproc: Introduce Qualcomm WCNSS loader binding

 .../bindings/remoteproc/qcom,wcnss-pil.txt         | 107 ++++
 drivers/remoteproc/Kconfig                         |  11 +
 drivers/remoteproc/Makefile                        |   2 +
 drivers/remoteproc/qcom_mdt_loader.c               | 213 +++++++
 drivers/remoteproc/qcom_mdt_loader.h               |   8 +
 drivers/remoteproc/qcom_wcnss.c                    | 615 +++++++++++++++++++++
 drivers/remoteproc/remoteproc_core.c               |  10 +-
 include/linux/remoteproc.h                         |   4 +
 8 files changed, 964 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
 create mode 100644 drivers/remoteproc/qcom_mdt_loader.c
 create mode 100644 drivers/remoteproc/qcom_mdt_loader.h
 create mode 100644 drivers/remoteproc/qcom_wcnss.c

-- 
1.8.2.2
