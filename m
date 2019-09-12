From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] arm: dts: renesas: r8a77980: Remove r8a77970 DU compatible
Date: Thu, 12 Sep 2019 11:37:34 +0100
Message-ID: <20190912103734.1879-1-kieran.bingham+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

The r8a77970 was added with an compatible string for a differnet device
rather than adding the correct compatible to the driver.

Remove the unnecessary compatible which is for a different platform.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
Please note, this patch should not be integrated until the renesas,du-r8a77980
compatible string makes it into the DU [0].

[0] https://lore.kernel.org/linux-renesas-soc/a9cc2193-0a18-0490-c273-c64bd70992f5@ideasonboard.com/T/#t

 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 042f4089e546..c6195377d181 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -1487,8 +1487,7 @@
 		};
 
 		du: display@feb00000 {
-			compatible = "renesas,du-r8a77980",
-				     "renesas,du-r8a77970";
+			compatible = "renesas,du-r8a77980";
 			reg = <0 0xfeb00000 0 0x80000>;
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 724>;
-- 
2.20.1
