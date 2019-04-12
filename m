Return-Path: <SRS0=cJdl=SO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay11.mail.gandi.net ([217.70.178.231]:49881 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbfDLMAu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Apr 2019 08:00:50 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH] arm64: dts: renesas: r8a77965: Remove reg-names of display node
Date: Fri, 12 Apr 2019 14:01:32 +0200
Message-Id: <20190412120132.31119-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: horms@verge.net.au, geert+renesas@glider.be, magnus.damm@gmail.com
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>
List-ID: <devicetree@vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Remove the "reg-names" property from the display node of R-Car Gen3 R8A77965
device tree.

No other mainline R-Car Gen3 SoC has that property specified.

Fixes: 2f2c71bfc8c5 ("arm64: dts: renesas: r8a77965: Populate the DU instance placeholder")

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[reworded commit message, sent upstream]
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 9763d108e183..0d455b2b1f88 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2166,7 +2166,6 @@
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a77965";
 			reg = <0 0xfeb00000 0 0x80000>;
-			reg-names = "du";
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
--
2.21.0
