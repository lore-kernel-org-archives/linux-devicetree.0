From: Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v2 0/3] pmbus: ibm-cffps: Add support for version 2 of PSU
Date: Fri, 30 Aug 2019 14:11:00 -0500
Message-ID: <1567192263-15065-1-git-send-email-eajames@linux.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux@roeck-us.net, andrew@aj.id.au, joel@jms.id.au, mark.rutland@arm.com, robh+dt@kernel.org, jdelvare@suse.com, Eddie James <eajames@linux.ibm.com>
List-Id: devicetree@vger.kernel.org

Version 2 of this PSU supports a second page of data and changes the
format of the FW version command. Use the devicetree binding (or the I2C
device ID) to determine which version the driver should use. Therefore add
the new compatible string to the devicetree documentation and change the
Swift system devicetree to use version 2.

Changes since v1:
 - use an enum for the version instead of integers 1, 2, etc

Eddie James (3):
  dt-bindings: hwmon: Document ibm,cffps2 compatible string
  ARM: dts: aspeed: swift: Change power supplies to version 2
  pmbus: ibm-cffps: Add support for version 2 of the PSU

 .../devicetree/bindings/hwmon/ibm,cffps1.txt       |   8 +-
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts         |   4 +-
 drivers/hwmon/pmbus/ibm-cffps.c                    | 110 ++++++++++++++++-----
 3 files changed, 95 insertions(+), 27 deletions(-)

-- 
1.8.3.1
