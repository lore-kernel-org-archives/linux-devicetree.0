From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 2/6] arm64: dts: marvell: cp110: add GPIO interrupts
Date: Sat, 08 Jul 2017 20:16:34 +0100
Message-ID: <E1dTvDW-0007Eh-LA@rmk-PC.armlinux.org.uk>
References: <20170708191317.GM4902@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170708191317.GM4902-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rabeeh Khoury <rabeeh-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>, Jon Nettleton <jon-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the GPIO interrupts for the CP110.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi | 11 ++++++++++-
 arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi  | 11 ++++++++++-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
index 68fb35f0386a..a2bfc3b0bef8 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
@@ -131,8 +131,12 @@
 					gpio-controller;
 					#gpio-cells = <2>;
 					gpio-ranges = <&cpm_pinctrl 0 0 32>;
+					interrupt-controller;
+					interrupts = <ICU_GRP_NSR 86 IRQ_TYPE_LEVEL_HIGH>,
+						     <ICU_GRP_NSR 85 IRQ_TYPE_LEVEL_HIGH>,
+						     <ICU_GRP_NSR 84 IRQ_TYPE_LEVEL_HIGH>,
+						     <ICU_GRP_NSR 83 IRQ_TYPE_LEVEL_HIGH>;
 					status = "disabled";
-
 				};
 
 				cpm_gpio2: gpio@140 {
@@ -142,6 +146,11 @@
 					gpio-controller;
 					#gpio-cells = <2>;
 					gpio-ranges = <&cpm_pinctrl 0 32 31>;
+					interrupt-controller;
+					interrupts = <ICU_GRP_NSR 82 IRQ_TYPE_LEVEL_HIGH>,
+						     <ICU_GRP_NSR 81 IRQ_TYPE_LEVEL_HIGH>,
+						     <ICU_GRP_NSR 80 IRQ_TYPE_LEVEL_HIGH>,
+						     <ICU_GRP_NSR 79 IRQ_TYPE_LEVEL_HIGH>;
 					status = "disabled";
 				};
 			};
diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
index d054684b79bc..036edf86b0f2 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
@@ -138,8 +138,12 @@
 					gpio-controller;
 					#gpio-cells = <2>;
 					gpio-ranges = <&cps_pinctrl 0 0 32>;
+					interrupt-controller;
+					interrupts = <ICU_GRP_NSR 86 IRQ_TYPE_LEVEL_HIGH>,
+						     <ICU_GRP_NSR 85 IRQ_TYPE_LEVEL_HIGH>,
+						     <ICU_GRP_NSR 84 IRQ_TYPE_LEVEL_HIGH>,
+						     <ICU_GRP_NSR 83 IRQ_TYPE_LEVEL_HIGH>;
 					status = "disabled";
-
 				};
 
 				cps_gpio2: gpio@140 {
@@ -149,6 +153,11 @@
 					gpio-controller;
 					#gpio-cells = <2>;
 					gpio-ranges = <&cps_pinctrl 0 32 31>;
+					interrupt-controller;
+					interrupts = <ICU_GRP_NSR 82 IRQ_TYPE_LEVEL_HIGH>,
+						     <ICU_GRP_NSR 81 IRQ_TYPE_LEVEL_HIGH>,
+						     <ICU_GRP_NSR 80 IRQ_TYPE_LEVEL_HIGH>,
+						     <ICU_GRP_NSR 79 IRQ_TYPE_LEVEL_HIGH>;
 					status = "disabled";
 				};
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
