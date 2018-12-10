From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V2 1/2] dt-bindings: iio: accel: mma8452: add optional power
 supply property
Date: Mon, 10 Dec 2018 07:25:22 +0000
Message-ID: <1544426368-16415-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "jic23@kernel.org" <jic23@kernel.org>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "rtresidd@electromag.com.au" <rtresidd@electromag.com.au>, "gustavo@embeddedor.com" <gustavo@embeddedor.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Leonard Crestez <leonard.crestez@nxp.com>, "martink@posteo.de" <martink@posteo.de>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

The accelerometer's power supply could be controlled by regulator
on some platforms, add optional property "vdd/vddio" power supply
to let device tree to pass phandles to the regulators to driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 Documentation/devicetree/bindings/iio/accel/mma8452.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/accel/mma8452.txt b/Docu=
mentation/devicetree/bindings/iio/accel/mma8452.txt
index 2100e9a..e132394 100644
--- a/Documentation/devicetree/bindings/iio/accel/mma8452.txt
+++ b/Documentation/devicetree/bindings/iio/accel/mma8452.txt
@@ -20,6 +20,10 @@ Optional properties:
   - interrupt-names: should contain "INT1" and/or "INT2", the acceleromete=
r's
 		     interrupt line in use.
=20
+  - vdd-supply: phandle to the regulator that provides vdd power to the ac=
celerometer.
+
+  - vddio-supply: phandle to the regulator that provides vddio power to th=
e accelerometer.
+
 Example:
=20
 	mma8453fc@1d {
--=20
2.7.4
