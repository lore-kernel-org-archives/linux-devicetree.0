From: Frederic Chen <frederic.chen@mediatek.com>
Subject: [RFC PATCH V1 4/6] dts: arm64: mt8183: Add DIP nodes
Date: Wed, 17 Apr 2019 18:45:09 +0800
Message-ID: <20190417104511.21514-5-frederic.chen@mediatek.com>
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190417104511.21514-1-frederic.chen@mediatek.com>
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
Cc: shik@chromium.org, devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com, holmes.chiou@mediatek.com, suleiman@chromium.org, Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org, christie.yu@mediatek.com, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds nodes for Digital Image Processing (DIP). DIP is
embedded in Mediatek SoCs and works with the co-processor to
adjust image content according to tuning input data. It also
provides image format conversion, resizing, and rotation
features.

Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index aec68c6b4571..263f79092b74 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -445,6 +445,22 @@
 			#clock-cells = <1>;
 		};
 
+		dip: dip@15022000 {
+			compatible = "mediatek,mt8183-dip";
+			mediatek,larb = <&larb5>;
+			mediatek,mdp3 = <&mdp_rdma0>;
+			mediatek,vpu = <&vpu>;
+			iommus = <&iommu M4U_PORT_CAM_IMGI>;
+			reg = <0 0x15022000 0 0x6000>;
+			interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_LOW>;
+			clocks =
+					<&imgsys CLK_IMG_LARB5>,
+					<&imgsys CLK_IMG_DIP>;
+			clock-names =
+					"DIP_CG_IMG_LARB5",
+					"DIP_CG_IMG_DIP";
+		};
+
 		vdecsys: syscon@16000000 {
 			compatible = "mediatek,mt8183-vdecsys", "syscon";
 			reg = <0 0x16000000 0 0x1000>;
-- 
2.18.0
