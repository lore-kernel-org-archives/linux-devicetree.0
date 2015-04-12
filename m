From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH RFC v3 3/4] MIPS: BMIPS: build all dtbs if no builtin dtb
Date: Sun, 12 Apr 2015 12:25:00 +0200
Message-ID: <1428834301-12721-4-git-send-email-jogo@openwrt.org>
References: <1428834301-12721-1-git-send-email-jogo@openwrt.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428834301-12721-1-git-send-email-jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Daniel Schwierzeck <daniel.schwierzeck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hartley <James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Build all available dtbs to allow them to be appended to the resulting
kernel in case there is no builtin dtb.

Signed-off-by: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
---
 arch/mips/boot/dts/brcm/Makefile |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/Makefile b/arch/mips/boot/dts/brcm/Makefile
index 1c8353b..c641216 100644
--- a/arch/mips/boot/dts/brcm/Makefile
+++ b/arch/mips/boot/dts/brcm/Makefile
@@ -10,6 +10,19 @@ dtb-$(CONFIG_DT_BCM97362SVMB)		+= bcm97362svmb.dtb
 dtb-$(CONFIG_DT_BCM97420C)		+= bcm97420c.dtb
 dtb-$(CONFIG_DT_BCM97425SVMB)		+= bcm97425svmb.dtb
 
+dtb-$(CONFIG_DT_NONE)			+= \
+						bcm93384wvg.dtb		\
+						bcm93384wvg_viper.dtb	\
+						bcm96368mvwg.dtb	\
+						bcm9ejtagprb.dtb	\
+						bcm97125cbmb.dtb	\
+						bcm97346dbsmb.dtb	\
+						bcm97358svmb.dtb	\
+						bcm97360svmb.dtb	\
+						bcm97362svmb.dtb	\
+						bcm97420c.dtb		\
+						bcm97425svmb.dtb
+
 obj-y				+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
 
 # Force kbuild to make empty built-in.o if necessary
-- 
1.7.10.4
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
