From: Nishanth Menon <nm@ti.com>
Subject: [PATCH 3/3] arm64: dts: ti: k3-am6: Add Device Management Security Controller support
Date: Wed, 5 Sep 2018 11:20:24 -0500
Message-ID: <20180905162024.28243-4-nm@ti.com>
References: <20180905162024.28243-1-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905162024.28243-1-nm@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, Nishanth Menon <nm@ti.com>
List-Id: devicetree@vger.kernel.org

Add TISCI compatible System controller for AM6 SoCs.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
index 8b4378d4d0a3..affc3c309353 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
@@ -6,6 +6,34 @@
  */
 
 &cbass_wakeup {
+	dmsc: dmsc {
+		compatible = "ti,k2g-sci";
+		ti,host-id = <12>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		mbox-names = "rx", "tx";
+
+		mboxes= <&secure_proxy_main 11>,
+			<&secure_proxy_main 13>;
+
+		k3_pds: power-controller {
+			compatible = "ti,sci-pm-domain";
+			#power-domain-cells = <1>;
+		};
+
+		k3_clks: clocks {
+			compatible = "ti,k2g-sci-clk";
+			#clock-cells = <2>;
+		};
+
+		k3_reset: reset-controller {
+			compatible = "ti,sci-reset";
+			#reset-cells = <2>;
+		};
+	};
+
 	wkup_uart0: serial@42300000 {
 		compatible = "ti,am654-uart";
 		reg = <0x00 0x42300000 0x00 0x100>;
-- 
2.15.1
