Return-Path: <SRS0=biny=ZJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0DAC43215
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 12:46:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1CFA520727
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 12:46:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbfKQMqJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 17 Nov 2019 07:46:09 -0500
Received: from inva020.nxp.com ([92.121.34.13]:58874 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726076AbfKQMqJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 17 Nov 2019 07:46:09 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8561E1A0222;
        Sun, 17 Nov 2019 13:46:07 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D54141A0123;
        Sun, 17 Nov 2019 13:46:01 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id D99C1402B0;
        Sun, 17 Nov 2019 20:45:54 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH RESEND v3 04/15] arm64: dts: imx8: add lsio lpcg clocks
Date:   Sun, 17 Nov 2019 20:43:44 +0800
Message-Id: <1573994635-14479-5-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573994635-14479-1-git-send-email-aisheng.dong@nxp.com>
References: <1573994635-14479-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add lsio lpcg clocks

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v2->v3:
 * update to use clock-indices property instead of bit-offset property
v1->v2:
 * Use old SCU clock binding temporarily to avoid build warning due to SCU
   clock cell will be changed to 2.
 * add power domain property
---
 .../boot/dts/freescale/imx8-ss-lsio.dtsi      | 156 +++++++++++++++++-
 1 file changed, 155 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
index 00eaadbdcc0a..e839aa8ab586 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
@@ -4,12 +4,29 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
+#include <dt-bindings/clock/imx8-lpcg.h>
+#include <dt-bindings/firmware/imx/rsrc.h>
+
 lsio_subsys: bus@5d000000 {
 	compatible = "simple-bus";
 	#address-cells = <1>;
 	#size-cells = <1>;
 	ranges = <0x5d000000 0x0 0x5d000000 0x1000000>;
 
+	lsio_mem_clk: clock-lsio-mem {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <200000000>;
+		clock-output-names = "lsio_mem_clk";
+	};
+
+	lsio_bus_clk: clock-lsio-bus {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "lsio_bus_clk";
+	};
+
 	lsio_gpio0: gpio@5d080000 {
 		reg = <0x5d080000 0x10000>;
 		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
@@ -131,8 +148,145 @@ lsio_subsys: bus@5d000000 {
 		power-domains = <&pd IMX_SC_R_MU_13A>;
 	};
 
-	lsio_lpcg: clock-controller@5d400000 {
+	/* LPCG clocks */
+	lsio_lpcg: clock-controller-legacy@5d400000 {
 		reg = <0x5d400000 0x400000>;
 		#clock-cells = <1>;
 	};
+
+	pwm0_lpcg: clock-controller@5d400000 {
+		reg = <0x5d400000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_LSIO_PWM0_CLK>, <&clk IMX_LSIO_PWM0_CLK>,
+			 <&clk IMX_LSIO_PWM0_CLK>, <&lsio_bus_clk>,
+			 <&clk IMX_LSIO_PWM0_CLK>;
+		clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_1>,
+				<IMX_LPCG_CLK_4>, <IMX_LPCG_CLK_5>,
+				<IMX_LPCG_CLK_6>;
+		clock-output-names = "pwm0_lpcg_ipg_clk",
+				     "pwm0_lpcg_ipg_hf_clk",
+				     "pwm0_lpcg_ipg_s_clk",
+				     "pwm0_lpcg_ipg_slv_clk",
+				     "pwm0_lpcg_ipg_mstr_clk";
+		power-domains = <&pd IMX_SC_R_PWM_0>;
+	};
+
+	pwm1_lpcg: clock-controller@5d410000 {
+		reg = <0x5d410000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_LSIO_PWM1_CLK>, <&clk IMX_LSIO_PWM1_CLK>,
+			 <&clk IMX_LSIO_PWM1_CLK>, <&lsio_bus_clk>,
+			 <&clk IMX_LSIO_PWM1_CLK>;
+		clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_1>,
+				<IMX_LPCG_CLK_4>, <IMX_LPCG_CLK_5>,
+				<IMX_LPCG_CLK_6>;
+		clock-output-names = "pwm1_lpcg_ipg_clk",
+				     "pwm1_lpcg_ipg_hf_clk",
+				     "pwm1_lpcg_ipg_s_clk",
+				     "pwm1_lpcg_ipg_slv_clk",
+				     "pwm1_lpcg_ipg_mstr_clk";
+		power-domains = <&pd IMX_SC_R_PWM_1>;
+	};
+
+	pwm2_lpcg: clock-controller@5d420000 {
+		reg = <0x5d420000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_LSIO_PWM2_CLK>, <&clk IMX_LSIO_PWM2_CLK>,
+			 <&clk IMX_LSIO_PWM2_CLK>, <&lsio_bus_clk>,
+			 <&clk IMX_LSIO_PWM2_CLK>;
+		clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_1>,
+				<IMX_LPCG_CLK_4>, <IMX_LPCG_CLK_5>,
+				<IMX_LPCG_CLK_6>;
+		clock-output-names = "pwm2_lpcg_ipg_clk",
+				     "pwm2_lpcg_ipg_hf_clk",
+				     "pwm2_lpcg_ipg_s_clk",
+				     "pwm2_lpcg_ipg_slv_clk",
+				     "pwm2_lpcg_ipg_mstr_clk";
+		power-domains = <&pd IMX_SC_R_PWM_2>;
+	};
+
+	pwm3_lpcg: clock-controller@5d430000 {
+		reg = <0x5d430000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_LSIO_PWM3_CLK>, <&clk IMX_LSIO_PWM3_CLK>,
+			 <&clk IMX_LSIO_PWM3_CLK>, <&lsio_bus_clk>,
+			 <&clk IMX_LSIO_PWM3_CLK>;
+		clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_1>,
+				<IMX_LPCG_CLK_4>, <IMX_LPCG_CLK_5>,
+				<IMX_LPCG_CLK_6>;
+		clock-output-names = "pwm3_lpcg_ipg_clk",
+				     "pwm3_lpcg_ipg_hf_clk",
+				     "pwm3_lpcg_ipg_s_clk",
+				     "pwm3_lpcg_ipg_slv_clk",
+				     "pwm3_lpcg_ipg_mstr_clk";
+		power-domains = <&pd IMX_SC_R_PWM_3>;
+	};
+
+	pwm4_lpcg: clock-controller@5d440000 {
+		reg = <0x5d440000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_LSIO_PWM4_CLK>, <&clk IMX_LSIO_PWM4_CLK>,
+			 <&clk IMX_LSIO_PWM4_CLK>, <&lsio_bus_clk>,
+			 <&clk IMX_LSIO_PWM4_CLK>;
+		clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_1>,
+				<IMX_LPCG_CLK_4>, <IMX_LPCG_CLK_5>,
+				<IMX_LPCG_CLK_6>;
+		clock-output-names = "pwm4_lpcg_ipg_clk",
+				     "pwm4_lpcg_ipg_hf_clk",
+				     "pwm4_lpcg_ipg_s_clk",
+				     "pwm4_lpcg_ipg_slv_clk",
+				     "pwm4_lpcg_ipg_mstr_clk";
+		power-domains = <&pd IMX_SC_R_PWM_4>;
+	};
+
+	pwm5_lpcg: clock-controller@5d450000 {
+		reg = <0x5d450000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_LSIO_PWM5_CLK>, <&clk IMX_LSIO_PWM5_CLK>,
+			 <&clk IMX_LSIO_PWM5_CLK>, <&lsio_bus_clk>,
+			 <&clk IMX_LSIO_PWM5_CLK>;
+		clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_1>,
+				<IMX_LPCG_CLK_4>, <IMX_LPCG_CLK_5>,
+				<IMX_LPCG_CLK_6>;
+		clock-output-names = "pwm5_lpcg_ipg_clk",
+				     "pwm5_lpcg_ipg_hf_clk",
+				     "pwm5_lpcg_ipg_s_clk",
+				     "pwm5_lpcg_ipg_slv_clk",
+				     "pwm5_lpcg_ipg_mstr_clk";
+		power-domains = <&pd IMX_SC_R_PWM_5>;
+	};
+
+	pwm6_lpcg: clock-controller@5d460000 {
+		reg = <0x5d460000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_LSIO_PWM6_CLK>, <&clk IMX_LSIO_PWM6_CLK>,
+			 <&clk IMX_LSIO_PWM6_CLK>, <&lsio_bus_clk>,
+			 <&clk IMX_LSIO_PWM6_CLK>;
+		clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_1>,
+				<IMX_LPCG_CLK_4>, <IMX_LPCG_CLK_5>,
+				<IMX_LPCG_CLK_6>;
+		clock-output-names = "pwm6_lpcg_ipg_clk",
+				     "pwm6_lpcg_ipg_hf_clk",
+				     "pwm6_lpcg_ipg_s_clk",
+				     "pwm6_lpcg_ipg_slv_clk",
+				     "pwm6_lpcg_ipg_mstr_clk";
+		power-domains = <&pd IMX_SC_R_PWM_6>;
+	};
+
+	pwm7_lpcg: clock-controller@5d470000 {
+		reg = <0x5d470000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_LSIO_PWM7_CLK>, <&clk IMX_LSIO_PWM7_CLK>,
+			 <&clk IMX_LSIO_PWM7_CLK>, <&lsio_bus_clk>,
+			 <&clk IMX_LSIO_PWM7_CLK>;
+		clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_1>,
+				<IMX_LPCG_CLK_4>, <IMX_LPCG_CLK_5>,
+				<IMX_LPCG_CLK_6>;
+		clock-output-names = "pwm7_lpcg_ipg_clk",
+				     "pwm7_lpcg_ipg_hf_clk",
+				     "pwm7_lpcg_ipg_s_clk",
+				     "pwm7_lpcg_ipg_slv_clk",
+				     "pwm7_lpcg_ipg_mstr_clk";
+		power-domains = <&pd IMX_SC_R_PWM_7>;
+	};
 };
-- 
2.23.0

