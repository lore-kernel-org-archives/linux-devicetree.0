Return-Path: <SRS0=MUa+=J2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from inva021.nxp.com ([92.121.34.21]:44974 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933343AbeGJNpx (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Jul 2018 09:45:53 -0400
From: Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH v2 2/6] ARM: dts: imx51: Add PMU support
Date: Tue, 10 Jul 2018 10:46:33 -0300
Message-Id: <1531230397-27659-2-git-send-email-fabio.estevam@nxp.com>
In-Reply-To: <1531230397-27659-1-git-send-email-fabio.estevam@nxp.com>
References: <1531230397-27659-1-git-send-email-fabio.estevam@nxp.com>
Sender: devicetree-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: kernel@pengutronix.de, sebastian.reichel@collabora.co.uk, robh+dt@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Add PMU support in the device tree.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Newly introduced in this series.

 arch/arm/boot/dts/imx51.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/imx51.dtsi b/arch/arm/boot/dts/imx51.dtsi
index 66e4187..113ddbc 100644
--- a/arch/arm/boot/dts/imx51.dtsi
+++ b/arch/arm/boot/dts/imx51.dtsi
@@ -93,6 +93,12 @@
 		};
 	};
 
+	pmu: pmu {
+		compatible = "arm,cortex-a8-pmu";
+		interrupt-parent = <&tzic>;
+		interrupts = <77>;
+	};
+
 	usbphy0: usbphy0 {
 		compatible = "usb-nop-xceiv";
 		clocks = <&clks IMX5_CLK_USB_PHY_GATE>;
-- 
2.7.4

