From: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
Subject: [PATCH v1 0/2] Add Embedded USB Debugger (EUD) driver
Date: Thu, 16 Aug 2018 17:05:46 -0700
Message-ID: <1534464348-8227-1-git-send-email-pheragu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, bryanh@codeaurora.org, psodagud@codeaurora.org, rnayak@codeaurora.org
List-Id: devicetree@vger.kernel.org

This is a series of patches that implements a driver for the control
peripheral, EUD (Embedded USB Debugger). The EUD is a mini-USB hub 
implemented on chip to support the USB-based debug and trace capabilities.
Apart from debug capabilities, EUD has a control peripheral. Control 
Peripheral is on when EUD is on and gets signals like USB attach, pet EUD,
charge phone etc. EUD driver listens to events like USB attach or detach 
and charger enable or disable and then notifies the USB driver or PMIC 
driver respectively about these events via EXTCON. At regular intervals, 
the EUD driver receives an interrupt to pet the driver indicating that 
the software is functional.

Changes since v0:
- Remove select SERIAL_CORE from Kconfig as this patch doesn't involve
  anything related to serial console
- Changed the dt-bindings to remove extcon and replace it with graphs
  to represent a connection with client

Prakruthi Deepak Heragu (2):
  dt-bindings: Documentation for qcom,eud
  Embedded USB Debugger (EUD) driver

 .../devicetree/bindings/soc/qcom/qcom,msm-eud.txt  |  28 ++
 drivers/soc/qcom/Kconfig                           |  12 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/eud.c                             | 340 +++++++++++++++++++++
 4 files changed, 381 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt
 create mode 100644 drivers/soc/qcom/eud.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
