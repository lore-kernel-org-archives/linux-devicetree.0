From: Andrew Lunn <andrew@lunn.ch>
Subject: [PATCHv4 0/2] Driver for TI tlc591xx 8/16 Channel i2c LED driver
Date: Tue, 20 Jan 2015 17:45:40 +0100
Message-ID: <1421772342-13810-1-git-send-email-andrew@lunn.ch>
Return-path: <linux-leds-owner@vger.kernel.org>
Sender: linux-leds-owner@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux ARM <linux-arm-kernel@lists.infradead.org>, tomi.valkeinen@ti.com, vigneshr@ti.com, Andrew Lunn <andrew@lunn.ch>, Matthew.Fatheree@belkin.com
List-Id: devicetree@vger.kernel.org

This patchset is a driver for the TI tlc59116 16 Channel i2c LED
driver and tlc59108 8 Channel i2c LED driver. This driver is used on
the Belkin WRT1900AC access point and the C code is derived from code
Belkin contributed to OpenWRT.  However it has been extensively
re-written, and a device tree binding added to replace platform data.

Cc: Matthew.Fatheree@belkin.com

Since v3:
      Generalized and added support for tlc59108
      brightness == 0 and brightness == LED_FULL disable PWM and used
        fixed OFF/ON mode

Since v2:
      Remove incorrect /* Mode register ? */ comment
      Parenthesis around the macro arguments
      Converted many signed variables into unsigned
      Saved an initialization

Since v1:
      s/uint8_t/u8/g
      Remove empty line
      Removed #gpio-cells
      Added select REGMAP_I2C
      Sorted #includes into alphabetic order
      Added missing MODULE_DEVICE_TABLE(of, ...)
      Check return value of regmap_write()
      Simplified tlc59116_set_mode()

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
