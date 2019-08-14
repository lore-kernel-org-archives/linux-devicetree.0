From: Michael Kao <michael.kao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 3/4] arm64: dts: mt8183: Add #cooling-cells to CPU nodes
Date: Wed, 14 Aug 2019 18:06:48 +0800
Message-ID: <1565777209-21869-4-git-send-email-michael.kao@mediatek.com>
References: <1565777209-21869-1-git-send-email-michael.kao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1565777209-21869-1-git-send-email-michael.kao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Zhang Rui <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, hsinyi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "michael.kao" <michael.kao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: "michael.kao" <michael.kao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

The #cooling-cells property needs to be specified to allow a CPU
to be used as cooling device.

Signed-off-by: michael.kao <michael.kao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 9de706a..bc42b82 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include "mt8183-pinfunc.h"
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	compatible = "mediatek,mt8183";
@@ -59,6 +60,7 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
 			dynamic-power-coefficient = <84>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -68,6 +70,7 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
 			dynamic-power-coefficient = <84>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -77,6 +80,7 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
 			dynamic-power-coefficient = <84>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -86,6 +90,7 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
 			dynamic-power-coefficient = <84>;
+			#cooling-cells = <2>;
 		};
 
 		cpu4: cpu@100 {
@@ -95,6 +100,7 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <211>;
+			#cooling-cells = <2>;
 		};
 
 		cpu5: cpu@101 {
@@ -104,6 +110,7 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <211>;
+			#cooling-cells = <2>;
 		};
 
 		cpu6: cpu@102 {
@@ -113,6 +120,7 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <211>;
+			#cooling-cells = <2>;
 		};
 
 		cpu7: cpu@103 {
@@ -122,6 +130,7 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <211>;
+			#cooling-cells = <2>;
 		};
 	};
 
-- 
1.9.1
