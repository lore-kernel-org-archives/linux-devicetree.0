Return-Path: <SRS0=p57L=RX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:45624 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfCTTp0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Mar 2019 15:45:26 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: ape6evm: Add NOR FLASH
Date: Wed, 20 Mar 2019 20:45:22 +0100
Message-Id: <20190320194522.15053-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

Describe the 128 MiB CFI NOR FLASH, which contains the boot loader and
its environment.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a73a4-ape6evm.dts | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/r8a73a4-ape6evm.dts b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
index 5c691e79e2b6e5fc..fa01de098dbcc0ac 100644
--- a/arch/arm/boot/dts/r8a73a4-ape6evm.dts
+++ b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
@@ -173,6 +173,33 @@
 };
 
 &bsc {
+	flash@0 {
+		compatible = "cfi-flash", "mtd-rom";
+		reg = <0x0 0x08000000>;
+		bank-width = <2>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "uboot";
+				reg = <0x00000000 0x00040000>;
+				read-only;
+			};
+			partition@40000 {
+				label = "uboot-env";
+				reg = <0x00040000 0x00040000>;
+				read-only;
+			};
+			partition@80000 {
+				label = "flash";
+				reg = <0x00080000 0x07f80000>;
+			};
+		};
+	};
+
 	ethernet@8000000 {
 		compatible = "smsc,lan9220", "smsc,lan9115";
 		reg = <0x08000000 0x1000>;
-- 
2.17.1
