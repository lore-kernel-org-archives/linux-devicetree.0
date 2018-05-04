From: Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH v3 0/3] usb: dwc3: support for Qualcomm DWC3 glue
Date: Sat,  5 May 2018 00:18:06 +0530
Message-ID: <1525459689-1358-1-git-send-email-mgautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org, robh@kernel.org, andy.gross@linaro.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add separate dwc3-qcom glue driver for Qualcomm SOCs having dwc3 core.
It is needed to support peripheral mode.
Patches also add support to invoke PHY runtime PM functions on host
mode bus-suspend.

Changes since v2:
 - Addressed Rob's comments for DT binding documentation.

Changes since v1:
 - Move dwc3 core register accesses from glue driver to dwc3 core as
   per review comment from Felipe.
 - Addressed other review comments from Felipe and Rob.
 - Some other minor code changes related to redability.
 - Add reset_control assert in driver probe to ensure core registers
   are reset to POR value in case of any initalization by boot code. 

Manu Gautam (3):
  dt-bindings: usb: Update documentation for Qualcomm DWC3 driver
  usb: dwc3: Add Qualcomm DWC3 glue driver
  usb: dwc3: core: Suspend PHYs on runtime suspend in host mode

 .../devicetree/bindings/usb/qcom,dwc3.txt          |  85 ++-
 drivers/usb/dwc3/Kconfig                           |  12 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/core.c                            |  36 +-
 drivers/usb/dwc3/dwc3-of-simple.c                  |   1 -
 drivers/usb/dwc3/dwc3-qcom.c                       | 618 +++++++++++++++++++++
 6 files changed, 727 insertions(+), 26 deletions(-)
 create mode 100644 drivers/usb/dwc3/dwc3-qcom.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
