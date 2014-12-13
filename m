Return-Path: <vishnupatekar0510@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGb2v65xpUhiMzSKu_1+JGNbg3oFdpw2EQ+JGUYkivCtG2O6gw@mail.gmail.com>
References: <1418408748-9797-1-git-send-email-vishnupatekar0510@gmail.com>
	<1418408748-9797-6-git-send-email-vishnupatekar0510@gmail.com>
	<CAGb2v65xpUhiMzSKu_1+JGNbg3oFdpw2EQ+JGUYkivCtG2O6gw@mail.gmail.com>
Date: Sat, 13 Dec 2014 08:48:13 +0530
Message-ID: <CAEzqOZtOycU5LT8b3SHOymMpMOMExGC9PHiZ9wHtAjxR2R5+Ew@mail.gmail.com>
Subject: Re: [PATCHv3 5/5] ARM: sunxi: dts: Add note ps2 pins conflict with hdmi
From: Vishnu Patekar <vishnupatekar0510@gmail.com>
Content-Type: multipart/alternative; boundary=047d7ba97f2aa5be57050a107520
To: Chen-Yu Tsai <wens@csie.org>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans De Goede <hdegoede@redhat.com>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "msalter@redhat.com" <msalter@redhat.com>, linux-kernel <linux-kernel@vger.kernel.org>, "ralf@linux-mips.org" <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, "jdelvare@suse.de" <jdelvare@suse.de>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

--047d7ba97f2aa5be57050a107520
Content-Type: text/plain; charset=UTF-8

Hello Chen-Yu,
Thank you for pointing out styling error.

On Sat, Dec 13, 2014 at 7:36 AM, Chen-Yu Tsai <wens@csie.org> wrote:
>
> Hi,
>
> On Sat, Dec 13, 2014 at 2:25 AM, VishnuPatekar
> <vishnupatekar0510@gmail.com> wrote:
> > 1. Please note that ps20 pins conflict with HDMI on Lime2 Board
> > so, by deault ps20 and ps21 are disabled for Lime2 Board.
> > There is no on board ps2 connector and these pins can be used
> > for different purpose.
> >
> > Signed-off-by: VishnuPatekar <vishnupatekar0510@gmail.com>
> > ---
> >  arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts |    6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
> b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
> > index ed364d5..951b615 100644
> > --- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
> > +++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
> > @@ -112,7 +112,11 @@
> >                         pinctrl-0 = <&uart0_pins_a>;
> >                         status = "okay";
> >                 };
> > -
> > +
> > +               /* PS2 0 and PS2 1 are disabled by default; Please note
> that
> > +               ps20 pins conflict with HDMI on Lime2 Board
> > +               */
> > +
>
> Multi-line comments should be:
>
> /*
>  * line 1
>  * line 2
>  * ...
>  */
>
Okie.

>
> And why is there a delete and insert for an empty line?
> Weird... though git seems to ignore it when applying.
>
I used clean_patch to clear the styling error. that might have modified it.



>
> ChenYu
>
> >                 i2c0: i2c@01c2ac00 {
> >                         pinctrl-names = "default";
> >                         pinctrl-0 = <&i2c0_pins_a>;
> > --
> > 1.7.9.5
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

--047d7ba97f2aa5be57050a107520
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Chen-Yu,<div>Thank you for pointing out styling erro=
r.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sat, D=
ec 13, 2014 at 7:36 AM, Chen-Yu Tsai <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:wens@csie.org" target=3D"_blank">wens@csie.org</a>&gt;</span> wrote:<bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Hi,<br>
<span class=3D""><br>
On Sat, Dec 13, 2014 at 2:25 AM, VishnuPatekar<br>
&lt;<a href=3D"mailto:vishnupatekar0510@gmail.com">vishnupatekar0510@gmail.=
com</a>&gt; wrote:<br>
&gt; 1. Please note that ps20 pins conflict with HDMI on Lime2 Board<br>
&gt; so, by deault ps20 and ps21 are disabled for Lime2 Board.<br>
&gt; There is no on board ps2 connector and these pins can be used<br>
&gt; for different purpose.<br>
&gt;<br>
&gt; Signed-off-by: VishnuPatekar &lt;<a href=3D"mailto:vishnupatekar0510@g=
mail.com">vishnupatekar0510@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts |=C2=A0 =C2=A0 6=
 +++++-<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts b/arch/ar=
m/boot/dts/sun7i-a20-olinuxino-lime2.dts<br>
&gt; index ed364d5..951b615 100644<br>
&gt; --- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts<br>
&gt; +++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts<br>
&gt; @@ -112,7 +112,11 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;uart0_pins_a&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; -<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* PS2 0 and P=
S2 1 are disabled by default; Please note that<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ps20 pins conf=
lict with HDMI on Lime2 Board<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +<br>
<br>
</span>Multi-line comments should be:<br>
<br>
/*<br>
=C2=A0* line 1<br>
=C2=A0* line 2<br>
=C2=A0* ...<br>
=C2=A0*/<br></blockquote><div>Okie.=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<br>
And why is there a delete and insert for an empty line?<br>
Weird... though git seems to ignore it when applying.<br></blockquote><div>=
I used clean_patch to clear the styling error. that might have modified it.=
</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
ChenYu<br>
<span class=3D""><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i2c0: i2c=
@01c2ac00 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;i2c0_pins_a&gt;;<br>
&gt; --<br>
&gt; 1.7.9.5<br>
&gt;<br>
&gt;<br>
</span>&gt; _______________________________________________<br>
&gt; linux-arm-kernel mailing list<br>
&gt; <a href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kern=
el@lists.infradead.org</a><br>
&gt; <a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kerne=
l" target=3D"_blank">http://lists.infradead.org/mailman/listinfo/linux-arm-=
kernel</a><br>
</blockquote></div></div></div>

--047d7ba97f2aa5be57050a107520--
