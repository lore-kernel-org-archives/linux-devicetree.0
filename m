From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH/RFC v2 2/2] arm64: dts: r8a7795: salvator-x: Add support for R-Car H3 ES2.0
Date: Fri, 24 Mar 2017 14:37:45 +0100
Message-ID: <1490362665-4422-3-git-send-email-geert+renesas@glider.be>
References: <1490362665-4422-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490362665-4422-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Wolfram Sang <wsa-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Split off support for Salvator-X boards with the ES1.x revision of the
R-Car H3 SoC into a separate file.  The main r8a7795-salvator-x.dts file
now corresponds to Salvator-X with R-Car H3 ES2.0 or later.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
v2:
  - Use a separate file for ES1.x instead of for ES2.0, so
    r8a7795-salvator-x.dts always corresponds to the board with the
    latest SoC revision,
  - Add a dash between SoC part number and revision, for compatibility
    with the BSP,
  - Enhance the hardware description from basic support to everything
    already supported on ES1.x.
---
 arch/arm64/boot/dts/renesas/Makefile                                  | 1 +
 .../renesas/{r8a7795-salvator-x.dts => r8a7795-es1-salvator-x.dts}    | 0
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts                    | 4 ++--
 3 files changed, 3 insertions(+), 2 deletions(-)
 copy arch/arm64/boot/dts/renesas/{r8a7795-salvator-x.dts => r8a7795-es1-salvator-x.dts} (100%)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 1618e0a3c81d48bd..b6c723d8f6875f2d 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -1,4 +1,5 @@
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb r8a7795-h3ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-salvator-x.dtb
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb r8a7796-m3ulcb.dtb
 
 always		:= $(dtb-y)
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
similarity index 100%
copy from arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
copy to arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 7758b479dd98d2e9..baf5d34653d27e28 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -32,11 +32,11 @@
  */
 
 /dts-v1/;
-#include "r8a7795-es1.dtsi"
+#include "r8a7795.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 
 / {
-	model = "Renesas Salvator-X board based on r8a7795 ES1.x";
+	model = "Renesas Salvator-X board based on r8a7795 ES2.0+";
 	compatible = "renesas,salvator-x", "renesas,r8a7795";
 
 	aliases {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
