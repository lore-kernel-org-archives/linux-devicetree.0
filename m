From: Christian Lamparter <chunkeey@googlemail.com>
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: add most other IPQ4019 pin functions and groups
Date: Sat,  1 Jul 2017 18:25:05 +0200
Message-ID: <73f822f3f969fa2c9ed25097ab8c70826b265491.1498925339.git.chunkeey@googlemail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Varadarajan Narayanan <varada@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ram Chandra Jangir <rjangir@codeaurora.org>, John Crispin <john@phrozen.org>
List-Id: devicetree@vger.kernel.org

This patch adds the remaining pin functions and mux groups.
All unknown and debug functions are omitted. Existing functions
for qpic, sdio, rgmii, rmii, wifi/d are squashed together as
much as possible. And only in case of a clash, the individually
named functions have been kept. The exceptions are:
	led0-11
	i2s_rx, i2s_tx, i2s_td, i2s_spdif_in, i2s_spdif_out,
	smart0-3
	wifiX_uart

Ram Chandra Jangir explained that:
wifi0_uart0 and wifi0_uart1 are different functions and they are
mapped as below:
wifi0_uart   -->  wifi0  uart   RTS
wifi0_uart0  -->  wifi0  uart   RxD
wifi0_uart1  -->  wifi0  uart   CTS

wifi1_uart   -->  wifi1  uart   TxD
wifi1_uart0  -->  wifi1  uart   RxD
wifi1_uart1  -->  wifi1  uart   CTS

Cc: Varadarajan Narayanan <varada@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ram Chandra Jangir <rjangir@codeaurora.org>
Cc: John Crispin <john@phrozen.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
---
I've seen that ipq8074 is ready. I've been sitting on this patches
for a while. So, I'm happy to post the series.
I've included the "Acked-by: Rob Herring <robh@kernel.org>" from V1.
Although I changed quite a bit, most of it was cleanup and squashing.
I think the original ACK is still good:
<http://www.spinics.net/lists/devicetree/msg176412.html>.
If something does come up, please let me know.
---
 Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
index cfb8500dd56b..c30642b086b2 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
@@ -50,7 +50,12 @@ Valid values for qcom,pins are:
     Supports mux, bias and drive-strength
 
 Valid values for qcom,function are:
-gpio, blsp_uart1, blsp_i2c0, blsp_i2c1, blsp_uart0, blsp_spi1, blsp_spi0
+aud_pin, audio_pwm, blsp_i2c0, blsp_i2c1, blsp_spi0, blsp_spi1, blsp_uart0,
+blsp_uart1, chip_rst, gpio, i2s_rx, i2s_spdif_in, i2s_spdif_out, i2s_td, i2s_tx,
+jtag, led0, led1, led2, led3, led4, led5, led6, led7, led8, led9, led10, led11,
+mdc, mdio, pcie, pmu, prng_rosc, qpic, rgmii, rmii, sdio, smart0, smart1,
+smart2, smart3, tm, wifi0, wifi0_uart, wifi0_uart0, wifi0_uart1, wifi1,
+wifi1_uart, wifi1_uart0, wifi1_uart1
 
 Example:
 
-- 
2.13.2

