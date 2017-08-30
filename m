Return-Path: <SRS0=Af7A=AA=gmail.com=s.abhisit@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170825183520.doacpiit7mxgsk7v@rob-hp-laptop>
References: <1503383171-15515-1-git-send-email-s.abhisit@gmail.com> <20170825183520.doacpiit7mxgsk7v@rob-hp-laptop>
From: Abhisit Sangjan <s.abhisit@gmail.com>
Date: Wed, 30 Aug 2017 14:58:56 +0700
Message-ID: <CAMV_pUaXQxcD_nrJ32wi0w=sBseL1ioAhYvDt1O-HTX=0QY0aw@mail.gmail.com>
Subject: Re: [PATCH] mfd: Add support for TI LMP92001
Content-Type: multipart/alternative; boundary="001a113c988c61dbff0557f3e62a"
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, jmondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, knaack.h@gmx.de, lars@metafoo.de, fabrice.gasnier@st.com, Akinobu Mita <akinobu.mita@gmail.com>, marek.vasut+renesas@gmail.com, jacopo+renesas@jmondi.org, mike.looijmans@topic.nl, peda@axentia.se, =?UTF-8?Q?Jean=2DFran=C3=A7ois_Dagenais?= <jeff.dagenais@gmail.com>, linux-iio@vger.kernel.org, linux-gpio@vger.kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, lukas@wunner.de, adi.reus@gmail.com
List-ID: <devicetree@vger.kernel.org>

--001a113c988c61dbff0557f3e62a
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Sat, Aug 26, 2017 at 1:35 AM, Rob Herring <robh@kernel.org> wrote:

> On Tue, Aug 22, 2017 at 01:26:11PM +0700, s.abhisit@gmail.com wrote:
> > From: Abhisit Sangjan <s.abhisit@gmail.com>
> >
> > TI LMP92001 Analog System Monitor and Controller
> >
> > 8-bit GPIOs.
> > 12 DACs with 12-bit resolution.
> > The GPIOs and DACs are shared port function with Cy function pin to
> > take control the pin suddenly from external hardware.
> > DAC's referance voltage selectable for Internal/External.
> >
> > 16 + 1 ADCs with 12-bit resolution.
> > Built-in internal Temperature Sensor on channel 17.
> > Windows Comparator Function is supported on channel 1-3 and 9-11 for
> > monitoring with interrupt signal (pending to implement for interrupt).
> > ADC's referance voltage selectable for Internal/External.
> >
> > Signed-off-by: Abhisit Sangjan <s.abhisit@gmail.com>
> > ---
> >  Documentation/ABI/testing/sysfs-bus-iio-lmp920001  |  92 ++++
> >  .../devicetree/bindings/gpio/gpio-lmp92001.txt     |  22 +
> >  .../bindings/iio/adc/ti-lmp92001-adc.txt           |  21 +
> >  .../bindings/iio/dac/ti-lmp92001-dac.txt           |  35 ++
>
>
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-lmp92001.txt
> b/Documentation/devicetree/bindings/gpio/gpio-lmp92001.txt
> > new file mode 100644
> > index 0000000..c68784e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-lmp92001.txt
> > @@ -0,0 +1,22 @@
> > +* Texas Instruments' LMP92001 GPIOs
> > +
> > +Required properties:
> > + - compatible: Must be set to "ti,lmp92001-gpio".
> > + - reg: i2c chip address for the device.
>
> No, you show this in the parent which needs to be described in
> bindings/mtd/...
>
> You could have reg here too if all the registers for each sub-block are
> in a well defined range.
>

I am sorry, I do not understand.


