From: Faiz Abbas <faiz_abbas@ti.com>
Subject: [PATCH v3 1/2] arm64: dts: ti: k3-am654: Add Support for eMMC host controller
Date: Thu, 17 Jan 2019 15:14:23 +0530
Message-ID: <20190117094424.7683-2-faiz_abbas@ti.com>
References: <20190117094424.7683-1-faiz_abbas@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117094424.7683-1-faiz_abbas@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, robh+dt@kernel.org, nm@ti.com, t-kristo@ti.com, faiz_abbas@ti.com
List-Id: devicetree@vger.kernel.org

Add support for the Secure Digital Host Controller Interface (SDHCI)
present on TI's AM654 SOCs. It is compatible with eMMC5.1 Host
Specifications.

Enable only upto HS200 speed mode.

Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
Acked-by: Nishanth Menon <nm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 272cf8fc8d30..9338315b0ca9 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -191,4 +191,18 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
+
+	sdhci0: sdhci@4f80000 {
+		compatible = "ti,am654-sdhci-5.1";
+		reg = <0x0 0x4f80000 0x0 0x260>, <0x0 0x4f90000 0x0 0x134>;
+		power-domains = <&k3_pds 47>;
+		clocks = <&k3_clks 47 0>, <&k3_clks 47 1>;
+		clock-names = "clk_ahb", "clk_xin";
+		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+		mmc-ddr-1_8v;
+		mmc-hs200-1_8v;
+		ti,otap-del-sel = <0x2>;
+		ti,trm-icp = <0x8>;
+		dma-coherent;
+	};
 };
-- 
2.19.2
