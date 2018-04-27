Return-Path: <SRS0=w2p0=HQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:37996 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759215AbeD0WCb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Apr 2018 18:02:31 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v3 3/6] arm64: dts: r8a77965: Populate the DU instance placeholder
Date: Fri, 27 Apr 2018 23:02:17 +0100
Message-Id: <20180427220220.31286-4-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20180427220220.31286-1-kieran.bingham+renesas@ideasonboard.com>
References: <20180427220220.31286-1-kieran.bingham+renesas@ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
List-ID: <devicetree@vger.kernel.org>

The DU entity node has been previously added but only as a placeholder.
Populate the node with the properties to use the device.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
v2:
 - Remove LVDS references from DU
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 362eddc6b3d1..a35ea2f32da2 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -1106,9 +1106,19 @@
 		};
 
 		du: display@feb00000 {
-			reg = <0 0xfeb00000 0 0x80000>,
-			      <0 0xfeb90000 0 0x14>;
-			/* placeholder */
+			compatible = "renesas,du-r8a77965";
+			reg = <0 0xfeb00000 0 0x80000>;
+			reg-names = "du";
+			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 724>,
+				 <&cpg CPG_MOD 723>,
+				 <&cpg CPG_MOD 721>;
+			clock-names = "du.0", "du.1", "du.3";
+			status = "disabled";
+
+			vsps = <&vspd0 0 &vspd1 0 &vspd0 1>;
 
 			ports {
 				#address-cells = <1>;
-- 
2.17.0

