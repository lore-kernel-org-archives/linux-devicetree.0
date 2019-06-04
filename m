From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v4 03/14] dt-bindings: media: Add camsv binding for MT2712 MIPI-CSI2
Date: Tue, 4 Jun 2019 18:11:44 +0800
Message-ID: <1559643115-15124-4-git-send-email-stu.hsieh@mediatek.com>
References: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

Add camsv binding for MT2712 MIPI-CSI2

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../bindings/media/mediatek-mipicsi-camsv.txt | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt b/Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt
new file mode 100644
index 000000000000..c9b4af9eeeff
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt
@@ -0,0 +1,55 @@
+* Mediatek MIPI-CSI2 receiver camsv
+
+Mediatek MIPI-CSI2 receiver camsv transfer data to DRAM in Mediatek SoCs
+
+These node are refer by mipicsi
+
+Required properties:
+- reg : physical base address of the mipicsi receiver registers and length of
+  memory mapped region.
+- clocks: device clocks, see
+  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
+- interrupts : interrupt number to the interrupt controller.
+
+Example:
+	seninf1_mux_camsv0: seninf_mux_camsv@15002100 {
+		reg = <0 0x15002120 0 0x40>,
+		      <0 0x15004000 0 0x1000>;
+		clocks = <&imgsys CLK_IMG_CAM_SV_EN>;
+		interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	seninf2_mux_camsv1: seninf_mux_camsv@15002500 {
+		reg = <0 0x15002520 0 0x40>,
+		      <0 0x15005000 0 0x1000>;
+		clocks = <&imgsys CLK_IMG_CAM_SV_EN>;
+		interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	seninf3_mux_camsv2: seninf_mux_camsv@15002900 {
+		reg = <0 0x15002920 0 0x40>,
+		      <0 0x15006000 0 0x1000>;
+		clocks = <&imgsys CLK_IMG_CAM_SV1_EN>;
+		interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	seninf4_mux_camsv3: seninf_mux_camsv@15002D00 {
+		reg = <0 0x15002D20 0 0x40>,
+		      <0 0x15007000 0 0x1000>;
+		clocks = <&imgsys CLK_IMG_CAM_SV1_EN>;
+		interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	seninf5_mux_camsv4: seninf_mux_camsv@15003100 {
+		reg = <0 0x15003120 0 0x40>,
+		      <0 0x15008000 0 0x1000>;
+		clocks = <&imgsys CLK_IMG_CAM_SV2_EN>;
+		interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	seninf6_mux_camsv5: seninf_mux_camsv@15003500 {
+		reg = <0 0x15003520 0 0x40>,
+		      <0 0x15009000 0 0x1000>;
+		clocks = <&imgsys CLK_IMG_CAM_SV2_EN>;
+		interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_LOW>;
+	};
-- 
2.18.0
