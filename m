From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
Subject: [PATCH] ARM: dts: imx7d: cl-som-imx7: add compatible for phy
Date: Fri,  9 Aug 2019 12:29:46 +0100
Message-ID: <20190809112946.28659-1-git@andred.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>, Ilya Ledvich <ilya@compulab.co.il>, Igor Grinberg <grinberg@compulab.co.il>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

While not strictly needed as "ethernet-phy-ieee802.3-c22"
is assumed by default if not given explicitly, having
the compatible string here makes it more clear what
this is and which driver handles this - an Ethernet
phy attached to mdio, handled by of_mdio.c

Signed-off-by: André Draszik <git@andred.net>
CC: Ilya Ledvich <ilya@compulab.co.il>
CC: Igor Grinberg <grinberg@compulab.co.il>
CC: Rob Herring <robh+dt@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Fabio Estevam <festevam@gmail.com>
CC: NXP Linux Team <linux-imx@nxp.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
index 62d5e9a4a781..7646284e13a7 100644
--- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
@@ -54,10 +54,12 @@
 		#size-cells = <0>;
 
 		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 		};
 
 		ethphy1: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <1>;
 		};
 	};
-- 
2.20.1
