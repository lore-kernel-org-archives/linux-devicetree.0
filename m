From: George Cherian <george.cherian-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 0/2] Add devicetree support for extcon-gpio
Date: Wed, 9 Jul 2014 14:31:06 +0530
Message-ID: <1404896468-15974-1-git-send-email-george.cherian@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, george.cherian-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

This serires adds devicetree support for extcon-gpio driver.

Patch 1 - Addreses minor cleanups
Patch 2 - Adds devicetree support for esxtcon-gpio driver.

George Cherian (2):
  extcon: gpio: Minor cleanups
  extcon: gpio: Add dt support for the driver.

 .../devicetree/bindings/extcon/extcon-gpio.txt     | 21 ++++++++++++
 drivers/extcon/extcon-gpio.c                       | 38 +++++++++++++++++++---
 include/linux/extcon/extcon-gpio.h                 |  4 ++-
 3 files changed, 57 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-gpio.txt

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
