From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 3/7] watchdog: JZ4740: Register a restart handler
Date: Thu, 28 Dec 2017 17:29:35 +0100
Message-ID: <20171228162939.3928-4-paul@crapouillou.net>
References: <20171228162939.3928-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171228162939.3928-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The watchdog driver can restart the system by simply configuring the
hardware for a timeout of 0 seconds.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/watchdog/jz4740_wdt.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
index 92d6ca8ceb49..fa7f49a3212c 100644
--- a/drivers/watchdog/jz4740_wdt.c
+++ b/drivers/watchdog/jz4740_wdt.c
@@ -130,6 +130,14 @@ static int jz4740_wdt_stop(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
+static int jz4740_wdt_restart(struct watchdog_device *wdt_dev,
+			      unsigned long action, void *data)
+{
+	wdt_dev->timeout = 0;
+	jz4740_wdt_start(wdt_dev);
+	return 0;
+}
+
 static const struct watchdog_info jz4740_wdt_info = {
 	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
 	.identity = "jz4740 Watchdog",
@@ -141,6 +149,7 @@ static const struct watchdog_ops jz4740_wdt_ops = {
 	.stop = jz4740_wdt_stop,
 	.ping = jz4740_wdt_ping,
 	.set_timeout = jz4740_wdt_set_timeout,
+	.restart = jz4740_wdt_restart,
 };
 
 #ifdef CONFIG_OF
-- 
2.11.0
