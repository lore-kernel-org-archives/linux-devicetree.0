Return-Path: <SRS0=0+Y3=OZ=mail.ru=shc_work@kernel.org>
From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 3/3] media: mx2-emmaprp: Add DT bindings documentation
Date: Sun, 16 Dec 2018 06:49:07 +0300
Message-Id: <20181216034907.15787-1-shc_work@mail.ru>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shiyan <shc_work@mail.ru>
List-ID: <devicetree@vger.kernel.org>

This patch adds DT binding documentation for the Freescale enhanced
Multimedia Accelerator (eMMA) video Pre-processor (PrP).

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 .../devicetree/bindings/media/fsl-emmaprp.txt        | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/fsl-emmaprp.txt

diff --git a/Documentation/devicetree/bindings/media/fsl-emmaprp.txt b/Documentation/devicetree/bindings/media/fsl-emmaprp.txt
new file mode 100644
index 0000000..9dd7cc6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl-emmaprp.txt
@@ -0,0 +1,20 @@
+* Freescale enhanced Multimedia Accelerator (eMMA) video Pre-processor (PrP)
+  for i.MX21 & i.MX27 SoCs.
+
+Required properties:
+- compatible : Shall contain "fsl,imx21-emmaprp" for compatible with
+               the one integrated on i.MX21 SoC.
+- reg        : Offset and length of the register set for the device.
+- interrupts : Should contain eMMA PrP interrupt number.
+- clocks     : Should contain the ahb and ipg clocks, in the order
+               determined by the clock-names property.
+- clock-names: Should be "ahb", "ipg".
+
+Example:
+	emmaprp: emmaprp@10026400 {
+		compatible = "fsl,imx21-emmaprp";
+		reg = <0x10026400 0x100>;
+		interrupts = <51>;
+		clocks = <&clks 49>, <&clks 68>;
+		clock-names = "ipg", "ahb";
+	};
-- 
2.10.2
