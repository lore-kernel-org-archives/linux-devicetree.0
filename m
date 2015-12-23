Return-Path: <constantine.shulyupin@gmail.com>
MIME-Version: 1.0
Sender: constantine.shulyupin@gmail.com
In-Reply-To: <20151125231535.GA25979@rob-hp-laptop>
References: <1448323758-28457-1-git-send-email-const@makelinux.com>
	<20151125231535.GA25979@rob-hp-laptop>
Date: Wed, 23 Dec 2015 23:11:36 +0200
Message-ID: <CAE7jHC-oivspaKymqqjRFzeeBz0K8c-cOrJSWMmvRD6Zf+4OLg@mail.gmail.com>
Subject: Re: [PATCH v9] Documentation: add Device tree bindings for hwmon/nct7802
From: Constantine Shulyupin <const@makelinux.com>
Content-Type: multipart/alternative; boundary=001a114b6468dc2d810527972a0b
To: Rob Herring <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lm-sensors@lm-sensors.org, Arnd Bergmann <arnd@arndb.de>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

--001a114b6468dc2d810527972a0b
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 26, 2015 at 1:15 AM, Rob Herring <robh@kernel.org> wrote:

> On Tue, Nov 24, 2015 at 02:09:18AM +0200, Constantine Shulyupin wrote:
> > From: Constantine Shulyupin <const@MakeLinux.com>
> >
> > Introduced subnodes sensor, fan and peci with properties.
> >
> > Signed-off-by: Constantine Shulyupin <const@MakeLinux.com>
>
> Acked-by: Rob Herring <robh@kernel.org>
>
> > ---
> > Changed in v9:
> > - Fixed nuvoton,nct7802-sensor
> > - Introduced nuvoton,nct7802-vmon, nuvoton,nct7802-fan-in,
> nuvoton,nct7802-fan-ctl
> >
> > Changed in v8:
> > - added senor type "local"
> > - Compatible nodes converted to senor types "vcore", "vcc"
> >
> > Changed in v7:
> > - sensors type (thermistor, thermistor, voltage) and pwm type
> > selected with type property instead of compatible property.
> >
> > Changed in v6:
> > - Removed previous definition.
> > - Introduced subnodes sensor, fan and peci with properties.
> >
> > Changed in v5:
> > - Fixed typos
> >
> > Changed in v4:
> > - Removed registers initialization by names
> > - Added properties nuvoton,sensor*-type
> >
> > Changed in v3:
> > - Fixed vendor prefix
> > - Added short registers description,
> >   full registers description is available at
> >
> https://www.nuvoton.com/hq/products/cloud-computing/hardware-monitors/desktop-server-series/nct7802y/
> >
> > Changed in v2:
> > - Removed nct7802,reg-init
> > - Added registers initialization by names
> >
> > Introduced in v1:
> >  - nct7802,reg-init
> > ---
> >  .../devicetree/bindings/hwmon/nct7802.txt          | 125
> +++++++++++++++++++++
> >  1 file changed, 125 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/nct7802.txt
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/nct7802.txt
> b/Documentation/devicetree/bindings/hwmon/nct7802.txt
> > new file mode 100644
> > index 0000000..cf983b3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/nct7802.txt
> > @@ -0,0 +1,125 @@
> > +Nuvoton NCT7802Y Hardware Monitoring IC
> > +
> > +Required node properties:
> > +
> > + - "compatible": must be "nuvoton,nct7802"
> > + - "reg": I2C bus address of the device
> > + - #address-cells=<1>;
> > + - #size-cells=<0>;
> > +
> > +Optional subnodes:
> > +
> > +Sensor subnodes properties:
> > + - "compatible", allowed values:
> > +      - "nuvoton,nct7802-sensor"
> > + - "sensor-type", allowed values:
> > +     "thermal-diode"
> > +     "thermistor"
> > +     "voltage"
> > +     "local" (only one instance, no "reg" required)
> > +For sensors of types "thermal-diode", "thermistor" and "voltage"
> required
> > + - "reg": sensor index in range 0 .. 2
> > +
> > +Except sensor at address 2 can't be "thermal-diode".
> > +
> > +Voltage monitor subnodes properties:
> > + - "compatible", allowed values:
> > +      - "nuvoton,nct7802-vmon"
> > + - "vmon-type", allowed values:
> > +     "vcore"
> > +     "vcc"
> > + - "reg" is not used because there is only one instance of
> > + vcore and vcc voltage monitors.
> > +
> > +Fan subnodes:
> > +
> > +Fan tachometer subnode (input):
> > +
> > +Required properties:
> > + - "reg" :sensor index of in range 0 .. 2.
> > + - "compatible", should be "nuvoton,nct7802-fan-in"
> > +
> > +Fan PWM (or DC) subnode (output or control):
> > +
> > +Required properties:
> > + - "reg" :sensor index of in range 0 .. 2.
> > + - "compatible", should be "nuvoton,nct7802-fan-ctl"
> > +Optional boolean properties:
> > + - "direct-current" :direct current powered fan instead default PWM
> > + - "invert" :inverted polarity
> > + - "open-drain" :open-drain output instead push pull
> > +
> > +Subnode "peci" properties:
> > + - "reg" :sensor index in range 0 .. 1
> > + - "compatible", should be "nuvoton,nct7802-peci"
> > +
> > +Not defined sensors, fans and PECI modules will be disabled.
> > +
> > +Example nct7802 node:
> > +
> > +nct7802-example@28 {
> > +     compatible = "nuvoton,nct7802";
> > +     reg = <0x28>;
> > +     #address-cells=<1>;
> > +     #size-cells=<0>;
> > +     local-sensor {
> > +             compatible = "nuvoton,nct7802-sensor";
> > +             sensor-type = "local";
> > +     };
> > +     sensor@0 {
> > +             compatible = "nuvoton,nct7802-sensor";
> > +             reg = <0>;
> > +             sensor-type = "thermal-diode";
> > +     };
> > +     sensor@1 {
> > +             compatible = "nuvoton,nct7802-sensor";
> > +             reg = <1>;
> > +             sensor-type = "thermistor";
> > +     };
> > +     sensor@2 {
> > +             compatible = "nuvoton,nct7802-sensor";
> > +             reg = <2>;
> > +             sensor-type = "voltage";
> > +     };
> > +     vcc {
> > +             compatible = "nuvoton,nct7802-vmon";
> > +             sensor-type = "vcc";
> > +     };
> > +     vcore {
> > +             compatible = "nuvoton,nct7802-vmon";
> > +             sensor-type = "vcore";
> > +     };
> > +     fan-in@0 {
> > +             compatible = "nuvoton,nct7802-fan-in";
> > +             reg = <0>;
> > +     };
> > +     fan-in@1 {
> > +             compatible = "nuvoton,nct7802-fan-in";
> > +             reg = <1>;
> > +     };
> > +     fan-ctl@0 {
> > +             compatible = "nuvoton,nct7802-fan-ctl";
> > +             reg = <0>;
> > +     };
> > +     dc-fan-ctl@1 {
> > +             compatible = "nuvoton,nct7802-fan-ctl";
> > +             reg = <1>;
> > +             direct-current;
> > +             open-drain;
> > +             invert;
> > +     };
> > +     pwm-fan-ctl@2 {
> > +             compatible = "nuvoton,nct7802-fan-ctl";
> > +             reg = <2>;
> > +             open-drain;
> > +             invert;
> > +     };
> > +     peci@0 {
> > +             compatible = "nuvoton,nct7802-peci";
> > +             reg = <0>;
> > +     };
> > +     peci@1 {
> > +             compatible = "nuvoton,nct7802-peci";
> > +             reg = <1>;
> > +     };
> > +};
> > --
> > 1.9.1
> >
>

