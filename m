Return-Path: <SRS0=H47x=KR=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 2/5] dt-bindings: gpio: rcar: Add gpio-reserved-ranges support
Date: Thu,  2 Aug 2018 15:11:24 +0100
Message-Id: <1533219087-33695-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1533219087-33695-1-git-send-email-biju.das@bp.renesas.com>
References: <1533219087-33695-1-git-send-email-biju.das@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Update the DT bindings documentation with the optional gpio-reserved-ranges
properties.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
index 378f132..67968b5 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
+++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
@@ -46,6 +46,9 @@ Optional properties:
     mandatory if the hardware implements a controllable functional clock for
     the GPIO instance.
 
+  - gpio-reserved-ranges: Set of tuples to specify the unused GPIOs.This
+    property indicates the start and size of the GPIOs that can't be used.
+
 Please refer to gpio.txt in this directory for details of gpio-ranges property
 and the common GPIO bindings used by client devices.
 
-- 
2.7.4
