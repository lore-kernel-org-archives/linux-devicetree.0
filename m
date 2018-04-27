Return-Path: <SRS0=w2p0=HQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:37990 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753569AbeD0WCd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Apr 2018 18:02:33 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v3 6/6] arm64: dts: r8a77965-salvator-xs: Enable DU external clocks and HDMI
Date: Fri, 27 Apr 2018 23:02:20 +0100
Message-Id: <20180427220220.31286-7-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20180427220220.31286-1-kieran.bingham+renesas@ideasonboard.com>
References: <20180427220220.31286-1-kieran.bingham+renesas@ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
List-ID: <devicetree@vger.kernel.org>

The DU1 external dot clock is provided by the fixed frequency clock
generator X21, while the DU0 and DU3 clocks are provided by the
programmable Versaclock6 clock generator.

Enable the clocks, and the HDMI encoder for the M3-N Salvator-XS, and
hook it up to the HDMI connector

Based on patches from Takeshi Kihara <takeshi.kihara.df@renesas.com>

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
v3:
 - Remove LVDS references
---
 .../boot/dts/renesas/r8a77965-salvator-xs.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
index a83a00deed9e..9de4e3db1621 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
@@ -19,3 +19,31 @@
 		reg = <0x0 0x48000000 0x0 0x78000000>;
 	};
 };
+
+&du {
+	clocks = <&cpg CPG_MOD 724>,
+		 <&cpg CPG_MOD 723>,
+		 <&cpg CPG_MOD 721>,
+		 <&versaclock6 1>,
+		 <&x21_clk>,
+		 <&versaclock6 2>;
+	clock-names = "du.0", "du.1", "du.3",
+		      "dclkin.0", "dclkin.1", "dclkin.3";
+};
+
+&hdmi0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			reg = <1>;
+			rcar_dw_hdmi0_out: endpoint {
+				remote-endpoint = <&hdmi0_con>;
+			};
+		};
+	};
+};
+
+&hdmi0_con {
+	remote-endpoint = <&rcar_dw_hdmi0_out>;
+};
-- 
2.17.0

