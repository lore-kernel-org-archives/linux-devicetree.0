From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH v2 8/9] Documentation: devicetree: Document sclk-jpeg clock for
 exynos3250 SoC
Date: Fri, 11 Jul 2014 17:19:49 +0200
Message-ID: <1405091990-28567-9-git-send-email-j.anaszewski@samsung.com>
References: <1405091990-28567-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1405091990-28567-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: s.nawrocki@samsung.com, andrzej.p@samsung.com, Jacek Anaszewski <j.anaszewski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

JPEG IP on Exynos3250 SoC requires enabling two clock
gates for its operation. This patch documents this
requirement.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org
---
 .../bindings/media/exynos-jpeg-codec.txt           |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt b/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
index 937b755..3142745 100644
--- a/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
+++ b/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
@@ -3,9 +3,12 @@ Samsung S5P/EXYNOS SoC series JPEG codec
 Required properties:
 
 - compatible	: should be one of:
-		  "samsung,s5pv210-jpeg", "samsung,exynos4210-jpeg";
+		  "samsung,s5pv210-jpeg", "samsung,exynos4210-jpeg",
+		  "samsung,exynos3250-jpeg";
 - reg		: address and length of the JPEG codec IP register set;
 - interrupts	: specifies the JPEG codec IP interrupt;
-- clocks	: should contain the JPEG codec IP gate clock specifier, from the
+- clocks	: should contain the JPEG codec IP gate clock specifier and
+		  for the Exynos3250 SoC additionally the SCLK_JPEG entry; from the
 		  common clock bindings;
-- clock-names	: should contain "jpeg" entry.
+- clock-names	: should contain "jpeg" entry and additionally "sclk-jpeg" entry
+		  for Exynos3250 SoC
-- 
1.7.9.5
