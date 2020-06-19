Return-Path: <SRS0=bA0P=AA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF1AC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 19:16:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF67720C09
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 19:16:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733125AbgFSTQK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 19 Jun 2020 15:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733120AbgFSTQK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 19 Jun 2020 15:16:10 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF3DC0617BC
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2020 12:16:07 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:e0be:48f2:cba4:1407])
        by michel.telenet-ops.be with bizsmtp
        id t7Fx220024UASYb067FxYB; Fri, 19 Jun 2020 21:16:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jmMUX-0002JS-2I; Fri, 19 Jun 2020 21:15:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jmMUX-0006V8-1E; Fri, 19 Jun 2020 21:15:57 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/5] dt-bindings: net: renesas,ravb: Document internal clock delay properties
Date:   Fri, 19 Jun 2020 21:15:50 +0200
Message-Id: <20200619191554.24942-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619191554.24942-1-geert+renesas@glider.be>
References: <20200619191554.24942-1-geert+renesas@glider.be>
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

Update the example accordingly.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/net/renesas,ravb.txt  | 29 ++++++++++---------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt b/Documentation/devicetree/bindings/net/renesas,ravb.txt
index 032b76f14f4fdb38..488ada78b6169b8e 100644
--- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
+++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
@@ -64,6 +64,18 @@ Optional properties:
 			 AVB_LINK signal.
 - renesas,ether-link-active-low: boolean, specify when the AVB_LINK signal is
 				 active-low instead of normal active-high.
+- renesas,rxc-delay-ps: Internal RX clock delay.
+			This property is mandatory and valid only on R-Car Gen3
+			and RZ/G2 SoCs.
+			Valid values are 0 and 1800.
+			A non-zero value is allowed only if phy-mode = "rgmii".
+			Zero is not supported on R-Car D3.
+- renesas,txc-delay-ps: Internal TX clock delay.
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
+		renesas,rxc-delay-ps = <0>;
+		renesas,txc-delay-ps = <2000>;
 
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

