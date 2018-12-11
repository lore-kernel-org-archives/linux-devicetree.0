From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V4 1/2] dt-bindings: iio: light: isl29018: update power supply
 name
Date: Tue, 11 Dec 2018 03:24:06 +0000
Message-ID: <1544498291-2716-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "jic23@kernel.org" <jic23@kernel.org>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "preid@electromag.com.au" <preid@electromag.com.au>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

According to datasheet, the isl29018 has "vddd/vdda" power
supply, and isl29023/isl29035 ONLY has "vdd" power supply,
update the power supply name with "vdd" and "vdda" according
to datasheet to cover all devices and avoid confusion.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 Documentation/devicetree/bindings/iio/light/isl29018.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/light/isl29018.txt b/Doc=
umentation/devicetree/bindings/iio/light/isl29018.txt
index b9bbde3..36f737d 100644
--- a/Documentation/devicetree/bindings/iio/light/isl29018.txt
+++ b/Documentation/devicetree/bindings/iio/light/isl29018.txt
@@ -15,7 +15,9 @@ Optional properties:
   Refer to interrupt-controller/interrupts.txt for generic interrupt clien=
t
   node bindings.
=20
-  - vcc-supply: phandle to the regulator that provides power to the sensor=
.
+  - vdd-supply: phandle to the regulator that provides vdd power to the se=
nsor.
+
+  - vdda-supply: phandle to the regulator that provides vdda power to the =
sensor.
=20
 Example:
=20
--=20
2.7.4
