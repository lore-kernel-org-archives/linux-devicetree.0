From: rick <rickchen36-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] clocksource/drivers/Kconfig: Support andestech atcpit100
Date: Wed, 25 Oct 2017 10:37:46 +0800
Message-ID: <1508899066-1326-1-git-send-email-rickchen36@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rick <rickchen36-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rick <rick-MUIXKm3Oiri1Z/+hSey0Gg@public.gmane.org>, Greentime Hu <green.hu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: rick <rickchen36-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: rick <rick-MUIXKm3Oiri1Z/+hSey0Gg@public.gmane.org>
Signed-off-by: Greentime Hu <green.hu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/clocksource/Kconfig  |    6 ++++++
 drivers/clocksource/Makefile |    1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index cc60620..e950066 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -615,4 +615,10 @@ config CLKSRC_ST_LPC
 	  Enable this option to use the Low Power controller timer
 	  as clocksource.
 
+config CLKSRC_ATCPIT100
+	bool "Clocksource for AE3XX platform" if COMPILE_TEST
+  depends on GENERIC_CLOCKEVENTS && HAS_IOMEM
+	help
+	  This option enables support for the Andestech AE3XX platform timers.
+
 endmenu
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index dbc1ad1..24d15bd 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -74,3 +74,4 @@ obj-$(CONFIG_H8300_TMR16)		+= h8300_timer16.o
 obj-$(CONFIG_H8300_TPU)			+= h8300_tpu.o
 obj-$(CONFIG_CLKSRC_ST_LPC)		+= clksrc_st_lpc.o
 obj-$(CONFIG_X86_NUMACHIP)		+= numachip.o
+obj-$(CONFIG_CLKSRC_ATCPIT100)		+= timer-atcpit100.o
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
