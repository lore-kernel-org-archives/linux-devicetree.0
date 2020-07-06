Return-Path: <SRS0=knFt=AR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0C9C433E7
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jul 2020 14:35:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D75082070C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jul 2020 14:35:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729409AbgGFOfv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jul 2020 10:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729407AbgGFOfn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jul 2020 10:35:43 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DAA8C08C5FC
        for <devicetree@vger.kernel.org>; Mon,  6 Jul 2020 07:35:43 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:e012:1552:6e81:c371])
        by xavier.telenet-ops.be with bizsmtp
        id zqbX220150tDR5Q01qbXiC; Mon, 06 Jul 2020 16:35:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jsSDT-0004kO-CT; Mon, 06 Jul 2020 16:35:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jsSDT-0004mG-AO; Mon, 06 Jul 2020 16:35:31 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/7] dt-bindings: net: renesas,ravb: Document internal clock delay properties
Date:   Mon,  6 Jul 2020 16:35:24 +0200
Message-Id: <20200706143529.18306-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200706143529.18306-1-geert+renesas@glider.be>
References: <20200706143529.18306-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Some EtherAVB variants support internal clock delay configuration, which
can add larger delays than the delays that are typically supported by
the PHY (using an "rgmii-*id" PHY mode, and/or "[rt]xc-skew-ps"
properties).

Add properties for configuring the internal MAC delays.
These properties are mandatory, even when specified as zero, to
distinguish between old and new DTBs.

Update the (bogus) example accordingly.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Replace "renesas,[rt]xc-delay-ps" by "[rt]x-internal-delay-ps",
  - Add "(bogus)" to the example update, to avoid people considering it
    a one-to-one conversion.
---
 .../devicetree/bindings/net/renesas,ravb.txt  | 29 ++++++++++---------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt b/Documentation/devicetree/bindings/net/renesas,ravb.txt
index 032b76f14f4fdb38..4a62dd11d5c488f4 100644
--- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
+++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
@@ -64,6 +64,18 @@ Optional properties:
 			 AVB_LINK signal.
 - renesas,ether-link-active-low: boolean, specify when the AVB_LINK signal is
 				 active-low instead of normal active-high.
+- rx-internal-delay-ps: Internal RX clock delay.
+			This property is mandatory and valid only on R-Car Gen3
+			and RZ/G2 SoCs.
+			Valid values are 0 and 1800.
+			A non-zero value is allowed only if phy-mode = "rgmii".
+			Zero is not supported on R-Car D3.
+- tx-internal-delay-ps: Internal TX clock delay.
+			This property is mandatory and valid only on R-Car H3,
+			M3-W, M3-W+, M3-N, V3M, and V3H, and RZ/G2M and RZ/G2N.
+			Valid values are 0 and 2000.
+			A non-zero value is allowed only if phy-mode = "rgmii".
+			Zero is not supported on R-Car V3H.
 
 Example:
 
@@ -105,8 +117,10 @@ Example:
 				  "ch24";
 		clocks = <&cpg CPG_MOD 812>;
 		power-domains = <&cpg>;
-		phy-mode = "rgmii-id";
+		phy-mode = "rgmii";
 		phy-handle = <&phy0>;
+		rx-internal-delay-ps = <0>;
+		tx-internal-delay-ps = <2000>;
 
 		pinctrl-0 = <&ether_pins>;
 		pinctrl-names = "default";
@@ -115,18 +129,7 @@ Example:
 		#size-cells = <0>;
 
 		phy0: ethernet-phy@0 {
-			rxc-skew-ps = <900>;
-			rxdv-skew-ps = <0>;
-			rxd0-skew-ps = <0>;
-			rxd1-skew-ps = <0>;
-			rxd2-skew-ps = <0>;
-			rxd3-skew-ps = <0>;
-			txc-skew-ps = <900>;
-			txen-skew-ps = <0>;
-			txd0-skew-ps = <0>;
-			txd1-skew-ps = <0>;
-			txd2-skew-ps = <0>;
-			txd3-skew-ps = <0>;
+			rxc-skew-ps = <1500>;
 			reg = <0>;
 			interrupt-parent = <&gpio2>;
 			interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
-- 
2.17.1

