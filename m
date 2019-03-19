From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 5/5] ARM: dts: imx50: Fix the numbering of the I2C controllers
Date: Tue, 19 Mar 2019 16:24:20 +0100
Message-ID: <20190319152421.16179-6-j.neuschaefer@gmx.net>
References: <20190319152421.16179-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319152421.16179-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <treding@nvidia.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, Jagan Teki <jagan@amarulasolutions.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
List-Id: devicetree@vger.kernel.org

Ensure that the i2c buses are reported to userspace (for example to
i2cdetect) in the same order as they are numbered in the SoC's
documentation by adding aliases to the devicetree.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 arch/arm/boot/dts/imx50.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/imx50.dtsi b/arch/arm/boot/dts/imx50.dtsi
index e5632ce24ba0..8cab0ab3bd4e 100644
=2D-- a/arch/arm/boot/dts/imx50.dtsi
+++ b/arch/arm/boot/dts/imx50.dtsi
@@ -26,6 +26,9 @@
 		gpio3 =3D &gpio4;
 		gpio4 =3D &gpio5;
 		gpio5 =3D &gpio6;
+		i2c0 =3D &i2c1;
+		i2c1 =3D &i2c2;
+		i2c2 =3D &i2c3;
 		serial0 =3D &uart1;
 		serial1 =3D &uart2;
 		serial2 =3D &uart3;
=2D-
2.20.1
