From: Michael Kao <michael.kao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/4] arm64: dts: mt8183: add dynamic power coefficients
Date: Wed, 14 Aug 2019 18:06:47 +0800
Message-ID: <1565777209-21869-3-git-send-email-michael.kao@mediatek.com>
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

Add dynamic power coefficients for all cores.

Signed-off-by: michael.kao <michael.kao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 47bde49..9de706a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -58,6 +58,7 @@
 			reg = <0x000>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
+			dynamic-power-coefficient = <84>;
 		};
 
 		cpu1: cpu@1 {
@@ -66,6 +67,7 @@
 			reg = <0x001>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
+			dynamic-power-coefficient = <84>;
 		};
 
 		cpu2: cpu@2 {
@@ -74,6 +76,7 @@
 			reg = <0x002>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
+			dynamic-power-coefficient = <84>;
 		};
 
 		cpu3: cpu@3 {
@@ -82,6 +85,7 @@
 			reg = <0x003>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
+			dynamic-power-coefficient = <84>;
 		};
 
 		cpu4: cpu@100 {
@@ -90,6 +94,7 @@
 			reg = <0x100>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <211>;
 		};
 
 		cpu5: cpu@101 {
@@ -98,6 +103,7 @@
 			reg = <0x101>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <211>;
 		};
 
 		cpu6: cpu@102 {
@@ -106,6 +112,7 @@
 			reg = <0x102>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <211>;
 		};
 
 		cpu7: cpu@103 {
@@ -114,6 +121,7 @@
 			reg = <0x103>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <211>;
 		};
 	};
 
-- 
1.9.1
