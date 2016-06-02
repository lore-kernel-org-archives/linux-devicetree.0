Return-Path: <cwchoi00@gmail.com>
MIME-Version: 1.0
Reply-To: cw00.choi@samsung.com
In-Reply-To: <CAGTfZH1ZAD_R1q8COUE2hdrq24BS1muJ=7-_1VeHriBqH+aAZQ@mail.gmail.com>
References: <1464263265-20187-1-git-send-email-vreddytalla@nvidia.com>
	<CGME20160527152945epcas1p4de3d2d43f94a20e3f93676b6c4f78244@epcas1p4.samsung.com>
	<20160527152934.GB12024@rob-hp-laptop>
	<574D32D7.2090902@samsung.com>
	<574D3EA7.9080907@samsung.com>
	<CAL_JsqLpWMX3X77xyVH=5+AtEaRiY9ShkEo0TdHOphqE654OXg@mail.gmail.com>
	<CAGTfZH1ZAD_R1q8COUE2hdrq24BS1muJ=7-_1VeHriBqH+aAZQ@mail.gmail.com>
Date: Thu, 2 Jun 2016 09:06:10 +0900
Message-ID: <CAGTfZH2yBVe0BOvX7Fpyq6Nbe-+P=AW=FYpRnbRDUS53aaJfoA@mail.gmail.com>
Subject: Re: [PATCH v4] extcon: gpio: Add the support for Device tree bindings
From: Chanwoo Choi <cwchoi00@gmail.com>
Content-Type: multipart/alternative; boundary=94eb2c07ceaca23eb90534405f9f
To: "cw00.choi@samsung.com" <cw00.choi@samsung.com>
Cc: Rob Herring <robh@kernel.org>, Venkat Reddy Talla <vreddytalla@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

--94eb2c07ceaca23eb90534405f9f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Rob,

I'm expecting your reply about comparision between gpio-keys and
extcon-gpio. I think two drivers are very similar as following.

Thanks,
Chanwoo Choi

2016=EB=85=84 5=EC=9B=94 31=EC=9D=BC =ED=99=94=EC=9A=94=EC=9D=BC, Chanwoo C=
hoi<cwchoi00@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=ED=95=9C =EB=
=A9=94=EC=8B=9C=EC=A7=80:

