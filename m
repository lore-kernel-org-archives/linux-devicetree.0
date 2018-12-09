Return-Path: <SRS0=9MhD=OS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr80051.outbound.protection.outlook.com ([40.107.8.51]:16469
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726072AbeLIFlJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 9 Dec 2018 00:41:09 -0500
From: Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v4 4/4] doc: usb: ci-hdrc-usb2: Add pinctrl properties for
 HSIC pin groups
Date: Sun, 9 Dec 2018 05:40:24 +0000
Message-ID: <20181209053746.24967-5-peter.chen@nxp.com>
References: <20181209053746.24967-1-peter.chen@nxp.com>
In-Reply-To: <20181209053746.24967-1-peter.chen@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>, "festevam@gmail.com" <festevam@gmail.com>, Peter Chen <peter.chen@nxp.com>
List-ID: <devicetree@vger.kernel.org>

For USB HSIC, the data and strobe pin needs to be pulled down
at default, we consider it as "idle" state. When the USB host
is ready to be used, the strobe pin needs to be pulled up,
we consider it as "active" state.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 .../devicetree/bindings/usb/ci-hdrc-usb2.txt       | 34 ++++++++++++++++++=
+++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Docum=
entation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index 529e51879fb2..a6c66f05601c 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -80,7 +80,10 @@ Optional properties:
   controller. It's expected that a mux state of 0 indicates device mode an=
d a
   mux state of 1 indicates host mode.
 - mux-control-names: Shall be "usb_switch" if mux-controls is specified.
-- pinctrl-names: Names for optional pin modes in "default", "host", "devic=
e"
+- pinctrl-names: Names for optional pin modes in "default", "host", "devic=
e".
+  In case of HSIC-mode, "idle" and "active" pin modes are mandatory. In th=
is
+  case, the "idle" state needs to pull down the data and strobe pin
+  and the "active" state needs to pull up the strobe pin.
 - pinctrl-n: alternate pin modes
=20
 i.mx specific properties
@@ -110,4 +113,33 @@ Example:
 		phy-clkgate-delay-us =3D <400>;
 		mux-controls =3D <&usb_switch>;
 		mux-control-names =3D "usb_switch";
+		pinctrl-names =3D "idle", "active";
+		pinctrl-0 =3D <&pinctrl_usbh2_1>;
+		pinctrl-1 =3D <&pinctrl_usbh2_2>;
+	};
+
+Example for HSIC:
+
+	usb@2184400 {
+		compatible =3D "fsl,imx6q-usb", "fsl,imx27-usb";
+		reg =3D <0x02184400 0x200>;
+		interrupts =3D <0 41 IRQ_TYPE_LEVEL_HIGH>;
+		clocks =3D <&clks IMX6QDL_CLK_USBOH3>;
+		fsl,usbphy =3D <&usbphynop1>;
+		fsl,usbmisc =3D <&usbmisc 2>;
+		phy_type =3D "hsic";
+		dr_mode =3D "host";
+		ahb-burst-config =3D <0x0>;
+		tx-burst-size-dword =3D <0x10>;
+		rx-burst-size-dword =3D <0x10>;
+		pinctrl-names =3D "idle", "active";
+		pinctrl-0 =3D <&pinctrl_usbh2_idle>;
+		pinctrl-1 =3D <&pinctrl_usbh2_active>;
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		usbnet: smsc@1 {
+			compatible =3D "usb424,9730";
+			reg =3D <1>;
+		};
 	};
--=20
2.14.1
