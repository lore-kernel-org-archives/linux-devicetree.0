From: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 1/2] pinctrl: qcom: ipq4019: add most other IPQ4019 pin functions and groups
Date: Wed, 10 May 2017 13:27:11 +0200
Message-ID: <20170510112712.14744-1-chunkeey@googlemail.com>
References: <d53b7a9b1bab818536680123136ac58481d959c8.1494415174.git.chunkeey@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d53b7a9b1bab818536680123136ac58481d959c8.1494415174.git.chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ram Chandra Jangir <rjangir-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds the remaining pin functions and mux groups.
It also fixes a typo in the existing binding document.

Cc: Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ram Chandra Jangir <rjangir-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Signed-off-by: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
Note: These definitions were present in the original submission
<https://patchwork.kernel.org/patch/7630711/>

The DT patch was acked by Rob Herring back then. However,
I'm not sure if this is still valid or not. @Rob, can you
please comment?

Thanks.

(Link to Matthew McLintock's v3 that was merged)
<https://patchwork.kernel.org/patch/7662241/>
---
 .../bindings/pinctrl/qcom,ipq4019-pinctrl.txt      | 36 ++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
index cfb8500dd56b..4b1c583c51e9 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
@@ -39,7 +39,7 @@ information about e.g. the mux function.
 
 The following generic properties as defined in pinctrl-bindings.txt are valid
 to specify in a pin configuration subnode:
- pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-strength.
+ pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-strength.
 
 Non-empty subnodes must specify the 'pins' property.
 Note that not all properties are valid for all pins.
@@ -50,7 +50,39 @@ Valid values for qcom,pins are:
     Supports mux, bias and drive-strength
 
 Valid values for qcom,function are:
-gpio, blsp_uart1, blsp_i2c0, blsp_i2c1, blsp_uart0, blsp_spi1, blsp_spi0
+gpio, blsp_uart1, blsp_i2c0, blsp_i2c1, blsp_uart0, blsp_spi1, blsp_spi0,
+atest_char, atest_char0, atest_char1, atest_char2, atest_char3,
+audio_pwm0, audio_pwm1, audio_pwm2, audio_pwm3, aud_pin,
+boot2, boot4, boot5, boot7, boot8, boot9, boot11, boot14, boot18, boot19, boot20,
+chip_rst, dbg_out, mdc, mdio0, mdio1, pcie_clk, pcie_clk1,
+i2s_rx_bclk, i2s_rxd, i2s_rx_fsync, i2s_rx_mclk, i2s_spdif_in, i2s_spdif_out,
+i2s_td1, i2s_td2, i2s_td3, i2s_tx_bclk, i2s_tx_fsync, i2s_tx_mclk,
+jtag_rst, jtag_tck, jtag_tdi, jtag_tdo, jtag_tms, jtag_trst,
+led0, led1, led2, led3, led4, led5, led6, led7, led8, led9, led10, led11,
+qdss_cti_trig_out_a0, qdss_cti_trig_out_b0, qdss_traceclk_a,
+qdss_tracectl_a, qdss_tracedata_a, pmu0, pmu1, prng_rosc,
+qpic_pad, qpic_pad0, qpic_pad1, qpic_pad2, qpic_pad3,
+qpic_pad4, qpic_pad5, qpic_pad6, qpic_pad7, qpic_pad8,
+rgmii0, rgmii1, rgmii2, rgmii3, rgmii_rx, rgmii_rxc, rgmii_tx, rgmii_txc,
+rmii00, rmii01, rmii0_dv, rmii0_refclk, rmii0_rx, rmii0_tx,
+rmii10, rmii11, rmii1_dv, rmii1_refclk, rmii1_rx, rmii1_tx,
+sdio0, sdio1, sdio2, sdio3, sdio4, sdio5, sdio6, sdio7, sdio_cd,
+sdio_clk, sdio_cmd, smart0, smart1, smart2, smart3,
+tm0, tm1, tm2, tm3, tm4, tm5, tm6, tm7, tm8, tm9, tm_ack, tm_clk0,
+wcss0_dbg, wcss0_dbg4, wcss0_dbg5, wcss0_dbg6, wcss0_dbg7, wcss0_dbg8,
+wcss0_dbg9, wcss0_dbg10, wcss0_dbg11, wcss0_dbg12, wcss0_dbg14, wcss0_dbg15,
+wcss0_dbg16, wcss0_dbg17, wcss0_dbg18, wcss0_dbg19, wcss0_dbg20, wcss0_dbg21,
+wcss0_dbg22, wcss0_dbg23, wcss0_dbg24, wcss0_dbg25, wcss0_dbg26, wcss0_dbg27,
+wcss0_dbg28, wcss0_dbg29, wcss0_dbg30, wcss0_dbg31,
+wcss1_dbg, wcss1_dbg7, wcss1_dbg8, wcss1_dbg9, wcss1_dbg10, wcss1_dbg11,
+wcss1_dbg12, wcss1_dbg16, wcss1_dbg17, wcss1_dbg18, wcss1_dbg19, wcss1_dbg20,
+wcss1_dbg21, wcss1_dbg22, wcss1_dbg23, wcss1_dbg24, wcss1_dbg25, wcss1_dbg26,
+wcss1_dbg27, wcss1_dbg28, wcss1_dbg29, wcss1_dbg30, wcss1_dbg31,
+wifi00, wifi01, wifi02, wifi03, wifi04, wifi034, wifi0_cal, wifi0_rfsilient0,
+wifi0_rfsilient1, wifi0_uart, wifi0_uart0, wifi0_uart1, wifi0_wci,
+wifi10, wifi11, wifi12, wifi13, wifi14, wifi134, wifi1_cal, wifi1_rfsilient0,
+wifi1_rfsilient1, wifi1_uart, wifi1_uart0, wifi1_uart1, wifi1_wci,
+wifi_wci0, wifi_wci1
 
 Example:
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
