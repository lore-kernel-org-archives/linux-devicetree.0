Return-Path: <SRS0=5k37=WP=vergenet.net=horms@kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] dt-bindings: dmaengine: nbpfaxi: Rename bindings documentation file
Date: Mon, 19 Aug 2019 15:52:44 +0200
Message-Id: <20190819135244.18183-1-horms+renesas@verge.net.au>
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Rename the device tree bindings for renesas "Type-AXI" NBPFAXI* DMA
controllers from nbpfaxi.txt to renesas,nbpfaxi.txt.

This is part of an ongoing effort to name bindings documentation files for
Renesas IP blocks consistently, in line with the compat strings they
document.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on v5.3-rc1
---
 .../devicetree/bindings/dma/{nbpfaxi.txt => renesas,nbpfaxi.txt}          | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/dma/{nbpfaxi.txt => renesas,nbpfaxi.txt} (100%)

diff --git a/Documentation/devicetree/bindings/dma/nbpfaxi.txt b/Documentation/devicetree/bindings/dma/renesas,nbpfaxi.txt
similarity index 100%
rename from Documentation/devicetree/bindings/dma/nbpfaxi.txt
rename to Documentation/devicetree/bindings/dma/renesas,nbpfaxi.txt
-- 
2.11.0
