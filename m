From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH 0/5] Add basic microphone detection bindings
Date: Thu, 18 Jun 2015 13:52:24 +0100
Message-ID: <1434631949-28594-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
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

Thanks,
Charles

Charles Keepax (5):
  extcon: arizona: Update to use the new device properties API
  extcon: arizona: Add basic microphone detection DT/ACPI bindings
  extcon: arizona: Convert to gpiod
  mfd: arizona: Update DT doc for new mic detection bindings
  mfd: arizona: Update several pdata members to unsigned

 Documentation/devicetree/bindings/mfd/arizona.txt |   16 +++++
 drivers/extcon/extcon-arizona.c                   |   73 ++++++++++++++++++--
 include/linux/mfd/arizona/pdata.h                 |   12 ++--
 3 files changed, 87 insertions(+), 14 deletions(-)

-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
