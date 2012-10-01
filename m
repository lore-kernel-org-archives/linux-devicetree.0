From: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 2/5] watchdog: orion_wdt: dt: add the timeout property
 binding
Date: Mon,  1 Oct 2012 14:24:38 +0200
Message-ID: <1349094281-28889-3-git-send-email-fabio.porcedda@gmail.com>
References: <1349094281-28889-1-git-send-email-fabio.porcedda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1349094281-28889-1-git-send-email-fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The binding is provided by the watchdog core.

Signed-off-by: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/watchdog/marvel.txt | 5 +++++
 drivers/watchdog/orion_wdt.c                          | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/marvel.txt b/Documentation/devicetree/bindings/watchdog/marvel.txt
index 0b2503a..66c2b8c 100644
--- a/Documentation/devicetree/bindings/watchdog/marvel.txt
+++ b/Documentation/devicetree/bindings/watchdog/marvel.txt
@@ -5,10 +5,15 @@ Required Properties:
 - Compatibility : "marvell,orion-wdt"
 - reg		: Address of the timer registers
 
+Optional properties:
+
+- timeout	: Contains the watchdog timeout in seconds
+
 Example:
 
 	wdt@20300 {
 		compatible = "marvell,orion-wdt";
 		reg = <0x20300 0x28>;
+		timeout = <10>;
 		status = "okay";
 	};
diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
index c20f96b..3dc7481 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -24,7 +24,6 @@
 #include <linux/spinlock.h>
 #include <linux/clk.h>
 #include <linux/err.h>
-#include <linux/of.h>
 #include <mach/bridge-regs.h>
 
 /*
@@ -168,6 +167,7 @@ static int __devinit orion_wdt_probe(struct platform_device *pdev)
 	orion_wdt.timeout = heartbeat;
 	orion_wdt.min_timeout = 1;
 	orion_wdt.max_timeout = wdt_max_duration;
+	watchdog_probe_dt(&orion_wdt, pdev->dev.of_node);
 
 	watchdog_set_nowayout(&orion_wdt, nowayout);
 	ret = watchdog_register_device(&orion_wdt);
-- 
1.7.11.3
