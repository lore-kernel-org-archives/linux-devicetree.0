From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 07/30] arm: dts: mt7623: add pinctrl nodes to the mt7623
 dtsi file
Date: Wed, 26 Apr 2017 17:25:51 +0800
Message-ID: <1493198774-4478-8-git-send-email-sean.wang@mediatek.com>
References: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1493198774-4478-1-git-send-email-sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>

Add pin controller node to the mt7623.dtsi file

Signed-off-by: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/mt7623.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index 3cc0a3a..1942bc7 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -15,7 +15,10 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/mt2701-clk.h>
+#include <dt-bindings/pinctrl/mt7623-pinfunc.h>
 #include <dt-bindings/power/mt2701-power.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/reset/mt2701-resets.h>
 #include "skeleton64.dtsi"
 
@@ -107,6 +110,26 @@
 		#reset-cells = <1>;
 	};
 
+	pio: pinctrl@10005000 {
+		compatible = "mediatek,mt7623-pinctrl",
+			     "mediatek,mt2701-pinctrl";
+		reg = <0 0x1000b000 0 0x1000>;
+		mediatek,pctl-regmap = <&syscfg_pctl_a>;
+		pins-are-numbered;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gic>;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	syscfg_pctl_a: syscfg@10005000 {
+		compatible = "mediatek,mt7623-pctl-a-syscfg", "syscon";
+		reg = <0 0x10005000 0 0x1000>;
+	};
+
 	scpsys: scpsys@10006000 {
 		compatible = "mediatek,mt7623-scpsys",
 			     "mediatek,mt2701-scpsys",
-- 
1.9.1