Gentle reminder ping...

-- 
Thanks
Constantine

--001a114b6468dc2d810527972a0b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Nov 26, 2015 at 1:15 AM, Rob Herring <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:robh@kernel.org" target=3D"_blank">robh@kernel.org</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-lef=
t-style:solid;padding-left:1ex"><span class=3D"">On Tue, Nov 24, 2015 at 02=
:09:18AM +0200, Constantine Shulyupin wrote:<br>
&gt; From: Constantine Shulyupin &lt;const@MakeLinux.com&gt;<br>
&gt;<br>
&gt; Introduced subnodes sensor, fan and peci with properties.<br>
&gt;<br>
&gt; Signed-off-by: Constantine Shulyupin &lt;const@MakeLinux.com&gt;<br>
<br>
</span>Acked-by: Rob Herring &lt;<a href=3D"mailto:robh@kernel.org">robh@ke=
rnel.org</a>&gt;<br>
<div class=3D""><div class=3D"h5"><br>
&gt; ---<br>
&gt; Changed in v9:<br>
&gt; - Fixed nuvoton,nct7802-sensor<br>
&gt; - Introduced nuvoton,nct7802-vmon, nuvoton,nct7802-fan-in, nuvoton,nct=
7802-fan-ctl<br>
&gt;<br>
&gt; Changed in v8:<br>
&gt; - added senor type &quot;local&quot;<br>
&gt; - Compatible nodes converted to senor types &quot;vcore&quot;, &quot;v=
cc&quot;<br>
&gt;<br>
&gt; Changed in v7:<br>
&gt; - sensors type (thermistor, thermistor, voltage) and pwm type<br>
&gt; selected with type property instead of compatible property.<br>
&gt;<br>
&gt; Changed in v6:<br>
&gt; - Removed previous definition.<br>
&gt; - Introduced subnodes sensor, fan and peci with properties.<br>
&gt;<br>
&gt; Changed in v5:<br>
&gt; - Fixed typos<br>
&gt;<br>
&gt; Changed in v4:<br>
&gt; - Removed registers initialization by names<br>
&gt; - Added properties nuvoton,sensor*-type<br>
&gt;<br>
&gt; Changed in v3:<br>
&gt; - Fixed vendor prefix<br>
&gt; - Added short registers description,<br>
&gt;=C2=A0 =C2=A0full registers description is available at<br>
&gt; <a href=3D"https://www.nuvoton.com/hq/products/cloud-computing/hardwar=
e-monitors/desktop-server-series/nct7802y/" rel=3D"noreferrer" target=3D"_b=
lank">https://www.nuvoton.com/hq/products/cloud-computing/hardware-monitors=
/desktop-server-series/nct7802y/</a><br>
&gt;<br>
&gt; Changed in v2:<br>
&gt; - Removed nct7802,reg-init<br>
&gt; - Added registers initialization by names<br>
&gt;<br>
&gt; Introduced in v1:<br>
&gt;=C2=A0 - nct7802,reg-init<br>
&gt; ---<br>
&gt;=C2=A0 .../devicetree/bindings/hwmon/nct7802.txt=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 125 +++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 125 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/hwmon/nct78=
02.txt<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/bindings/hwmon/nct7802.txt b/Doc=
umentation/devicetree/bindings/hwmon/nct7802.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..cf983b3<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/hwmon/nct7802.txt<br>
&gt; @@ -0,0 +1,125 @@<br>
&gt; +Nuvoton NCT7802Y Hardware Monitoring IC<br>
&gt; +<br>
&gt; +Required node properties:<br>
&gt; +<br>
&gt; + - &quot;compatible&quot;: must be &quot;nuvoton,nct7802&quot;<br>
&gt; + - &quot;reg&quot;: I2C bus address of the device<br>
&gt; + - #address-cells=3D&lt;1&gt;;<br>
&gt; + - #size-cells=3D&lt;0&gt;;<br>
&gt; +<br>
&gt; +Optional subnodes:<br>
&gt; +<br>
&gt; +Sensor subnodes properties:<br>
&gt; + - &quot;compatible&quot;, allowed values:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - &quot;nuvoton,nct7802-sensor&quot;<br>
&gt; + - &quot;sensor-type&quot;, allowed values:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;thermal-diode&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;thermistor&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;voltage&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;local&quot; (only one instance, no &quot;re=
g&quot; required)<br>
&gt; +For sensors of types &quot;thermal-diode&quot;, &quot;thermistor&quot=
; and &quot;voltage&quot; required<br>
&gt; + - &quot;reg&quot;: sensor index in range 0 .. 2<br>
&gt; +<br>
&gt; +Except sensor at address 2 can&#39;t be &quot;thermal-diode&quot;.<br=
>
&gt; +<br>
&gt; +Voltage monitor subnodes properties:<br>
&gt; + - &quot;compatible&quot;, allowed values:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - &quot;nuvoton,nct7802-vmon&quot;<br>
&gt; + - &quot;vmon-type&quot;, allowed values:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;vcore&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;vcc&quot;<br>
&gt; + - &quot;reg&quot; is not used because there is only one instance of<=
br>
&gt; + vcore and vcc voltage monitors.<br>
&gt; +<br>
&gt; +Fan subnodes:<br>
&gt; +<br>
&gt; +Fan tachometer subnode (input):<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; + - &quot;reg&quot; :sensor index of in range 0 .. 2.<br>
&gt; + - &quot;compatible&quot;, should be &quot;nuvoton,nct7802-fan-in&quo=
t;<br>
&gt; +<br>
&gt; +Fan PWM (or DC) subnode (output or control):<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; + - &quot;reg&quot; :sensor index of in range 0 .. 2.<br>
&gt; + - &quot;compatible&quot;, should be &quot;nuvoton,nct7802-fan-ctl&qu=
ot;<br>
&gt; +Optional boolean properties:<br>
&gt; + - &quot;direct-current&quot; :direct current powered fan instead def=
ault PWM<br>
&gt; + - &quot;invert&quot; :inverted polarity<br>
&gt; + - &quot;open-drain&quot; :open-drain output instead push pull<br>
&gt; +<br>
&gt; +Subnode &quot;peci&quot; properties:<br>
&gt; + - &quot;reg&quot; :sensor index in range 0 .. 1<br>
&gt; + - &quot;compatible&quot;, should be &quot;nuvoton,nct7802-peci&quot;=
<br>
&gt; +<br>
&gt; +Not defined sensors, fans and PECI modules will be disabled.<br>
&gt; +<br>
&gt; +Example nct7802 node:<br>
&gt; +<br>
&gt; +nct7802-example@28 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;nuvoton,nct7802&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x28&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0#address-cells=3D&lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0#size-cells=3D&lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0local-sensor {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
nuvoton,nct7802-sensor&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor-type =3D &quot=
;local&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sensor@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
nuvoton,nct7802-sensor&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor-type =3D &quot=
;thermal-diode&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sensor@1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
nuvoton,nct7802-sensor&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;1&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor-type =3D &quot=
;thermistor&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sensor@2 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
nuvoton,nct7802-sensor&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;2&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor-type =3D &quot=
;voltage&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vcc {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
nuvoton,nct7802-vmon&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor-type =3D &quot=
;vcc&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vcore {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
nuvoton,nct7802-vmon&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor-type =3D &quot=
;vcore&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fan-in@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
nuvoton,nct7802-fan-in&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fan-in@1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
nuvoton,nct7802-fan-in&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;1&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fan-ctl@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
nuvoton,nct7802-fan-ctl&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dc-fan-ctl@1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
nuvoton,nct7802-fan-ctl&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;1&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0direct-current;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0open-drain;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0invert;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pwm-fan-ctl@2 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
nuvoton,nct7802-fan-ctl&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;2&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0open-drain;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0invert;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0peci@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
nuvoton,nct7802-peci&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0peci@1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
nuvoton,nct7802-peci&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;1&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
&gt; --<br>
&gt; 1.9.1<br>
&gt;<br>
</div></div></blockquote></div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Gentle reminder ping...</div><div><br></div>-- <br><div=
 class=3D"gmail_signature">Thanks<br>Constantine</div>
</div></div>

--001a114b6468dc2d810527972a0b--
