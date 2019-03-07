From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 3/3] arm64: dts: imx8mq: add osc_hdmi_phy_27m fixed clock
Date: Thu, 7 Mar 2019 03:41:09 +0000
Message-ID: <1551929772-22633-3-git-send-email-Anson.Huang@nxp.com>
References: <1551929772-22633-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551929772-22633-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Abel Vesa <abel.vesa@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Add new fixed clock osc_hdmi_phy_27m.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dt=
s/freescale/imx8mq.dtsi
index 8e9d6d5..fbcdd4d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -48,6 +48,13 @@
 		clock-output-names =3D "osc_27m";
 	};
=20
+	osc_hdmi_phy_27m: clock-osc-hdmi-phy-27m {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <27000000>;
+		clock-output-names =3D "osc_hdmi_phy_27m";
+	};
+
 	clk_ext1: clock-ext1 {
 		compatible =3D "fixed-clock";
 		#clock-cells =3D <0>;
--=20
2.7.4
