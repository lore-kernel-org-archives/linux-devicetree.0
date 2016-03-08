From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCHv2 6/8] ARM: dts: imx6qdl-tx6: add mdio node for ethernet phy
Date: Tue,  8 Mar 2016 09:04:02 +0100
Message-ID: <1457424244-14549-7-git-send-email-LW@KARO-electronics.de>
References: <1457424244-14549-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457424244-14549-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vinod.koul@intel.com>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

Add mdio node and an appropriate PHY configuration to enable use of
the PHY interrupt for link status changes.

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx6qdl-tx6.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/imx=
6qdl-tx6.dtsi
index dc813c2..a0d59ab 100644
--- a/arch/arm/boot/dts/imx6qdl-tx6.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-tx6.dtsi
@@ -249,8 +249,22 @@
 	clock-names =3D "ipg", "ahb", "ptp", "enet_out";
 	phy-mode =3D "rmii";
 	phy-reset-gpios =3D <&gpio7 6 GPIO_ACTIVE_HIGH>;
+	phy-handle =3D <&etnphy>;
 	phy-supply =3D <&reg_3v3_etn>;
 	status =3D "okay";
+
+	mdio {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		etnphy: ethernet-phy@0 {
+			compatible =3D "ethernet-phy-ieee802.3-c22";
+			reg =3D <0>;
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_enet_mdio>;
+			interrupts-extended =3D <&gpio7 1 IRQ_TYPE_EDGE_FALLING>;
+		};
+	};
 };
=20
 &gpmi {
--=20
2.1.4
