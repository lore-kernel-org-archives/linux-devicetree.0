From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v2 0/3] hwmon: (pmbus): Add POWER System power supply driver
Date: Thu, 10 Aug 2017 17:19:43 -0500
Message-ID: <1502403586-20549-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Sender: linux-hwmon-owner@vger.kernel.org
To: linux@roeck-us.net
Cc: robh+dt@kernel.org, jdelvare@suse.com, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, joel@jms.id.au, jk@ozlabs.org, andrew@aj.id.au, eajames@linux.vnet.ibm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

This series adds a hwmon pmbus driver for a POWER System power supply. The
core monitoring functionality is provided by pmbus.

This series depends on the pmbus core extensions for debugfs recently submitted
to the mailing list (latest: https://lkml.org/lkml/2017/8/10/881).

Since v1:
 * Renamed the driver.
 * Removed non-hwmon attributes.
 * Simplified word and byte data reads.

Edward A. James (3):
  dt-bindings: i2c: Document the POWER system power supply device
  hwmon: (pmbus): Add POWER system power supply driver
  Documentation: hwmon: Add POWER system power supply documentation

 .../devicetree/bindings/i2c/ibm,power-ps.txt       |  21 +++
 Documentation/hwmon/powerps                        |  54 ++++++++
 drivers/hwmon/pmbus/Kconfig                        |  10 ++
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/powerps.c                      | 144 +++++++++++++++++++++
 5 files changed, 230 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/ibm,power-ps.txt
 create mode 100644 Documentation/hwmon/powerps
 create mode 100644 drivers/hwmon/pmbus/powerps.c

-- 
1.8.3.1

