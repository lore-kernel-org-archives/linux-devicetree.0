Return-Path: <hywu@google.com>
MIME-Version: 1.0
In-Reply-To: <572C61B1.2040508@atmel.com>
References: <1462295611-49684-1-git-send-email-grundler@chromium.org>
	<20160504135123.GA4567@rob-hp-laptop>
	<CANEJEGt1Ri7Q-g25U8_KTAb9Z8MfVWH0N5QLaLcdnDuF_wwrtw@mail.gmail.com>
	<572C61B1.2040508@atmel.com>
Date: Fri, 6 May 2016 23:14:12 +0800
Message-ID: <CAHHoo-j7145vPFNmJH=CvPu-BRCgRe0WNKH8QDkSc+c3koxHAQ@mail.gmail.com>
Subject: Re: Input: add Atmel Atmegaxx captouch driver
From: Daniel Hung-yu Wu <hywu@google.com>
Content-Type: multipart/alternative; boundary=001a114c99664d25a405322de903
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Grant Grundler <grundler@chromium.org>, Rob Herring <robh@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input <linux-input@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, LKML <linux-kernel@vger.kernel.org>, Linux DeviceTree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--001a114c99664d25a405322de903
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The register set is different, and this chip does not support calibration.
The I2C protocol is not the same as well; there is an additional byte
indicating data length.

Atmega88PA is a general-purpose MCU. In the future, we will add more
functionalities, such as firmware upgrade through I2C.

On Fri, May 6, 2016 at 5:19 PM, Nicolas Ferre <nicolas.ferre@atmel.com>
wrote:

> Le 05/05/2016 18:04, Grant Grundler a =C3=A9crit :
> > On Wed, May 4, 2016 at 6:51 AM, Rob Herring <robh@kernel.org> wrote:
> > ...
> >>> +Required properties:
> >>> +
> >>> +     compatible:     Must be "atmel,atmegaxx_captouch".
> >>
> >> No wildcards in the compatible strings. Use the specific devices.
> >>
> >> Also, use hyphen rather than underscore. However, if the device is onl=
y
> >> a touch controller, then '_captouch' is not needed. The part number is
> >> sufficient to identify the device.
> >
> > The primary part used on the board is AtMega88PA. Details of that SoC
> > are public:
> >     http://www.atmel.com/devices/ATMEGA88PA.aspx
> >
> > I don't see why the exact chip is relevant to the driver. The driver
> > is just talking to an I2C device that reports button events.  The
> > protocol across the I2C determines what this driver has to do and that
> > protocol is implemented by the on-board firmware (supplied by Atmel).
> > Any AVR CPU could implement this same protocol.
> >
> > Can we call this "atmel,qtouch-buttons-v2" or something like that?
>
> Is it different from the Atmel QT1070 or QT2160 which have drivers
> already available in Linux:
> drivers/input/keyboard/qt1070.c
>
> Bye,
>
> > I personally don't have anything invested in any particular name. Feel
> > free to suggest a different one. I'm perfectly happy with any color
> > paint on the shed.
> >
> > ...
> >>> +Example:
> >>> +
> >>> +     atmegaxx_captouch@51 {
> >>
> >> atmegaxx@51 (with actual part number)
> >
> > Is "qtouch-buttons@51" ok?
> >
> >>
> >>> +             compatible =3D "atmel,atmegaxx_captouch";
> >>> +             reg =3D <0x51>;
> >>> +             interrupt-parent =3D <&tlmm>;
> >>> +             interrupts =3D <67 IRQ_TYPE_EDGE_FALLING>;
> >>> +             linux,keycodes =3D <BTN_0>, <BTN_1>,
> >>> +                     <BTN_2>, <BTN_3>,
> >>> +                     <BTN_4>, <BTN_5>,
> >>> +                     <BTN_6>, <BTN_7>;
> >>> +             autorepeat;
> >>> +     };
> >
> > cheers,
> > grant
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
>
>
> --
> Nicolas Ferre
>

