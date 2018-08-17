From: Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RESEND v1 4/5] arm64: dts: qcom: add wake up interrupts for GPIOs for SDM845
Date: Fri, 17 Aug 2018 13:10:25 -0600
Message-ID: <20180817191026.32245-5-ilina@codeaurora.org>
References: <20180817191026.32245-1-ilina@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180817191026.32245-1-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, bjorn.andersson@linaro.org, sboyd@kernel.org, evgreen@chromium.org, linus.walleij@linaro.org
Cc: rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
List-Id: devicetree@vger.kernel.org

GPIOs that are wakeup capable have interrupt lines that are routed to
the always-on interrupt controller (PDC) in parallel to the pinctrl. The
interrupts listed here are the wake up lines corresponding to GPIOs.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
Changes in v1:
	- Use interrupt-extended for all TLMM interrupts
	- Define GPIO-PDC map using interrupt-names
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 57 +++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 87ffc32dc597..2379684373d3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -712,11 +712,66 @@
 		tlmm: pinctrl@3400000 {
 			compatible = "qcom,sdm845-pinctrl";
 			reg = <0x03400000 0xc00000>;
-			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			interrupts-extended = <&intc GIC_SPI 208 0>,
+				<&pdc 510 0>, <&pdc 511 0>, <&pdc 512 0>,
+				<&pdc 513 0>, <&pdc 514 0>, <&pdc 515 0>,
+				<&pdc 516 0>, <&pdc 517 0>, <&pdc 518 0>,
+				<&pdc 519 0>, <&pdc 632 0>, <&pdc 639 0>,
+				<&pdc 521 0>, <&pdc 522 0>, <&pdc 523 0>,
+				<&pdc 524 0>, <&pdc 525 0>, <&pdc 526 0>,
+				<&pdc 527 0>, <&pdc 630 0>, <&pdc 637 0>,
+				<&pdc 529 0>, <&pdc 530 0>, <&pdc 531 0>,
+				<&pdc 532 0>, <&pdc 633 0>, <&pdc 640 0>,
+				<&pdc 534 0>, <&pdc 535 0>, <&pdc 536 0>,
+				<&pdc 537 0>, <&pdc 538 0>, <&pdc 539 0>,
+				<&pdc 540 0>, <&pdc 541 0>, <&pdc 542 0>,
+				<&pdc 543 0>, <&pdc 544 0>, <&pdc 545 0>,
+				<&pdc 546 0>, <&pdc 547 0>, <&pdc 548 0>,
+				<&pdc 549 0>, <&pdc 550 0>, <&pdc 551 0>,
+				<&pdc 552 0>, <&pdc 553 0>, <&pdc 554 0>,
+				<&pdc 555 0>, <&pdc 556 0>, <&pdc 557 0>,
+				<&pdc 631 0>, <&pdc 638 0>, <&pdc 559 0>,
+				<&pdc 560 0>, <&pdc 561 0>, <&pdc 562 0>,
+				<&pdc 563 0>, <&pdc 564 0>, <&pdc 565 0>,
+				<&pdc 566 0>, <&pdc 570 0>, <&pdc 571 0>,
+				<&pdc 572 0>, <&pdc 573 0>, <&pdc 609 0>,
+				<&pdc 610 0>, <&pdc 611 0>, <&pdc 612 0>,
+				<&pdc 613 0>, <&pdc 614 0>, <&pdc 615 0>,
+				<&pdc 617 0>, <&pdc 618 0>, <&pdc 619 0>,
+				<&pdc 620 0>, <&pdc 621 0>, <&pdc 622 0>,
+				<&pdc 623 0>;
+			interrupt-names = "summary-irq",
+				"gpio1", "gpio3", "gpio5",
+				"gpio10", "gpio11", "gpio20",
+				"gpio22", "gpio24", "gpio26",
+				"gpio30", "gpio31", "gpio31",
+				"gpio32", "gpio34", "gpio36",
+				"gpio37", "gpio38", "gpio39",
+				"gpio40", "gpio41", "gpio41",
+				"gpio43", "gpio44", "gpio46",
+				"gpio48", "gpio49", "gpio49",
+				"gpio52", "gpio53", "gpio54",
+				"gpio56", "gpio57", "gpio58",
+				"gpio59", "gpio60", "gpio61",
+				"gpio62", "gpio63", "gpio64",
+				"gpio66", "gpio68", "gpio71",
+				"gpio73", "gpio77", "gpio78",
+				"gpio79", "gpio80", "gpio84",
+				"gpio85", "gpio86", "gpio88",
+				"gpio89", "gpio89", "gpio91",
+				"gpio92", "gpio95", "gpio96",
+				"gpio97", "gpio101", "gpio103",
+				"gpio104", "gpio115", "gpio116",
+				"gpio117", "gpio118", "gpio119",
+				"gpio120", "gpio121", "gpio122",
+				"gpio123", "gpio124", "gpio125",
+				"gpio127", "gpio128", "gpio129",
+				"gpio130", "gpio132", "gpio133",
+				"gpio145";
 
 			qup_i2c0_default: qup-i2c0-default {
 				pinmux {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
