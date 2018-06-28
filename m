From: Stanley Chu <stanley.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 1/5] clocksource/drivers/timer-mediatek: Add system timer
 bindings
Date: Thu, 28 Jun 2018 18:45:40 +0800
Message-ID: <1530182744-10731-2-git-send-email-stanley.chu@mediatek.com>
References: <1530182744-10731-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1530182744-10731-1-git-send-email-stanley.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stanley Chu <stanley.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch fixes bindings of existed "General Purpose Timer",
and then add bindings of new "System Timer" on Mediatek SoCs.

Signed-off-by: Stanley Chu <stanley.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../bindings/timer/mediatek,mtk-timer.txt          |   38 ++++++++++++++++----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
index b1fe7e9..d42247b 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -1,5 +1,14 @@
-Mediatek MT6577, MT6572 and MT6589 Timers
----------------------------------------
+Mediatek Timers
+---------------
+
+Mediatek SoCs have two different timers on different platforms,
+- GPT (General Purpose Timer)
+- SYST (System Timer)
+
+Please bind correct timers in each platforms.
+
+
+** General Purpose Timer (GPT)
 
 Required properties:
 - compatible should contain:
@@ -11,9 +20,8 @@ Required properties:
 	* "mediatek,mt8135-timer" for MT8135 compatible timers
 	* "mediatek,mt8173-timer" for MT8173 compatible timers
 	* "mediatek,mt6577-timer" for MT6577 and all above compatible timers
-- reg: Should contain location and length for timers register.
-- clocks: Clocks driving the timer hardware. This list should include two
-	clocks. The order is system clock and as second clock the RTC clock.
+- reg: Should contain location and length for GPT register.
+- clocks: GPT is drived by system clock.
 
 Examples:
 
@@ -21,5 +29,23 @@ Examples:
 		compatible = "mediatek,mt6577-timer";
 		reg = <0x10008000 0x80>;
 		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&system_clk>, <&rtc_clk>;
+		clocks = <&system_clk>;
+	};
+
+
+** System Timer (SYST)
+
+Required properties:
+- compatible: Should contain
+	* "mediatek,mt6765-systimer" for MT6765 compatible timers
+- reg: Should contain the location and length for system timer registers.
+- clocks: System timer is drived by system clock.
+
+Examples:
+
+	systimer@10017000 {
+		compatible = "mediatek,mt6765-systimer";
+		reg = <0 0x10017000 0 0x1000>;
+		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&system_clk>;
 	};
-- 
1.7.9.5
