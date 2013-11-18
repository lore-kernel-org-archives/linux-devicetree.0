From: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 5/6] watchdog: davinci: reuse driver for keystone arch
Date: Mon, 18 Nov 2013 19:18:58 +0200
Message-ID: <1384795139-19466-6-git-send-email-ivan.khoronzhuk@ti.com>
References: <1384795139-19466-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384795139-19466-1-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Strashko Grygorii <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The keystone arch use the same IP watchdog, so add "ti,keystone-wdt"
compatible and correct identity.

The Keystone arch is using clocks in DT and source clock for watchdog
has to be specified, so add this to binding.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Acked-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
---
 .../devicetree/bindings/watchdog/davinci-wdt.txt   |   11 +++++++++--
 drivers/watchdog/Kconfig                           |    4 ++--
 drivers/watchdog/davinci_wdt.c                     |    3 ++-
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt b/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
index e450134..0f1aa99 100644
--- a/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
@@ -1,16 +1,23 @@
-DaVinci Watchdog Timer (WDT) Controller
+Texas Instruments DaVinci/Keystone Watchdog Timer (WDT) Controller
 
 Required properties:
-- compatible : Should be "ti,davinci-wdt"
+- compatible : Should be "ti,davinci-wdt" or "ti,keystone-wdt"
 - reg : Should contain WDT registers location and length
+- clocks : phandle reference to the controller clock.
+	   Required only for Keystone arch. See clock-bindings.txt
 
 Optional properties:
 - timeout-sec : Contains the watchdog timeout in seconds
 
+Documentation:
+Davinci DM646x - http://www.ti.com/lit/ug/spruer5b/spruer5b.pdf
+Keystone - http://www.ti.com/lit/ug/sprugv5a/sprugv5a.pdf
+
 Examples:
 
 wdt: wdt@2320000 {
 	compatible = "ti,davinci-wdt";
 	reg = <0x02320000 0x80>;
 	timeout-sec = <30>;
+	clocks = <&clkwdtimer0>;
 };
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index d7db13d..addfc2c 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -270,12 +270,12 @@ config IOP_WATCHDOG
 
 config DAVINCI_WATCHDOG
 	tristate "DaVinci watchdog"
-	depends on ARCH_DAVINCI
+	depends on ARCH_DAVINCI || ARCH_KEYSTONE
 	select WATCHDOG_CORE
 	select WATCHDOG_NOWAYOUT
 	help
 	  Say Y here if to include support for the watchdog timer
-	  in the DaVinci DM644x/DM646x processors.
+	  in the DaVinci DM644x/DM646x or Keystone processors.
 	  To compile this driver as a module, choose M here: the
 	  module will be called davinci_wdt.
 
diff --git a/drivers/watchdog/davinci_wdt.c b/drivers/watchdog/davinci_wdt.c
index 55deaf8..a6d365a 100644
--- a/drivers/watchdog/davinci_wdt.c
+++ b/drivers/watchdog/davinci_wdt.c
@@ -143,7 +143,7 @@ static unsigned int davinci_wdt_get_timeleft(struct watchdog_device *wdd)
 
 static const struct watchdog_info davinci_wdt_info = {
 	.options = WDIOF_KEEPALIVEPING,
-	.identity = "DaVinci Watchdog",
+	.identity = "DaVinci/Keystone Watchdog",
 };
 
 static const struct watchdog_ops davinci_wdt_ops = {
@@ -212,6 +212,7 @@ static int davinci_wdt_remove(struct platform_device *pdev)
 
 static const struct of_device_id davinci_wdt_of_match[] = {
 	{ .compatible = "ti,davinci-wdt", },
+	{ .compatible = "ti,keystone-wdt", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, davinci_wdt_of_match);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
