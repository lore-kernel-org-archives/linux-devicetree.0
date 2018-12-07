From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: [PATCH 0/2] USB SS PHY for Qualcomm's QCS404
Date: Fri,  7 Dec 2018 10:55:56 +0100
Message-ID: <1544176558-7946-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jorge.ramirez-ortiz@linaro.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, kishon@ti.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, shawn.guo@linaro.org, vkoul@kernel.org
List-Id: devicetree@vger.kernel.org

This set adds USB SS PHY support to Qualcomm's QCS404 SoC
The PHY is implemented using Synopsys SS PHY 1.0.0 IP

The code is based on Sriharsha Allenki's <sallenki@codeaurora.org>
original implementation.

Jorge Ramirez-Ortiz (1):
  dt-bindings: Add Qualcomm USB Super-Speed PHY bindings

Shawn Guo (1):
  phy: qualcomm: usb: Add Super-Speed PHY driver

 .../devicetree/bindings/usb/qcom,usb-ssphy.txt     |  78 +++++
 drivers/phy/qualcomm/Kconfig                       |  11 +
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-usb-ss.c             | 340 +++++++++++++++++++++
 4 files changed, 430 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt
 create mode 100644 drivers/phy/qualcomm/phy-qcom-usb-ss.c

-- 
2.7.4
