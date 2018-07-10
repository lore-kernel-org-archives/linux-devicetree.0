Return-Path: <SRS0=MUa+=J2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from inva021.nxp.com ([92.121.34.21]:45104 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933343AbeGJNp4 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Jul 2018 09:45:56 -0400
From: Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH v2 4/6] ARM: dts: imx53: Add tigerp support
Date: Tue, 10 Jul 2018 10:46:35 -0300
Message-Id: <1531230397-27659-4-git-send-email-fabio.estevam@nxp.com>
In-Reply-To: <1531230397-27659-1-git-send-email-fabio.estevam@nxp.com>
References: <1531230397-27659-1-git-send-email-fabio.estevam@nxp.com>
Sender: devicetree-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: kernel@pengutronix.de, sebastian.reichel@collabora.co.uk, robh+dt@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

As per the i.MX53 Reference Manual add an entry for the
'tigerp' region in the device tree.

This is needed for accessing the ARM_GPC register to set the
DBGEN bit, so that the debug clocks can be turned on.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Use the term 'tigerp' to follow the MX51 naming scheme

 arch/arm/boot/dts/imx53.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index 1a7a7bb..3fd553c 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -672,6 +672,11 @@
 				status = "disabled";
 			};
 
+			tigerp: tigerp@63fa0000 {
+				compatible = "fsl,imx53-tigerp", "fsl,imx51-tigerp";
+				reg = <0x63fa0000 0x28>;
+			};
+
 			owire: owire@63fa4000 {
 				compatible = "fsl,imx53-owire", "fsl,imx21-owire";
 				reg = <0x63fa4000 0x4000>;
-- 
2.7.4

