From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: r8a7795: Drop bogus HDMI node names suffixes
Date: Wed, 30 Aug 2017 12:03:17 +0200
Message-ID: <1504087397-6211-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Node names should not use numerical suffixes if the nodes can be
distinguished by unit-address.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 8b4dbce860001224..e1ced54d11322cb4 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -2702,7 +2702,7 @@
 			renesas,fcp = <&fcpf1>;
 		};
 
-		hdmi0: hdmi0@fead0000 {
+		hdmi0: hdmi@fead0000 {
 			compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
 			reg = <0 0xfead0000 0 0x10000>;
 			interrupts = <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
@@ -2727,7 +2727,7 @@
 			};
 		};
 
-		hdmi1: hdmi1@feae0000 {
+		hdmi1: hdmi@feae0000 {
 			compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
 			reg = <0 0xfeae0000 0 0x10000>;
 			interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.7.4
