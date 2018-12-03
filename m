Return-Path: <SRS0=so6l=OM=vger.kernel.org=devicetree-owner@kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:57994 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbeLCPMu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Dec 2018 10:12:50 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] ARM: dts: stout: Convert to new LVDS DT bindings
Date: Mon,  3 Dec 2018 16:12:41 +0100
Message-Id: <20181203151242.25875-2-geert+renesas@glider.be>
In-Reply-To: <20181203151242.25875-1-geert+renesas@glider.be>
References: <20181203151242.25875-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Marek Vasut <marek.vasut@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

As of commit 6d2ca85279becdff ("dt-bindings: display: renesas: Deprecate
LVDS support in the DU bindings"), the internal LVDS encoder has DT
bindings separate from the DU.  The Lager device tree was ported over to
the new model, but the Stout device tree was forgotten.

Fixes: 15a1ff30d8f9bd83 ("ARM: dts: r8a7790: Convert to new LVDS DT bindings")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 arch/arm/boot/dts/r8a7790-stout.dts | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790-stout.dts b/arch/arm/boot/dts/r8a7790-stout.dts
index 629da4cee1b971d6..7a7d3b84d1a6b21d 100644
--- a/arch/arm/boot/dts/r8a7790-stout.dts
+++ b/arch/arm/boot/dts/r8a7790-stout.dts
@@ -94,9 +94,8 @@
 	status = "okay";
 
 	clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>, <&cpg CPG_MOD 722>,
-		 <&cpg CPG_MOD 726>, <&cpg CPG_MOD 725>,
 		 <&osc1_clk>;
-	clock-names = "du.0", "du.1", "du.2", "lvds.0", "lvds.1", "dclkin.0";
+	clock-names = "du.0", "du.1", "du.2", "dclkin.0";
 
 	ports {
 		port@0 {
@@ -104,11 +103,21 @@
 				remote-endpoint = <&adv7511_in>;
 			};
 		};
+	};
+};
+
+&lvds0 {
+	ports {
 		port@1 {
 			lvds_connector0: endpoint {
 			};
 		};
-		port@2 {
+	};
+};
+
+&lvds1 {
+	ports {
+		port@1 {
 			lvds_connector1: endpoint {
 			};
 		};
-- 
2.17.1
