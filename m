From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH v4 0/8] Add basic microphone detection bindings
Date: Fri, 19 Jun 2015 13:37:28 +0100
Message-ID: <1434717456-31995-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
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

Thanks,
Charles

Charles Keepax (8):
  extcon: arizona: Simplify pdata symantics for micd_dbtime
  extcon: arizona: Factor out initial GPIO state
  extcon: arizona: Update to use the new device properties API
  extcon: arizona: Add basic microphone detection DT/ACPI bindings
  extcon: arizona: Convert to gpiod
  extcon: arizona: Ensure variables are set for headphone detection
  mfd: arizona: Update DT doc for new mic detection bindings
  mfd: arizona: Update several pdata members to unsigned

 Documentation/devicetree/bindings/mfd/arizona.txt |   16 ++++
 drivers/extcon/extcon-arizona.c                   |   99 +++++++++++++++++----
 include/linux/mfd/arizona/pdata.h                 |   15 ++--
 3 files changed, 105 insertions(+), 25 deletions(-)

-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
