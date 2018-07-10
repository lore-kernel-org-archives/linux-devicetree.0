Return-Path: <SRS0=MUa+=J2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from inva020.nxp.com ([92.121.34.13]:40674 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933343AbeGJNpv (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Jul 2018 09:45:51 -0400
From: Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH v2 1/6] dt-bindings: freescale: Add bindings for the tigerp module
Date: Tue, 10 Jul 2018 10:46:32 -0300
Message-Id: <1531230397-27659-1-git-send-email-fabio.estevam@nxp.com>
Sender: devicetree-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: kernel@pengutronix.de, sebastian.reichel@collabora.co.uk, robh+dt@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Add bindings for the tigerp module present on i.MX51.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Newly introduced in this series.

 Documentation/devicetree/bindings/arm/freescale/tigerp.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/freescale/tigerp.txt

diff --git a/Documentation/devicetree/bindings/arm/freescale/tigerp.txt b/Documentation/devicetree/bindings/arm/freescale/tigerp.txt
new file mode 100644
index 0000000..19e2aad
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/freescale/tigerp.txt
@@ -0,0 +1,12 @@
+* Freescale Tigerp platform module
+
+Required properties:
+- compatible : Should be "fsl,imx51-tigerp"
+- reg : Address and length of the register set for the device
+
+Example:
+
+tigerp: tigerp@83fa0000 {
+	compatible = "fsl,imx51-tigerp";
+	reg = <0x83fa0000 0x28>;
+};
-- 
2.7.4

