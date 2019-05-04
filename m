From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: [PATCH 3/6] arm64: dts: renesas: r8a7795: zap dma configuration in scif2
Date: Sat,  4 May 2019 02:42:55 +0200
Message-ID: <20190504004258.23574-4-erosca@de.adit-jv.com>
References: <20190504004258.23574-1-erosca@de.adit-jv.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190504004258.23574-1-erosca@de.adit-jv.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "George G . Davis" <george_davis@mentor.com>, Andy Lowe <andy_lowe@mentor.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eugeniu Rosca <erosca@de.adit-jv.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>
List-Id: devicetree@vger.kernel.org

Both empirically and based on the existing documentation, it looks like
SCIF2 does not support DMA. Let's disable it. Full reasoning is given in
commit ("Revert "arm64: dts: renesas: r8a7796: Enable DMA for SCIF2"").

Fixes: eb21089c32054e ("arm64: dts: renesas: r8a7795: Add missing SYS-DMAC2 dmas")
Fixes: 49af46b4095672 ("arm64: renesas: r8a7795: Add all SCIF nodes")
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index abeac3059383..7704bd46afdf 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1323,9 +1323,6 @@
 				 <&cpg CPG_CORE R8A7795_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
-			dmas = <&dmac1 0x13>, <&dmac1 0x12>,
-			       <&dmac2 0x13>, <&dmac2 0x12>;
-			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 310>;
 			status = "disabled";
-- 
2.21.0
