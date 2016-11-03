From: Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v4 0/4] Add DT support for DA8xx
Date: Thu,  3 Nov 2016 16:59:08 +0100
Message-ID: <1478188752-22447-1-git-send-email-abailon@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com, robh+dt@kernel.org, b-liu@ti.com
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, nsekhar@ti.com, Alexandre Bailon <abailon@baylibre.com>
List-Id: devicetree@vger.kernel.org

Changes in v2:
* Remove unrelated changes in patch 3
* Rename the device node in patch 4

Changes in v3:
* Fix few mistakes in DT binding sample
* Only build the device table if DT is enabled

Change in v4:
* Fix a nit

Alexandre Bailon (1):
  ARM: dts: da850: Add the usb otg device node

Petr Kulhavy (3):
  dt/bindings: Add binding for the DA8xx MUSB driver
  usb: musb: core: added helper function for parsing DT
  usb: musb: da8xx: Add DT support for the DA8xx driver

 .../devicetree/bindings/usb/da8xx-usb.txt          | 43 ++++++++++++++++++++
 arch/arm/boot/dts/da850-lcdk.dts                   |  8 ++++
 arch/arm/boot/dts/da850.dtsi                       | 15 +++++++
 drivers/usb/musb/da8xx.c                           | 46 ++++++++++++++++++++++
 drivers/usb/musb/musb_core.c                       | 19 +++++++++
 drivers/usb/musb/musb_core.h                       |  6 +++
 6 files changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/da8xx-usb.txt

-- 
2.7.3
