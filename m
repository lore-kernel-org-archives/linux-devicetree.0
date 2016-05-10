From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Subject: [RFC 4/4] arm64: dts: r8a7795: Add Z clock scaling support
Date: Tue, 10 May 2016 11:46:06 +0700
Message-ID: <5731678E.3080003@rvc.renesas.com>
References: <1462372543-31835-1-git-send-email-geert+renesas@glider.be>
 <573166EB.70908@rvc.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <573166EB.70908@rvc.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <damm+renesas@opensource.se>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Toru Oishi <toru.oishi.zj@rvc.renesas.com>, "Khiem Trong. Nguyen" <khiem.nguyen.xt@rvc.renesas.com>
List-Id: devicetree@vger.kernel.org

This patch adds Z clock scaling support for CA57 in R8A7795 SoC.
An OPP table is created with the supported frequency scaling.

Signed-off-by: Dien Pham <dien.pham.ry@rvc.renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
---
  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 26 ++++++++++++++++++++++++++
  1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi 
b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 7181db0..041d0f2 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -43,6 +43,8 @@
  			power-domains = <&sysc R8A7795_PD_CA57_CPU0>;
  			next-level-cache = <&L2_CA57>;
  			enable-method = "psci";
+			clocks =<&cpg CPG_CORE R8A7795_CLK_Z>;
+			operating-points-v2 = <&cluster0_opp_tb0>;
  		};

  		a57_1: cpu@1 {
@@ -52,6 +54,7 @@
  			power-domains = <&sysc R8A7795_PD_CA57_CPU1>;
  			next-level-cache = <&L2_CA57>;
  			enable-method = "psci";
+			operating-points-v2 = <&cluster0_opp_tb0>;
  		};
  		a57_2: cpu@2 {
  			compatible = "arm,cortex-a57","arm,armv8";
@@ -60,6 +63,7 @@
  			power-domains = <&sysc R8A7795_PD_CA57_CPU2>;
  			next-level-cache = <&L2_CA57>;
  			enable-method = "psci";
+			operating-points-v2 = <&cluster0_opp_tb0>;
  		};
  		a57_3: cpu@3 {
  			compatible = "arm,cortex-a57","arm,armv8";
@@ -68,6 +72,28 @@
  			power-domains = <&sysc R8A7795_PD_CA57_CPU3>;
  			next-level-cache = <&L2_CA57>;
  			enable-method = "psci";
+			operating-points-v2 = <&cluster0_opp_tb0>;
+		};
+	};
+
+	cluster0_opp_tb0: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
  		};
  	};

-- 
1.9.1
