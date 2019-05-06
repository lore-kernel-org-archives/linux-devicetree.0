Return-Path: <SRS0=WgTi=TG=renesas.com=prvs=40290ccc1f=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH] ARM: dts: r7s9210-rza2mevb: add ethernet aliases
Date: Mon, 6 May 2019 15:12:36 -0500
Message-ID: <20190506201236.110281-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add ethernet aliases so u-boot can find the device nodes.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index 1eba37db7cdc..7795066d82cb 100644
--- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -17,6 +17,8 @@
 
 	aliases {
 		serial0 = &scif4;
+		ethernet0 = &ether0;
+		ethernet1 = &ether1;
 	};
 
 	chosen {
-- 
2.16.1
