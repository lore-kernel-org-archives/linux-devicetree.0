From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [PATCH v2 2/4] dt-bindings: media: rcar_vin: add device tree support for r8a774[35]
Date: Thu, 16 Nov 2017 18:22:49 +0000
Message-ID: <1510856571-30281-3-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1510856571-30281-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510856571-30281-1-git-send-email-fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add compatible strings for r8a7743 and r8a7745. No driver change
is needed as "renesas,rcar-gen2-vin" will activate the right code.
However, it is good practice to document compatible strings for the
specific SoC as this allows SoC specific changes to the driver if
needed, in addition to document SoC support and therefore allow
checkpatch.pl to validate compatible string values.

Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Reviewed-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
---
v1->v2:
* Fixed double "change" in changelog

 Documentation/devicetree/bindings/media/rcar_vin.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/rcar_vin.txt
index 98931f5..ff9697e 100644
--- a/Documentation/devicetree/bindings/media/rcar_vin.txt
+++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
@@ -6,6 +6,8 @@ family of devices. The current blocks are always slaves and suppot one input
 channel which can be either RGB, YUYV or BT656.
 
  - compatible: Must be one or more of the following
+   - "renesas,vin-r8a7743" for the R8A7743 device
+   - "renesas,vin-r8a7745" for the R8A7745 device
    - "renesas,vin-r8a7778" for the R8A7778 device
    - "renesas,vin-r8a7779" for the R8A7779 device
    - "renesas,vin-r8a7790" for the R8A7790 device
@@ -14,7 +16,8 @@ channel which can be either RGB, YUYV or BT656.
    - "renesas,vin-r8a7793" for the R8A7793 device
    - "renesas,vin-r8a7794" for the R8A7794 device
    - "renesas,vin-r8a7795" for the R8A7795 device
-   - "renesas,rcar-gen2-vin" for a generic R-Car Gen2 compatible device.
+   - "renesas,rcar-gen2-vin" for a generic R-Car Gen2 or RZ/G1 compatible
+     device.
    - "renesas,rcar-gen3-vin" for a generic R-Car Gen3 compatible device.
 
    When compatible with the generic version nodes must list the
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
