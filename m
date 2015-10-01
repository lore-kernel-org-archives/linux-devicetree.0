From: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 2/4] ARM: dts: Add Ethernet node to STiH407 family
Date: Thu, 1 Oct 2015 17:56:20 +0200
Message-ID: <1443714982-16251-3-git-send-email-maxime.coquelin@st.com>
References: <1443714982-16251-1-git-send-email-maxime.coquelin@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443714982-16251-1-git-send-email-maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: maxime.coquelin-qxv4g6HH51o@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

STiH407 family uses the Synopsys IP.

Signed-off-by: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 582154b..c944d3a 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -653,5 +653,32 @@
 			clocks          = <&clk_sysin>;
 			status		= "okay";
 		};
+
+		ethernet0: dwmac@9630000 {
+			device_type = "network";
+			status = "disabled";
+			compatible = "st,stih407-dwmac", "snps,dwmac", "snps,dwmac-3.710";
+			reg = <0x9630000 0x8000>, <0x80 0x4>;
+			reg-names = "stmmaceth", "sti-ethconf";
+
+			st,syscon = <&syscfg_sbc_reg 0x80>;
+			st,gmac_en;
+			resets = <&softreset STIH407_ETH1_SOFTRESET>;
+			reset-names = "stmmaceth";
+
+			interrupts = <GIC_SPI 98 IRQ_TYPE_NONE>,
+				     <GIC_SPI 99 IRQ_TYPE_NONE>;
+			interrupt-names = "macirq", "eth_wake_irq";
+
+			/* DMA Bus Mode */
+			snps,pbl = <8>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_rgmii1>;
+
+			clock-names = "stmmaceth", "sti-ethclk";
+			clocks = <&clk_s_c0_flexgen CLK_EXT2F_A9>,
+				 <&clk_s_c0_flexgen CLK_ETH_PHY>;
+		};
 	};
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