>
> > + - gpio-controller: Marks the device node as a gpio controller.
> > + - #gpio-cells : Should be two.  The first cell is the pin number and
> the
> > +  second cell is used to specify the gpio polarity:
> > +        0 = Active high
> > +        1 = Active low
> > +
> > +Example:
> > +lmp92001@20 {
> > +        compatible = "ti,lmp92001";
> > +        reg = <0x20>;
> > +
> > +        lmp92001_gpio: lmp92001-gpio {
>
> gpio-controller {
>

I am sorry, I do not understand. I took this idea from some things
like Documentation/devicetree/bindings/gpio/gpio-lp3943.txt
------------------------------------------------------------------------------------------------------------------------------

TI/National Semiconductor LP3943 GPIO controller

Required properties:
  - compatible: "ti,lp3943-gpio"
  - gpio-controller: Marks the device node as a GPIO controller.
  - #gpio-cells: Should be 2. See gpio.txt in this directory for a
                 description of the cells format.

Example:
Simple LED controls with LP3943 GPIO controller

&i2c4 {
        *lp3943@60* {
                compatible = "ti,lp3943";
                reg = <0x60>;

                *gpioex: gpio* {
                        compatible = "ti,lp3943-gpio";
                        *gpio-controller;*
                        #gpio-cells = <2>;
                };
        };
};

leds {
        compatible = "gpio-leds";
        indicator1 {
                label = "indi1";
                gpios = <&gpioex 9 GPIO_ACTIVE_LOW>;
        };

        indicator2 {
                label = "indi2";
                gpios = <&gpioex 10 GPIO_ACTIVE_LOW>;
                default-state = "off";
        };
};


>
> > +                compatible = "ti,lmp92001-gpio";
> > +                gpio-controller;
> > +                #gpio-cells = <2>;
> > +        };
> > +};
> > diff --git a/Documentation/devicetree/bindings/iio/adc/ti-lmp92001-adc.txt
> b/Documentation/devicetree/bindings/iio/adc/ti-lmp92001-adc.txt
> > new file mode 100644
> > index 0000000..34d7809
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/ti-lmp92001-adc.txt
> > @@ -0,0 +1,21 @@
> > +* Texas Instruments' LMP92001 ADCs
> > +
> > +Required properties:
> > + - compatible: Must be set to "ti,lmp92001-adc".
> > + - reg: i2c chip address for the device.
>
> Same comment here.
>
> > + - ti,lmp92001-adc-mode: adc operation, either continuous or
> single-shot.
>
> No standard property for this?
>

I am removed this, regrading to Lukas Wunner (cc) and Adriana Reus
discussed (cc)
"it would be fine also as a sysfs property instead".
-------------------------------------------------------------------------------------------------------
On Sun, Aug 27, 2017 at 6:34 PM, Lukas Wunner <lukas@wunner.de> wrote:
> On Fri, Aug 25, 2017 at 02:59:41PM -0500, Rob Herring wrote:
>> On Tue, Aug 22, 2017 at 03:33:00PM +0200, Lukas Wunner wrote:
>> > --- a/Documentation/devicetree/bindings/iio/adc/mcp320x.txt
>> > +++ b/Documentation/devicetree/bindings/iio/adc/mcp320x.txt
>> > +Optional properties:
>> > +   - microchip,continuous-conversion (boolean):
>> > +                   Only applicable to MCP3550/1/3:  These ADCs have
long
>> > +                   conversion times and therefore support "continuous
>> > +                   conversion mode" to allow retrieval of conversions
>> > +                   at any time without observing a delay.  The mode is
>> > +                   enabled by permanently driving CS low, e.g. by
wiring
>> > +                   it to ground.
>>
>> Second binding I have seen today with a continuous property. Make this
>> common (or maybe we already have one).
>
> The other one was the TI LMP92001 ADC driver posted by Abhisit Sangjan
> (cc), however looking at the datasheet of that chip reveals that
> continuous versus one-shot mode is selected by flipping a bit in the
> chip's register map.
>
> So it is configurable at run-time.  It's not something that's hardwired.
> (Which is the case with the MCP3550 in my patch.)
>
> My understanding was that run-time configurable options should not be
> listed in the device-tree at all, only hardware features.  If that is
> correct then that device-tree property should be dropped from Abhisit
> Sangjan's patch.  Configuring the feature via sysfs is fine I guess.
>
> However we do have another driver supporting continuous versus one-shot
> mode and that is drivers/iio/light/us5182d.c by Adriana Reus (cc).
> The feature was added with commit c3304c212326.  I'm not sure if it's
> hardwired or runtime-configurable, the datasheet is gone from the
> manufacturer's website.
For the us5182 continuous versus one-shot is also a configuration in the
chip's registers. I think it would be fine also as a sysfs property instead.


>
> I agree that a common "continuous" property makes sense.  We haven't
> defined any common IIO properties so far and that has already led to
> inconsistencies.  E.g. most ADC/DAC drivers name the reference regulator
> "vref-supply", but e.g. drivers/iio/dac/ad7303.c calls it "REF-supply".
>
> What do you think of this:
>
> -- >8 --
> Subject: [PATCH] dt-bindings: iio: Document common properties
>
> It's about time we standardize on common names for frequently used IIO
> properties.  For starters, document "vref-supply" and "continuous".
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  Documentation/devicetree/bindings/iio/iio-bindings.txt | 15
+++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/iio/iio-bindings.txt
b/Documentation/devicetree/bindings/iio/iio-bindings.txt
> index 68d6f8c..c3e87e15 100644
> --- a/Documentation/devicetree/bindings/iio/iio-bindings.txt
> +++ b/Documentation/devicetree/bindings/iio/iio-bindings.txt
> @@ -95,3 +95,18 @@ vdd channel is connected to output 0 of the &ref
device.
>                 io-channels = <&adc 10>, <&adc 11>;
>                 io-channel-names = "adc1", "adc2";
>         };
> +
> +==Common IIO properties==
> +
> +Reference voltage:
> +ADCs, DACs and several other IIO devices require a reference voltage.
> +By convention the property specifying this regulator is named
"vref-supply".
> +If the chip lacks a dedicated Vref pin and instead uses its own power
supply
> +as reference, the property specifying the regulator is commonly named
> +"vdd-supply" or "vcc-supply".
> +
> +Continuous mode:
> +Some sensors can be configured to perform continuous (versus one-shot)
> +measurements.  Continuous mode may require more energy in return for
faster
> +or more reliable measurements.  A boolean property named "continuous"
> +signifies that the device is configured for this mode.


