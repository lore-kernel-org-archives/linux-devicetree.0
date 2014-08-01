From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCHv10 1/4] mailbox: rename pl320-ipc specific mailbox.h
Date: Fri,  1 Aug 2014 18:00:57 +0530
Message-ID: <1406896257-4814-1-git-send-email-jaswinder.singh@linaro.org>
References: <1406896194-4667-1-git-send-email-jaswinder.singh@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406896194-4667-1-git-send-email-jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org, lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, loic.pallardy-qxv4g6HH51o@public.gmane.org, s-anna-l0cyMroinI0@public.gmane.org, ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bjorn-UYDU3/A3LUY@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mollie.wu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org, broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>

The patch 30058677 "ARM / highbank: add support for pl320 IPC"
added a pl320 IPC specific header file as a generic mailbox.h.
This file has been renamed appropriately to allow the
introduction of the generic mailbox API framework.

Acked-by: Mark Langsdorf <mark.langsdorf-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Rafael J. Wysocki <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 arch/arm/mach-highbank/highbank.c        | 2 +-
 drivers/cpufreq/highbank-cpufreq.c       | 2 +-
 drivers/mailbox/pl320-ipc.c              | 2 +-
 include/linux/{mailbox.h => pl320-ipc.h} | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename include/linux/{mailbox.h => pl320-ipc.h} (100%)

diff --git a/arch/arm/mach-highbank/highbank.c b/arch/arm/mach-highbank/highbank.c
index 8c35ae4..07a0957 100644
--- a/arch/arm/mach-highbank/highbank.c
+++ b/arch/arm/mach-highbank/highbank.c
@@ -20,7 +20,7 @@
 #include <linux/input.h>
 #include <linux/io.h>
 #include <linux/irqchip.h>
-#include <linux/mailbox.h>
+#include <linux/pl320-ipc.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
diff --git a/drivers/cpufreq/highbank-cpufreq.c b/drivers/cpufreq/highbank-cpufreq.c
index bf8902a..b464f29 100644
--- a/drivers/cpufreq/highbank-cpufreq.c
+++ b/drivers/cpufreq/highbank-cpufreq.c
@@ -19,7 +19,7 @@
 #include <linux/cpu.h>
 #include <linux/err.h>
 #include <linux/of.h>
-#include <linux/mailbox.h>
+#include <linux/pl320-ipc.h>
 #include <linux/platform_device.h>
 
 #define HB_CPUFREQ_CHANGE_NOTE	0x80000001
diff --git a/drivers/mailbox/pl320-ipc.c b/drivers/mailbox/pl320-ipc.c
index d873cba..f3755e0 100644
--- a/drivers/mailbox/pl320-ipc.c
+++ b/drivers/mailbox/pl320-ipc.c
@@ -26,7 +26,7 @@
 #include <linux/device.h>
 #include <linux/amba/bus.h>
 
-#include <linux/mailbox.h>
+#include <linux/pl320-ipc.h>
 
 #define IPCMxSOURCE(m)		((m) * 0x40)
 #define IPCMxDSET(m)		(((m) * 0x40) + 0x004)
diff --git a/include/linux/mailbox.h b/include/linux/pl320-ipc.h
similarity index 100%
rename from include/linux/mailbox.h
rename to include/linux/pl320-ipc.h
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
