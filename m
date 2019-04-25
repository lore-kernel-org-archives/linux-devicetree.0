Return-Path: <SRS0=K8Ad=S3=socionext.com=sugaya.taichi@kernel.org>
From: Sugaya Taichi <sugaya.taichi@socionext.com>
Subject: [PATCH v3 3/3] ARM: dts: milbeaut: Add a clk node for Milbeaut M10V
Date: Thu, 25 Apr 2019 19:41:02 +0900
Message-Id: <1556188862-22546-4-git-send-email-sugaya.taichi@socionext.com>
In-Reply-To: <1556188862-22546-1-git-send-email-sugaya.taichi@socionext.com>
References: <1556188862-22546-1-git-send-email-sugaya.taichi@socionext.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Sugaya Taichi <sugaya.taichi@socionext.com>
List-ID: <devicetree@vger.kernel.org>

Add a clk node for Milbeaut M10V.

Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
---
 arch/arm/boot/dts/milbeaut-m10v.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/milbeaut-m10v.dtsi b/arch/arm/boot/dts/milbeaut-m10v.dtsi
index aa7c6ca..5428bd9 100644
--- a/arch/arm/boot/dts/milbeaut-m10v.dtsi
+++ b/arch/arm/boot/dts/milbeaut-m10v.dtsi
@@ -65,6 +65,13 @@
 			      <0x1d002000 0x1000>; /* CPU I/f base and size */
 		};
 
+		clk: m10v-clock-ctrl@1d021000 {
+			compatible = "socionext,milbeaut-m10v-ccu";
+			#clock-cells = <1>;
+			reg = <0x1d021000 0x1000>;
+			clocks = <&uclk40xi>;
+		};
+
 		timer@1e000050 { /* 32-bit Reload Timers */
 			compatible = "socionext,milbeaut-timer";
 			reg = <0x1e000050 0x20>;
-- 
1.9.1
