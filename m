From: Jungo Lin <jungo.lin@mediatek.com>
Subject: [RFC,v3 1/9] dt-bindings: mt8183: Added camera ISP Pass 1
Date: Tue, 11 Jun 2019 11:53:36 +0800
Message-ID: <20190611035344.29814-2-jungo.lin@mediatek.com>
References: <jungo.lin@mediatek.com>
 <20190611035344.29814-1-jungo.lin@mediatek.com>
Reply-To: jungo.lin@mediatek.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190611035344.29814-1-jungo.lin@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: tfiga@chromium.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, matthias.bgg@gmail.com, mchehab@kernel.org
Cc: devicetree@vger.kernel.org, sean.cheng@mediatek.com, rynn.wu@mediatek.com, srv_heupstream@mediatek.com, robh@kernel.org, ryan.yu@mediatek.com, frankie.chiu@mediatek.com, jungo.lin@mediatek.com, sj.huang@mediatek.com, linux-mediatek@lists.infradead.org, ddavenport@chromium.org, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds DT binding document for the Pass 1 (P1) unit in
Mediatek's camera ISP system. The Pass 1 unit grabs the sensor data
out from the sensor interface, applies ISP image effects from tuning
data and outputs the image data or statistics data to DRAM.

Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
---
 .../bindings/media/mediatek,camisp.txt        | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,camisp.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek,camisp.txt b/Documentation/devicetree/bindings/media/mediatek,camisp.txt
new file mode 100644
index 000000000000..50a8b4d9ac8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,camisp.txt
@@ -0,0 +1,57 @@
+* Mediatek Image Signal Processor Pass 1 (ISP P1)
+
+The Pass 1 unit of Mediatek's camera ISP system grabs the sensor data out
+from the sensor interface, applies ISP effects from tuning data and outputs
+the image data and statistics data to DRAM. Furthermore, Pass 1 unit has
+the ability to output two different resolutions frames at the same time to
+increase the performance of the camera application.
+
+Required properties:
+- compatible: Must be "mediatek,mt8183-camisp" for MT8183.
+- reg: Physical base address of the camera function block registers and
+  length of memory mapped region. Must contain an entry for each entry
+  in reg-names.
+- reg-names: Must include the following entries:
+  "cam_sys": Camsys base function block
+  "cam_uni": Camera UNI function block
+  "cam_a": Single camera ISP P1 hardware module A
+  "cam_b": Single camera ISP P1 hardware module B
+- interrupts: Interrupt number to the CPU.
+- iommus: Shall point to the respective IOMMU block with master port
+  as argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+- clocks: A list of phandle and clock specifier pairs as listed
+  in clock-names property, see
+  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
+- clock-names: Must be "camsys_cam_cgpdn" and "camsys_camtg_cgpdn".
+- mediatek,larb: Must contain the local arbiters in the current SoCs, see
+  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+  for details.
+- mediatek,scp : The node of system control processor (SCP), see
+  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt for details.
+
+Example:
+SoC specific DT entry:
+
+		camisp: camisp@1a000000 {
+			compatible = "mediatek,mt8183-camisp", "syscon";
+			reg = <0 0x1a000000 0 0x1000>,
+			      <0 0x1a003000 0 0x1000>,
+			      <0 0x1a004000 0 0x2000>,
+			      <0 0x1a006000 0 0x2000>;
+			reg-names = "cam_sys",
+				    "cam_uni",
+				    "cam_a",
+				    "cam_b";
+			interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 254 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 255 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_CAM_IMGO>;
+			clocks = <&camsys CLK_CAM_CAM>,
+				 <&camsys CLK_CAM_CAMTG>;
+			clock-names = "camsys_cam_cgpdn",
+				      "camsys_camtg_cgpdn";
+			mediatek,larb = <&larb3>,
+					<&larb6>;
+			mediatek,scp = <&scp>;
+		};
\ No newline at end of file
-- 
2.18.0
