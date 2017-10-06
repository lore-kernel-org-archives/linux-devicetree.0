From: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [PATCH v2] usb: renesas_usbhs: Add compatible string for r8a7743/5
Date: Fri,  6 Oct 2017 17:49:34 +0100
Message-ID: <1507308574-32047-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for r8a7743/5 SoCs. The Renesas RZ/G1[ME]
(R8A7743/5) usbhs is identical to the R-Car Gen2 family.

No driver change is needed due to the fallback compatible value
"renesas,rcar-gen2-usbhs".
Adding the SoC-specific compatible values here has two purposes:
  1. Document which SoCs have this hardware module,
  2. Allow checkpatch to validate compatible values.

Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Signed-off-by: Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
v1-->v2
   * Modified the patch description
   * Rebased on the below R-Car D3 patch
     https://patchwork.kernel.org/patch/9982267/

This patch is tested against Linux next tag next-20170929 +
  https://patchwork.kernel.org/patch/9982267/

 Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
index e79f6e4..47394ab 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
@@ -3,6 +3,8 @@ Renesas Electronics USBHS driver
 Required properties:
   - compatible: Must contain one or more of the following:
 
+	- "renesas,usbhs-r8a7743" for r8a7743 (RZ/G1M) compatible device
+	- "renesas,usbhs-r8a7745" for r8a7745 (RZ/G1E) compatible device
 	- "renesas,usbhs-r8a7790" for r8a7790 (R-Car H2) compatible device
 	- "renesas,usbhs-r8a7791" for r8a7791 (R-Car M2-W) compatible device
 	- "renesas,usbhs-r8a7792" for r8a7792 (R-Car V2H) compatible device
@@ -11,7 +13,7 @@ Required properties:
 	- "renesas,usbhs-r8a7795" for r8a7795 (R-Car H3) compatible device
 	- "renesas,usbhs-r8a7796" for r8a7796 (R-Car M3-W) compatible device
 	- "renesas,usbhs-r8a77995" for r8a77995 (R-Car D3) compatible device
-	- "renesas,rcar-gen2-usbhs" for R-Car Gen2 compatible device
+	- "renesas,rcar-gen2-usbhs" for R-Car Gen2 or RZ/G1 compatible devices
 	- "renesas,rcar-gen3-usbhs" for R-Car Gen3 compatible device
 
 	When compatible with the generic version, nodes must list the
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
