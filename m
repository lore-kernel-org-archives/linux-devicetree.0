From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [RFC resend 1/4] dt-bindings: display: mediatek: add drm binding
Date: Thu, 19 Oct 2017 13:26:07 +0200
Message-ID: <20171019112610.13645-2-mbrugger@suse.com>
References: <20171019112610.13645-1-mbrugger@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171019112610.13645-1-mbrugger@suse.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com, ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>, catalin.marinas@arm.com, will.deacon@arm.com, linux@armlinux.org.uk, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

DRM subysystem and clock driver shared the same compatible mmsys.
This stopped does not work, as only the first driver for a compatible
gets probed. We change the comaptible to the new DRM identifier to fix
this.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 383183a89164..6db652463e64 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -27,6 +27,7 @@ Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt.
 
 Required properties (all function blocks):
 - compatible: "mediatek,<chip>-disp-<function>", one of
+	"mediatek,<chip>-dispsys"    - central component for the DRM system
 	"mediatek,<chip>-disp-ovl"   - overlay (4 layers, blending, csc)
 	"mediatek,<chip>-disp-rdma"  - read DMA / line buffer
 	"mediatek,<chip>-disp-wdma"  - write DMA
@@ -71,6 +72,11 @@ mmsys: clock-controller@14000000 {
 	#clock-cells = <1>;
 };
 
+dispsys: display-system {
+	compatible = "mediatek,mt2701-dispsys";
+	mediatek,mmsys = <&mmsys>;
+}
+
 ovl0: ovl@1400c000 {
 	compatible = "mediatek,mt8173-disp-ovl";
 	reg = <0 0x1400c000 0 0x1000>;
-- 
2.14.2
