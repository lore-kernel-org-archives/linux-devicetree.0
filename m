From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] reset: uniphier: add compatible string for LD11 SD-reset block
Date: Sun, 15 Jan 2017 04:04:46 +0900
Message-ID: <1484420686-28911-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The LD11 SoC is equipped with not only MIO-reset but also SD-reset
for controlling RST_n pin of the eMMC device.

Update the binding document and remove unneeded "." from each line
in itemization.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 .../devicetree/bindings/reset/uniphier-reset.txt   | 47 +++++++++++-----------
 drivers/reset/reset-uniphier.c                     |  4 ++
 2 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/uniphier-reset.txt b/Documentation/devicetree/bindings/reset/uniphier-reset.txt
index 5020524..83ab0f5 100644
--- a/Documentation/devicetree/bindings/reset/uniphier-reset.txt
+++ b/Documentation/devicetree/bindings/reset/uniphier-reset.txt
@@ -6,14 +6,14 @@ System reset
 
 Required properties:
 - compatible: should be one of the following:
-    "socionext,uniphier-sld3-reset" - for sLD3 SoC.
-    "socionext,uniphier-ld4-reset"  - for LD4 SoC.
-    "socionext,uniphier-pro4-reset" - for Pro4 SoC.
-    "socionext,uniphier-sld8-reset" - for sLD8 SoC.
-    "socionext,uniphier-pro5-reset" - for Pro5 SoC.
-    "socionext,uniphier-pxs2-reset" - for PXs2/LD6b SoC.
-    "socionext,uniphier-ld11-reset" - for LD11 SoC.
-    "socionext,uniphier-ld20-reset" - for LD20 SoC.
+    "socionext,uniphier-sld3-reset" - for sLD3 SoC
+    "socionext,uniphier-ld4-reset"  - for LD4 SoC
+    "socionext,uniphier-pro4-reset" - for Pro4 SoC
+    "socionext,uniphier-sld8-reset" - for sLD8 SoC
+    "socionext,uniphier-pro5-reset" - for Pro5 SoC
+    "socionext,uniphier-pxs2-reset" - for PXs2/LD6b SoC
+    "socionext,uniphier-ld11-reset" - for LD11 SoC
+    "socionext,uniphier-ld20-reset" - for LD20 SoC
 - #reset-cells: should be 1.
 
 Example:
@@ -37,14 +37,15 @@ Media I/O (MIO) reset, SD reset
 
 Required properties:
 - compatible: should be one of the following:
-    "socionext,uniphier-sld3-mio-reset" - for sLD3 SoC.
-    "socionext,uniphier-ld4-mio-reset"  - for LD4 SoC.
-    "socionext,uniphier-pro4-mio-reset" - for Pro4 SoC.
-    "socionext,uniphier-sld8-mio-reset" - for sLD8 SoC.
-    "socionext,uniphier-pro5-sd-reset"  - for Pro5 SoC.
-    "socionext,uniphier-pxs2-sd-reset"  - for PXs2/LD6b SoC.
-    "socionext,uniphier-ld11-mio-reset" - for LD11 SoC.
-    "socionext,uniphier-ld20-sd-reset"  - for LD20 SoC.
+    "socionext,uniphier-sld3-mio-reset" - for sLD3 SoC
+    "socionext,uniphier-ld4-mio-reset"  - for LD4 SoC
+    "socionext,uniphier-pro4-mio-reset" - for Pro4 SoC
+    "socionext,uniphier-sld8-mio-reset" - for sLD8 SoC
+    "socionext,uniphier-pro5-sd-reset"  - for Pro5 SoC
+    "socionext,uniphier-pxs2-sd-reset"  - for PXs2/LD6b SoC
+    "socionext,uniphier-ld11-mio-reset" - for LD11 SoC (MIO)
+    "socionext,uniphier-ld11-sd-reset"  - for LD11 SoC (SD)
+    "socionext,uniphier-ld20-sd-reset"  - for LD20 SoC
 - #reset-cells: should be 1.
 
 Example:
@@ -68,13 +69,13 @@ Peripheral reset
 
 Required properties:
 - compatible: should be one of the following:
-    "socionext,uniphier-ld4-peri-reset"  - for LD4 SoC.
-    "socionext,uniphier-pro4-peri-reset" - for Pro4 SoC.
-    "socionext,uniphier-sld8-peri-reset" - for sLD8 SoC.
-    "socionext,uniphier-pro5-peri-reset" - for Pro5 SoC.
-    "socionext,uniphier-pxs2-peri-reset" - for PXs2/LD6b SoC.
-    "socionext,uniphier-ld11-peri-reset" - for LD11 SoC.
-    "socionext,uniphier-ld20-peri-reset" - for LD20 SoC.
+    "socionext,uniphier-ld4-peri-reset"  - for LD4 SoC
+    "socionext,uniphier-pro4-peri-reset" - for Pro4 SoC
+    "socionext,uniphier-sld8-peri-reset" - for sLD8 SoC
+    "socionext,uniphier-pro5-peri-reset" - for Pro5 SoC
+    "socionext,uniphier-pxs2-peri-reset" - for PXs2/LD6b SoC
+    "socionext,uniphier-ld11-peri-reset" - for LD11 SoC
+    "socionext,uniphier-ld20-peri-reset" - for LD20 SoC
 - #reset-cells: should be 1.
 
 Example:
diff --git a/drivers/reset/reset-uniphier.c b/drivers/reset/reset-uniphier.c
index 968c3ae..9c11be3 100644
--- a/drivers/reset/reset-uniphier.c
+++ b/drivers/reset/reset-uniphier.c
@@ -390,6 +390,10 @@ static const struct of_device_id uniphier_reset_match[] = {
 		.data = uniphier_sld3_mio_reset_data,
 	},
 	{
+		.compatible = "socionext,uniphier-ld11-sd-reset",
+		.data = uniphier_pro5_sd_reset_data,
+	},
+	{
 		.compatible = "socionext,uniphier-ld20-sd-reset",
 		.data = uniphier_pro5_sd_reset_data,
 	},
-- 
2.7.4
