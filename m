From: Girish K S <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/2] Support for samsung mailbox controller
Date: Mon, 17 Mar 2014 17:33:57 +0530
Message-ID: <1395057839-23871-1-git-send-email-ks.giri@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, s-anna-l0cyMroinI0@public.gmane.org, ilho215.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Girish K S <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series is based on the mailbox framework prepared by jassi
and others.  

Girish K S (2):
  mailbox: samsung: added support for samsung mailbox
  arm64: dts: exynos: added mailbox node

 .../bindings/mailbox/samsung-mailbox.txt           |   24 ++
 arch/arm64/boot/dts/samsung-gh7.dtsi               |   66 ++++
 arch/arm64/boot/dts/samsung-ssdk-gh7.dts           |    3 +
 drivers/mailbox/Kconfig                            |    8 +
 drivers/mailbox/Makefile                           |    2 +
 drivers/mailbox/mailbox-samsung.c                  |  354 ++++++++++++++++++++
 include/linux/mailbox-samsung.h                    |  112 +++++++
 7 files changed, 569 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/samsung-mailbox.txt
 create mode 100644 drivers/mailbox/mailbox-samsung.c
 create mode 100644 include/linux/mailbox-samsung.h

-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
