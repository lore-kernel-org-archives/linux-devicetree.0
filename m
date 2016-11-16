From: Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v5 0/3] driver: Add DT support for DA8xx
Date: Wed, 16 Nov 2016 11:52:22 +0100
Message-ID: <1479293545-7516-1-git-send-email-abailon@baylibre.com>
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

Changes in v5:
* Nothing. Resent the v4 in two seppaated series: one for platform and one for
  driver.

Petr Kulhavy (3):
  dt/bindings: Add binding for the DA8xx MUSB driver
  usb: musb: core: added helper function for parsing DT
  usb: musb: da8xx: Add DT support for the DA8xx driver

 .../devicetree/bindings/usb/da8xx-usb.txt          | 43 ++++++++++++++++++++
 drivers/usb/musb/da8xx.c                           | 46 ++++++++++++++++++++++
 drivers/usb/musb/musb_core.c                       | 19 +++++++++
 drivers/usb/musb/musb_core.h                       |  6 +++
 4 files changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/da8xx-usb.txt

-- 
2.7.3
