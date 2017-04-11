From: thor.thayer@linux.intel.com
Subject: [PATCH 0/3] Add Altera I2C Controller Driver
Date: Tue, 11 Apr 2017 11:02:24 -0500
Message-ID: <1491926547-29510-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: wsa@the-dreams.de, robh@kernel.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, Thor Thayer <thor.thayer@linux.intel.com>
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Add the Altera I2C Controller driver for use in FPGAs.

Thor Thayer (3):
  MAINTAINERS: Add Altera I2C Controller Driver
  Documentation: dt: i2c: Add Altera I2C Controller
  i2c: altera: Add Altera I2C Controller driver

 .../devicetree/bindings/i2c/i2c-altera.txt         |  37 ++
 MAINTAINERS                                        |   5 +
 drivers/i2c/busses/Kconfig                         |  10 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-altera.c                    | 509 +++++++++++++++++++++
 5 files changed, 562 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-altera.txt
 create mode 100644 drivers/i2c/busses/i2c-altera.c

-- 
1.9.1
