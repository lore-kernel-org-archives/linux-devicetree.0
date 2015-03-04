From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 0/3 RESEND] NI Ettus Research USRP E3x0 soft-poweroff.
Date: Wed,  4 Mar 2015 14:25:46 -0800
Message-ID: <1425507949-30499-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds support for the NI Ettus Research USRP E3x0 SDR's poweroff
functionality.

v1:
 - Using syscon regmap instead of directly exposing registers.
 - Separate commit for dt bindings.
 - Fixed typo in Kconfig

Moritz Fischer (3):
  power: reset: Add support for NI Ettus Research USRP E3x0
    soft-poweroff.
  dt: power: Add documentation for NI USRP E3x0 soft-poweroff.
  MAINTAINERS: add info for e3x0-poweroff driver.

 .../bindings/power/reset/e3x0-poweroff.txt         | 16 +++++
 MAINTAINERS                                        |  8 +++
 drivers/power/reset/Kconfig                        | 10 +++
 drivers/power/reset/Makefile                       |  1 +
 drivers/power/reset/e3x0-poweroff.c                | 79 ++++++++++++++++++++++
 5 files changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/reset/e3x0-poweroff.txt
 create mode 100644 drivers/power/reset/e3x0-poweroff.c

-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
