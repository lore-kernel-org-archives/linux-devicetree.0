Return-Path: <SRS0=Ch3o=KW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:60452 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbeHGSOg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Aug 2018 14:14:36 -0400
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] arm64: dts: renesas: salvator-common: adv748x: Override secondary addresses
Date: Tue,  7 Aug 2018 16:59:33 +0100
Message-Id: <20180807155933.3732-1-kieran.bingham@ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
List-ID: <devicetree@vger.kernel.org>

Ensure that the ADV748x device addresses do not conflict, and group them
together (visually in i2cdetect)

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 5cfb9b99de89..2eba743c5c3f 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -414,7 +414,10 @@
 
 	video-receiver@70 {
 		compatible = "adi,adv7482";
-		reg = <0x70>;
+		reg = <0x70 0x71 0x72 0x73 0x74 0x75
+		       0x60 0x61 0x62 0x63 0x64 0x65>;
+		reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
+			    "infoframe", "cbus", "cec", "sdp", "txa", "txb" ;
 
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.17.1

