From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 2/6] arm64: dts: k3-am6: Add mux-controller DT node required for muxing SERDES
Date: Wed, 29 May 2019 14:48:08 +0530
Message-ID: <20190529091812.20764-3-kishon@ti.com>
References: <20190529091812.20764-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529091812.20764-1-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

Add mux-controller DT node as a child node of scm_conf. This is
required for muxing SERDES between USB, PCIe and ICSS2 SGMII.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 81e97d7adcc9..99d2402455d1 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -233,6 +233,13 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x00100000 0x1c000>;
+
+		serdes_mux: mux-controller {
+			compatible = "mmio-mux";
+			#mux-control-cells = <1>;
+			mux-reg-masks = <0x4080 0x3>, /* SERDES0 lane select */
+					<0x4090 0x3>; /* SERDES1 lane select */
+		};
 	};
 
 	dwc3_0: dwc3@4000000 {
-- 
2.17.1
