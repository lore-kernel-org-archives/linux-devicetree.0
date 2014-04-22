From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RESEND 5/5] MAINTAINERS: add entry for the Broadcom BCM63xx ARM SoCs
Date: Mon, 21 Apr 2014 18:39:18 -0700
Message-ID: <1398130758-19456-6-git-send-email-f.fainelli@gmail.com>
References: <1398130758-19456-1-git-send-email-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398130758-19456-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jpeshkin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, aelder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a MAINTAINERS entry covering all the Broadcom BCM63xx ARM DSL SoCs
files along with the relevant git tree and mailing-list.

Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e67ea2442041..135060fcf599 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1916,6 +1916,7 @@ F:	arch/arm/boot/dts/bcm2835*
 F:	arch/arm/configs/bcm2835_defconfig
 F:	drivers/*/*bcm2835*
 
+
 BROADCOM BCM5301X ARM ARCHICTURE
 M:	Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
 L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
@@ -1924,6 +1925,16 @@ F:	arch/arm/mach-bcm/bcm_5301x.c
 F:	arch/arm/boot/dts/bcm5301x.dtsi
 F:	arch/arm/boot/dts/bcm470*
 
+BROADCOM BCM63XX ARM ARCHITECTURE
+M:	Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
+T:	git git://git.github.com/broadcom/arm-bcm63xx
+S:	Maintained
+F:	arch/arm/mach-bcm/board_bcm63xx.c
+F:	arch/arm/mach-bcm/bcm63xx.h
+F:	arch/arm/include/debug/bcm63xxx.S
+F:	arch/arm/configs/bcm_defconfig
+
 BROADCOM TG3 GIGABIT ETHERNET DRIVER
 M:	Nithin Nayak Sujir <nsujir-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
 M:	Michael Chan <mchan-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
