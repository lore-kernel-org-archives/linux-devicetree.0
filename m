Return-Path: <SRS0=iWrS=MQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55470 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727322AbeJDV2S (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Oct 2018 17:28:18 -0400
Received: by mail-wm1-f67.google.com with SMTP id 206-v6so9291902wmb.5
        for <devicetree@vger.kernel.org>; Thu, 04 Oct 2018 07:34:42 -0700 (PDT)
From: Markus Kueffner <kueffner.markus@gmail.com>
Subject: [PATCH] ARM: dts: imx6qdl-udoo: Add Pincfgs for UART4
Date: Thu,  4 Oct 2018 16:33:59 +0200
Message-Id: <1538663639-3427-1-git-send-email-kueffner.markus@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Markus Kueffner <kueffner.markus@gmail.com>
List-ID: <devicetree@vger.kernel.org>

From: Markus Kueffner <kueffner.markus@gmail.com>

Add Pincfgs for UART4 to enable Communication with the onboard SAM3X

Signed-off-by: Markus Kueffner <kueffner.markus@gmail.com>
---
 arch/arm/boot/dts/imx6qdl-udoo.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-udoo.dtsi b/arch/arm/boot/dts/imx6qdl-udoo.dtsi
index 4f27861..5614170 100644
--- a/arch/arm/boot/dts/imx6qdl-udoo.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-udoo.dtsi
@@ -195,6 +195,13 @@
 			>;
 		};
 
+		pinctrl_uart4: uart4grp {
+			fsl,pins = <
+				MX6QDL_PAD_KEY_COL0__UART4_TX_DATA	0x1b0b1
+				MX6QDL_PAD_KEY_ROW0__UART4_RX_DATA	0x1b0b1
+			>;
+		};
+
 		pinctrl_usbh: usbhgrp {
 			fsl,pins = <
 				MX6QDL_PAD_GPIO_17__GPIO7_IO12 0x80000000
@@ -265,6 +272,12 @@
 	status = "okay";
 };
 
+&uart4 { // iMX6-Arduino internal serial port - ttymxc3
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usbh1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usbh>;
-- 
2.7.4
