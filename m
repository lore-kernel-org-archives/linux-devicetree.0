Return-Path: <SRS0=MUa+=J2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from inva021.nxp.com ([92.121.34.21]:45148 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933343AbeGJNp6 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Jul 2018 09:45:58 -0400
From: Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH v2 5/6] ARM: dts: imx53: Add a label for the PMU node
Date: Tue, 10 Jul 2018 10:46:36 -0300
Message-Id: <1531230397-27659-5-git-send-email-fabio.estevam@nxp.com>
In-Reply-To: <1531230397-27659-1-git-send-email-fabio.estevam@nxp.com>
References: <1531230397-27659-1-git-send-email-fabio.estevam@nxp.com>
Sender: devicetree-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: kernel@pengutronix.de, sebastian.reichel@collabora.co.uk, robh+dt@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Add a label for the PMU node so that the board dts may be able to
pass the 'secure-reg-access' property like this:

&pmu {
	secure-reg-access;
};

This also makes it consistent with the PMU node in imx6qdl.dtsi

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
Changes since v1:
- None

 arch/arm/boot/dts/imx53.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index 3fd553c..6386185 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -113,7 +113,7 @@
 		};
 	};
 
-	pmu {
+	pmu: pmu {
 		compatible = "arm,cortex-a8-pmu";
 		interrupt-parent = <&tzic>;
 		interrupts = <77>;
-- 
2.7.4

