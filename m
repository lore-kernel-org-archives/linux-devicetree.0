From: Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 0/2] hwmon: (pmbus/ibm-cffps) Add version detection capability
Date: Wed,  9 Oct 2019 14:11:00 -0500
Message-ID: <1570648262-25383-1-git-send-email-eajames@linux.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, linux@roeck-us.net, mark.rutland@arm.com, robh+dt@kernel.org, Eddie James <eajames@linux.ibm.com>
List-Id: devicetree@vger.kernel.org

The IBM common form factor power supply driver may need to detect which PSU
version is connected, since some systems can use a variety of power supplies.
This series adds a new compatible string with no version number, and some code
to parse the CCIN of the PSU to determine which version is applicable.

Eddie James (2):
  dt-bindings: hwmon: Document ibm,cffps compatible string
  hwmon: (pmbus/ibm-cffps) Add version detection capability

 .../devicetree/bindings/hwmon/ibm,cffps1.txt       |  3 ++
 drivers/hwmon/pmbus/ibm-cffps.c                    | 37 +++++++++++++++++++---
 2 files changed, 36 insertions(+), 4 deletions(-)

-- 
1.8.3.1
