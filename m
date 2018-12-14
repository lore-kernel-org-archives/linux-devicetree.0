From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 5/9] arm64: dts: renesas: r8a774c0: Add PFC support
Date: Fri, 14 Dec 2018 09:10:09 +0000
Message-ID: <1544778613-24279-6-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1544778613-24279-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544778613-24279-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Add PFC support to the RZ/G2E (a.k.a. r8a774c0) SoC specific
device tree.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 895f407..afb4751 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -105,6 +105,11 @@
 		#size-cells = <2>;
 		ranges;
 
+		pfc: pin-controller@e6060000 {
+			compatible = "renesas,pfc-r8a774c0";
+			reg = <0 0xe6060000 0 0x508>;
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a774c0-cpg-mssr";
 			reg = <0 0xe6150000 0 0x1000>;
-- 
2.7.4
