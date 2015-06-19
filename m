From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v5 0/7] Add basic microphone detection bindings
Date: Fri, 19 Jun 2015 17:23:27 +0100
Message-ID: <1434731014-19980-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

This series adds basic microphone detection DT/ACPI bindings
using the device properties API.

The MFD parts and the extcon parts can go seperately through
there respective trees, but I sent them together so everyone
can see what is going on. There is no build dependency
although the MFD patch will fix a couple of Sparse warnings
that you get if using -Wsparse-all.

Changes since v1:
 - Removed double include of property.h

Changes since v2:
 - Removed check for CONFIG_OF to call
   arizona_extcon_device_get_pdata.
 - Add some defines for the pdata values of micd-dbtime.
 - Factor out the initial gpio level for the micd-pol-gpio.
 - Don't check if null before calling gpiod_set_value_cansleep.
 - Added a comment to explain why we can't use devm for gpiod.
 - Added patch to make some small corrections to the jack
   detection into this series to keep them all together for
   easy of applying.

Changes since v3:
 - Simplify the symantics of the pdata for micd_dbtime

Changes since v4:
 - Remove the gpio initial state patch added in v2

Thanks,
Charles

Charles Keepax (7):
  extcon: arizona: Simplify pdata symantics for micd_dbtime
  extcon: arizona: Update to use the new device properties API
  extcon: arizona: Add basic microphone detection DT/ACPI bindings
  extcon: arizona: Convert to gpiod
  extcon: arizona: Ensure variables are set for headphone detection
  mfd: arizona: Update DT doc for new mic detection bindings
  mfd: arizona: Update several pdata members to unsigned

 Documentation/devicetree/bindings/mfd/arizona.txt |   16 ++++
 drivers/extcon/extcon-arizona.c                   |   95 +++++++++++++++++----
 include/linux/mfd/arizona/pdata.h                 |   15 ++--
 3 files changed, 102 insertions(+), 24 deletions(-)

-- 
1.7.2.5
