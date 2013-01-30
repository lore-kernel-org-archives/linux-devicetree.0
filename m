From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/6] ARM: dts: Update MFC DT binding documentation
Date: Wed, 30 Jan 2013 12:41:24 +0530
Message-ID: <1359529889-26318-2-git-send-email-sachin.kamat@linaro.org>
References: <1359529889-26318-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1359529889-26318-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org, Arun Kumar K <arun.kk@samsung.com>
List-Id: devicetree@vger.kernel.org

Added an example for bindings for illustration and clarity.

Cc: devicetree-discuss@lists.ozlabs.org
Cc: Arun Kumar K <arun.kk@samsung.com>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 .../devicetree/bindings/media/s5p-mfc.txt          |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt b/Documentation/devicetree/bindings/media/s5p-mfc.txt
index 67ec3d4..bf0182d 100644
--- a/Documentation/devicetree/bindings/media/s5p-mfc.txt
+++ b/Documentation/devicetree/bindings/media/s5p-mfc.txt
@@ -21,3 +21,24 @@ Required properties:
 
   - samsung,mfc-l : Base address of the second memory bank used by MFC
 		    for DMA contiguous memory allocation and its size.
+
+Optional properties:
+  - samsung,power-domain : power-domain property defined with a phandle
+			   to respective power domain.
+
+Example:
+SoC specific DT entry:
+
+mfc: codec@13400000 {
+	compatible = "samsung,mfc-v5";
+	reg = <0x13400000 0x10000>;
+	interrupts = <0 94 0>;
+	samsung,power-domain = <&pd_mfc>;
+};
+
+Board specific DT entry:
+
+codec@13400000 {
+	samsung,mfc-r = <0x43000000 0x800000>;
+	samsung,mfc-l = <0x51000000 0x800000>;
+};
-- 
1.7.4.1
