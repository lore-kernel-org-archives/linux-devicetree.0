Return-Path: <SRS0=HAag=NQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:47245 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728094AbeKEWci (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 5 Nov 2018 17:32:38 -0500
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2] arm64: dts: renesas: r8a77990: Fix VIN endpoint numbering
Date: Mon,  5 Nov 2018 14:12:43 +0100
Message-Id: <1541423563-790-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: devicetree-owner@vger.kernel.org
To: horms@verge.net.au, geert@linux-m68k.org, laurent.pinchart@ideasonboard.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Koji Matsuoka <koji.matsuoka.xm@renesas.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-ID: <devicetree@vger.kernel.org>

The VIN driver bindings dictates fixed numbering for VIN endpoints connected
to CSI-2 endpoints, even when a single endpoint exists.

Without proper endpoint numbering the VIN driver fails to probe.

Based on a patch in BSP from Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Fixes: ec70407ae7d7 ("arm64: dts: renesas: r8a77990: Add VIN and CSI-2 device nodes")
Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 9509dc0..106a574 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -745,9 +745,13 @@
 				#size-cells = <0>;

 				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
 					reg = <1>;

-					vin4csi40: endpoint {
+					vin4csi40: endpoint@2 {
+						reg = <2>;
 						remote-endpoint= <&csi40vin4>;
 					};
 				};
@@ -769,9 +773,13 @@
 				#size-cells = <0>;

 				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
 					reg = <1>;

-					vin5csi40: endpoint {
+					vin5csi40: endpoint@2 {
+						reg = <2>;
 						remote-endpoint= <&csi40vin5>;
 					};
 				};
--
2.7.4
