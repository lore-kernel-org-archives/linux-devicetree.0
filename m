Return-Path: <SRS0=7PqC=IR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:45182 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750708AbeE3LEa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 30 May 2018 07:04:30 -0400
From: Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH] arm64: dts: msm8996: Use dwc3-qcom glue driver for USB
Date: Wed, 30 May 2018 16:34:00 +0530
Message-Id: <20180530110400.30710-1-mgautam@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
To: andy.gross@linaro.org
Cc: vivek.gautam@codeaurora.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

Move from dwc3-of-simple to dwc3-qcom glue driver to
support peripheral mode which requires qscratch wrapper
programming on VBUS event.

Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/msm8996.dtsi        | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index f45a0ab30d30..83bc1b9ff6ef 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -108,6 +108,7 @@
 
 		usb@6a00000 {
 			status = "okay";
+			extcon = <&usb3_id>;
 
 			dwc3@6a00000 {
 				extcon = <&usb3_id>;
@@ -124,6 +125,7 @@
 
 		usb@7600000 {
 			status = "okay";
+			extcon = <&usb2_id>;
 
 			dwc3@7600000 {
 				extcon = <&usb2_id>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 26292027ba9b..d30516c0db87 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -777,7 +777,8 @@
 		};
 
 		usb2: usb@7600000 {
-			compatible = "qcom,dwc3";
+			compatible = "qcom,msm8996-dwc3", "qcom,dwc3";
+			reg = <0x76f8800 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -805,7 +806,8 @@
 		};
 
 		usb3: usb@6a00000 {
-			compatible = "qcom,dwc3";
+			compatible = "qcom,msm8996-dwc3", "qcom,dwc3";
+			reg = <0x6af8800 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

