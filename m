From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 3/6] ARM: dts: imx6qdl-tx6: add ENET_OUT clock to fec node
Date: Wed, 20 Jan 2016 13:57:03 +0100
Message-ID: <1453294626-17608-4-git-send-email-LW@KARO-electronics.de>
References: <1453294626-17608-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453294626-17608-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vinod.koul@intel.com>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

ENET_OUT is used as reference clock for the ethernet PHY on the Ka-Ro
TX6 modules. Specify this clock in DTB to let it be managed correctly
by the driver.

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx6qdl-tx6.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/imx=
6qdl-tx6.dtsi
index 9404668..5e0afc8 100644
--- a/arch/arm/boot/dts/imx6qdl-tx6.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-tx6.dtsi
@@ -227,6 +227,11 @@
 &fec {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&pinctrl_enet>;
+	clocks =3D <&clks IMX6QDL_CLK_ENET>,
+		 <&clks IMX6QDL_CLK_ENET>,
+		 <&clks IMX6QDL_CLK_ENET_REF>,
+		 <&clks IMX6QDL_CLK_ENET_REF>;
+	clock-names =3D "ipg", "ahb", "ptp", "enet_out";
 	phy-mode =3D "rmii";
 	phy-reset-gpios =3D <&gpio7 6 GPIO_ACTIVE_HIGH>;
 	phy-supply =3D <&reg_3v3_etn>;
--=20
2.1.4
