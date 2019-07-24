Return-Path: <SRS0=vA0O=VV=vergenet.net=horms@kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] dt-bindings: shdma: Rename bindings documentation file
Date: Wed, 24 Jul 2019 13:49:46 +0200
Message-Id: <20190724114946.14021-1-horms+renesas@verge.net.au>
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Rename the bindings documentation file for shdma
from shdma.txt to renesas,shdma.txt.

This is part of an ongoing effort to name bindings documentation files for
Renesas IP blocks consistently, in line with the compat strings they
document.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on v5.3-rc1
---
 Documentation/devicetree/bindings/dma/{shdma.txt => renesas,shdma.txt} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/dma/{shdma.txt => renesas,shdma.txt} (100%)

diff --git a/Documentation/devicetree/bindings/dma/shdma.txt b/Documentation/devicetree/bindings/dma/renesas,shdma.txt
similarity index 100%
rename from Documentation/devicetree/bindings/dma/shdma.txt
rename to Documentation/devicetree/bindings/dma/renesas,shdma.txt
-- 
2.11.0
