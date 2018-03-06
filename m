Return-Path: <SRS0=s344=F4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mailguard.fkie.fraunhofer.de ([128.7.3.5]:59458 "EHLO
        a.mx.fkie.fraunhofer.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750864AbeCFLsj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 6 Mar 2018 06:48:39 -0500
From: "Shetty, Jayashree" <jayashree.shetty@fkie.fraunhofer.de>
Date: Tue, 6 Mar 2018 11:48:13 +0000
Message-ID: <d370b7762cd94ff4a6abc5ff4b41f3d3@srv-mail-01.gaia.fkie.fraunhofer.de>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Subject: [PATCH] ARM: dts: sun8i: NanoPi NEO Air - Enable USB hostcontroller
Sender: devicetree-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "owner-devicetree@vger.kernel.org" <owner-devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

This patch enables USB1 and USB2 ports on Nanopi Neo Air.

--- linux-4.15/arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts                2018-01-28 22:20:33.000000000 +0100
+++ air-kernel/linux-4.15/arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts       2018-03-05 12:39:50.768609174 +0100
@@ -84,6 +84,16 @@
               status = "okay";
};

+/*Enable USB hostcontroller support */
+&ehci2 {
+        status = "okay";
+};
+
+&ehci3 {
+        status = "okay";
+};
+
+
&uart0 {
               pinctrl-names = "default";
               pinctrl-0 = <&uart0_pins_a>;

Best wishes,
Jayashree
