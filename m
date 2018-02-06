From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] arm64: dts: renesas: r8a77970: Remove non-existing STBE region
Date: Tue,  6 Feb 2018 14:05:53 +0100
Message-ID: <1517922354-28421-3-git-send-email-geert+renesas@glider.be>
References: <1517922354-28421-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1517922354-28421-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "David S . Miller" <davem@davemloft.net>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

R-Car V3M does not have the Stream Buffer for EtherAVB-IF (STBE).

Note that the RAVB driver does not use this region.

Fixes: bea2ab136eaacec2 ("arm64: dts: renesas: r8a77970: add EtherAVB support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index d13794ab2f47b6dc..15a003cb56764c44 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -588,7 +588,7 @@
 		avb: ethernet@e6800000 {
 			compatible = "renesas,etheravb-r8a77970",
 				     "renesas,etheravb-rcar-gen3";
-			reg = <0 0xe6800000 0 0x800>, <0 0xe6a00000 0 0x10000>;
+			reg = <0 0xe6800000 0 0x800>;
 			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.7.4
