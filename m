Return-Path: <SRS0=S257=M4=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] dt-bindings: spi: sh-msiof: document R8A779{7|8}0 bindings
Message-ID: <62919a6e-4206-0caa-deb0-6bf67b77eff1@cogentembedded.com>
Date: Tue, 16 Oct 2018 22:22:05 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Document the R-Car V3{M|H} (R8A779{7|8}0) SoCs in the Renesas MSIOF
bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'for-next' branch of Mark Brown's 'spi.git' repo.

 Documentation/devicetree/bindings/spi/sh-msiof.txt |    2 ++
 1 file changed, 2 insertions(+)

Index: spi/Documentation/devicetree/bindings/spi/sh-msiof.txt
===================================================================
--- spi.orig/Documentation/devicetree/bindings/spi/sh-msiof.txt
+++ spi/Documentation/devicetree/bindings/spi/sh-msiof.txt
@@ -13,6 +13,8 @@ Required properties:
 			 "renesas,msiof-r8a7795" (R-Car H3)
 			 "renesas,msiof-r8a7796" (R-Car M3-W)
 			 "renesas,msiof-r8a77965" (R-Car M3-N)
+			 "renesas,msiof-r8a77970" (R-Car V3M)
+			 "renesas,msiof-r8a77980" (R-Car V3H)
 			 "renesas,msiof-r8a77990" (R-Car E3)
 			 "renesas,msiof-r8a77995" (R-Car D3)
 			 "renesas,msiof-sh73a0" (SH-Mobile AG5)
