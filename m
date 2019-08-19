Return-Path: <SRS0=5k37=WP=vergenet.net=horms@kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] dt-bindings: sh-mobile-ceu: Rename bindings documentation file
Date: Mon, 19 Aug 2019 16:05:44 +0200
Message-Id: <20190819140544.19294-1-horms+renesas@verge.net.au>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Renesas media binding documentation files uses a naming schema of
'renesas,<module>.txt'. Rename the SH Mobile CEU file to match this pattern.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on v5.3-rc1
---
 .../bindings/media/{sh_mobile_ceu.txt => renesas,sh-mobile-ceu.txt}       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/media/{sh_mobile_ceu.txt => renesas,sh-mobile-ceu.txt} (100%)

diff --git a/Documentation/devicetree/bindings/media/sh_mobile_ceu.txt b/Documentation/devicetree/bindings/media/renesas,sh-mobile-ceu.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/sh_mobile_ceu.txt
rename to Documentation/devicetree/bindings/media/renesas,sh-mobile-ceu.txt
-- 
2.11.0
