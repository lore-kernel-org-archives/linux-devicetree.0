From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 10/54] MAINTAINERS: Add file patterns for clocksource device tree bindings
Date: Sun, 22 May 2016 11:05:47 +0200
Message-ID: <1463907991-7916-11-git-send-email-geert@linux-m68k.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fedc113e17ead8bc..47dac1ce82896697 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3025,6 +3025,7 @@ M:	Thomas Gleixner <tglx@linutronix.de>
 L:	linux-kernel@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/core
 S:	Supported
+F:	Documentation/devicetree/bindings/timer/
 F:	drivers/clocksource
 
 CISCO FCOE HBA DRIVER
-- 
1.9.1
