Return-Path: <SRS0=ZXHR=F3=mleia.com=vz@kernel.org>
From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH v2 1/2] dt-bindings: rng: Document Freescale i.MX21 and i.MX31 RNGA compatibles
Date: Tue,  6 Mar 2018 00:20:59 +0200
Message-Id: <20180305222100.29351-2-vz@mleia.com>
In-Reply-To: <20180305222100.29351-1-vz@mleia.com>
References: <20180305222100.29351-1-vz@mleia.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>, Rob Herring <robh+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-crypto@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Freescale i.MX21 and i.MX31 SoCs contain a Random Number Generator
Accelerator module (RNGA), which is replaced by RNGB and RNGC modules
on later i.MX SoC series, the change adds a new compatible property
to describe the controller.

Since all versions of Freescale RNG modules are legacy, apparently
the documentation file has no more potential for further extensions,
nevertheless generalize it by removing explicit RNGC specifics.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes from v1 to v2:
* added i.MX21 RNGA compatible, i.MX31 RNGA is backward compatible to it,
* though the list of documented compatibles is extended, I dare to add
  Rob's Reviewed-by tag casted for v1.

 .../devicetree/bindings/rng/{imx-rngc.txt => imx-rng.txt}     | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename Documentation/devicetree/bindings/rng/{imx-rngc.txt => imx-rng.txt} (54%)

diff --git a/Documentation/devicetree/bindings/rng/imx-rngc.txt b/Documentation/devicetree/bindings/rng/imx-rng.txt
similarity index 54%
rename from Documentation/devicetree/bindings/rng/imx-rngc.txt
rename to Documentation/devicetree/bindings/rng/imx-rng.txt
index 93c7174..405c2b0 100644
--- a/Documentation/devicetree/bindings/rng/imx-rngc.txt
+++ b/Documentation/devicetree/bindings/rng/imx-rng.txt
@@ -1,15 +1,14 @@
-Freescale RNGC (Random Number Generator Version C)
-
-The driver also supports version B, which is mostly compatible
-to version C.
+Freescale RNGA/RNGB/RNGC (Random Number Generator Versions A, B and C)
 
 Required properties:
 - compatible : should be one of
+               "fsl,imx21-rnga"
+               "fsl,imx31-rnga" (backward compatible with "fsl,imx21-rnga")
                "fsl,imx25-rngb"
                "fsl,imx35-rngc"
 - reg : offset and length of the register set of this block
-- interrupts : the interrupt number for the RNGC block
-- clocks : the RNGC clk source
+- interrupts : the interrupt number for the RNG block
+- clocks : the RNG clk source
 
 Example:
 
-- 
2.10.2
