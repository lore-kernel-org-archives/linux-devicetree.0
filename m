From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH 3/3] Documentation: devicetree: Document exynos3250 SoC related
 settings
Date: Tue, 08 Jul 2014 15:05:38 +0200
Message-ID: <1404824738-5944-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: k.debski@samsung.com, jtp.park@samsung.com, kyungmin.park@samsung.com, b.zolnierkie@samsung.com, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/media/s5p-mfc.txt          |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt b/Documentation/devicetree/bindings/media/s5p-mfc.txt
index 3e3c5f3..ee9604b 100644
--- a/Documentation/devicetree/bindings/media/s5p-mfc.txt
+++ b/Documentation/devicetree/bindings/media/s5p-mfc.txt
@@ -10,16 +10,20 @@ Required properties:
   - compatible : value should be either one among the following
 	(a) "samsung,mfc-v5" for MFC v5 present in Exynos4 SoCs
 	(b) "samsung,mfc-v6" for MFC v6 present in Exynos5 SoCs
-	(c) "samsung,mfc-v7" for MFC v7 present in Exynos5420 SoC
+	(c) "samsung,mfc-v7" for MFC v7 present in Exynos3250 and Exynos5420 SoC
 	(d) "samsung,mfc-v8" for MFC v8 present in Exynos5800 SoC
 
   - reg : Physical base address of the IP registers and length of memory
 	  mapped region.
 
   - interrupts : MFC interrupt number to the CPU.
-  - clocks : from common clock binding: handle to mfc clock.
+  - clocks : from common clock binding: handle to mfc clock and for
+	     Exynos3250 SoC special clock gate should be defined
+	     as the second element of the clocks array
+
   - clock-names : from common clock binding: must contain "mfc",
-		  corresponding to entry in the clocks property.
+		  corresponding to entry in the clocks property and
+		  additionally "sclk-mfc" entry for Exynos3250 SoC
 
   - samsung,mfc-r : Base address of the first memory bank used by MFC
 		    for DMA contiguous memory allocation and its size.
-- 
1.7.9.5
