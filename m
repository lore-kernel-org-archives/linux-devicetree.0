From: Eddie James <eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 0/3] hwmon: (pmbus): Add IBM Common Form Factor (CFF) power supply driver
Date: Tue, 15 Aug 2017 15:52:32 -0500
Message-ID: <1502830355-502-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
Cc: jdelvare-IBi9RG/b67k@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>

This series adds a hwmon pmbus driver for a POWER System power supply. The
core monitoring functionality is provided by pmbus.

Changes since v3:
 * Change "fault" to "alarm" in the documentation.

Changes since v2:
 * Renamed the driver again...
 * Remove debugfs bool from pmbus_driver_info.
 * Add comment for returning rc when reading STATUS_MFR_SPECIFIC fails.

Since v1:
 * Renamed the driver.
 * Removed non-hwmon attributes.
 * Simplified word and byte data reads.

Edward A. James (3):
  dt-bindings: i2c: Document the IBM CCF power supply version 1
  hwmon: (pmbus): Add IBM Common Form Factor (CFF) power supply driver
  Documentation: hwmon: Document the IBM CFF power supply

 .../devicetree/bindings/i2c/ibm,cffps1.txt         |  21 +++
 Documentation/hwmon/ibm-cffps                      |  54 ++++++++
 drivers/hwmon/pmbus/Kconfig                        |  10 ++
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/ibm-cffps.c                    | 151 +++++++++++++++++++++
 5 files changed, 237 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
 create mode 100644 Documentation/hwmon/ibm-cffps
 create mode 100644 drivers/hwmon/pmbus/ibm-cffps.c

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