> Hi Rob,
>
> On Tue, May 31, 2016 at 10:35 PM, Rob Herring <robh@kernel.org
> <javascript:;>> wrote:
> > On Tue, May 31, 2016 at 2:35 AM, Chanwoo Choi <cw00.choi@samsung.com
> <javascript:;>> wrote:
> >> Hi Rob,
> >>
> >> On 2016=EB=85=84 05=EC=9B=94 31=EC=9D=BC 15:44, Chanwoo Choi wrote:
> >>> On 2016=EB=85=84 05=EC=9B=94 28=EC=9D=BC 00:29, Rob Herring wrote:
> >>>> On Thu, May 26, 2016 at 05:17:45PM +0530, Venkat Reddy Talla wrote:
> >>>>> Add the support for Device tree bindings of extcon-gpio driver.
> >>>>> The extcon-gpio device tree node must include the both 'extcon-id'
> and
> >>>>> 'gpios' property.
> >>>>
> >>>> I think extcon bindings are a mess in general...
> >>>>
> >>>>> For example:
> >>>>>     usb_cable: extcon-gpio-0 {
> >>>>>             compatible =3D "extcon-gpio";
> >>>>>             extcon-id =3D <EXTCON_USB>;
> >>>>>             gpios =3D <&gpio6 1 GPIO_ACTIVE_HIGH>;
> >>>>>     }
> >>>>>     ta_cable: extcon-gpio-1 {
> >>>>>             compatible =3D "extcon-gpio";
> >>>>>             extcon-id =3D <EXTCON_CHG_USB_DCP>;
> >>>>>             gpios =3D <&gpio3 2 GPIO_ACTIVE_LOW>;
> >>>>>             debounce-ms =3D <50>;     /* 50 millisecond */
> >>>>>             wakeup-source;
> >>>>>     }
> >>>>
> >>>> This is all 1 logical connector, the USB connector. Why are you
> >>>> describing cables? Those are not part of the h/w and are dynamic.
> >>>> Describe this as a connector which is one thing (i.e. node). Use a
> >>>> compatible string that reflects the type of connector
> >>>> (usb-microab-connector), not the driver you want to use. Then define
> >>>> GPIO lines needed to provide state information like VBus, ID, charge=
r
> >>>> modes and control lines like soft connect (D+ pullup enable), VBus
> >>>> enable, etc.
> >>>
> >>> You're right. The extcon-gpio driver will not use the "extcon-gpio"
> raw compatible.
> >>> As you commented[1], the each connector will have the unique name to
> use the extcon-gpio.c driver.
> >>> [1] https://lkml.org/lkml/2015/10/21/906
> >>>
> >>>
> >>> For example,
> >>> The extcon-gpio.c driver may have the different name including the h/=
w
> information
> >>> according to the kind of external connector.
> >>>
> >>> static const struct of_device_id gpio_extcon_of_match[] =3D {
> >>>       {
> >>>               .compatible =3D "extcon-chg-sdp", /* SDP charger connec=
tor
> */
> >>>               .data =3D EXTCON_CHG_SDP_DATA,
> >>>       }, {
> >>>               .compatible =3D "extcon-chg-dcp", /* DCP charger connec=
tor
> */
> >>>               .data =3D EXTCON_CHG_DCP_DATA,
> >>>       }, {
> >>>               .compatible =3D "extcon-jack-microphone", /* Microphone
> jack connector */
> >>>               .data =3D EXTCON_JACK_MICROPHONE_DATA,
> >>>       }, {
> >>>               .compatible =3D "extcon-disp-hdmi", /* HDMI connector*/
> >>>               .data =3D EXTCON_DISP_HDMI_DATA,
> >>>       },
> >>>       ......
> >>> };
> >>
> >> I reply it again.
> >>
> >> The extcon-gpio.c is very similar with existing gpio_keys.c driver[1]
> >> [1] drivers/input/keyboard/gpio_keys.c
> >
> > There is a big difference in that each gpio-key is independent. The
> > only state is pressed or not. A USB connector has multiple pieces of
> > state information. You may be treating them independently, but I don't
> > think they should be.
>
> I think that is it not different because the EXTCON can only notify the
> whether
> external connector is attached or detached such as gpio-key (pressed or
> not).
>
> EXTCON don't handle the any additional state except for attached or
> detached.
>
> >
> >> The gpio_keys.c driver use the following style to support the
> device-tree.
> >> It use the "gpio-keys" compatible and this dt node include the specifi=
c
> >> 'key code' such as 'extcon-id =3D <EXTCON_CHG_USB_DCP>;'
> >
> > This is state information about what is currently attached. The
> > analogy with gpio-keys would be multiple key codes on one gpio which
> > would be broken...
>
> I compared between 'gpis-keys'  and ' extcon-gpio' driver as following:
>
> name      | gpio-keys                         | extcon-gpio
>
> -------------------------------------------------------------------------=
--------------------
> gpio        | gpios =3D <>                        | extcon-gpio =3D <>
>
> -------------------------------------------------------------------------=
--------------------
> type        | linux,code =3D <>                 | extcon-id =3D <>
>
> -------------------------------------------------------------------------=
--------------------
> key &      | KEY_POWER                  | EXTCON_USB
> extcon id | KEY_VOLUME_UP         | EXTCON_CHG_USB_SDP
>                | KEY_VOLUME_DOWN   | EXTCON_JACK_MICROPHONE
>                | etc                                    | etc
>
> -------------------------------------------------------------------------=
--------------------
> state       | pressed or not                  | attached or detached
>
> -------------------------------------------------------------------------=
--------------------
>
> >
> >>
> >>         gpio_keys {
> >>                 compatible =3D "gpio-keys";
> >>
> >>                 power_key {
> >>                         gpios =3D <&gpx2 7 GPIO_ACTIVE_LOW>;
> >>                         linux,code =3D <KEY_POWER>;
> >>                         label =3D "power key";
> >>                         debounce-interval =3D <10>;
> >>                         wakeup-source;
> >>                 };
> >>         };
> >>
> >> If the extcon-gpio.c driver should have the separate compatible
> according to
> >> the kind of external connector, the list of compatible name of
> extcon-gpio.c driver
> >> will be increased when new external connector is attached.
> >
> > So? Different h/w needs different compatible strings.
> >
> > But again, you are mixing describing the connector (only what is
> > soldered on a board) and state information (what is attached). Do not
> > put state information into DT (describe the gpio signals or chip that
> > provides the state information).
> >
> >> The extcon-gpio.c driver can separate the kind of external connector
> >> by using the 'extcon-id' property.
> >
> > This use of DT is just broken. Come up with another way.
> >
> > Rob
>
> Thanks,
> Chanwoo Choi
>

