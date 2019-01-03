From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v6 0/3] Stingray thermal driver support
Date: Thu,  3 Jan 2019 14:25:31 +0530
Message-ID: <1546505734-24527-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

These patches adds the stingray thermal driver and its
corresponding DT nodes with documentation.

Changes from v5
  - Addressed Eduardo Valentin comments.

Changes from v4
  - Addressed Rob Herring comments on DT parameters and
    thermal driver architecture.
  - Removed brcm,max-crit-temp DT parameter
  - Changed driver to thermal sensor registration model.
  - Added trip DT properties.

Changes from v3
  - Addressed Daniel lezcano comments.
  - Elaborated commit description of thermal driver patch.
  - Added brcm,max-crit-temp DT parameter.

Changes from v2:
  - All stingray TMON DT nodes are combine together into single.
    Temperature registers are combined into one mem resource.
    brcm,tmon-mask parameter has available TMONs mask value.
  - All available TMONs are initialized together in single
    instance of driver probe call.

Changes from v1:
  - Fixed auto build sparce warning.

Pramod Kumar (3):
  dt-bindings: thermal: Add binding document for SR thermal
  thermal: broadcom: Add Stingray thermal driver
  arm64: dts: stingray: Add Stingray Thermal DT support.

 .../bindings/thermal/brcm,sr-thermal.txt           | 105 ++++++++++++++++++
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |  89 +++++++++++++++
 drivers/thermal/Kconfig                            |   3 +-
 drivers/thermal/broadcom/Kconfig                   |   9 ++
 drivers/thermal/broadcom/Makefile                  |   1 +
 drivers/thermal/broadcom/sr-thermal.c              | 122 +++++++++++++++++++++
 6 files changed, 328 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
 create mode 100644 drivers/thermal/broadcom/sr-thermal.c

-- 
2.7.4
