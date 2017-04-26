From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 18/30] arm: dts: mt7623: add afe nodes to the mt7623.dtsi file
Date: Wed, 26 Apr 2017 17:26:02 +0800
Message-ID: <1493198774-4478-19-git-send-email-sean.wang@mediatek.com>
References: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493198774-4478-1-git-send-email-sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Add afe nodes to the mt7623.dtsi file. Which
is the necessary node for I2S audio in/out.

Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/mt7623.dtsi | 99 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index 76e0840..a2b6238 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -380,6 +380,105 @@
 		status = "disabled";
 	};
 
+	afe: audio-controller@11220000 {
+		compatible = "mediatek,mt7623-audio",
+			     "mediatek,mt2701-audio";
+		reg = <0 0x11220000 0 0x2000>,
+		      <0 0x112a0000 0 0x20000>;
+		interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_LOW>;
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
+
+		clocks = <&infracfg CLK_INFRA_AUDIO>,
+			 <&topckgen CLK_TOP_AUD_MUX1_SEL>,
+			 <&topckgen CLK_TOP_AUD_MUX2_SEL>,
+			 <&topckgen CLK_TOP_AUD_MUX1_DIV>,
+			 <&topckgen CLK_TOP_AUD_MUX2_DIV>,
+			 <&topckgen CLK_TOP_AUD_48K_TIMING>,
+			 <&topckgen CLK_TOP_AUD_44K_TIMING>,
+			 <&topckgen CLK_TOP_AUDPLL_MUX_SEL>,
+			 <&topckgen CLK_TOP_APLL_SEL>,
+			 <&topckgen CLK_TOP_AUD1PLL_98M>,
+			 <&topckgen CLK_TOP_AUD2PLL_90M>,
+			 <&topckgen CLK_TOP_HADDS2PLL_98M>,
+			 <&topckgen CLK_TOP_HADDS2PLL_294M>,
+			 <&topckgen CLK_TOP_AUDPLL>,
+			 <&topckgen CLK_TOP_AUDPLL_D4>,
+			 <&topckgen CLK_TOP_AUDPLL_D8>,
+			 <&topckgen CLK_TOP_AUDPLL_D16>,
+			 <&topckgen CLK_TOP_AUDPLL_D24>,
+			 <&topckgen CLK_TOP_AUDINTBUS_SEL>,
+			 <&clk26m>,
+			 <&topckgen CLK_TOP_SYSPLL1_D4>,
+			 <&topckgen CLK_TOP_AUD_K1_SRC_SEL>,
+			 <&topckgen CLK_TOP_AUD_K2_SRC_SEL>,
+			 <&topckgen CLK_TOP_AUD_K3_SRC_SEL>,
+			 <&topckgen CLK_TOP_AUD_K4_SRC_SEL>,
+			 <&topckgen CLK_TOP_AUD_K5_SRC_SEL>,
+			 <&topckgen CLK_TOP_AUD_K6_SRC_SEL>,
+			 <&topckgen CLK_TOP_AUD_K1_SRC_DIV>,
+			 <&topckgen CLK_TOP_AUD_K2_SRC_DIV>,
+			 <&topckgen CLK_TOP_AUD_K3_SRC_DIV>,
+			 <&topckgen CLK_TOP_AUD_K4_SRC_DIV>,
+			 <&topckgen CLK_TOP_AUD_K5_SRC_DIV>,
+			 <&topckgen CLK_TOP_AUD_K6_SRC_DIV>,
+			 <&topckgen CLK_TOP_AUD_I2S1_MCLK>,
+			 <&topckgen CLK_TOP_AUD_I2S2_MCLK>,
+			 <&topckgen CLK_TOP_AUD_I2S3_MCLK>,
+			 <&topckgen CLK_TOP_AUD_I2S4_MCLK>,
+			 <&topckgen CLK_TOP_AUD_I2S5_MCLK>,
+			 <&topckgen CLK_TOP_AUD_I2S6_MCLK>,
+			 <&topckgen CLK_TOP_ASM_M_SEL>,
+			 <&topckgen CLK_TOP_ASM_H_SEL>,
+			 <&topckgen CLK_TOP_UNIVPLL2_D4>,
+			 <&topckgen CLK_TOP_UNIVPLL2_D2>,
+			 <&topckgen CLK_TOP_SYSPLL_D5>;
+
+		clock-names = "infra_sys_audio_clk",
+			 "top_audio_mux1_sel",
+			 "top_audio_mux2_sel",
+			 "top_audio_mux1_div",
+			 "top_audio_mux2_div",
+			 "top_audio_48k_timing",
+			 "top_audio_44k_timing",
+			 "top_audpll_mux_sel",
+			 "top_apll_sel",
+			 "top_aud1_pll_98M",
+			 "top_aud2_pll_90M",
+			 "top_hadds2_pll_98M",
+			 "top_hadds2_pll_294M",
+			 "top_audpll",
+			 "top_audpll_d4",
+			 "top_audpll_d8",
+			 "top_audpll_d16",
+			 "top_audpll_d24",
+			 "top_audintbus_sel",
+			 "clk_26m",
+			 "top_syspll1_d4",
+			 "top_aud_k1_src_sel",
+			 "top_aud_k2_src_sel",
+			 "top_aud_k3_src_sel",
+			 "top_aud_k4_src_sel",
+			 "top_aud_k5_src_sel",
+			 "top_aud_k6_src_sel",
+			 "top_aud_k1_src_div",
+			 "top_aud_k2_src_div",
+			 "top_aud_k3_src_div",
+			 "top_aud_k4_src_div",
+			 "top_aud_k5_src_div",
+			 "top_aud_k6_src_div",
+			 "top_aud_i2s1_mclk",
+			 "top_aud_i2s2_mclk",
+			 "top_aud_i2s3_mclk",
+			 "top_aud_i2s4_mclk",
+			 "top_aud_i2s5_mclk",
+			 "top_aud_i2s6_mclk",
+			 "top_asm_m_sel",
+			 "top_asm_h_sel",
+			 "top_univpll2_d4",
+			 "top_univpll2_d2",
+			 "top_syspll_d5";
+	};
+
 	mmc0: mmc@11230000 {
 		compatible = "mediatek,mt7623-mmc",
 			     "mediatek,mt8135-mmc";
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
