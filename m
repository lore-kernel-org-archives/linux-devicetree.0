Return-Path: <SRS0=L7Fd=RW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40284 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbfCSRAT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Mar 2019 13:00:19 -0400
Received: by mail-wm1-f66.google.com with SMTP id u10so14801722wmj.5
        for <devicetree@vger.kernel.org>; Tue, 19 Mar 2019 10:00:18 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 2/5] ARM: dts: imx7s: add multiplexer controls
Date: Tue, 19 Mar 2019 17:00:00 +0000
Message-Id: <20190319170003.21261-3-rui.silva@linaro.org>
In-Reply-To: <20190319170003.21261-1-rui.silva@linaro.org>
References: <20190319170003.21261-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

The IOMUXC General Purpose Register has bitfield to control video bus
multiplexer to control the CSI input between the MIPI-CSI2 and parallel
interface. Add that register and mask.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 arch/arm/boot/dts/imx7s.dtsi | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 9a680d3d6424..792efcd2caa1 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -497,8 +497,15 @@
 
 			gpr: iomuxc-gpr@30340000 {
 				compatible = "fsl,imx7d-iomuxc-gpr",
-					"fsl,imx6q-iomuxc-gpr", "syscon";
+					"fsl,imx6q-iomuxc-gpr", "syscon",
+					"simple-mfd";
 				reg = <0x30340000 0x10000>;
+
+				mux: mux-controller {
+					compatible = "mmio-mux";
+					#mux-control-cells = <0>;
+					mux-reg-masks = <0x14 0x00000010>;
+				};
 			};
 
 			ocotp: ocotp-ctrl@30350000 {
-- 
2.21.0
