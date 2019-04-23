From: Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
Subject: [RFC PATCH V1 4/6] dts: arm64: mt8183: Add FD nodes
Date: Tue, 23 Apr 2019 18:45:03 +0800
Message-ID: <20190423104505.38778-5-Jerry-Ch.chen@mediatek.com>
References: <20190423104505.38778-1-Jerry-Ch.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190423104505.38778-1-Jerry-Ch.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org
Cc: shik@chromium.org, devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com, holmes.chiou@mediatek.com, suleiman@chromium.org, Jerry-ch Chen <jerry-ch.chen@mediatek.com>, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org, christie.yu@mediatek.com, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>

This patch adds nodes for Face Detection (FD) unit. FD is embedded
in Mediatek SoCs and works with the co-processor to perform face
detection on the input data and image and output detected face result.

Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index dc0b4cad5200..04fd590c09b3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -442,6 +442,19 @@
 			#clock-cells = <1>;
 		};
 
+		fd:fd@1502b000 {
+			compatible = "mediatek,mt8183-fd";
+			mediatek,larb = <&larb5>;
+			mediatek,scp = <&scp>;
+			iommus = <&iommu M4U_PORT_CAM_FDVT_RP>,
+				 <&iommu M4U_PORT_CAM_FDVT_WR>,
+				 <&iommu M4U_PORT_CAM_FDVT_RB>;
+			reg = <0 0x1502b000 0 0x1000>;
+			interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&imgsys CLK_IMG_FDVT>;
+			clock-names = "FD_CLK_IMG_FD";
+		};
+
 		vdecsys: syscon@16000000 {
 			compatible = "mediatek,mt8183-vdecsys", "syscon";
 			reg = <0 0x16000000 0 0x1000>;
-- 
2.18.0
