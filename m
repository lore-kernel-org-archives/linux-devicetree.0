From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: [PATCH 5/6] Revert "arm64: dts: renesas: r8a77990: Enable DMA for SCIF2"
Date: Sat,  4 May 2019 02:42:57 +0200
Message-ID: <20190504004258.23574-6-erosca@de.adit-jv.com>
References: <20190504004258.23574-1-erosca@de.adit-jv.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190504004258.23574-1-erosca@de.adit-jv.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "George G . Davis" <george_davis@mentor.com>, Andy Lowe <andy_lowe@mentor.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eugeniu Rosca <erosca@de.adit-jv.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>
List-Id: devicetree@vger.kernel.org

This reverts commit a99de47921565c233092b0d3c4652b3a10e715ec.

Both empirically and based on the existing documentation, it looks like
SCIF2 does not support DMA. Let's disable it. Full reasoning is given in
commit ("Revert "arm64: dts: renesas: r8a7796: Enable DMA for SCIF2"").

Fixes: a99de47921565c ("arm64: dts: renesas: r8a77990: Enable DMA for SCIF2")
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index d2ad665fe2d9..4bf32bfaafc0 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1018,9 +1018,7 @@
 				 <&cpg CPG_CORE R8A77990_CLK_S3D1C>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
-			dmas = <&dmac1 0x13>, <&dmac1 0x12>,
-			       <&dmac2 0x13>, <&dmac2 0x12>;
-			dma-names = "tx", "rx", "tx", "rx";
+
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 310>;
 			status = "disabled";
-- 
2.21.0
