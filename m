From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 17/17] arm64: dts: r8a77965-salvator-xs: Enable HDMI output
Date: Thu, 26 Apr 2018 17:53:46 +0100
Message-ID: <20180426165346.494-18-kieran.bingham+renesas@ideasonboard.com>
References: <20180426165346.494-1-kieran.bingham+renesas@ideasonboard.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180426165346.494-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM64 PORT
        AARCH64 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch enables the HDMI encoder for the Salvator-X 2nd version board
on the R8A77965 SoC and hook it up to the HDMI connector.

Based on code of the Salvator-X 2nd version board
on the R8A7796 SoC device tree
by Geert Uytterhoeven <geert+renesas@glider.be>

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 .../boot/dts/renesas/r8a77965-salvator-xs.dts   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
index 2223cc2bd6bc..dcf1849f1a67 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
@@ -31,3 +31,20 @@
 	clock-names = "du.0", "du.1", "du.3", "lvds.0",
 		      "dclkin.0", "dclkin.1", "dclkin.3";
 };
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
