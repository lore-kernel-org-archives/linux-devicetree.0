Return-Path: <SRS0=RtcA=ZC=gmail.com=eddie.cai.linux@kernel.org>
MIME-Version: 1.0
In-Reply-To: <40159140.kOHBSj8v8b@phil>
References: <1484791919-4665-1-git-send-email-eddie.cai@rock-chips.com>
 <1484791919-4665-3-git-send-email-eddie.cai@rock-chips.com> <40159140.kOHBSj8v8b@phil>
From: Eddie Cai <eddie.cai.linux@gmail.com>
Date: Fri, 20 Jan 2017 14:42:53 +0800
Message-ID: <CAJrj+DP8vYd=+OrPVwpWqzG935EC5Utty+4vFVKEDe92vxZ4Gw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: add dts for RK3288-Tinker board
Content-Type: multipart/alternative; boundary=001a114ac30e995c1a054680f599
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Eddie Cai <eddie.cai@rock-chips.com>
List-ID: <devicetree@vger.kernel.org>

--001a114ac30e995c1a054680f599
Content-Type: text/plain; charset=UTF-8

2017-01-19 17:58 GMT+08:00 Heiko Stuebner <heiko@sntech.de>:

> Hi Eddie,
>
> Am Donnerstag, 19. Januar 2017, 10:11:59 CET schrieb Eddie Cai:
> > This patch add basic support for RK3288-Tinker board. We can boot in to
> > rootfs with this patch.
> >
> > Signed-off-by: Eddie Cai <eddie.cai@rock-chips.com>
>
> looks good in general, just some small question down below.
>
> [...]
>
> > +     /*
> > +      * NOTE: vcc_sd isn't hooked up on v1.0 boards where power comes
> from
> > +      * vcc_io directly.  Those boards won't be able to power cycle SD
> cards
> > +      * but it shouldn't hurt to toggle this pin there anyway.
> > +      */
>
> just to clarify, later board will have that pin connected, right?
>
Copy from rk3288-evb.dtsi. forgot to delete it. I will remove it next
version

>
> > +     vcc_sd: sdmmc-regulator {
> > +             compatible = "regulator-fixed";
> > +             gpio = <&gpio7 11 GPIO_ACTIVE_LOW>;
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&sdmmc_pwr>;
> > +             regulator-name = "vcc_sd";
> > +             regulator-min-microvolt = <3300000>;
> > +             regulator-max-microvolt = <3300000>;
> > +             startup-delay-us = <100000>;
> > +             vin-supply = <&vcc_io>;
> > +     };
> > +};
>
> [...]
>
> > +&hdmi {
> > +     #address-cells = <1>;
> > +     #size-cells = <0>;
> > +     #sound-dai-cells = <0>;
> > +     ddc-i2c-bus = <&i2c5>;
> > +     status = "okay";
> > +     /* Don't use vopl for HDMI */
> > +     ports {
> > +             hdmi_in: port {
> > +                     /delete-node/ endpoint@1;
> > +             };
>
> what is the reason for this? You enable both VOPs below and the linux
> display
> subsystem should be able to select an appropriate VOP for output just fine
> on
> its own. So there should be no reason for capping the hdmi's connection to
> one
> of the vops.
>
The VOP big support 4k display. is designed for HDMI  4K display. VOP
little is for other display(eDP, LVDS, Mipi etc)

>
> > +     };
> > +};
>
> [...]
>
> > +&usb_host0_ehci {
> > +     no-relinquish-port;
>
> This seems like an unused/undocumented property
>
I will remove it next version

>
> > +     status = "okay";
> > +};
>
> [...]
>
> > +&vopl {
> > +     status = "okay";
> > +     /* Don't use vopl for HDMI */
> > +     vopl_out: port {
> > +             /delete-node/ endpoint@0;
> > +     };
>
> see comment at the hdmi node
>
> > +};
>
>
> Thanks
> Heiko
>

--001a114ac30e995c1a054680f599
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">2017-01-19 17:58 GMT+08:00 Heiko Stuebner <span dir=3D"ltr">&lt;<a href=
=3D"mailto:heiko@sntech.de" target=3D"_blank">heiko@sntech.de</a>&gt;</span=
>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Eddie,<br>
<span class=3D"gmail-"><br>
Am Donnerstag, 19. Januar 2017, 10:11:59 CET schrieb Eddie Cai:<br>
&gt; This patch add basic support for RK3288-Tinker board. We can boot in t=
o<br>
&gt; rootfs with this patch.<br>
&gt;<br>
&gt; Signed-off-by: Eddie Cai &lt;<a href=3D"mailto:eddie.cai@rock-chips.co=
m">eddie.cai@rock-chips.com</a>&gt;<br>
<br>
</span>looks good in general, just some small question down below.<br>
<br>
[...]<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * NOTE: vcc_sd isn&#39;t hooked up on v1.0 board=
s where power comes from<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * vcc_io directly.=C2=A0 Those boards won&#39;t =
be able to power cycle SD cards<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * but it shouldn&#39;t hurt to toggle this pin t=
here anyway.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
<br>
</span>just to clarify, later board will have that pin connected, right?<br=
></blockquote><div>Copy from rk3288-evb.dtsi. forgot to delete it. I will r=
emove it next version =C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0vcc_sd: sdmmc-regulator {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
regulator-fixed&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio =3D &lt;&amp;gpi=
o7 11 GPIO_ACTIVE_LOW&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &qu=
ot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&am=
p;sdmmc_pwr&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-name =3D &q=
uot;vcc_sd&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-min-microvo=
lt =3D &lt;3300000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-max-microvo=
lt =3D &lt;3300000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0startup-delay-us =3D =
&lt;100000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vin-supply =3D &lt;&a=
mp;vcc_io&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
<br>
</span>[...]<br>
<span class=3D"gmail-"><br>
&gt; +&amp;hdmi {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0#sound-dai-cells =3D &lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ddc-i2c-bus =3D &lt;&amp;i2c5&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Don&#39;t use vopl for HDMI */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ports {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hdmi_in: port {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/delete-node/ endpoint@1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
<br>
</span>what is the reason for this? You enable both VOPs below and the linu=
x display<br>
subsystem should be able to select an appropriate VOP for output just fine =
on<br>
its own. So there should be no reason for capping the hdmi&#39;s connection=
 to one<br>
of the vops.<br></blockquote><div>The VOP big support 4k display. is design=
ed for HDMI =C2=A04K display. VOP little is for other display(eDP, LVDS, Mi=
pi etc)</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
<br>
[...]<br>
<br>
&gt; +&amp;usb_host0_ehci {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0no-relinquish-port;<br>
<br>
This seems like an unused/undocumented property<br></blockquote><div>I will=
 remove it next version=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
<br>
[...]<br>
<span class=3D"gmail-"><br>
&gt; +&amp;vopl {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Don&#39;t use vopl for HDMI */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vopl_out: port {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/delete-node/ endpoin=
t@0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
<br>
</span>see comment at the hdmi node<br>
<br>
&gt; +};<br>
<br>
<br>
Thanks<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">Heiko<br>
</font></span></blockquote></div><br></div></div>

--001a114ac30e995c1a054680f599--
