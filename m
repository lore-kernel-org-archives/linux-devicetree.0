From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH v2 07/13] ARM: mach-omap2: cpus/cpu nodes dts updates
Date: Mon, 22 Apr 2013 16:27:29 +0100
Message-ID: <1366644455-16550-8-git-send-email-lorenzo.pieralisi@arm.com>
References: <1366644455-16550-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1366644455-16550-1-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>, Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch updates the in-kernel dts files according to the latest cpus
and cpu bindings updates for ARM.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/boot/dts/omap3.dtsi | 4 ++++
 arch/arm/boot/dts/omap4.dtsi | 5 +++++
 arch/arm/boot/dts/omap5.dtsi | 5 +++++
 3 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
index 1acc261..b4e2b8d 100644
--- a/arch/arm/boot/dts/omap3.dtsi
+++ b/arch/arm/boot/dts/omap3.dtsi
@@ -21,8 +21,12 @@
 	};
 
 	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		cpu@0 {
 			compatible = "arm,cortex-a8";
+			reg = <0x0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
index 739bb79..9c5f7c2 100644
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -28,13 +28,18 @@
 	};
 
 	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		cpu@0 {
 			compatible = "arm,cortex-a9";
 			next-level-cache = <&L2>;
+			reg = <0x0>;
 		};
 		cpu@1 {
 			compatible = "arm,cortex-a9";
 			next-level-cache = <&L2>;
+			reg = <0x1>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index 790bb2a..d2106b6 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -31,8 +31,12 @@
 	};
 
 	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		cpu@0 {
 			compatible = "arm,cortex-a15";
+			reg = <0x0>;
 			timer {
 				compatible = "arm,armv7-timer";
 				/* 14th PPI IRQ, active low level-sensitive */
@@ -42,6 +46,7 @@
 		};
 		cpu@1 {
 			compatible = "arm,cortex-a15";
+			reg = <0x1>;
 			timer {
 				compatible = "arm,armv7-timer";
 				/* 14th PPI IRQ, active low level-sensitive */
-- 
1.7.12