> > + - ti,lmp92001-adc-mask: bit mask for which channel is enable.
> > +        0 = Off
> > +        1 = On
> > +
> > +Example:
> > +lmp92001@20 {
> > +        compatible = "ti,lmp92001";
> > +        reg = <0x20>;
> > +
> > +        lmp92001-adc {
> > +                compatible = "ti,lmp92001-adc";
> > +                ti,lmp92001-adc-mode = "continuous";
> > +                ti,lmp92001-adc-mask = <0x00000079>;
> > +        };
> > +};
> > \ No newline at end of file
> > diff --git a/Documentation/devicetree/bindings/iio/dac/ti-lmp92001-dac.txt
> b/Documentation/devicetree/bindings/iio/dac/ti-lmp92001-dac.txt
> > new file mode 100644
> > index 0000000..882db9c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/dac/ti-lmp92001-dac.txt
> > @@ -0,0 +1,35 @@
> > +* Texas Instruments' LMP92001 DACs
> > +
> > +Required properties:
> > + - compatible: Must be set to "ti,lmp92001-dac".
> > + - reg: i2c chip address for the device.
> > + - ti,lmp92001-dac-hiz: hi-impedance control,
> > +        1 = Forces all OUT[1:12] outputs to hi-z, 0 = normal
>
> Just make this a boolean (i.e. no value).
>

Hi-Z will be or to cdac and it is unsigned int, u8 would be safe and work
fine for this.

lmp92001_dac_probe()
...
u8 gang = 0, outx = 0, hiz = 0;
unsigned int cdac = 0;
...
of_property_read_u8(np, "ti,lmp92001-dac-hiz", &hiz);
cdac = hiz;


> > + - ti,lmp92001-dac-outx:
> > +        Cy = 0, 1 = will force associated OUTx outputs to VDD
> > +        Cy = 0, 0 = will force associated OUTx outputs to GND
> > + - ti,lmp92001-dac-gang: What group of Cy is governed to.
> > +        -----------------------------------------
> > +        |  Cy   | CDAC:GANG = 0 | CDAC:GANG = 1 |
> > +        -----------------------------------------
> > +        |  C1   |   OUT[1:4]    |    OUT[1:3]   |
> > +        -----------------------------------------
> > +        |  C2   |   OUT[5:6]    |    OUT[4:6]   |
> > +        -----------------------------------------
> > +        |  C3   |   OUT[7:8]    |    OUT[7:9]   |
> > +        -----------------------------------------
> > +        |  C4   |   OUT[9:12]   |    OUT[10:12] |
> > +        -----------------------------------------
> > +
> > +Example:
> > +lmp92001@20 {
> > +        compatible = "ti,lmp92001";
> > +        reg = <0x20>;
> > +
> > +        lmp92001-dac {
> > +                compatible = "ti,lmp92001-dac";
> > +                ti,lmp92001-dac-hiz  = /bits/ 8 <0>;
> > +                ti,lmp92001-dac-outx = /bits/ 8 <0>;
> > +                ti,lmp92001-dac-gang = /bits/ 8 <0>;
> > +        };
> > +};
>

Thank you for your review,
Abhisit.

--001a113c988c61dbff0557f3e62a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"monospace, monospace">Hi Rob,<br></font><div=
 class=3D"gmail_extra"><font face=3D"monospace, monospace"><br></font><div =
class=3D"gmail_quote"><font face=3D"monospace, monospace">On Sat, Aug 26, 2=
017 at 1:35 AM, Rob Herring <span dir=3D"ltr">&lt;<a href=3D"mailto:robh@ke=
rnel.org" target=3D"_blank">robh@kernel.org</a>&gt;</span> wrote:<br></font=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><font face=3D"monospace,=
 monospace"><span class=3D"gmail-">On Tue, Aug 22, 2017 at 01:26:11PM +0700=
