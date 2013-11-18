From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: [PATCH] clk: exynos: Fix typos in DT bindings documentation
Date: Mon, 18 Nov 2013 12:46:12 +0100
Message-ID: <1384775172-3373-1-git-send-email-laurent.pinchart@ideasonboard.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

s/comptible/compatible/

Signed-off-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/exynos4-clock.txt    | 2 +-
 Documentation/devicetree/bindings/clock/exynos5250-clock.txt | 2 +-
 Documentation/devicetree/bindings/clock/exynos5420-clock.txt | 2 +-
 Documentation/devicetree/bindings/clock/exynos5440-clock.txt | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/exynos4-clock.txt b/Documentation/devicetree/bindings/clock/exynos4-clock.txt
index c6bf8a6..a2ac2d9 100644
--- a/Documentation/devicetree/bindings/clock/exynos4-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos4-clock.txt
@@ -6,7 +6,7 @@ SoC's in the Exynos4 family.
 
 Required Properties:
 
-- comptible: should be one of the following.
+- compatible: should be one of the following.
   - "samsung,exynos4210-clock" - controller compatible with Exynos4210 SoC.
   - "samsung,exynos4412-clock" - controller compatible with Exynos4412 SoC.
 
diff --git a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
index 24765c1..46f5c79 100644
--- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
@@ -5,7 +5,7 @@ controllers within the Exynos5250 SoC.
 
 Required Properties:
 
-- comptible: should be one of the following.
+- compatible: should be one of the following.
   - "samsung,exynos5250-clock" - controller compatible with Exynos5250 SoC.
 
 - reg: physical base address of the controller and length of memory mapped
diff --git a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
index 32aa34e..458f347 100644
--- a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
@@ -5,7 +5,7 @@ controllers within the Exynos5420 SoC.
 
 Required Properties:
 
-- comptible: should be one of the following.
+- compatible: should be one of the following.
   - "samsung,exynos5420-clock" - controller compatible with Exynos5420 SoC.
 
 - reg: physical base address of the controller and length of memory mapped
diff --git a/Documentation/devicetree/bindings/clock/exynos5440-clock.txt b/Documentation/devicetree/bindings/clock/exynos5440-clock.txt
index 4499e99..9955dc9 100644
--- a/Documentation/devicetree/bindings/clock/exynos5440-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5440-clock.txt
@@ -5,7 +5,7 @@ controllers within the Exynos5440 SoC.
 
 Required Properties:
 
-- comptible: should be "samsung,exynos5440-clock".
+- compatible: should be "samsung,exynos5440-clock".
 
 - reg: physical base address of the controller and length of memory mapped
   region.
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
