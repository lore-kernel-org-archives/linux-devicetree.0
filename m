Return-Path: <SRS0=g9Sy=OG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00069.outbound.protection.outlook.com ([40.107.0.69]:54038
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728512AbeK0U2Z (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 27 Nov 2018 15:28:25 -0500
From: PETER CHEN <peter.chen@nxp.com>
Subject: [PATCH v3 4/4] doc: usb: ci-hdrc-usb2: Add pinctrl properties for
 HSIC pin groups
Date: Tue, 27 Nov 2018 09:31:02 +0000
Message-ID: <20181127092824.22756-5-peter.chen@nxp.com>
References: <20181127092824.22756-1-peter.chen@nxp.com>
In-Reply-To: <20181127092824.22756-1-peter.chen@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>, "festevam@gmail.com" <festevam@gmail.com>, PETER CHEN <peter.chen@nxp.com>
List-ID: <devicetree@vger.kernel.org>

For USB HSIC, the data and strobe pin needs to be pulled down
at default, we consider it as "idle" state. When the USB host
is ready to be used, the strobe pin needs to be pulled up,
we consider it as "active" state.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Docum=
entation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index 529e51879fb2..1e5e7ddfb1a5 100644
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
@@ -110,4 +113,7 @@ Example:
 		phy-clkgate-delay-us =3D <400>;
 		mux-controls =3D <&usb_switch>;
 		mux-control-names =3D "usb_switch";
+		pinctrl-names =3D "idle", "active";
+		pinctrl-0 =3D <&pinctrl_usbh2_1>;
+		pinctrl-1 =3D <&pinctrl_usbh2_2>;
 	};
--=20
2.14.1
