From: Rick Chen <rickchen36@gmail.com>
Subject: [PATCH v3 2/3] clocksource/drivers/Kconfig: Support andestech atcpit100 timer
Date: Tue,  7 Nov 2017 15:19:52 +0800
Message-ID: <1510039193-32522-3-git-send-email-rickchen36@gmail.com>
References: <1510039193-32522-1-git-send-email-rickchen36@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1510039193-32522-1-git-send-email-rickchen36@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, tglx@linutronix.de, robh@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, rick@andestech.com
Cc: Rick Chen <rickchen36@gmail.com>, Greentime Hu <green.hu@gmail.com>
List-Id: devicetree@vger.kernel.org

Add CLKSRC_ATCPIT100 for Andestech atcpit100 timer selection.
It often be used in Andestech AE3XX platform.

Signed-off-by: Rick Chen <rickchen36@gmail.com>
Signed-off-by: Greentime Hu <green.hu@gmail.com>
---
 drivers/clocksource/Kconfig  | 6 ++++++
 drivers/clocksource/Makefile | 1 +
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
2.7.4
