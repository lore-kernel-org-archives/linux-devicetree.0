From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH-v4 0/3] mfd: 88pm800: Add Device tree support
Date: Thu, 25 Jun 2015 12:56:26 +0530
Message-ID: <1435217189-19578-1-git-send-email-vaibhav.hiremath@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch-series adds support for Device tree to 88PM800 mfd driver.
It also sets default configuration of irq clear method if board file
doesn't exist.

Testing::
 - Boot tested on PXA1928 based platform.
 - probe of mfd, rtc and regulator function passing successfully.
 - Basic read operations on registers
 - irq clear configuration

V3 => V4
=======
Link to V3: https://lkml.org/lkml/2015/6/24/143

   - Removed generic error msg when returning -ENOMEM
   - irq clear method is 88PM800 feature, which is not dependent on board or
     doesn't require any wiring changes, so DT is not the way.
     Hardcoded to "irq clear on write" if board file doesn't exist.
   - Updated binding patch (PATCH 3/3) to remove irq-clr-on-wr entry.
   - Since PATCH 3/3 changed from original, removed Rob's Acked-by.

V2 => V3
=======
Link to V2: https://www.mail-archive.com/linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg914299.html

   - Replaced deprecated "regulator-compatible" property with "regulator-name".
   - Added Rob's Acked-by  to [PATCH 3/3]

V1 => V2
=======
Link to V1: http://lkml.iu.edu/hypermail/linux/kernel/1505.3/04386.html

  - Split binding changes from original commit
  - Updated binding info as per Rob's suggestion
  - Dropped PATCH 4/4, as discussed during review
  - Dropped PATCH 3/4, as it is independent RTC code change,
    so will submit it separately to ease merging.
  - Fixed all other minor comments

Attempt has been made to push some of the patches to the list sometime
back in 2013.

Link to previous patch submission:
        https://lkml.org/lkml/2013/8/14/86

TODO:
=====
   - init config for 88PM860 device
   - Rgulator driver changes to add support for 88PM860 device


Vaibhav Hiremath (3):
  mfd: 88pm800: Add device tree support
  mfd: 88pm800: Set default interrupt clear method
  mfd: devicetree: bindings: Add new 88pm800 mfd binding

 Documentation/devicetree/bindings/mfd/88pm800.txt | 54 +++++++++++++++++++++++
 drivers/mfd/88pm800.c                             | 38 +++++++++++++---
 include/linux/mfd/88pm80x.h                       |  6 ++-
 3 files changed, 91 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/88pm800.txt

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
