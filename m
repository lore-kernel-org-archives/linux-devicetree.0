From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux v9 0/5] drivers: hwmon: Add On-Chip Controller driver
Date: Tue, 14 Mar 2017 15:55:01 -0500
Message-ID: <1489524906-19411-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Sender: linux-hwmon-owner@vger.kernel.org
To: linux@roeck-us.net
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net, mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de, andrew@aj.id.au, benh@kernel.crashing.org, joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

This patchset adds a hwmon driver to support the OCC (On-Chip Controller)
on the IBM POWER8 and POWER9 processors, from a BMC (Baseboard Management
Controller). The OCC is an embedded processor that provides real time
power and thermal monitoring.

The driver provides an interface on a BMC to poll OCC sensor data, set
user power caps, and perform some basic OCC error handling. It interfaces
with userspace through hwmon.

The driver is currently functional only for the OCC on POWER8 chips.
Communicating with the POWER9 OCC requries FSI support.

since v8:
 * drop P9 sensors patch. This patch was mainly included to demonstrate
why we abstracted out the sensor-specific code into the occ_p8 functions.
However, since we haven't submitted the transfer protocol to the OCC for
P9 yet, we shouldn't submit this unused P9 code yet.
 * fix string access in hwmon read_string() function. Thanks Guenter.
 * change parameter to const char ** in read_string() function to match
upcoming hwmon code.

Edward A. James (5):
  hwmon: Add core On-Chip Controller support for POWER CPUs
  hwmon: occ: Add sysfs interface
  hwmon: occ: Add I2C transport implementation for SCOM operations
  hwmon: occ: Add callbacks for parsing P8 OCC datastructures
  hwmon: occ: Add hwmon implementation for the P8 OCC

 Documentation/devicetree/bindings/hwmon/occ.txt |  13 +
 Documentation/hwmon/occ                         | 113 ++++++
 MAINTAINERS                                     |   7 +
 drivers/hwmon/Kconfig                           |   2 +
 drivers/hwmon/Makefile                          |   1 +
 drivers/hwmon/occ/Kconfig                       |  28 ++
 drivers/hwmon/occ/Makefile                      |   3 +
 drivers/hwmon/occ/occ.c                         | 440 ++++++++++++++++++++++++
 drivers/hwmon/occ/occ.h                         |  77 +++++
 drivers/hwmon/occ/occ_p8.c                      | 256 ++++++++++++++
 drivers/hwmon/occ/occ_p8.h                      |  25 ++
 drivers/hwmon/occ/occ_p8_i2c.c                  |  99 ++++++
 drivers/hwmon/occ/occ_scom_i2c.c                |  69 ++++
 drivers/hwmon/occ/occ_scom_i2c.h                |  21 ++
 drivers/hwmon/occ/occ_sysfs.c                   | 253 ++++++++++++++
 drivers/hwmon/occ/occ_sysfs.h                   |  25 ++
 drivers/hwmon/occ/scom.h                        |  42 +++
 17 files changed, 1474 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/occ.txt
 create mode 100644 Documentation/hwmon/occ
 create mode 100644 drivers/hwmon/occ/Kconfig
 create mode 100644 drivers/hwmon/occ/Makefile
 create mode 100644 drivers/hwmon/occ/occ.c
 create mode 100644 drivers/hwmon/occ/occ.h
 create mode 100644 drivers/hwmon/occ/occ_p8.c
 create mode 100644 drivers/hwmon/occ/occ_p8.h
 create mode 100644 drivers/hwmon/occ/occ_p8_i2c.c
 create mode 100644 drivers/hwmon/occ/occ_scom_i2c.c
 create mode 100644 drivers/hwmon/occ/occ_scom_i2c.h
 create mode 100644 drivers/hwmon/occ/occ_sysfs.c
 create mode 100644 drivers/hwmon/occ/occ_sysfs.h
 create mode 100644 drivers/hwmon/occ/scom.h

-- 
1.8.3.1

