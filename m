From: Steve Lin <steven.lin1-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] ARM: dts: BCM953012HR: Add ethernet aliases
Date: Wed, 15 Mar 2017 16:59:35 -0400
Message-ID: <1489611575-18684-1-git-send-email-steven.lin1@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, steven.lin1-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Adding ethernet aliases.  These are used, for example, by bootloaders,
to modify the MAC addresses in the device tree.

Signed-off-by: Steve Lin <steven.lin1-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/bcm953012hr.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/bcm953012hr.dts b/arch/arm/boot/dts/bcm953012hr.dts
index 85f9b0b..766aa71 100644
--- a/arch/arm/boot/dts/bcm953012hr.dts
+++ b/arch/arm/boot/dts/bcm953012hr.dts
@@ -41,6 +41,9 @@
 
 	aliases {
 		serial0 = &uart0;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		ethernet2 = &gmac2;
 	};
 
 	chosen {
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
