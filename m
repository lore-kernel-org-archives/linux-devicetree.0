From: Maxime Jourdan <mjourdan@baylibre.com>
Subject: [PATCH 1/3] dt-bindings: media: amlogic,vdec: add default compatible
Date: Fri, 26 Jul 2019 14:46:37 +0200
Message-ID: <20190726124639.7713-2-mjourdan@baylibre.com>
References: <20190726124639.7713-1-mjourdan@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190726124639.7713-1-mjourdan@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The first version of the bindings is missing a generic compatible that
is used by the base node (GX), and then extended by the SoC device trees
(GXBB, GXL, GXM)

Also change the example to use "video-codec" instead of "video-decoder",
as the former is the one used in almost all cases when it comes to video
decode/encode accelerators.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 Documentation/devicetree/bindings/media/amlogic,vdec.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/amlogic,vdec.txt b/Documentation/devicetree/bindings/media/amlogic,vdec.txt
index aabdd01bcf32..9b6aace86ca7 100644
--- a/Documentation/devicetree/bindings/media/amlogic,vdec.txt
+++ b/Documentation/devicetree/bindings/media/amlogic,vdec.txt
@@ -26,6 +26,7 @@ Required properties:
 	- GXBB (S905) : "amlogic,gxbb-vdec"
 	- GXL (S905X, S905D) : "amlogic,gxl-vdec"
 	- GXM (S912) : "amlogic,gxm-vdec"
+	followed by the common "amlogic,gx-vdec"
 - reg: base address and size of he following memory-mapped regions :
 	- dos
 	- esparser
@@ -47,8 +48,8 @@ Required properties:
 
 Example:
 
-vdec: video-decoder@c8820000 {
-	compatible = "amlogic,gxbb-vdec";
+vdec: video-codec@c8820000 {
+	compatible = "amlogic,gxbb-vdec", "amlogic,gx-vdec";
 	reg = <0x0 0xc8820000 0x0 0x10000>,
 	      <0x0 0xc110a580 0x0 0xe4>;
 	reg-names = "dos", "esparser";
-- 
2.22.0
