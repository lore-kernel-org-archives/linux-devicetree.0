Return-Path: <SRS0=r956=TB=collins.com=adam.michaelis@kernel.org>
MIME-Version: 1.0
From: Adam Michaelis <adam.michaelis@collins.com>
Date: Wed, 1 May 2019 14:17:59 -0500
Message-ID: <CALMrGWVfM+PqijDDnj5m_hHZodf0AKCRu9VHvm9mBTB_R3+rjQ@mail.gmail.com>
Subject: [PATCH 4/6] dt-bindings: iio: ad7949: Add cfg-readback option
Content-Type: multipart/alternative; boundary="000000000000c5b3a70587d8604f"
To: lars@metafoo.de, michael.hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, charles-antoine.couret@essensium.com, devicetree@vger.kernel.org
Cc: Brandon Maier <brandon.maier@rockwellcollins.com>, Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
List-ID: <devicetree@vger.kernel.org>

--000000000000c5b3a70587d8604f
Content-Type: text/plain; charset="UTF-8"

>From 7bf834dd49844a4e785924a9b0ead37cb9cf83c6 Mon Sep 17 00:00:00 2001
From: Adam Michaelis <adam.michaelis@rockwellcollins.com>
Date: Thu, 25 Apr 2019 15:26:21 -0500
Subject: [PATCH 4/6] dt-bindings: iio: ad7949: Add cfg-readback option

Adding optional parameter to the ad7949 to indicate that the part should
be configured to include the configuration register value used when
acquiring the current sample value.

Signed-off-by: Adam Michaelis <adam.michaelis@rockwellcollins.com>
---
 Documentation/devicetree/bindings/iio/adc/ad7949.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/ad7949.txt
b/Documentation/devicetree/bindings/iio/adc/ad7949.txt
index 14ee9a2cb2a5..cd3572828243 100644
--- a/Documentation/devicetree/bindings/iio/adc/ad7949.txt
+++ b/Documentation/devicetree/bindings/iio/adc/ad7949.txt
@@ -18,6 +18,8 @@ Optional properties:
    7: External reference, temperature sensor disabled, buffer enabled
  - vref-supply: The regulator supply for ADC reference voltage. Required
  if external reference selected by 'adi,reference-select'.
+ - adi,cfg-readback: If defined, set bit in configuration register to
+ read-back the configuration used for the current sample value.

 Examples:
 adc@0 {
@@ -32,3 +34,10 @@ adc@0 {
  reg = <0>;
  adi,reference-select = <0>;
 };
+
+adc@0 {
+ compatible = "adi,ad7949";
+ reg = <0>;
+ adi,reference-select = <1>;
+ adi,cfg-readback;
+};
-- 
1.9.1

--000000000000c5b3a70587d8604f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div>From 7bf834dd49844a4e785924a9b0=
ead37cb9cf83c6 Mon Sep 17 00:00:00 2001</div><div>From: Adam Michaelis &lt;=
<a href=3D"mailto:adam.michaelis@rockwellcollins.com">adam.michaelis@rockwe=
llcollins.com</a>&gt;</div><div>Date: Thu, 25 Apr 2019 15:26:21 -0500</div>=
<div>Subject: [PATCH 4/6] dt-bindings: iio: ad7949: Add cfg-readback option=
</div><div><br></div><div>Adding optional parameter to the ad7949 to indica=
te that the part should</div><div>be configured to include the configuratio=
n register value used when</div><div>acquiring the current sample value.</d=
iv><div><br></div><div>Signed-off-by: Adam Michaelis &lt;<a href=3D"mailto:=
adam.michaelis@rockwellcollins.com">adam.michaelis@rockwellcollins.com</a>&=
gt;</div><div>---</div><div>=C2=A0Documentation/devicetree/bindings/iio/adc=
/ad7949.txt | 9 +++++++++</div><div>=C2=A01 file changed, 9 insertions(+)</=
div><div><br></div><div>diff --git a/Documentation/devicetree/bindings/iio/=
adc/ad7949.txt b/Documentation/devicetree/bindings/iio/adc/ad7949.txt</div>=
<div>index 14ee9a2cb2a5..cd3572828243 100644</div><div>--- a/Documentation/=
devicetree/bindings/iio/adc/ad7949.txt</div><div>+++ b/Documentation/device=
tree/bindings/iio/adc/ad7949.txt</div><div>@@ -18,6 +18,8 @@ Optional prope=
rties:</div><div>=C2=A0 =C2=A0 7: External reference, temperature sensor di=
sabled, buffer enabled</div><div>=C2=A0 - vref-supply: The regulator supply=
 for ADC reference voltage. Required</div><div>=C2=A0 if external reference=
 selected by &#39;adi,reference-select&#39;.</div><div>+ - adi,cfg-readback=
: If defined, set bit in configuration register to</div><div>+ read-back th=
e configuration used for the current sample value.</div><div>=C2=A0</div><d=
iv>=C2=A0Examples:</div><div>=C2=A0adc@0 {</div><div>@@ -32,3 +34,10 @@ adc=
@0 {</div><div>=C2=A0<span style=3D"white-space:pre">	</span>reg =3D &lt;0&=
gt;;</div><div>=C2=A0<span style=3D"white-space:pre">	</span>adi,reference-=
select =3D &lt;0&gt;;</div><div>=C2=A0};</div><div>+</div><div>+adc@0 {</di=
v><div>+<span style=3D"white-space:pre">	</span>compatible =3D &quot;adi,ad=
7949&quot;;</div><div>+<span style=3D"white-space:pre">	</span>reg =3D &lt;=
0&gt;;</div><div>+<span style=3D"white-space:pre">	</span>adi,reference-sel=
ect =3D &lt;1&gt;;</div><div>+<span style=3D"white-space:pre">	</span>adi,c=
fg-readback;</div><div>+};</div><div>--=C2=A0</div><div>1.9.1</div><div><br=
></div></div></div></div>

--000000000000c5b3a70587d8604f--
