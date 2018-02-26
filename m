Return-Path: <SRS0=8w0u=FU=mleia.com=vz@kernel.org>
From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 1/2] dt-bindings: rng: Document Freescale i.MX31 RNGA compatible
Date: Mon, 26 Feb 2018 20:38:48 +0200
Message-Id: <20180226183849.11562-2-vz@mleia.com>
In-Reply-To: <20180226183849.11562-1-vz@mleia.com>
References: <20180226183849.11562-1-vz@mleia.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-crypto@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Freescale i.MX31 SoC contains a Security Random Number Generator
Accelerator module (RNGA), which is replaced by RNGB and RNGC modules
on later i.MX SoC series, the change adds a new compatible property
to describe the controller.

Since all versions of Freescale RNG modules are legacy, apparently
the documentation file has no more potential for further extensions,
nevertheless generalize it by removing explicit RNGC specifics.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 .../devicetree/bindings/rng/{imx-rngc.txt => imx-rng.txt}      | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename Documentation/devicetree/bindings/rng/{imx-rngc.txt => imx-rng.txt} (59%)

diff --git a/Documentation/devicetree/bindings/rng/imx-rngc.txt b/Documentation/devicetree/bindings/rng/imx-rng.txt
similarity index 59%
rename from Documentation/devicetree/bindings/rng/imx-rngc.txt
rename to Documentation/devicetree/bindings/rng/imx-rng.txt
index 93c7174..fc10933 100644
--- a/Documentation/devicetree/bindings/rng/imx-rngc.txt
+++ b/Documentation/devicetree/bindings/rng/imx-rng.txt
@@ -1,15 +1,13 @@
-Freescale RNGC (Random Number Generator Version C)
-
-The driver also supports version B, which is mostly compatible
-to version C.
+Freescale RNGA/RNGB/RNGC (Random Number Generator Versions A, B and C)
 
 Required properties:
 - compatible : should be one of
+               "fsl,imx31-rnga"
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
