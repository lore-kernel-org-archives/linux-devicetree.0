From: David Lechner <david@lechnology.com>
Subject: [PATCH v5 0/7] da8xx USB PHY (was da8xx USB clocks)
Date: Mon,  9 May 2016 18:39:56 -0500
Message-ID: <1462837203-12125-1-git-send-email-david@lechnology.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nsekhar@ti.com, khilman@kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kishon Vijay Abraham I <kishon@ti.com>, Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>, Lee Jones <lee.jones@linaro.org>
Cc: David Lechner <david@lechnology.com>, petr@barix.com, sergei.shtylyov@cogentembedded.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

v5 changes:

Functionally, nothing has really changed. Just some cleanups based on feedback.

* Renamed "usbphy" to "usb_phy" or "usb-phy" as appropriate
* License header matches MODULE_LICENSE in new phy driver

David Lechner (7):
  mfd: da8xx-cfgchip: New header file for CFGCHIP registers.
  dt-bindings: Add bindings for phy-da8xx-usb
  phy: Add set_mode callback
  phy: da8xx-usb: new driver for DA8xx SoC USB PHY
  usb: ohci-da8xx: Remove code that references mach
  usb: musb: da8xx: Use devm in probe
  usb: musb: da8xx: Remove mach code

 .../devicetree/bindings/phy/phy-da8xx-usb.txt      |  40 ++++
 drivers/phy/Kconfig                                |  10 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-core.c                             |  15 ++
 drivers/phy/phy-da8xx-usb.c                        | 244 +++++++++++++++++++++
 drivers/usb/host/Kconfig                           |   1 +
 drivers/usb/host/ohci-da8xx.c                      | 102 +++++----
 drivers/usb/musb/Kconfig                           |   2 +-
 drivers/usb/musb/da8xx.c                           | 154 +++++--------
 include/linux/mfd/da8xx-cfgchip.h                  | 153 +++++++++++++
 include/linux/phy/phy.h                            |  17 ++
 include/linux/platform_data/usb-davinci.h          |  22 --
 12 files changed, 592 insertions(+), 169 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
 create mode 100644 drivers/phy/phy-da8xx-usb.c
 create mode 100644 include/linux/mfd/da8xx-cfgchip.h

-- 
2.7.4
