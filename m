From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH v2 1/5] ARM: dts: Update clocks entry in MFC binding
 documentation
Date: Thu, 20 Jun 2013 12:23:38 +0530
Message-ID: <1371711222-9232-2-git-send-email-arun.kk@samsung.com>
References: <1371711222-9232-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1371711222-9232-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, s.nawrocki@samsung.com, sachin.kamat@linaro.org, arunkk.samsung@gmail.com
List-Id: devicetree@vger.kernel.org

MFC driver is updated to use only one clock instead of
two. Correcting this in the binding documentation.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 .../devicetree/bindings/media/s5p-mfc.txt          |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt b/Documentation/devicetree/bindings/media/s5p-mfc.txt
index df37b02..d75c3e5 100644
--- a/Documentation/devicetree/bindings/media/s5p-mfc.txt
+++ b/Documentation/devicetree/bindings/media/s5p-mfc.txt
@@ -15,9 +15,9 @@ Required properties:
 	  mapped region.
 
   - interrupts : MFC interrupt number to the CPU.
-  - clocks : from common clock binding: handle to mfc clocks.
-  - clock-names : from common clock binding: must contain "sclk_mfc" and "mfc",
-		  corresponding to entries in the clocks property.
+  - clocks : from common clock binding: handle to mfc clock.
+  - clock-names : from common clock binding: must contain "mfc",
+		  corresponding to entry in the clocks property.
 
   - samsung,mfc-r : Base address of the first memory bank used by MFC
 		    for DMA contiguous memory allocation and its size.
@@ -37,8 +37,8 @@ mfc: codec@13400000 {
 	reg = <0x13400000 0x10000>;
 	interrupts = <0 94 0>;
 	samsung,power-domain = <&pd_mfc>;
-	clocks = <&clock 170>, <&clock 273>;
-	clock-names = "sclk_mfc", "mfc";
+	clocks = <&clock 273>;
+	clock-names = "mfc";
 };
 
 Board specific DT entry:
-- 
1.7.9.5
