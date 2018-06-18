From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v2 0/3] Stingray thermal driver support
Date: Mon, 18 Jun 2018 14:01:16 +0530
Message-ID: <1529310679-13482-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

These patches adds the stingray thermal driver and its
corresponding DT nodes with documentation.

Pramod Kumar (3):
  dt-bindings: thermal: Add binding document for SR thermal
  arm64: dts: stingray: Add Stingray Thermal DT support.
  thermal: broadcom: Add Stingray thermal driver

 .../bindings/thermal/brcm,sr-thermal.txt           |  45 ++++++
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |  37 +++++
 drivers/thermal/Kconfig                            |   3 +-
 drivers/thermal/broadcom/Kconfig                   |   9 ++
 drivers/thermal/broadcom/Makefile                  |   1 +
 drivers/thermal/broadcom/sr-thermal.c              | 151 +++++++++++++++++++++
 6 files changed, 245 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
 create mode 100644 drivers/thermal/broadcom/sr-thermal.c

-- 
2.7.4
