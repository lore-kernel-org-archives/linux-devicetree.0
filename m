From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v2 3/7] watchdog: sirfsoc: allow setting timeout in devicetree
Date: Sat, 10 Feb 2018 10:19:07 +0100
Message-ID: <20180210091911.3644-3-marcus.folkesson@gmail.com>
References: <20180210091911.3644-1-marcus.folkesson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180210091911.3644-1-marcus.folkesson@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Barry Song <baohua@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

watchdog_init_timeout() will allways pick timeout_param since it
defaults to a valid timeout.

By following best practice described in
Documentation/watchdog/watchdog-kernel-api.txt, it also
let us to set timout-sec property in devicetree.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/devicetree/bindings/watchdog/sirfsoc_wdt.txt | 4 ++++
 drivers/watchdog/sirfsoc_wdt.c                             | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/sirfsoc_wdt.txt b/Documentation/devicetree/bindings/watchdog/sirfsoc_wdt.txt
index 9cbc76c89b2b..0dce5e3100b4 100644
--- a/Documentation/devicetree/bindings/watchdog/sirfsoc_wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/sirfsoc_wdt.txt
@@ -5,10 +5,14 @@ Required properties:
 - reg: Address range of tick timer/WDT register set
 - interrupts: interrupt number to the cpu
 
+Optional properties:
+- timeout-sec : Contains the watchdog timeout in seconds
+
 Example:
 
 timer@b0020000 {
 	compatible = "sirf,prima2-tick";
 	reg = <0xb0020000 0x1000>;
 	interrupts = <0>;
+	timeout-sec = <30>;
 };
diff --git a/drivers/watchdog/sirfsoc_wdt.c b/drivers/watchdog/sirfsoc_wdt.c
index 4eea351e09b0..ac0c9d2c4aee 100644
--- a/drivers/watchdog/sirfsoc_wdt.c
+++ b/drivers/watchdog/sirfsoc_wdt.c
@@ -29,7 +29,7 @@
 #define SIRFSOC_WDT_MAX_TIMEOUT		(10 * 60)	/* 10 mins */
 #define SIRFSOC_WDT_DEFAULT_TIMEOUT	30		/* 30 secs */
 
-static unsigned int timeout = SIRFSOC_WDT_DEFAULT_TIMEOUT;
+static unsigned int timeout;
 static bool nowayout = WATCHDOG_NOWAYOUT;
 
 module_param(timeout, uint, 0);
-- 
2.15.1
