Return-Path: <SRS0=L0hH=T5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35129 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbfE2Jyj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 May 2019 05:54:39 -0400
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 7/9] media: dt-bindings: Document i.MX8MQ and i.MX8MM VPU bindings
Date: Wed, 29 May 2019 11:54:22 +0200
Message-Id: <20190529095424.23614-8-p.zabel@pengutronix.de>
In-Reply-To: <20190529095424.23614-1-p.zabel@pengutronix.de>
References: <20190529095424.23614-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Boris Brezillon <boris.brezillon@collabora.com>, Ezequiel Garcia <ezequiel@collabora.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Add devicetree binding documentation for the Hantro G1/G2 VPU on i.MX8MQ
and for the Hantro G1/G2/H1 VPU on i.MX8MM.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 .../devicetree/bindings/media/imx8m-vpu.txt   | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/imx8m-vpu.txt

diff --git a/Documentation/devicetree/bindings/media/imx8m-vpu.txt b/Documentation/devicetree/bindings/media/imx8m-vpu.txt
new file mode 100644
index 000000000000..659bd28dd002
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/imx8m-vpu.txt
@@ -0,0 +1,56 @@
+device-tree bindings for Hantro G1/G2/H1 VPU codecs implemented on i.MX8M SoCs
+
+Required properties:
+- compatible: value should be one of the following
+		"nxp,imx8mq-vpu",
+		"nxp,imx8mm-vpu";
+- regs: VPU core and control block register ranges
+- reg-names: should be
+		"g1", "g2", "ctrl" on i.MX8MQ,
+		"g1", "g2", "h1", "ctrl" on i.MX8MM.
+- interrupts: encoding and decoding interrupt specifiers
+- interrupt-names: should be
+		"g1", "g2" on i.MX8MQ,
+		"g1", "g2", "h1" on i.MX8MM.
+- clocks: phandle to VPU core clocks and bus clock
+- clock-names: should be
+		"g1", "g2", "bus" on i.MX8MQ,
+		"g1", "g2", "h1", "bus" on i.MX8MM.
+- power-domains: phandle to power domain node
+
+Examples:
+
+	vpu: vpu@38300000 {
+		compatible = "nxp,imx8mq-vpu";
+		reg = <0x38300000 0x10000>,
+		      <0x38310000 0x10000>,
+		      <0x38320000 0x10000>;
+		reg-names = "g1", "g2", "ctrl";
+		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "g1", "g2";
+		clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
+			 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
+			 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
+		clock-names = "g1", "g2", "bus";
+		power-domains = <&pgc_vpu>;
+	};
+
+	vpu: vpu@38300000 {
+		compatible = "nxp,imx8mm-vpu";
+		reg = <0x38300000 0x10000>,
+		      <0x38310000 0x10000>,
+		      <0x38320000 0x10000>;
+		      <0x38330000 0x10000>;
+		reg-names = "g1", "g2", "h1", "ctrl";
+		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "g1", "g2", "h1";
+		clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
+			 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
+			 <&clk IMX8MQ_CLK_VPU_H1_ROOT>,
+			 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
+		clock-names = "g1", "g2", "h1", "bus";
+		power-domains = <&pgc_vpu>;
+	};
-- 
2.20.1