, <a href=3D"mailto:s.abhisit@gmail.com">s.abhisit@gmail.com</a> wrote:<br>
&gt; From: Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.com">s.abh=
isit@gmail.com</a>&gt;<br>
&gt;<br>
&gt; TI LMP92001 Analog System Monitor and Controller<br>
&gt;<br>
&gt; 8-bit GPIOs.<br>
&gt; 12 DACs with 12-bit resolution.<br>
&gt; The GPIOs and DACs are shared port function with Cy function pin to<br=
>
&gt; take control the pin suddenly from external hardware.<br>
&gt; DAC&#39;s referance voltage selectable for Internal/External.<br>
&gt;<br>
&gt; 16 + 1 ADCs with 12-bit resolution.<br>
&gt; Built-in internal Temperature Sensor on channel 17.<br>
&gt; Windows Comparator Function is supported on channel 1-3 and 9-11 for<b=
r>
&gt; monitoring with interrupt signal (pending to implement for interrupt).=
<br>
&gt; ADC&#39;s referance voltage selectable for Internal/External.<br>
&gt;<br>
&gt; Signed-off-by: Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.c=
om">s.abhisit@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 Documentation/ABI/testing/<wbr>sysfs-bus-iio-lmp920001=C2=A0 |=
=C2=A0 92 ++++<br>
&gt;=C2=A0 .../devicetree/bindings/gpio/<wbr>gpio-lmp92001.txt=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 22 +<br>
&gt;=C2=A0 .../bindings/iio/adc/ti-<wbr>lmp92001-adc.txt=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 21 +<br>
&gt;=C2=A0 .../bindings/iio/dac/ti-<wbr>lmp92001-dac.txt=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 35 ++<br>
<br>
<br>
</span><span class=3D"gmail-">&gt; diff --git a/Documentation/devicetree/<w=
br>bindings/gpio/gpio-lmp92001.<wbr>txt b/Documentation/devicetree/<wbr>bin=
dings/gpio/gpio-lmp92001.<wbr>txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..c68784e<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/<wbr>bindings/gpio/gpio-lmp92001.<wbr>t=
xt<br>
&gt; @@ -0,0 +1,22 @@<br>
&gt; +* Texas Instruments&#39; LMP92001 GPIOs<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; + - compatible: Must be set to &quot;ti,lmp92001-gpio&quot;.<br>
&gt; + - reg: i2c chip address for the device.<br>
<br>
</span>No, you show this in the parent which needs to be described in<br>
bindings/mtd/...<br>
<br>
You could have reg here too if all the registers for each sub-block are<br>
in a well defined range.<br></font></blockquote><div><font face=3D"monospac=
e, monospace"><br></font></div><div><font face=3D"monospace, monospace">I a=
m sorry, I do not understand.</font></div><div><font face=3D"monospace, mon=
ospace">=C2=A0</font></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><font face=3D"monospace, monospace">
<span class=3D"gmail-"><br>
&gt; + - gpio-controller: Marks the device node as a gpio controller.<br>
&gt; + - #gpio-cells : Should be two.=C2=A0 The first cell is the pin numbe=
r and the<br>
&gt; +=C2=A0 second cell is used to specify the gpio polarity:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =3D Active high<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 1 =3D Active low<br>
&gt; +<br>
&gt; +Example:<br>
&gt; +lmp92001@20 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;ti,lmp92001&quot;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x20&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lmp92001_gpio: lmp92001-gpio {<br>
<br>
</span>gpio-controller {<br></font></blockquote><div><font face=3D"monospac=
e, monospace"><br></font></div><div><font face=3D"monospace, monospace">I a=
m sorry, I do not understand. I took this idea from some things like=C2=A0D=
ocumentation/devicetree/bindings/gpio/gpio-lp3943.txt</font></div><div><fon=
t face=3D"monospace, monospace">-------------------------------------------=
---------------------------------------------------------------------------=
--------</font></div><div><font face=3D"monospace, monospace"><br></font></=
div><div><div><font face=3D"monospace, monospace">TI/National Semiconductor=
 LP3943 GPIO controller</font></div><div><font face=3D"monospace, monospace=
"><br></font></div><div><font face=3D"monospace, monospace">Required proper=
ties:</font></div><div><font face=3D"monospace, monospace">=C2=A0 - compati=
ble: &quot;ti,lp3943-gpio&quot;</font></div><div><font face=3D"monospace, m=
onospace">=C2=A0 - gpio-controller: Marks the device node as a GPIO control=
ler.</font></div><div><font face=3D"monospace, monospace">=C2=A0 - #gpio-ce=
lls: Should be 2. See gpio.txt in this directory for a</font></div><div><fo=
nt face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0description of the cells format.</font></div><div><font=
 face=3D"monospace, monospace"><br></font></div><div><font face=3D"monospac=
e, monospace">Example:</font></div><div><font face=3D"monospace, monospace"=
>Simple LED controls with LP3943 GPIO controller</font></div><div><font fac=
e=3D"monospace, monospace"><br></font></div><div><font face=3D"monospace, m=
onospace">&amp;i2c4 {</font></div><div><font face=3D"monospace, monospace">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <i><font color=3D"#0000ff">lp3943@60</font></i>=
 {</font></div><div><font face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;ti,lp3943&quot;=
;</font></div><div><font face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x60&gt;;</font></div><div>=
<font face=3D"monospace, monospace"><br></font></div><div><font face=3D"mon=
ospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
<font color=3D"#0000ff"><i>gpioex: gpio</i></font> {</font></div><div><font=
 face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;ti,lp3943-gp=
io&quot;;</font></div><div><font face=3D"monospace, monospace">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
i><font color=3D"#0000ff">gpio-controller;</font></i></font></div><div><fon=
t face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #gpio-cells =3D &lt;2&gt;;</font>=
</div><div><font face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };</font></div><div><font face=3D"monospace, mo=
nospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 };</font></div><div><font face=3D"mono=
space, monospace">};</font></div><div><font face=3D"monospace, monospace"><=
br></font></div><div><font face=3D"monospace, monospace">leds {</font></div=
><div><font face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 compa=
tible =3D &quot;gpio-leds&quot;;</font></div><div><font face=3D"monospace, =
monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 indicator1 {</font></div><div><font =
face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 label =3D &quot;indi1&quot;;</font></div><div><font face=3D"mono=
space, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g=
pios =3D &lt;&amp;gpioex 9 GPIO_ACTIVE_LOW&gt;;</font></div><div><font face=
=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 };</font></div><div><=
font face=3D"monospace, monospace"><br></font></div><div><font face=3D"mono=
space, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 indicator2 {</font></div><div=
><font face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 label =3D &quot;indi2&quot;;</font></div><div><font face=
=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 gpios =3D &lt;&amp;gpioex 10 GPIO_ACTIVE_LOW&gt;;</font></div><div><=
font face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 default-state =3D &quot;off&quot;;</font></div><div><font=
 face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 };</font></div><=
div><font face=3D"monospace, monospace">};</font></div></div><div><font fac=
e=3D"monospace, monospace">=C2=A0</font></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<font face=3D"monospace, monospace"><span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =
=3D &quot;ti,lmp92001-gpio&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio-controll=
er;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #gpio-cells =
=3D &lt;2&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +};<br>
&gt; diff --git a/Documentation/devicetree/<wbr>bindings/iio/adc/ti-lmp9200=
1-<wbr>adc.txt b/Documentation/devicetree/<wbr>bindings/iio/adc/ti-lmp92001=
-<wbr>adc.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..34d7809<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/<wbr>bindings/iio/adc/ti-lmp92001-<wbr>=
adc.txt<br>
&gt; @@ -0,0 +1,21 @@<br>
&gt; +* Texas Instruments&#39; LMP92001 ADCs<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; + - compatible: Must be set to &quot;ti,lmp92001-adc&quot;.<br>
&gt; + - reg: i2c chip address for the device.<br>
<br>
</span>Same comment here.<br>
<span class=3D"gmail-"><br>
&gt; + - ti,lmp92001-adc-mode: adc operation, either continuous or single-s=
hot.<br>
<br>
</span>No standard property for this?<br></font></blockquote><div><font fac=
e=3D"monospace, monospace"><br></font></div><div><font face=3D"monospace, m=
onospace">I am removed this, regrading to=C2=A0Lukas Wunner (cc) and=C2=A0A=
driana Reus discussed (cc)</font></div><div><font face=3D"monospace, monosp=
ace">&quot;it would be fine also as a sysfs property instead&quot;.</font><=
/div><div><font face=3D"monospace, monospace">-----------------------------=
--------------------------------------------------------------------------<=
br></font></div><div><font face=3D"monospace, monospace">On Sun, Aug 27, 20=
17 at 6:34 PM, Lukas Wunner &lt;<a href=3D"mailto:lukas@wunner.de">lukas@wu=
nner.de</a>&gt; wrote:</font></div><div><font face=3D"monospace, monospace"=
>&gt; On Fri, Aug 25, 2017 at 02:59:41PM -0500, Rob Herring wrote:</font></=
div><div><font face=3D"monospace, monospace">&gt;&gt; On Tue, Aug 22, 2017 =
at 03:33:00PM +0200, Lukas Wunner wrote:</font></div><div><font face=3D"mon=
ospace, monospace">&gt;&gt; &gt; --- a/Documentation/devicetree/bindings/ii=
o/adc/mcp320x.txt</font></div><div><font face=3D"monospace, monospace">&gt;=
&gt; &gt; +++ b/Documentation/devicetree/bindings/iio/adc/mcp320x.txt</font=
></div><div><font face=3D"monospace, monospace">&gt;&gt; &gt; +Optional pro=
perties:</font></div><div><font face=3D"monospace, monospace">&gt;&gt; &gt;=
 + =C2=A0 - microchip,continuous-conversion (boolean):</font></div><div><fo=
nt face=3D"monospace, monospace">&gt;&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Only applicable to MCP3550/1/3: =C2=
=A0These ADCs have long</font></div><div><font face=3D"monospace, monospace=
">&gt;&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 conversion times and therefore support &quot;continuous</font></div>=
<div><font face=3D"monospace, monospace">&gt;&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conversion mode&quot; to allo=
w retrieval of conversions</font></div><div><font face=3D"monospace, monosp=
ace">&gt;&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 at any time without observing a delay.=C2=A0 The mode is</font><=
/div><div><font face=3D"monospace, monospace">&gt;&gt; &gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enabled by permanently dr=
iving CS low, e.g. by wiring</font></div><div><font face=3D"monospace, mono=
space">&gt;&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 it to ground.</font></div><div><font face=3D"monospace, monospac=
e">&gt;&gt;</font></div><div><font face=3D"monospace, monospace">&gt;&gt; S=
econd binding I have seen today with a continuous property. Make this</font=
></div><div><font face=3D"monospace, monospace">&gt;&gt; common (or maybe w=
e already have one).</font></div><div><font face=3D"monospace, monospace">&=
gt;</font></div><div><font face=3D"monospace, monospace">&gt; The other one=
 was the TI LMP92001 ADC driver posted by Abhisit Sangjan</font></div><div>=
<font face=3D"monospace, monospace">&gt; (cc), however looking at the datas=
heet of that chip reveals that</font></div><div><font face=3D"monospace, mo=
nospace">&gt; continuous versus one-shot mode is selected by flipping a bit=
 in the</font></div><div><font face=3D"monospace, monospace">&gt; chip&#39;=
s register map.</font></div><div><font face=3D"monospace, monospace">&gt;</=
font></div><div><font face=3D"monospace, monospace">&gt; So it is configura=
ble at run-time.=C2=A0 It&#39;s not something that&#39;s hardwired.</font><=
/div><div><font face=3D"monospace, monospace">&gt; (Which is the case with =
the MCP3550 in my patch.)</font></div><div><font face=3D"monospace, monospa=
ce">&gt;</font></div><div><font face=3D"monospace, monospace">&gt; My under=
standing was that run-time configurable options should not be</font></div><=
div><font face=3D"monospace, monospace">&gt; listed in the device-tree at a=
ll, only hardware features.=C2=A0 If that is</font></div><div><font face=3D=
"monospace, monospace">&gt; correct then that device-tree property should b=
e dropped from Abhisit</font></div><div><font face=3D"monospace, monospace"=
>&gt; Sangjan&#39;s patch.=C2=A0 Configuring the feature via sysfs is fine =
I guess.</font></div><div><font face=3D"monospace, monospace">&gt;</font></=
div><div><font face=3D"monospace, monospace">&gt; However we do have anothe=
r driver supporting continuous versus one-shot</font></div><div><font face=
=3D"monospace, monospace">&gt; mode and that is drivers/iio/light/us5182d.c=
 by Adriana Reus (cc).</font></div><div><font face=3D"monospace, monospace"=
>&gt; The feature was added with commit c3304c212326.=C2=A0 I&#39;m not sur=
e if it&#39;s</font></div><div><font face=3D"monospace, monospace">&gt; har=
dwired or runtime-configurable, the datasheet is gone from the</font></div>=
<div><font face=3D"monospace, monospace">&gt; manufacturer&#39;s website.</=
font></div><div><font face=3D"monospace, monospace">For the us5182 continuo=
us versus one-shot is also a configuration in the</font></div><div><font fa=
ce=3D"monospace, monospace">chip&#39;s registers. I think it would be fine =
also as a sysfs property instead.</font></div><div><font face=3D"monospace,=
 monospace"><br></font></div><div><font face=3D"monospace, monospace"><br><=
/font></div><div><font face=3D"monospace, monospace">&gt;</font></div><div>=
<font face=3D"monospace, monospace">&gt; I agree that a common &quot;contin=
uous&quot; property makes sense.=C2=A0 We haven&#39;t</font></div><div><fon=
t face=3D"monospace, monospace">&gt; defined any common IIO properties so f=
ar and that has already led to</font></div><div><font face=3D"monospace, mo=
nospace">&gt; inconsistencies.=C2=A0 E.g. most ADC/DAC drivers name the ref=
erence regulator</font></div><div><font face=3D"monospace, monospace">&gt; =
&quot;vref-supply&quot;, but e.g. drivers/iio/dac/ad7303.c calls it &quot;R=
EF-supply&quot;.</font></div><div><font face=3D"monospace, monospace">&gt;<=
/font></div><div><font face=3D"monospace, monospace">&gt; What do you think=
 of this:</font></div><div><font face=3D"monospace, monospace">&gt;</font><=
/div><div><font face=3D"monospace, monospace">&gt; -- &gt;8 --</font></div>=
<div><font face=3D"monospace, monospace">&gt; Subject: [PATCH] dt-bindings:=
 iio: Document common properties</font></div><div><font face=3D"monospace, =
monospace">&gt;</font></div><div><font face=3D"monospace, monospace">&gt; I=
t&#39;s about time we standardize on common names for frequently used IIO</=
font></div><div><font face=3D"monospace, monospace">&gt; properties.=C2=A0 =
For starters, document &quot;vref-supply&quot; and &quot;continuous&quot;.<=
/font></div><div><font face=3D"monospace, monospace">&gt;</font></div><div>=
<font face=3D"monospace, monospace">&gt; Suggested-by: Rob Herring &lt;<a h=
ref=3D"mailto:robh@kernel.org">robh@kernel.org</a>&gt;</font></div><div><fo=
nt face=3D"monospace, monospace">&gt; Signed-off-by: Lukas Wunner &lt;<a hr=
ef=3D"mailto:lukas@wunner.de">lukas@wunner.de</a>&gt;</font></div><div><fon=
t face=3D"monospace, monospace">&gt; ---</font></div><div><font face=3D"mon=
ospace, monospace">&gt; =C2=A0Documentation/devicetree/bindings/iio/iio-bin=
dings.txt | 15 +++++++++++++++</font></div><div><font face=3D"monospace, mo=
nospace">&gt; =C2=A01 file changed, 15 insertions(+)</font></div><div><font=
 face=3D"monospace, monospace">&gt;</font></div><div><font face=3D"monospac=
e, monospace">&gt; diff --git a/Documentation/devicetree/bindings/iio/iio-b=
indings.txt b/Documentation/devicetree/bindings/iio/iio-bindings.txt</font>=
</div><div><font face=3D"monospace, monospace">&gt; index 68d6f8c..c3e87e15=
 100644</font></div><div><font face=3D"monospace, monospace">&gt; --- a/Doc=
umentation/devicetree/bindings/iio/iio-bindings.txt</font></div><div><font =
face=3D"monospace, monospace">&gt; +++ b/Documentation/devicetree/bindings/=
iio/iio-bindings.txt</font></div><div><font face=3D"monospace, monospace">&=
gt; @@ -95,3 +95,18 @@ vdd channel is connected to output 0 of the &amp;ref=
 device.</font></div><div><font face=3D"monospace, monospace">&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 io-channels =3D &lt;&amp;a=
dc 10&gt;, &lt;&amp;adc 11&gt;;</font></div><div><font face=3D"monospace, m=
onospace">&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 io-c=
hannel-names =3D &quot;adc1&quot;, &quot;adc2&quot;;</font></div><div><font=
 face=3D"monospace, monospace">&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 };</font></=
