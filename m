From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v4 26/28] ARM: dts: s500: Set power domains for CPU2 and CPU3
Date: Tue,  6 Jun 2017 02:54:24 +0200
Message-ID: <20170606005426.26446-27-afaerber@suse.de>
References: <20170606005426.26446-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170606005426.26446-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: mp-cs@actions-semi.com, Thomas Liau <thomas.liau@actions-semi.com>, =?UTF-8?q?=E5=BC=A0=E4=B8=9C=E9=A3=8E?= <zhangdf@actions-semi.com>, =?UTF-8?q?=E5=88=98=E7=82=9C?= <liuwei@actions-semi.com>, =?UTF-8?q?=E5=BC=A0=E5=A4=A9=E7=9B=8A?= <tyzhang@actions-semi.com>, 96boards@ucrobotics.com, support@lemaker.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

CPU2 has its own power domain PD_CPU2, and CPU3 has PD_CPU3.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v4: new (split off due to dt-bindings dependency)
 
 arch/arm/boot/dts/s500.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/s500.dtsi b/arch/arm/boot/dts/s500.dtsi
index 51a48741d4c0..4e4478a3ec08 100644
--- a/arch/arm/boot/dts/s500.dtsi
+++ b/arch/arm/boot/dts/s500.dtsi
@@ -7,6 +7,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/s500-powergate.h>
 
 / {
 	compatible = "actions,s500";
@@ -43,6 +44,7 @@
 			compatible = "arm,cortex-a9";
 			reg = <0x2>;
 			enable-method = "actions,s500-smp";
+			power-domains = <&sps S500_PD_CPU2>;
 		};
 
 		cpu3: cpu@3 {
@@ -50,6 +52,7 @@
 			compatible = "arm,cortex-a9";
 			reg = <0x3>;
 			enable-method = "actions,s500-smp";
+			power-domains = <&sps S500_PD_CPU3>;
 		};
 	};
 
-- 
2.12.3
