Return-Path: <SRS0=AbCP=IG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:52036 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752506AbeESUsW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 19 May 2018 16:48:22 -0400
From: Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: dts: am3517-evm: Remove unnessary PMIC parameters
Date: Sat, 19 May 2018 15:48:08 -0500
Message-Id: <20180519204808.28899-1-aford173@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: devicetree@vger.kernel.org, bcousson@baylibre.com, tony@atomide.com, woods.technical@gmail.com, Adam Ford <aford173@gmail.com>
List-ID: <devicetree@vger.kernel.org>

The AM3517-EVM uses a TPS65023 PMIC.  This is already defined
by:  compatible = "ti,tps65023"

There doesn't seem to be a need to have each regulator in the
PMIC with the 'compatible = "regulator-fixed"' since each
regulator has a min and max setting.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/am3517-som.dtsi b/arch/arm/boot/dts/am3517-som.dtsi
index a6d5ff73c163..7ff7cd135dca 100644
--- a/arch/arm/boot/dts/am3517-som.dtsi
+++ b/arch/arm/boot/dts/am3517-som.dtsi
@@ -64,7 +64,6 @@
 		regulators {
 			vdd_core_reg: VDCDC1 {
 				regulator-name = "vdd_core";
-				compatible = "regulator-fixed";
 				regulator-always-on;
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1200000>;
@@ -72,7 +71,6 @@
 
 			vdd_io_reg: VDCDC2 {
 				regulator-name = "vdd_io";
-				compatible = "regulator-fixed";
 				regulator-always-on;
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
@@ -80,7 +78,6 @@
 
 			vdd_1v8_reg: VDCDC3 {
 				regulator-name = "vdd_1v8";
-				compatible = "regulator-fixed";
 				regulator-always-on;
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -88,7 +85,6 @@
 
 			vdd_usb18_reg: LDO1 {
 				regulator-name = "vdd_usb18";
-				compatible = "regulator-fixed";
 				regulator-always-on;
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -96,7 +92,6 @@
 
 			vdd_usb33_reg: LDO2 {
 				regulator-name = "vdd_usb33";
-				compatible = "regulator-fixed";
 				regulator-always-on;
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
-- 
2.17.0

