Return-Path: <SRS0=c6Dm=MD=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 1/4] dt-bindings: i2c: rcar: Add r8a77470 support
Date: Fri, 21 Sep 2018 18:36:58 +0100
Message-Id: <1537551421-4259-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1537551421-4259-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1537551421-4259-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das@bp.renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Although the I2C IP found in the RZ/G1C is not exactly the same
as the one found in the R-Car Gen2 family or R-Car Gen3 family,
it can still be considered as compatible with R-Car Gen2 from
a software perpective.
This patch therefore documents the SoC specific compatible string,
and the compatibility with Gen2 fallback is retained.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/i2c/i2c-rcar.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt b/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
index 39cd21d..671e2a1 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible:
 	"renesas,i2c-r8a7743" if the device is a part of a R8A7743 SoC.
 	"renesas,i2c-r8a7745" if the device is a part of a R8A7745 SoC.
+	"renesas,i2c-r8a77470" if the device is a part of a R8A77470 SoC.
 	"renesas,i2c-r8a774a1" if the device is a part of a R8A774A1 SoC.
 	"renesas,i2c-r8a7778" if the device is a part of a R8A7778 SoC.
 	"renesas,i2c-r8a7779" if the device is a part of a R8A7779 SoC.
-- 
2.7.4
