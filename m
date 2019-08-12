From: Philippe Schenker <philippe.schenker@toradex.com>
Subject: [PATCH v4 20/21] ARM: dts: imx7-colibri: Add UHS support to eval
 board
Date: Mon, 12 Aug 2019 14:21:45 +0000
Message-ID: <20190812142105.1995-21-philippe.schenker@toradex.com>
References: <20190812142105.1995-1-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812142105.1995-1-philippe.schenker@toradex.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?iso-8859-2?Q?Michal_Vok=E1=E8?= <michal.vokac@ysoft.com>, Fabio Estevam <festevam@gmail.com>
Cc: Philippe Schenker <philippe.schenker@toradex.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

This commit adds UHS capability to Toradex Eval Boards

Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>

---

Changes in v4: None
Changes in v3:
- New patch to make use of ARM: dts: imx7-colibri: fix 1.8V/UHS support

Changes in v2: None

 arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi b/arch/arm/boot/dt=
s/imx7-colibri-eval-v3.dtsi
index 576dec9ff81c..90121fbe561f 100644
--- a/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
+++ b/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
@@ -210,9 +210,16 @@
 };
=20
 &usdhc1 {
-	keep-power-in-suspend;
-	wakeup-source;
+	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 =3D <&pinctrl_usdhc1 &pinctrl_cd_usdhc1>;
+	pinctrl-1 =3D <&pinctrl_usdhc1_100mhz &pinctrl_cd_usdhc1>;
+	pinctrl-2 =3D <&pinctrl_usdhc1_200mhz &pinctrl_cd_usdhc1>;
 	vmmc-supply =3D <&reg_3v3>;
+	vqmmc-supply =3D <&reg_LDO2>;
+	cd-gpios =3D <&gpio1 0 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	enable-sdio-wakeup;
+	keep-power-in-suspend;
 	status =3D "okay";
 };
=20
--=20
2.22.0
