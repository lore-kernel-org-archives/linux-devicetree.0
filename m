From: Garlic Tseng <garlic.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] arm: dts: mediatek: Add audio driver node for MT2701
Date: Thu, 27 Apr 2017 20:36:15 +0800
Message-ID: <1493296575-1896-1-git-send-email-garlic.tseng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Ailsa.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ir.lian-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Garlic Tseng <garlic.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add audio driver node for mt2701

Depends on [1], which is i2c dts patch for MT2701.
[1] https://patchwork.kernel.org/patch/9601961/

Signed-off-by: Garlic Tseng <garlic.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/mt2701-evb.dts | 65 +++++++++++++++++++++++++++
 arch/arm/boot/dts/mt2701.dtsi    | 97 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 162 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701-evb.dts b/arch/arm/boot/dts/mt2701-evb.dts
index 3f5a96c..c2ad659 100644
--- a/arch/arm/boot/dts/mt2701-evb.dts
+++ b/arch/arm/boot/dts/mt2701-evb.dts
@@ -22,6 +22,40 @@
 	memory {
 		reg = <0 0x80000000 0 0x40000000>;
 	};
+
+		sound:sound {
+		compatible = "mediatek,mt2701-cs42448-machine";
+		mediatek,platform = <&afe>;
+		/* CS42448 Machine name */
+		audio-routing =
+		"Line Out Jack", "AOUT1L",
+		"Line Out Jack", "AOUT1R",
+		"Line Out Jack", "AOUT2L",
+		"Line Out Jack", "AOUT2R",
+		"Line Out Jack", "AOUT3L",
+		"Line Out Jack", "AOUT3R",
+		"Line Out Jack", "AOUT4L",
+		"Line Out Jack", "AOUT4R",
+		"AIN1L", "AMIC",
+		"AIN1R", "AMIC",
+		"AIN2L", "Tuner In",
+		"AIN2R", "Tuner In",
+		"AIN3L", "Satellite Tuner In",
+		"AIN3R", "Satellite Tuner In",
+		"AIN3L", "AUX In",
+		"AIN3R", "AUX In";
+		mediatek,audio-codec = <&cs42448>;
+		mediatek,audio-codec-bt-mrg = <&bt_sco_codec>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&aud_pins_default>;
+		i2s1-in-sel-gpio1 = <&pio 53 0>;
+		i2s1-in-sel-gpio2 = <&pio 54 0>;
+		status = "okay";
+	};
+
+	bt_sco_codec:bt_sco_codec {
+		compatible = "linux,bt-sco";
+	};
 };
 
 &auxadc {
@@ -44,9 +78,40 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins_a>;
 	status = "okay";
+	cs42448: cs42448@48 {
+		compatible = "cirrus,cs42448";
+		reg = <0x48>;
+		clocks = <&topckgen CLK_TOP_AUD_I2S1_MCLK>;
+		clock-names = "mclk";
+	};
 };
 
 &pio {
+	aud_pins_default: audiodefault {
+		pins_cmd_dat {
+			pinmux = <MT2701_PIN_49_I2S0_DATA__FUNC_I2S0_DATA>,
+				 <MT2701_PIN_72_I2S0_DATA_IN__FUNC_I2S0_DATA_IN>,
+				 <MT2701_PIN_73_I2S0_LRCK__FUNC_I2S0_LRCK>,
+				 <MT2701_PIN_74_I2S0_BCK__FUNC_I2S0_BCK>,
+				 <MT2701_PIN_126_I2S0_MCLK__FUNC_I2S0_MCLK>,
+				 <MT2701_PIN_33_I2S1_DATA__FUNC_I2S1_DATA>,
+				 <MT2701_PIN_34_I2S1_DATA_IN__FUNC_I2S1_DATA_IN>,
+				 <MT2701_PIN_35_I2S1_BCK__FUNC_I2S1_BCK>,
+				 <MT2701_PIN_36_I2S1_LRCK__FUNC_I2S1_LRCK>,
+				 <MT2701_PIN_37_I2S1_MCLK__FUNC_I2S1_MCLK>,
+				 <MT2701_PIN_203_PWM0__FUNC_I2S2_DATA>,
+				 <MT2701_PIN_204_PWM1__FUNC_I2S3_DATA>,
+				 <MT2701_PIN_53_SPI0_CSN__FUNC_GPIO53>,
+				 <MT2701_PIN_54_SPI0_CK__FUNC_GPIO54>,
+				 <MT2701_PIN_18_PCM_CLK__FUNC_MRG_CLK>,
+				 <MT2701_PIN_19_PCM_SYNC__FUNC_MRG_SYNC>,
+				 <MT2701_PIN_20_PCM_RX__FUNC_MRG_TX>,
+				 <MT2701_PIN_21_PCM_TX__FUNC_MRG_RX>;
+			drive-strength = <MTK_DRIVE_12mA>;
+			bias-pull-down;
+		};
+	};
+
 	i2c0_pins_a: i2c0@0 {
 		pins1 {
 			pinmux = <MT2701_PIN_75_SDA0__FUNC_SDA0>,
diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 1b6157e..00eef42 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -400,6 +400,103 @@
 			 <&pericfg CLK_PERI_SPI2>;
 		clock-names = "parent-clk", "sel-clk", "spi-clk";
 		status = "disabled";
+
+	afe: audio-controller@11220000 {
+		compatible = "mediatek,mt2701-audio";
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
 	};
 
 	mmsys: syscon@14000000 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
