From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 10/10] arm64: dts: k3-am6: Add crypto accelarator node
Date: Tue, 18 Jun 2019 17:38:43 +0530
Message-ID: <20190618120843.18777-11-j-keerthy@ti.com>
References: <20190618120843.18777-1-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618120843.18777-1-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, t-kristo@ti.com, j-keerthy@ti.com, nm@ti.com
List-Id: devicetree@vger.kernel.org

Add crypto accelarator node. Define the psil specific config
node as well. This can be used in Packet Mode alone.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 91ca5bfeefc2..5e4f9ec39f01 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -91,6 +91,39 @@
 		power-domains = <&k3_pds 148>;
 	};
 
+	crypto: crypto@4E00000 {
+		compatible = "ti,sa2ul-crypto";
+		label = "crypto-aes-gbe";
+		reg = <0x0 0x4E00000 0x0 0x1200>;
+
+		status = "okay";
+		ti,psil-base = <0x4000>;
+
+		/* tx: crypto_pnp-1, rx: crypto_pnp-1 */
+		dmas = <&main_udmap &crypto 0 UDMA_DIR_TX>,
+				<&main_udmap &crypto 0 UDMA_DIR_RX>,
+				<&main_udmap &crypto 1 UDMA_DIR_RX>;
+		dma-names = "tx", "rx1", "rx2";
+
+		ti,psil-config0 {
+			linux,udma-mode = <UDMA_PKT_MODE>;
+			ti,needs-epib;
+			ti,psd-size = <64>;
+		};
+
+		ti,psil-config1 {
+			linux,udma-mode = <UDMA_PKT_MODE>;
+			ti,needs-epib;
+			ti,psd-size = <64>;
+		};
+
+		ti,psil-config2 {
+			linux,udma-mode = <UDMA_PKT_MODE>;
+			ti,needs-epib;
+			ti,psd-size = <64>;
+		};
+	};
+
 	main_pmx0: pinmux@11c000 {
 		compatible = "pinctrl-single";
 		reg = <0x0 0x11c000 0x0 0x2e4>;
-- 
2.17.1