div><div><font face=3D"monospace, monospace">&gt; +</font></div><div><font =
face=3D"monospace, monospace">&gt; +=3D=3DCommon IIO properties=3D=3D</font=
></div><div><font face=3D"monospace, monospace">&gt; +</font></div><div><fo=
nt face=3D"monospace, monospace">&gt; +Reference voltage:</font></div><div>=
<font face=3D"monospace, monospace">&gt; +ADCs, DACs and several other IIO =
devices require a reference voltage.</font></div><div><font face=3D"monospa=
ce, monospace">&gt; +By convention the property specifying this regulator i=
s named &quot;vref-supply&quot;.</font></div><div><font face=3D"monospace, =
monospace">&gt; +If the chip lacks a dedicated Vref pin and instead uses it=
s own power supply</font></div><div><font face=3D"monospace, monospace">&gt=
; +as reference, the property specifying the regulator is commonly named</f=
ont></div><div><font face=3D"monospace, monospace">&gt; +&quot;vdd-supply&q=
uot; or &quot;vcc-supply&quot;.</font></div><div><font face=3D"monospace, m=
onospace">&gt; +</font></div><div><font face=3D"monospace, monospace">&gt; =
+Continuous mode:</font></div><div><font face=3D"monospace, monospace">&gt;=
 +Some sensors can be configured to perform continuous (versus one-shot)</f=
