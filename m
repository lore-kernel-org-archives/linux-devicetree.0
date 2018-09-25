Return-Path: <SRS0=hgQm=MH=gmail.com=dangtranhieu2012@kernel.org>
From: Hieu Tran Dang <dangtranhieu2012@gmail.com>
Subject: [PATCH 1/2] dt-bindings: spi: fsl-lpspi: Option to allow stalling
Date: Wed, 26 Sep 2018 04:22:45 +0700
Message-Id: <20180925212245.14858-1-dangtranhieu2012@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Gao Pan <pandy.gao@nxp.com>
Cc: Hieu Tran Dang <dangtranhieu2012@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This patch add fsl,allow-stalling property documentation for fsl-lpspi

Signed-off-by: Hieu Tran Dang <dangtranhieu2012@gmail.com>
---
 Documentation/devicetree/bindings/spi/spi-fsl-lpspi.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.txt b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.txt
index 4af132606b37..2b012b8cb05e 100644
--- a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.txt
+++ b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.txt
@@ -6,6 +6,8 @@ Required properties:
 - reg : address and length of the lpspi master registers
 - interrupts : lpspi interrupt
 - clocks : lpspi clock specifier
+- fsl,allow-stall : allow stalling of transfers when the transmit FIFO is empty
+  or when the receive FIFO is full
 
 Examples:
 
-- 
2.17.1
