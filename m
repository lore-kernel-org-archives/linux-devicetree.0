From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] NI Ettus Research USRP E3x0 soft-poweroff.
Date: Thu, 12 Feb 2015 17:14:38 -0800
Message-ID: <1423790080-8264-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds support for the NI Ettus Research USRP E3x0 SDR's poweroff
functionality.

Moritz Fischer (2):
  power: reset: Add support for NI Ettus Research USRP E3x0
    soft-poweroff.
  MAINTAINERS: add info for e3x0-poweroff driver.

 .../bindings/power/reset/e3x0-poweroff.txt         | 16 ++++
 MAINTAINERS                                        |  8 ++
 drivers/power/reset/Kconfig                        | 10 +++
 drivers/power/reset/Makefile                       |  1 +
 drivers/power/reset/e3x0-poweroff.c                | 94 ++++++++++++++++++++++
 5 files changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/reset/e3x0-poweroff.txt
 create mode 100644 drivers/power/reset/e3x0-poweroff.c

-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
