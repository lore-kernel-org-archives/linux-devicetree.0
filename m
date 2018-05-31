Return-Path: <SRS0=hnDX=IS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:50076 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754346AbeEaKsS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 31 May 2018 06:48:18 -0400
From: Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH v2] arm64: dts: msm8996: Use dwc3-qcom glue driver for USB
Date: Thu, 31 May 2018 16:17:10 +0530
Message-Id: <20180531104710.23965-1-mgautam@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
To: andy.gross@linaro.org
Cc: vivek.gautam@codeaurora.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, dianders@chromium.org, linux-usb@vger.kernel.org, felipe.balbi@linux.intel.com, gregkh@linuxfoundation.org, bjorn.andersson@linaro.org, Manu Gautam <mgautam@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

Move from dwc3-of-simple to dwc3-qcom glue driver to
support peripheral mode which requires qscratch wrapper
programming on VBUS event.

Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
---

Changes since v1:
 - Update unit address of DT node as per Doug's comment

 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi |  6 ++++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi        | 10 ++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index f45a0ab30d30..00be0d53891a 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -106,8 +106,9 @@
 			status = "okay";
 		};
 
-		usb@6a00000 {
+		usb@6af8800 {
 			status = "okay";
+			extcon = <&usb3_id>;
 
 			dwc3@6a00000 {
 				extcon = <&usb3_id>;
@@ -122,8 +123,9 @@
 			pinctrl-0 = <&usb3_vbus_det_gpio>;
 		};
 
-		usb@7600000 {
+		usb@76f8800 {
 			status = "okay";
+			extcon = <&usb2_id>;
 
 			dwc3@7600000 {
 				extcon = <&usb2_id>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 26292027ba9b..8b6dd5443524 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -776,8 +776,9 @@
 			status = "disabled";
 		};
 
-		usb2: usb@7600000 {
-			compatible = "qcom,dwc3";
+		usb2: usb@76f8800 {
+			compatible = "qcom,msm8996-dwc3", "qcom,dwc3";
+			reg = <0x76f8800 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -804,8 +805,9 @@
 			};
 		};
 
-		usb3: usb@6a00000 {
-			compatible = "qcom,dwc3";
+		usb3: usb@6af8800 {
+			compatible = "qcom,msm8996-dwc3", "qcom,dwc3";
+			reg = <0x6af8800 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

