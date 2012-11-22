From: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 3/7] watchdog: pnx4008: add timeout-sec property binding
Date: Thu, 22 Nov 2012 13:51:52 +0100
Message-ID: <1353588716-28917-4-git-send-email-fabio.porcedda@gmail.com>
References: <1353588716-28917-1-git-send-email-fabio.porcedda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1353588716-28917-1-git-send-email-fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: Masanari Iida <standby24x7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Only compile tested.

Signed-off-by: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Cc: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Masanari Iida <standby24x7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/watchdog/pnx4008-wdt.txt | 4 ++++
 drivers/watchdog/pnx4008_wdt.c                             | 7 +++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/pnx4008-wdt.txt b/Documentation/devicetree/bindings/watchdog/pnx4008-wdt.txt
index 7c7f688..556d06c 100644
--- a/Documentation/devicetree/bindings/watchdog/pnx4008-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/pnx4008-wdt.txt
@@ -5,9 +5,13 @@ Required properties:
 - reg: physical base address of the controller and length of memory mapped
   region.
 
+Optional properties:
+- timeout-sec: contains the watchdog timeout in seconds.
+
 Example:
 
 	watchdog@4003C000 {
 		compatible = "nxp,pnx4008-wdt";
 		reg = <0x4003C000 0x1000>;
+		timeout-sec = <10>;
 	};
diff --git a/drivers/watchdog/pnx4008_wdt.c b/drivers/watchdog/pnx4008_wdt.c
index 87722e1..152e9fb 100644
--- a/drivers/watchdog/pnx4008_wdt.c
+++ b/drivers/watchdog/pnx4008_wdt.c
@@ -142,6 +142,7 @@ static const struct watchdog_ops pnx4008_wdt_ops = {
 static struct watchdog_device pnx4008_wdd = {
 	.info = &pnx4008_wdt_ident,
 	.ops = &pnx4008_wdt_ops,
+	.timeout = DEFAULT_HEARTBEAT,
 	.min_timeout = 1,
 	.max_timeout = MAX_HEARTBEAT,
 };
@@ -151,8 +152,7 @@ static int __devinit pnx4008_wdt_probe(struct platform_device *pdev)
 	struct resource *r;
 	int ret = 0;
 
-	if (heartbeat < 1 || heartbeat > MAX_HEARTBEAT)
-		heartbeat = DEFAULT_HEARTBEAT;
+	watchdog_init_timeout(&pnx4008_wdd, heartbeat, pdev->dev.of_node);
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	wdt_base = devm_request_and_ioremap(&pdev->dev, r);
@@ -167,7 +167,6 @@ static int __devinit pnx4008_wdt_probe(struct platform_device *pdev)
 	if (ret)
 		goto out;
 
-	pnx4008_wdd.timeout = heartbeat;
 	pnx4008_wdd.bootstatus = (readl(WDTIM_RES(wdt_base)) & WDOG_RESET) ?
 			WDIOF_CARDRESET : 0;
 	watchdog_set_nowayout(&pnx4008_wdd, nowayout);
@@ -181,7 +180,7 @@ static int __devinit pnx4008_wdt_probe(struct platform_device *pdev)
 	}
 
 	dev_info(&pdev->dev, "PNX4008 Watchdog Timer: heartbeat %d sec\n",
-			heartbeat);
+		 pnx4008_wdd.timeout);
 
 	return 0;
 
-- 
1.8.0
