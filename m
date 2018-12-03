From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] dt-bindings: rtc: use a generic node name for ds1307
Date: Mon,  3 Dec 2018 12:47:36 +0100
Message-ID: <20181203114736.637012-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

The example should follow the practice or using a generic node name
instead of the precise programming model, as recommended by the DTSpec.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 Documentation/devicetree/bindings/rtc/rtc-ds1307.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt b/Docum=
entation/devicetree/bindings/rtc/rtc-ds1307.txt
index eebfbe04207a..eaee19b60960 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
@@ -35,7 +35,7 @@ Optional properties:
 	Should be given if internal trickle charger diode should be disabled
=20
 Example:
-	rtc1: ds1339@68 {
+	ds1339: rtc@68 {
 		compatible =3D "dallas,ds1339";
 		reg =3D <0x68>;
 		interrupt-parent =3D <&gpio4>;
--=20
2.19.1