ont></div><div><font face=3D"monospace, monospace">&gt; +measurements.=C2=
=A0 Continuous mode may require more energy in return for faster</font></di=
v><div><font face=3D"monospace, monospace">&gt; +or more reliable measureme=
nts.=C2=A0 A boolean property named &quot;continuous&quot;</font></div><div=
><font face=3D"monospace, monospace">&gt; +signifies that the device is con=
figured for this mode.=C2=A0</font></div><div><font face=3D"monospace, mono=
space"><br></font></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
font face=3D"monospace, monospace">
</font><div><div class=3D"gmail-h5"><font face=3D"monospace, monospace"><br=
>
&gt; + - ti,lmp92001-adc-mask: bit mask for which channel is enable.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =3D Off<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 1 =3D On<br>
&gt; +<br>
&gt; +Example:<br>
&gt; +lmp92001@20 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;ti,lmp92001&quot;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x20&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lmp92001-adc {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =
=3D &quot;ti,lmp92001-adc&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ti,lmp92001-a=
dc-mode =3D &quot;continuous&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ti,lmp92001-a=
dc-mask =3D &lt;0x00000079&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +};<br>
&gt; \ No newline at end of file<br>
&gt; diff --git a/Documentation/devicetree/<wbr>bindings/iio/dac/ti-lmp9200=
1-<wbr>dac.txt b/Documentation/devicetree/<wbr>bindings/iio/dac/ti-lmp92001=
-<wbr>dac.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..882db9c<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/<wbr>bindings/iio/dac/ti-lmp92001-<wbr>=
dac.txt<br>
&gt; @@ -0,0 +1,35 @@<br>
&gt; +* Texas Instruments&#39; LMP92001 DACs<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; + - compatible: Must be set to &quot;ti,lmp92001-dac&quot;.<br>
&gt; + - reg: i2c chip address for the device.<br>
&gt; + - ti,lmp92001-dac-hiz: hi-impedance control,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 1 =3D Forces all OUT[1:12] outputs to hi-=
z, 0 =3D normal<br>
<br>
</font></div></div><font face=3D"monospace, monospace">Just make this a boo=
lean (i.e. no value).<br></font></blockquote><div><font face=3D"monospace, =
monospace"><br></font></div><div><font face=3D"monospace, monospace">Hi-Z w=
ill be or to cdac and it is unsigned int, u8 would be safe and work fine fo=
r this.<br></font></div><div><font face=3D"monospace, monospace"><br></font=
></div><div><font face=3D"monospace, monospace">lmp92001_dac_probe()<br></f=
ont></div><div><font face=3D"monospace, monospace">...</font></div><div><fo=
nt face=3D"monospace, monospace"><span style=3D"white-space:pre">	</span>u8=
 gang =3D 0, outx =3D 0, hiz =3D 0;</font></div><div><font face=3D"monospac=
