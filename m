From: Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH 0/2] Driver for TI tlc59116 16 Channel i2c LED driver
Date: Fri,  9 Jan 2015 01:26:16 +0100
Message-ID: <1420763178-10115-1-git-send-email-andrew@lunn.ch>
Return-path: <linux-leds-owner@vger.kernel.org>
Sender: linux-leds-owner@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux ARM <linux-arm-kernel@lists.infradead.org>, Andrew Lunn <andrew@lunn.ch>, Matthew.Fatheree@belkin.com
List-Id: devicetree@vger.kernel.org

This patchset is a driver for the TI tlc59116 16 Channel i2c LED
driver. This driver is used on the Belkin WRT1900AC access point and
the C code is derived from code Belkin contributed to OpenWRT.
However it has been extensively re-written, and a device tree binding
added to replace platform data.

Cc: Matthew.Fatheree@belkin.com

Andrew Lunn (2):
  leds: tlc59116: Document binding for the TI 16 Channel i2c LED driver
  leds: tlc59116: Driver for the TI 16 Channel i2c LED driver

 .../devicetree/bindings/leds/leds-tlc59116.txt     |  41 ++++
 drivers/leds/Kconfig                               |   7 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-tlc59116.c                       | 253 +++++++++++++++++++++
 4 files changed, 302 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-tlc59116.txt
 create mode 100644 drivers/leds/leds-tlc59116.c

-- 
2.1.3
