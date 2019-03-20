From: Steve Twiss <stwiss.opensource@diasemi.com>
Subject: [PATCH] ARM: dts: imx6qdl-sabresd: change phy-mode to use rgmii-id
Date: Wed, 20 Mar 2019 11:03:50 +0000
Message-ID: <20190320120604.7D99B3FBE9@swsrvapps-01.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Cc: DEVICETREE <devicetree@vger.kernel.org>, LINUX-ARM-KERNEL <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, Dialog Opensource Support <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

The PHY used on the Freescale i.MX6Q/DL SABRE boards is qualified as
'rgmii' instead of 'rgmii-id'. Meaning the RX and TX delays that were
previously added by the MAC when required, but are now provided
internally by the PHY (and the MAC should no longer add the RX or TX
delays in this case).

This patch fixes the network problems seen on the Freescale i.MX6Q/DL
SABRE boards and makes a difference when correctly loading the NFS
rootfs on startup.

Link: https://lkml.kernel.org/r/1397569821-5530-4-git-send-email-thomas.petazzoni@free-electrons.com
Tested-by: Steve Twiss <stwiss.opensource@diasemi.com>
Tested-by: Adam Thomson <Adam.Thomson@diasemi.com>
Signed-off-by: Steve Twiss <stwiss.opensource@diasemi.com>
---
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
index a070506..185fb17 100644
--- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
@@ -202,7 +202,7 @@
 &fec {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_enet>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	phy-reset-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
-- 
1.9.3