--001a114c99664d25a405322de903
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The register set is different, and this chip does not supp=
ort calibration. The I2C protocol is not the same as well; there is an addi=
tional byte indicating data length.<br><div><br></div><div>Atmega88PA is a =
general-purpose MCU. In the future, we will add more functionalities, such =
as firmware upgrade through I2C.</div></div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On Fri, May 6, 2016 at 5:19 PM, Nicolas Ferre <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:nicolas.ferre@atmel.com" target=3D"_b=
lank">nicolas.ferre@atmel.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><span class=3D"">Le 05/05/2016 18:04, Grant Grundler a =C3=A9cri=
t :<br>
&gt; On Wed, May 4, 2016 at 6:51 AM, Rob Herring &lt;<a href=3D"mailto:robh=
@kernel.org">robh@kernel.org</a>&gt; wrote:<br>
&gt; ...<br>
&gt;&gt;&gt; +Required properties:<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0compatible:=C2=A0 =C2=A0 =C2=A0Must be &q=
uot;atmel,atmegaxx_captouch&quot;.<br>
&gt;&gt;<br>
&gt;&gt; No wildcards in the compatible strings. Use the specific devices.<=
br>
&gt;&gt;<br>
&gt;&gt; Also, use hyphen rather than underscore. However, if the device is=
 only<br>
&gt;&gt; a touch controller, then &#39;_captouch&#39; is not needed. The pa=
rt number is<br>
&gt;&gt; sufficient to identify the device.<br>
&gt;<br>
&gt; The primary part used on the board is AtMega88PA. Details of that SoC<=
br>
&gt; are public:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://www.atmel.com/devices/ATMEGA88PA.=
aspx" rel=3D"noreferrer" target=3D"_blank">http://www.atmel.com/devices/ATM=
EGA88PA.aspx</a><br>
&gt;<br>
&gt; I don&#39;t see why the exact chip is relevant to the driver. The driv=
er<br>
&gt; is just talking to an I2C device that reports button events.=C2=A0 The=
<br>
&gt; protocol across the I2C determines what this driver has to do and that=
<br>
&gt; protocol is implemented by the on-board firmware (supplied by Atmel).<=
br>
&gt; Any AVR CPU could implement this same protocol.<br>
&gt;<br>
&gt; Can we call this &quot;atmel,qtouch-buttons-v2&quot; or something like=
 that?<br>
<br>
</span>Is it different from the Atmel QT1070 or QT2160 which have drivers<b=
r>
already available in Linux:<br>
drivers/input/keyboard/qt1070.c<br>
<br>
Bye,<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; I personally don&#39;t have anything invested in any particular name. =
Feel<br>
&gt; free to suggest a different one. I&#39;m perfectly happy with any colo=
r<br>
&gt; paint on the shed.<br>
&gt;<br>
&gt; ...<br>
&gt;&gt;&gt; +Example:<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0atmegaxx_captouch@51 {<br>
&gt;&gt;<br>
&gt;&gt; atmegaxx@51 (with actual part number)<br>
&gt;<br>
&gt; Is &quot;qtouch-buttons@51&quot; ok?<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =
=3D &quot;atmel,atmegaxx_captouch&quot;;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0=
x51&gt;;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-par=
ent =3D &lt;&amp;tlmm&gt;;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =
=3D &lt;67 IRQ_TYPE_EDGE_FALLING&gt;;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux,keycode=
s =3D &lt;BTN_0&gt;, &lt;BTN_1&gt;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&lt;BTN_2&gt;, &lt;BTN_3&gt;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&lt;BTN_4&gt;, &lt;BTN_5&gt;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&lt;BTN_6&gt;, &lt;BTN_7&gt;;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0autorepeat;<b=
r>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt;<br>
&gt; cheers,<br>
&gt; grant<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; To unsubscribe from this list: send the line &quot;unsubscribe devicet=
ree&quot; in<br>
&gt; the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">=
majordomo@vger.kernel.org</a><br>
&gt; More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordo=
mo-info.html" rel=3D"noreferrer" target=3D"_blank">http://vger.kernel.org/m=
ajordomo-info.html</a><br>
&gt;<br>
<br>
<br>
--<br>
Nicolas Ferre<br>
</font></span></blockquote></div><br></div>

--001a114c99664d25a405322de903--
