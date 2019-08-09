Return-Path: <SRS0=mJni=WF=vergenet.net=horms@kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] dt-bindings: ata: sata_rcar: Rename bindings documentation file
Date: Fri,  9 Aug 2019 14:51:31 -0700
Message-Id: <20190809215131.877-1-horms+renesas@verge.net.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, linux-ide@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Rename the bindings documentation file for Renesas SATA controller
from sata_rcar.txt to renesas,rcar-sata.txt

This is part of an ongoing effort to name bindings documentation files for
Renesas IP blocks consistently, in line with the compat strings they
document.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on v5.3-rc1
---
 .../devicetree/bindings/ata/{sata_rcar.txt => renesas,rcar-sata.txt}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/ata/{sata_rcar.txt => renesas,rcar-sata.txt} (100%)

diff --git a/Documentation/devicetree/bindings/ata/sata_rcar.txt b/Documentation/devicetree/bindings/ata/renesas,rcar-sata.txt
similarity index 100%
rename from Documentation/devicetree/bindings/ata/sata_rcar.txt
rename to Documentation/devicetree/bindings/ata/renesas,rcar-sata.txt
-- 
2.11.0
