From: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v7 4/6] watchdog: s3c2410_wdt: add timeout-sec property binding
Date: Tue,  8 Jan 2013 11:04:13 +0100
Message-ID: <1357639455-21935-5-git-send-email-fabio.porcedda@gmail.com>
References: <1357639455-21935-1-git-send-email-fabio.porcedda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1357639455-21935-1-git-send-email-fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Only compile tested.

Signed-off-by: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.txt | 3 +++
 drivers/watchdog/s3c2410_wdt.c                             | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
index 79ead82..451127a 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
@@ -9,3 +9,6 @@ Required properties:
 - reg : base physical address of the controller and length of memory mapped
 	region.
 - interrupts : interrupt number to the cpu.
+
+Optional properties:
+- timeout-sec : contains the watchdog timeout in seconds.
diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 27bcd4e..2f187ae 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -53,7 +53,7 @@
 #define CONFIG_S3C2410_WATCHDOG_DEFAULT_TIME	(15)
 
 static bool nowayout	= WATCHDOG_NOWAYOUT;
-static int tmr_margin	= CONFIG_S3C2410_WATCHDOG_DEFAULT_TIME;
+static int tmr_margin;
 static int tmr_atboot	= CONFIG_S3C2410_WATCHDOG_ATBOOT;
 static int soft_noboot;
 static int debug;
@@ -226,6 +226,7 @@ static struct watchdog_ops s3c2410wdt_ops = {
 static struct watchdog_device s3c2410_wdd = {
 	.info = &s3c2410_wdt_ident,
 	.ops = &s3c2410wdt_ops,
+	.timeout = CONFIG_S3C2410_WATCHDOG_DEFAULT_TIME,
 };
 
 /* interrupt handler code */
@@ -365,7 +366,8 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	/* see if we can actually set the requested timer margin, and if
 	 * not, try the default value */
 
-	if (s3c2410wdt_set_heartbeat(&s3c2410_wdd, tmr_margin)) {
+	watchdog_init_timeout(&s3c2410_wdd, tmr_margin,  pdev->dev.of_node);
+	if (s3c2410wdt_set_heartbeat(&s3c2410_wdd, s3c2410_wdd.timeout)) {
 		started = s3c2410wdt_set_heartbeat(&s3c2410_wdd,
 					CONFIG_S3C2410_WATCHDOG_DEFAULT_TIME);
 
-- 
1.8.0.3
