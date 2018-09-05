From: Nishanth Menon <nm@ti.com>
Subject: [PATCH 2/3] arm64: dts: ti: am654: Add secure proxy instance for main domain
Date: Wed, 5 Sep 2018 11:20:23 -0500
Message-ID: <20180905162024.28243-3-nm@ti.com>
References: <20180905162024.28243-1-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905162024.28243-1-nm@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, Nishanth Menon <nm@ti.com>
List-Id: devicetree@vger.kernel.org

Add secure proxy instance for Main domain

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 674a266066ca..adcd6341e40c 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -29,6 +29,17 @@
 		};
 	};
 
+	secure_proxy_main: mailbox@32c00000 {
+		compatible = "ti,am654-secure-proxy";
+		#mbox-cells = <1>;
+		reg-names = "target_data", "rt", "scfg";
+		reg = <0x00 0x32c00000 0x00 0x100000>,
+		      <0x00 0x32400000 0x00 0x100000>,
+		      <0x00 0x32800000 0x00 0x100000>;
+		interrupt-names = "rx_011";
+		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	main_uart0: serial@2800000 {
 		compatible = "ti,am654-uart";
 		reg = <0x00 0x02800000 0x00 0x100>;
-- 
2.15.1
