Return-Path: <SRS0=/CI9=RE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr60073.outbound.protection.outlook.com ([40.107.6.73]:32279
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726088AbfCABZP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 28 Feb 2019 20:25:15 -0500
From: Jun Li <jun.li@nxp.com>
Subject: [PATCH v2 1/2] dt-bindings: usb: add documentation for typec switch
 via GPIO
Date: Fri, 1 Mar 2019 01:25:10 +0000
Message-ID: <1551402256-7815-1-git-send-email-jun.li@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Some typec super speed active channel switch can be controlled via
a GPIO, this binding can be used to specify the switch node by
a GPIO and the remote endpoint of its consumre.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
No change on v2 for this patch.

 .../devicetree/bindings/usb/typec-switch-gpio.txt  | 30 ++++++++++++++++++=
++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/typec-switch-gpio.txt b/=
Documentation/devicetree/bindings/usb/typec-switch-gpio.txt
new file mode 100644
index 0000000..4ef76cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/typec-switch-gpio.txt
@@ -0,0 +1,30 @@
+Typec orientation switch via a GPIO
+-----------------------------------
+
+Required properties:
+- compatible: should be set one of following:
+	- "nxp,ptn36043" for NXP Type-C SuperSpeed active switch.
+
+- gpios: the GPIO used to switch the super speed active channel,
+		GPIO_ACTIVE_HIGH: GPIO state high for cc1;
+		GPIO_ACTIVE_LOW:  GPIO state low for cc1.
+- orientation-switch: must be present.
+
+Required sub-node:
+- port: specify the remote endpoint of typec switch consumer.
+
+Example:
+
+ptn36043 {
+	compatible =3D "nxp,ptn36043";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_ss_sel>;
+	gpios =3D <&gpio3 15 GPIO_ACTIVE_HIGH>;
+	orientation-switch;
+
+	port {
+		usb3_data_ss: endpoint {
+			remote-endpoint =3D <&typec_con_ss>;
+		};
+	};
+};
--=20
2.7.4
