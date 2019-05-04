Return-Path: <SRS0=YSTV=TE=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/8] media: dt-bindings: imx7-csi: Document a single CSI clock
Date: Sat,  4 May 2019 11:40:25 -0300
Message-Id: <20190504144027.31920-6-festevam@gmail.com>
In-Reply-To: <20190504144027.31920-1-festevam@gmail.com>
References: <20190504144027.31920-1-festevam@gmail.com>
To: hverkuil-cisco@xs4all.nl
Cc: rui.silva@linaro.org, slongerbeam@gmail.com, p.zabel@pengutronix.de, linux-media@vger.kernel.org, sebastien.szymanski@armadeus.com, otavio@ossystems.com.br, robh+dt@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
List-ID: <devicetree@vger.kernel.org>

As per the i.MX7D Reference Manual only the MCLK is used for
the CSI block, so only document this single clock.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/media/imx7-csi.txt | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/imx7-csi.txt b/Documentation/devicetree/bindings/media/imx7-csi.txt
index 3c07bc676bc3..443aef07356e 100644
--- a/Documentation/devicetree/bindings/media/imx7-csi.txt
+++ b/Documentation/devicetree/bindings/media/imx7-csi.txt
@@ -14,8 +14,7 @@ Required properties:
 - interrupts    : should contain CSI interrupt;
 - clocks        : list of clock specifiers, see
         Documentation/devicetree/bindings/clock/clock-bindings.txt for details;
-- clock-names   : must contain "axi", "mclk" and "dcic" entries, matching
-                 entries in the clock property;
+- clock-names   : must contain "mclk";
 
 The device node shall contain one 'port' child node with one child 'endpoint'
 node, according to the bindings defined in:
@@ -32,10 +31,8 @@ example:
                         compatible = "fsl,imx7-csi";
                         reg = <0x30710000 0x10000>;
                         interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-                        clocks = <&clks IMX7D_CLK_DUMMY>,
-                                        <&clks IMX7D_CSI_MCLK_ROOT_CLK>,
-                                        <&clks IMX7D_CLK_DUMMY>;
-                        clock-names = "axi", "mclk", "dcic";
+                        clocks = <&clks IMX7D_CSI_MCLK_ROOT_CLK>;
+                        clock-names = "mclk";
 
                         port {
                                 csi_from_csi_mux: endpoint {
-- 
2.17.1