--94eb2c07ceaca23eb90534405f9f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Rob,<div><br></div><div>I&#39;m expecting your reply about comparision b=
etween gpio-keys and extcon-gpio. I think two drivers are very similar as f=
ollowing.</div><div><br></div><div>Thanks,</div><div>Chanwoo Choi<br><br>20=
16=EB=85=84 5=EC=9B=94 31=EC=9D=BC =ED=99=94=EC=9A=94=EC=9D=BC, Chanwoo Cho=
i&lt;<a href=3D"mailto:cwchoi00@gmail.com">cwchoi00@gmail.com</a>&gt;=EB=8B=
=98=EC=9D=B4 =EC=9E=91=EC=84=B1=ED=95=9C =EB=A9=94=EC=8B=9C=EC=A7=80:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">Hi Rob,<br>
<br>
On Tue, May 31, 2016 at 10:35 PM, Rob Herring &lt;<a href=3D"javascript:;" =
onclick=3D"_e(event, &#39;cvml&#39;, &#39;robh@kernel.org&#39;)">robh@kerne=
l.org</a>&gt; wrote:<br>
&gt; On Tue, May 31, 2016 at 2:35 AM, Chanwoo Choi &lt;<a href=3D"javascrip=
t:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;cw00.choi@samsung.com&#39;)"=
>cw00.choi@samsung.com</a>&gt; wrote:<br>
&gt;&gt; Hi Rob,<br>
&gt;&gt;<br>
&gt;&gt; On 2016=EB=85=84 05=EC=9B=94 31=EC=9D=BC 15:44, Chanwoo Choi wrote=
:<br>
&gt;&gt;&gt; On 2016=EB=85=84 05=EC=9B=94 28=EC=9D=BC 00:29, Rob Herring wr=
ote:<br>
&gt;&gt;&gt;&gt; On Thu, May 26, 2016 at 05:17:45PM +0530, Venkat Reddy Tal=
la wrote:<br>
&gt;&gt;&gt;&gt;&gt; Add the support for Device tree bindings of extcon-gpi=
o driver.<br>
&gt;&gt;&gt;&gt;&gt; The extcon-gpio device tree node must include the both=
 &#39;extcon-id&#39; and<br>
