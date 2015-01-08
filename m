From: Andy Gross <agross@codeaurora.org>
Subject: [PATCH 0/2] Add Qualcomm TCSR driver
Date: Thu,  8 Jan 2015 16:52:55 -0600
Message-ID: <1420757577-20425-1-git-send-email-agross@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Andy Gross <agross@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch set adds a driver for the TCSR (Top Control and Status Register)
block that is present in the IPQ8064, APQ8064, and some later processors.  The
TCSR is responsible for accessing configuration and mux settings for a variety
of peripherals.

The initial version of this driver exposes configuration settings for the USB
PHY selection and ADM DMA CRCI muxing.

Andy Gross (2):
  soc: qcom: Add TCSR driver
  soc: qcom: Add device tree binding for TCSR

 .../devicetree/bindings/soc/qcom/qcom,tcsr.txt     |   33 ++++++++
 drivers/soc/qcom/Kconfig                           |    7 ++
 drivers/soc/qcom/Makefile                          |    1 +
 drivers/soc/qcom/qcom_tcsr.c                       |   83 ++++++++++++++++++++
 include/dt-bindings/soc/qcom,tcsr.h                |   34 ++++++++
 include/soc/qcom/qcom_tcsr.h                       |   21 +++++
 6 files changed, 179 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,tcsr.txt
 create mode 100644 drivers/soc/qcom/qcom_tcsr.c
 create mode 100644 include/dt-bindings/soc/qcom,tcsr.h
 create mode 100644 include/soc/qcom/qcom_tcsr.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
