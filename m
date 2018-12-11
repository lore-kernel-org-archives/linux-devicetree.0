From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V5 1/2] dt-bindings: iio: light: isl29018: update power supply
 name
Date: Tue, 11 Dec 2018 05:02:39 +0000
Message-ID: <1544504196-30277-1-git-send-email-Anson.Huang@nxp.com>
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
supply, the "vdda" and "vddd" MUST be shorted externally,
and isl29023/isl29035 ONLY has "vdd" power supply, so just
one regulator is needed for the driver, update the power
supply name with "vdd" according to datasheet to avoid
confusion.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
ChangeLog since V4:
	Since ONLY isl29018 has two power supplies and they are MUST shorted exter=
nally, so they can be
	treated as one power supply as well, remove "vdda" power supply and ONLY u=
pdate the "vcc" with
	"vdd" according to datasheet.
---
 Documentation/devicetree/bindings/iio/light/isl29018.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/light/isl29018.txt b/Doc=
umentation/devicetree/bindings/iio/light/isl29018.txt
index b9bbde3..c4c4e9e 100644
--- a/Documentation/devicetree/bindings/iio/light/isl29018.txt
+++ b/Documentation/devicetree/bindings/iio/light/isl29018.txt
@@ -15,7 +15,7 @@ Optional properties:
   Refer to interrupt-controller/interrupts.txt for generic interrupt clien=
t
   node bindings.
=20
-  - vcc-supply: phandle to the regulator that provides power to the sensor=
.
+  - vdd-supply: phandle to the regulator that provides power to the sensor=
.
=20
 Example:
=20
--=20
2.7.4