e, monospace"><span style=3D"white-space:pre">	</span>unsigned int cdac =3D=
 0;</font></div><div><font face=3D"monospace, monospace">...</font></div><d=
iv><font face=3D"monospace, monospace"><span style=3D"white-space:pre">	</s=
pan>of_property_read_u8(np, &quot;ti,lmp92001-dac-hiz&quot;, &amp;hiz);</fo=
nt></div><div><font face=3D"monospace, monospace"><span style=3D"white-spac=
e:pre">	</span>cdac =3D hiz;=C2=A0</font></div><div><font face=3D"monospace=
, monospace"><br></font></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><font face=3D"monospace, monospace">
</font><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><font face=3D"mo=
nospace, monospace"><br>
&gt; + - ti,lmp92001-dac-outx:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Cy =3D 0, 1 =3D will force associated OUT=
x outputs to VDD<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Cy =3D 0, 0 =3D will force associated OUT=
x outputs to GND<br>
&gt; + - ti,lmp92001-dac-gang: What group of Cy is governed to.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>------=
-----<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 Cy=C2=A0 =C2=A0| CDAC:GANG =3D 0 =
| CDAC:GANG =3D 1 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>------=
-----<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 C1=C2=A0 =C2=A0|=C2=A0 =C2=A0OUT[=
1:4]=C2=A0 =C2=A0 |=C2=A0 =C2=A0 OUT[1:3]=C2=A0 =C2=A0|<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>------=
-----<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 C2=C2=A0 =C2=A0|=C2=A0 =C2=A0OUT[=
5:6]=C2=A0 =C2=A0 |=C2=A0 =C2=A0 OUT[4:6]=C2=A0 =C2=A0|<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>------=
-----<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 C3=C2=A0 =C2=A0|=C2=A0 =C2=A0OUT[=
7:8]=C2=A0 =C2=A0 |=C2=A0 =C2=A0 OUT[7:9]=C2=A0 =C2=A0|<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>------=
-----<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 C4=C2=A0 =C2=A0|=C2=A0 =C2=A0OUT[=
9:12]=C2=A0 =C2=A0|=C2=A0 =C2=A0 OUT[10:12] |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>------=
-----<br>
&gt; +<br>
&gt; +Example:<br>
&gt; +lmp92001@20 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;ti,lmp92001&quot;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x20&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lmp92001-dac {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =
=3D &quot;ti,lmp92001-dac&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ti,lmp92001-d=
ac-hiz=C2=A0 =3D /bits/ 8 &lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ti,lmp92001-d=
ac-outx =3D /bits/ 8 &lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ti,lmp92001-d=
ac-gang =3D /bits/ 8 &lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +};<br>
</font></div></div></blockquote></div><font face=3D"monospace, monospace"><=
br></font></div><div class=3D"gmail_extra"><font face=3D"monospace, monospa=
ce">Thank you for your review,</font></div><div class=3D"gmail_extra"><font=
 face=3D"monospace, monospace">Abhisit.</font></div></div>

--001a113c988c61dbff0557f3e62a--
