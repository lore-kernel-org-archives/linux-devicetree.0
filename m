Return-Path: <SRS0=B8vl=RM=st.com=denis.ciocca@kernel.org>
From: Denis CIOCCA <denis.ciocca@st.com>
Subject: RE: [PATCH 1/2] dt-bindings: iio: accel: add LIS2DE12 sensor device
 binding
Date: Sat, 9 Mar 2019 01:14:14 +0000
Message-ID: <2671a590a8394e76bd795c6bb187bfd1@SFHDAG2NODE1.st.com>
References: <20190305203252.13647-1-rjones@gateworks.com>
 <20190305203252.13647-2-rjones@gateworks.com>
In-Reply-To: <20190305203252.13647-2-rjones@gateworks.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Robert Jones <rjones@gateworks.com>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>Peter
List-ID: <devicetree@vger.kernel.org>

Acked-by: Denis Ciocca <denis.ciocca@st.com>

Thanks,
Denis


-----Original Message-----
From: linux-iio-owner@vger.kernel.org <linux-iio-owner@vger.kernel.org> On =
Behalf Of Robert Jones
Sent: Tuesday, March 5, 2019 12:33 PM
To: Jonathan Cameron <jic23@kernel.org>; Rob Herring <robh+dt@kernel.org>; =
Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org; linux-iio@vger.kernel.org; Hartmut Knaack <=
knaack.h@gmx.de>; Lars-Peter Clausen <lars@metafoo.de>; Peter Meerwald-Stad=
ler <pmeerw@pmeerw.net>; Robert Jones <rjones@gateworks.com>
Subject: [PATCH 1/2] dt-bindings: iio: accel: add LIS2DE12 sensor device bi=
nding

Signed-off-by: Robert Jones <rjones@gateworks.com>
---
 Documentation/devicetree/bindings/iio/st-sensors.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/st-sensors.txt b/Documen=
tation/devicetree/bindings/iio/st-sensors.txt
index 52ee4ba..7f24b33 100644
--- a/Documentation/devicetree/bindings/iio/st-sensors.txt
+++ b/Documentation/devicetree/bindings/iio/st-sensors.txt
@@ -49,6 +49,7 @@ Accelerometers:
 - st,lis2dw12
 - st,lis3dhh
 - st,lis3de
+- st,lis2de12-accel
=20
 Gyroscopes:
 - st,l3g4200d-gyro
--=20
2.9.2
