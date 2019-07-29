Return-Path: <SRS0=6Xp7=V2=vergenet.net=horms@kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] dt-bindings: rcar-imr: Rename bindings documentation file
Date: Mon, 29 Jul 2019 09:47:57 +0200
Message-Id: <20190729074757.9581-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-ID: <devicetree@vger.kernel.org>

Renesas media binding documentation files uses a naming schema of
'renesas,<module>.txt'. Rename IMR file to match this pattern.

Cc: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/media/{rcar_imr.txt => renesas,imr.txt} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/media/{rcar_imr.txt => renesas,imr.txt} (100%)

diff --git a/Documentation/devicetree/bindings/media/rcar_imr.txt b/Documentation/devicetree/bindings/media/renesas,imr.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/rcar_imr.txt
rename to Documentation/devicetree/bindings/media/renesas,imr.txt
-- 
2.11.0
