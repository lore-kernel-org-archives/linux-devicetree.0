From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2] ARM: shmobile: Document Renesas H2-based Stout DT bindings
Date: Thu, 15 Feb 2018 11:02:28 +0100
Message-ID: <20180215100228.24695-1-marek.vasut+renesas@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document the Renesas H2 Stout (ADAS Starterkit) device tree bindings,
listing it as a supported board.

This allows to use checkpatch.pl to validate .dts files referring to
the Stout board.

Signed-off-by: Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
---
V2: - Keep the list of boards alphabetically sorted
    - Rename the board from ADAS Starter Kit to ADAS Starterkit
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 41d3920aaa5e..98916b3864c2 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -116,6 +116,8 @@ Boards:
     compatible = "renesas,sk-rzg1e", "renesas,r8a7745"
   - SK-RZG1M (YR8A77430S000BE)
     compatible = "renesas,sk-rzg1m", "renesas,r8a7743"
+  - Stout (ADAS Starterkit, Y-R-CAR-ADAS-SKH2-BOARD)
+    compatible = "renesas,stout", "renesas,r8a7790"
   - V3MSK
     compatible = "renesas,v3msk", "renesas,r8a77970"
   - Wheat
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
