From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] dt-bindings: iio: accel: use a generic node name for lis302
Date: Mon,  3 Dec 2018 12:47:40 +0100
Message-ID: <20181203114740.637091-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

The example should follow the practice or using a generic node name
instead of the precise programming model, as recommended by the DTSpec.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 Documentation/devicetree/bindings/iio/accel/lis302.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/accel/lis302.txt b/Doc=
umentation/devicetree/bindings/iio/accel/lis302.txt
index dfdce67826ba..764e28ec1a0a 100644
--- a/Documentation/devicetree/bindings/iio/accel/lis302.txt
+++ b/Documentation/devicetree/bindings/iio/accel/lis302.txt
@@ -64,7 +64,7 @@ Optional properties for all bus drivers:
=20
 Example for a SPI device node:
=20
-	lis302@0 {
+	accelerometer@0 {
 		compatible =3D "st,lis302dl-spi";
 		reg =3D <0>;
 		spi-max-frequency =3D <1000000>;
@@ -89,7 +89,7 @@ Example for a SPI device node:
=20
 Example for a I2C device node:
=20
-	lis331dlh: lis331dlh@18 {
+	lis331dlh: accelerometer@18 {
 		compatible =3D "st,lis331dlh", "st,lis3lv02d";
 		reg =3D <0x18>;
 		Vdd-supply =3D <&lis3_reg>;
--=20
2.19.1
