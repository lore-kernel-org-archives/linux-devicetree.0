From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 2/5] dt-bindings: arm: amlogic: Add support for GXL S905W
 and the P281 board
Date: Sat, 14 Jul 2018 21:37:22 +0200
Message-ID: <20180714193725.17837-3-martin.blumenstingl@googlemail.com>
References: <20180714193725.17837-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180714193725.17837-1-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com
Cc: mark.rutland@arm.com, narmstrong@baylibre.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, yixun.lan@amlogic.com, robh+dt@kernel.org, carlo@caione.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
List-Id: devicetree@vger.kernel.org

S905W SoC is another SoC from the GXL family. It is a cost-reduced
version of the S905X SoC. The following differences are known:
- S905W supports HDMI resolutions up to 4k@30fps (while S905X support
  resolutions up to 4k@60fps)
- the built-in video decoders of S905W decode up to 4k@30fps (while
  S905X supports decoding up to 4k@60fps)
- CPU speed on S905W is limited to 1.2GHz (compared to 1.5GHz on S905X,
  this is handled in the SCPI firmware)
- the DRAM interface on S905W is limited to 16-bit (GXL supports both,
  16-bit and 32-bit)

Notes based on Amlogic's GPL kernel sources:
- the P281 is a development board from Amlogic which uses the S905W SoC.
  Amlogic's GPL kernel sources indicate that it uses the same PCB layout
  as the "P231" board (and simply replaces the S905D from the original
  P231 board with a S905W SoC).
- it is assumed that the S905W SoC is pin-compatible with the S905X SoC
  since Amlogic's GPL kernel sources use the same driver for both SoCs.
- gxl_p281_1g.dts contains a comment which mentions that "max gp pll for
  gpu is 650M, temporarily disabled". However, it seems to boot fine
  with 744MHz (as used on GXBB and the other GXL SoCs).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 849834cb1766..8178da8742c3 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -45,6 +45,10 @@ Boards with the Amlogic Meson GXL S805X SoC shall have the following properties:
   Required root node property:
     compatible: "amlogic,s805x", "amlogic,meson-gxl";
 
+Boards with the Amlogic Meson GXL S905W SoC shall have the following properties:
+  Required root node property:
+    compatible: "amlogic,s905w", "amlogic,meson-gxl";
+
 Boards with the Amlogic Meson GXM S912 SoC shall have the following properties:
   Required root node property:
     compatible: "amlogic,s912", "amlogic,meson-gxm";
@@ -85,6 +89,8 @@ Board compatible values (alphabetically, grouped by SoC):
 
   - "amlogic,p241" (Meson gxl s805x)
 
+  - "amlogic,p281" (Meson gxl s905w)
+
   - "amlogic,q200" (Meson gxm s912)
   - "amlogic,q201" (Meson gxm s912)
   - "khadas,vim2" (Meson gxm s912)
-- 
2.18.0
