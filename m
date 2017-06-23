From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [PATCH] dt-bindings: media: Add r8a7796 DRIF bindings
Date: Fri, 23 Jun 2017 10:25:02 +0100
Message-ID: <20170623092502.57818-1-ramesh.shanmugasundaram@bp.renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org
Cc: chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add r8a7796 DRIF bindings.

Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
---
Hi DT & Media maintainers, All,

   This patch adds DRIF bindings for R8A7796 SoC.
   It is based on media_tree - commit 76724b30f222

Thanks,
Ramesh.

 Documentation/devicetree/bindings/media/renesas,drif.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,drif.txt b/Documentation/devicetree/bindings/media/renesas,drif.txt
index 39516b94c28f..0d8974aa8b38 100644
--- a/Documentation/devicetree/bindings/media/renesas,drif.txt
+++ b/Documentation/devicetree/bindings/media/renesas,drif.txt
@@ -40,6 +40,7 @@ To summarize,
 Required properties of an internal channel:
 -------------------------------------------
 - compatible:	"renesas,r8a7795-drif" if DRIF controller is a part of R8A7795 SoC.
+		"renesas,r8a7796-drif" if DRIF controller is a part of R8A7796 SoC.
 		"renesas,rcar-gen3-drif" for a generic R-Car Gen3 compatible device.
 
 		When compatible with the generic version, nodes must list the
-- 
2.12.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