&gt;&gt;&gt;&gt;&gt; &#39;gpios&#39; property.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I think extcon bindings are a mess in general...<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; For example:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0usb_cable: extcon-gpio-0 {<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compati=
ble =3D &quot;extcon-gpio&quot;;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extcon-=
id =3D &lt;EXTCON_USB&gt;;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpios =
=3D &lt;&amp;gpio6 1 GPIO_ACTIVE_HIGH&gt;;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0ta_cable: extcon-gpio-1 {<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compati=
ble =3D &quot;extcon-gpio&quot;;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extcon-=
id =3D &lt;EXTCON_CHG_USB_DCP&gt;;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpios =
=3D &lt;&amp;gpio3 2 GPIO_ACTIVE_LOW&gt;;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debounc=
e-ms =3D &lt;50&gt;;=C2=A0 =C2=A0 =C2=A0/* 50 millisecond */<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wakeup-=
source;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; This is all 1 logical connector, the USB connector. Why ar=
e you<br>
&gt;&gt;&gt;&gt; describing cables? Those are not part of the h/w and are d=
ynamic.<br>
&gt;&gt;&gt;&gt; Describe this as a connector which is one thing (i.e. node=
). Use a<br>
&gt;&gt;&gt;&gt; compatible string that reflects the type of connector<br>
&gt;&gt;&gt;&gt; (usb-microab-connector), not the driver you want to use. T=
hen define<br>
&gt;&gt;&gt;&gt; GPIO lines needed to provide state information like VBus, =
ID, charger<br>
&gt;&gt;&gt;&gt; modes and control lines like soft connect (D+ pullup enabl=
e), VBus<br>
&gt;&gt;&gt;&gt; enable, etc.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; You&#39;re right. The extcon-gpio driver will not use the &quo=
t;extcon-gpio&quot; raw compatible.<br>
&gt;&gt;&gt; As you commented[1], the each connector will have the unique n=
ame to use the extcon-gpio.c driver.<br>
&gt;&gt;&gt; [1] <a href=3D"https://lkml.org/lkml/2015/10/21/906" target=3D=
"_blank">https://lkml.org/lkml/2015/10/21/906</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; For example,<br>
&gt;&gt;&gt; The extcon-gpio.c driver may have the different name including=
 the h/w information<br>
&gt;&gt;&gt; according to the kind of external connector.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; static const struct of_device_id gpio_extcon_of_match[] =3D {<=
br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compati=
ble =3D &quot;extcon-chg-sdp&quot;, /* SDP charger connector */<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =
=3D EXTCON_CHG_SDP_DATA,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compati=
ble =3D &quot;extcon-chg-dcp&quot;, /* DCP charger connector */<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =
=3D EXTCON_CHG_DCP_DATA,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compati=
ble =3D &quot;extcon-jack-microphone&quot;, /* Microphone jack connector */=
<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =
=3D EXTCON_JACK_MICROPHONE_DATA,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compati=
ble =3D &quot;extcon-disp-hdmi&quot;, /* HDMI connector*/<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =
=3D EXTCON_DISP_HDMI_DATA,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0......<br>
&gt;&gt;&gt; };<br>
&gt;&gt;<br>
&gt;&gt; I reply it again.<br>
&gt;&gt;<br>
&gt;&gt; The extcon-gpio.c is very similar with existing gpio_keys.c driver=
[1]<br>
&gt;&gt; [1] drivers/input/keyboard/gpio_keys.c<br>
&gt;<br>
&gt; There is a big difference in that each gpio-key is independent. The<br=
>
&gt; only state is pressed or not. A USB connector has multiple pieces of<b=
r>
&gt; state information. You may be treating them independently, but I don&#=
39;t<br>
&gt; think they should be.<br>
<br>
I think that is it not different because the EXTCON can only notify the whe=
ther<br>
external connector is attached or detached such as gpio-key (pressed or not=
).<br>
<br>
EXTCON don&#39;t handle the any additional state except for attached or det=
ached.<br>
<br>
&gt;<br>
&gt;&gt; The gpio_keys.c driver use the following style to support the devi=
ce-tree.<br>
&gt;&gt; It use the &quot;gpio-keys&quot; compatible and this dt node inclu=
de the specific<br>
&gt;&gt; &#39;key code&#39; such as &#39;extcon-id =3D &lt;EXTCON_CHG_USB_D=
CP&gt;;&#39;<br>
&gt;<br>
&gt; This is state information about what is currently attached. The<br>
&gt; analogy with gpio-keys would be multiple key codes on one gpio which<b=
r>
&gt; would be broken...<br>
<br>
I compared between &#39;gpis-keys&#39;=C2=A0 and &#39; extcon-gpio&#39; dri=
ver as following:<br>
<br>
name=C2=A0 =C2=A0 =C2=A0 | gpio-keys=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| extcon-gpio<br>
---------------------------------------------------------------------------=
------------------<br>
gpio=C2=A0 =C2=A0 =C2=A0 =C2=A0 | gpios =3D &lt;&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | extcon-gpi=
o =3D &lt;&gt;<br>
---------------------------------------------------------------------------=
------------------<br>
type=C2=A0 =C2=A0 =C2=A0 =C2=A0 | linux,code =3D &lt;&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| extcon-id =3D &lt;&gt;<br>
---------------------------------------------------------------------------=
------------------<br>
key &amp;=C2=A0 =C2=A0 =C2=A0 | KEY_POWER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | EXTCON_USB<br>
extcon id | KEY_VOLUME_UP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| EXTCON_CHG_USB=
_SDP<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| KEY_VOLUME_DOWN=C2=
=A0 =C2=A0| EXTCON_JACK_MICROPHONE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| etc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | etc<br>
---------------------------------------------------------------------------=
------------------<br>
state=C2=A0 =C2=A0 =C2=A0 =C2=A0| pressed or not=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | attached or detached<br>
---------------------------------------------------------------------------=
------------------<br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio_keys {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compa=
tible =3D &quot;gpio-keys&quot;;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0power=
_key {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0gpios =3D &lt;&amp;gpx2 7 GPIO_ACTIVE_LOW&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0linux,code =3D &lt;KEY_POWER&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;power key&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0debounce-interval =3D &lt;10&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0wakeup-source;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;<br>
&gt;&gt; If the extcon-gpio.c driver should have the separate compatible ac=
cording to<br>
&gt;&gt; the kind of external connector, the list of compatible name of ext=
con-gpio.c driver<br>
&gt;&gt; will be increased when new external connector is attached.<br>
&gt;<br>
&gt; So? Different h/w needs different compatible strings.<br>
&gt;<br>
&gt; But again, you are mixing describing the connector (only what is<br>
&gt; soldered on a board) and state information (what is attached). Do not<=
br>
&gt; put state information into DT (describe the gpio signals or chip that<=
br>
&gt; provides the state information).<br>
&gt;<br>
&gt;&gt; The extcon-gpio.c driver can separate the kind of external connect=
or<br>
&gt;&gt; by using the &#39;extcon-id&#39; property.<br>
&gt;<br>
&gt; This use of DT is just broken. Come up with another way.<br>
&gt;<br>
&gt; Rob<br>
<br>
Thanks,<br>
Chanwoo Choi<br>
</blockquote></div>

--94eb2c07ceaca23eb90534405f9f--
