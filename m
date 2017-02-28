From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 24/25] ARM: dts: s500: Add SPS node
Date: Tue, 28 Feb 2017 07:35:34 +0100
Message-ID: <20170228063535.32069-25-afaerber@suse.de>
References: <20170228063535.32069-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170228063535.32069-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, mp-cs@actions-semi.com, 96boards@ucrobotics.com, support@lemaker.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v3: new
 
 arch/arm/boot/dts/s500.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/s500.dtsi b/arch/arm/boot/dts/s500.dtsi
index b4ebd27..e802896 100644
--- a/arch/arm/boot/dts/s500.dtsi
+++ b/arch/arm/boot/dts/s500.dtsi
@@ -9,6 +9,7 @@
 #include "skeleton.dtsi"
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/s500-powergate.h>
 
 / {
 	compatible = "actions,s500";
@@ -37,6 +38,7 @@
 			compatible = "arm,cortex-a9";
 			reg = <0x2>;
 			enable-method = "actions,s500-smp";
+			power-domains = <&sps S500_PD_CPU2>;
 		};
 
 		cpu3: cpu@3 {
@@ -44,6 +46,7 @@
 			compatible = "arm,cortex-a9";
 			reg = <0x3>;
 			enable-method = "actions,s500-smp";
+			power-domains = <&sps S500_PD_CPU3>;
 		};
 	};
 
@@ -170,5 +173,11 @@
 			             <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "2Hz0", "2Hz1", "Timer0", "Timer1";
 		};
+
+		sps: power-controller@b01b0100 {
+			compatible = "actions,s500-sps";
+			reg = <0xb01b0100 0x100>;
+			#power-domain-cells = <1>;
+		};
 	};
 };
-- 
2.10.2
