Return-Path: <SRS0=c3x+=AA=leopardimaging.com=leonl@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170830175053.31332-1-leonl@leopardimaging.com>
References: <20170830175053.31332-1-leonl@leopardimaging.com>
From: Leon Luo <leonl@leopardimaging.com>
Date: Wed, 30 Aug 2017 11:16:53 -0700
Message-ID: <CADu3m9yLVa8f4cuamXayRc5TOVXRNtZ1sYjj+_DNP3U9-GPpmw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media:imx274 device tree binding file
Content-Type: multipart/alternative; boundary="001a114b32005720c90557fc886e"
To: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, hans.verkuil@cisco.com, sakari.ailus@linux.intel.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, leon Luo <leonl@leopardimaging.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

--001a114b32005720c90557fc886e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, one of the email address is wrong. I will correct it and resend.

Regards,
Leon Luo
1130 Cadillac CT
Milpitas, CA 95035
Phone: (510)371-1169
Fax: (408) 217-1960
Email: leonl@leopardimaging.com
www.leopardimaging.com

On Wed, Aug 30, 2017 at 10:50 AM, Leon Luo <leonl@leopardimaging.com> wrote=
:

> The binding file for imx274 CMOS sensor V4l2 driver
>
> Signed-off-by: Leon Luo <leonl@leopardimaging.com>
> Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
> ---
> v3:
>  - remove redundant properties and references
>  - document 'reg' property
> v2:
>  - no changes
> ---
>  .../devicetree/bindings/media/i2c/imx274.txt       | 32
> ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.tx=
t
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx274.txt
> b/Documentation/devicetree/bindings/media/i2c/imx274.txt
> new file mode 100644
> index 000000000000..1f03256b35db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/imx274.txt
> @@ -0,0 +1,32 @@
> +* Sony 1/2.5-Inch 8.51Mp CMOS Digital Image Sensor
> +
> +The Sony imx274 is a 1/2.5-inch CMOS active pixel digital image sensor
> with
> +an active array size of 3864H x 2202V. It is programmable through I2C
> +interface. The I2C address is fixed to 0x1a as per sensor data sheet.
> +Image data is sent through MIPI CSI-2, which is configured as 4 lanes
> +at 1440 Mbps.
> +
> +
> +Required Properties:
> +- compatible: value should be "sony,imx274" for imx274 sensor
> +- reg: I2C bus address of the device
> +
> +Optional Properties:
> +- reset-gpios: Sensor reset GPIO
> +
> +For further reading on port node refer to
> +Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +Example:
> +       sensor@1a {
> +               compatible =3D "sony,imx274";
> +               reg =3D <0x1a>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               reset-gpios =3D <&gpio_sensor 0 0>;
> +               port {
> +                       sensor_out: endpoint {
> +                               remote-endpoint =3D <&csiss_in>;
> +                       };
> +               };
> +       };
> --
> 2.14.0.rc1
>
>

--001a114b32005720c90557fc886e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, one of the email address is wrong. I will correct i=
t and resend.</div><div class=3D"gmail_extra"><br clear=3D"all"><div><div c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature">Regards,<br>Leo=
n Luo<br>1130 Cadillac CT<br>Milpitas, CA 95035<br>Phone: (510)371-1169<br>=
Fax: (408) 217-1960<br>Email: <a href=3D"mailto:leonl@leopardimaging.com" t=
arget=3D"_blank">leonl@leopardimaging.com</a><br><a href=3D"http://www.leop=
ardimaging.com" target=3D"_blank">www.leopardimaging.com</a><br></div></div=
>
<br><div class=3D"gmail_quote">On Wed, Aug 30, 2017 at 10:50 AM, Leon Luo <=
span dir=3D"ltr">&lt;<a href=3D"mailto:leonl@leopardimaging.com" target=3D"=
_blank">leonl@leopardimaging.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">The binding file for imx274 CMOS sensor V4l2=
 driver<br>
<br>
Signed-off-by: Leon Luo &lt;<a href=3D"mailto:leonl@leopardimaging.com">leo=
nl@leopardimaging.com</a>&gt;<br>
Acked-by: S=C3=B6ren Brinkmann &lt;<a href=3D"mailto:soren.brinkmann@xilinx=
.com">soren.brinkmann@xilinx.com</a>&gt;<br>
---<br>
</span>v3:<br>
=C2=A0- remove redundant properties and references<br>
=C2=A0- document &#39;reg&#39; property<br>
v2:<br>
=C2=A0- no changes<br>
<span class=3D"">---<br>
=C2=A0.../devicetree/bindings/media/<wbr>i2c/imx274.txt=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 32 ++++++++++++++++++++++<br>
=C2=A01 file changed, 32 insertions(+)<br>
=C2=A0create mode 100644 Documentation/devicetree/<wbr>bindings/media/i2c/i=
mx274.txt<br>
<br>
</span>diff --git a/Documentation/devicetree/<wbr>bindings/media/i2c/imx274=
.txt b/Documentation/devicetree/<wbr>bindings/media/i2c/imx274.txt<br>
new file mode 100644<br>
index 000000000000..1f03256b35db<br>
<span class=3D"">--- /dev/null<br>
+++ b/Documentation/devicetree/<wbr>bindings/media/i2c/imx274.txt<br>
@@ -0,0 +1,32 @@<br>
+* Sony 1/2.5-Inch 8.51Mp CMOS Digital Image Sensor<br>
+<br>
+The Sony imx274 is a 1/2.5-inch CMOS active pixel digital image sensor wit=
h<br>
+an active array size of 3864H x 2202V. It is programmable through I2C<br>
+interface. The I2C address is fixed to 0x1a as per sensor data sheet.<br>
+Image data is sent through MIPI CSI-2, which is configured as 4 lanes<br>
+at 1440 Mbps.<br>
+<br>
+<br>
+Required Properties:<br>
+- compatible: value should be &quot;sony,imx274&quot; for imx274 sensor<br=
>
</span>+- reg: I2C bus address of the device<br>
<span class=3D"">+<br>
+Optional Properties:<br>
+- reset-gpios: Sensor reset GPIO<br>
+<br>
+For further reading on port node refer to<br>
+Documentation/devicetree/<wbr>bindings/media/video-<wbr>interfaces.txt.<br=
>
+<br>
+Example:<br>
</span>+=C2=A0 =C2=A0 =C2=A0 =C2=A0sensor@1a {<br>
<span class=3D"">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0co=
mpatible =3D &quot;sony,imx274&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x1a&gt=
;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D =
&lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt=
;0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reset-gpios =3D &lt=
;&amp;gpio_sensor 0 0&gt;;<br>
</span>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port {<br>
<span class=3D"">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0sensor_out: endpoint {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remote-endpoint =3D &lt;&amp;csiss_in=
&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
--<br>
</span>2.14.0.rc1<br>
<br>
</blockquote></div><br></div>

--001a114b32005720c90557fc886e--
