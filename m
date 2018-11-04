Return-Path: <SRS0=Nr/5=NP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46576 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbeKEFxd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 5 Nov 2018 00:53:33 -0500
From: Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH V2] arm64: dts: renesas: Switch eMMC bus to 1V8 on Salvator-X and ULCB
Date: Sun,  4 Nov 2018 21:37:07 +0100
Message-Id: <20181104203707.20996-1-marek.vasut+renesas@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa@the-dreams.de>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The eMMC card has two supplies, VCC and VCCQ. The VCC supplies the NAND
array and the VCCQ supplies the bus. On Salvator-X and ULCB, the VCC is
connected to 3.3V rail, while the VCCQ is connected to 1.8V rail. Adjust
the pinmux to match the bus, which is always operating in 1.8V mode.

While at it, deduplicate the pinmux entries, which are now the same for
both default and UHS modes. We still need the two pinctrl entries to
match the bindings though.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
---
V2: - Squash patches for multiple boards together
    - Deduplicate pinmux entries
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 8 +-------
 arch/arm64/boot/dts/renesas/ulcb.dtsi            | 8 +-------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 7f91ff524109..69775a201b4d 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -605,12 +605,6 @@
 	};
 
 	sdhi2_pins: sd2 {
-		groups = "sdhi2_data8", "sdhi2_ctrl", "sdhi2_ds";
-		function = "sdhi2";
-		power-source = <3300>;
-	};
-
-	sdhi2_pins_uhs: sd2_uhs {
 		groups = "sdhi2_data8", "sdhi2_ctrl", "sdhi2_ds";
 		function = "sdhi2";
 		power-source = <1800>;
@@ -760,7 +754,7 @@
 &sdhi2 {
 	/* used for on-board 8bit eMMC */
 	pinctrl-0 = <&sdhi2_pins>;
-	pinctrl-1 = <&sdhi2_pins_uhs>;
+	pinctrl-1 = <&sdhi2_pins>;
 	pinctrl-names = "default", "state_uhs";
 
 	vmmc-supply = <&reg_3p3v>;
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 89daca7356df..de694fdae067 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -330,12 +330,6 @@
 	};
 
 	sdhi2_pins: sd2 {
-		groups = "sdhi2_data8", "sdhi2_ctrl", "sdhi2_ds";
-		function = "sdhi2";
-		power-source = <3300>;
-	};
-
-	sdhi2_pins_uhs: sd2_uhs {
 		groups = "sdhi2_data8", "sdhi2_ctrl", "sdhi2_ds";
 		function = "sdhi2";
 		power-source = <1800>;
@@ -426,7 +420,7 @@
 &sdhi2 {
 	/* used for on-board 8bit eMMC */
 	pinctrl-0 = <&sdhi2_pins>;
-	pinctrl-1 = <&sdhi2_pins_uhs>;
+	pinctrl-1 = <&sdhi2_pins>;
 	pinctrl-names = "default", "state_uhs";
 
 	vmmc-supply = <&reg_3p3v>;
-- 
2.18.0
