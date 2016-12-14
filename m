From: Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v9 3/4] arm: dts: mt2701: Add node for Mediatek JPEG Decoder
Date: Wed, 14 Dec 2016 16:04:49 +0800
Message-ID: <1481702690-10476-4-git-send-email-rick.chang@mediatek.com>
References: <1481702690-10476-1-git-send-email-rick.chang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1481702690-10476-1-git-send-email-rick.chang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Bin Liu <bin.liu@mediatek.com>, devicetree@vger.kernel.org, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Rick Chang <rick.chang@mediatek.com>, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Rick Chang <rick.chang@mediatek.com>
Signed-off-by: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
---
This patch depends on: 
  CCF "Add clock support for Mediatek MT2701"[1]
  iommu and smi "Add the dtsi node of iommu and smi for mt2701"[2]

[1] http://lists.infradead.org/pipermail/linux-mediatek/2016-October/007271.html
[2] https://patchwork.kernel.org/patch/9164013/
---
 arch/arm/boot/dts/mt2701.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 8f13c70..4dd5048 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -298,6 +298,20 @@
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
 	};
 
+	jpegdec: jpegdec@15004000 {
+		compatible = "mediatek,mt2701-jpgdec";
+		reg = <0 0x15004000 0 0x1000>;
+		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
+		clocks =  <&imgsys CLK_IMG_JPGDEC_SMI>,
+			  <&imgsys CLK_IMG_JPGDEC>;
+		clock-names = "jpgdec-smi",
+			      "jpgdec";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
+		mediatek,larb = <&larb2>;
+		iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
+			 <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
+	};
+
 	vdecsys: syscon@16000000 {
 		compatible = "mediatek,mt2701-vdecsys", "syscon";
 		reg = <0 0x16000000 0 0x1000>;
-- 
1.9.1
