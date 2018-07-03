From: Saravanan Sekar <sravanhome@gmail.com>
Subject: [PATCH v3 5/5] arm64: dts: actions: Set UART clock reference from CMU
Date: Tue,  3 Jul 2018 11:25:24 +0200
Message-ID: <20180703092524.1697111-6-sravanhome@gmail.com>
References: <20180703092524.1697111-1-sravanhome@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703092524.1697111-1-sravanhome@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de, sboyd@kernel.org, manivannan.sadhasivam@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, support@cubietech.com, thomas.liau@actions-semi.com, jeff.chen@actions-semi.com, linux@cubietech.com, darren@cubietech.com, mp-cs@actions-semi.com, pn@denx.de, sravanhome@gmail.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Parthiban Nallathambi <pn@denx.de>
Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>
---
 arch/arm64/boot/dts/actions/s700-cubieboard7.dts | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/actions/s700-cubieboard7.dts b/arch/arm64/boot/dts/actions/s700-cubieboard7.dts
index ef79d7905f44..388a5d8bb48d 100644
--- a/arch/arm64/boot/dts/actions/s700-cubieboard7.dts
+++ b/arch/arm64/boot/dts/actions/s700-cubieboard7.dts
@@ -28,12 +28,6 @@
 		device_type = "memory";
 		reg = <0x1 0xe0000000 0x0 0x0>;
 	};
-
-	uart3_clk: uart3-clk {
-		compatible = "fixed-clock";
-		clock-frequency = <921600>;
-		#clock-cells = <0>;
-	};
 };
 
 &timer {
@@ -42,5 +36,5 @@
 
 &uart3 {
 	status = "okay";
-	clocks = <&uart3_clk>;
+	clocks = <&clock CLK_UART3>;
 };
-- 
2.14.4
