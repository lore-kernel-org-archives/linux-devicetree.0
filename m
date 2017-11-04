Return-Path: <SRS0=Gwv8=CC=gmail.com=geomatsi@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMty3ZCs8kq1vUGLOi0ZghY7n0iXgUQ1E=ngBO6Y4wm7wMLF7Q@mail.gmail.com>
References: <20171103195855.15283-1-geomatsi@gmail.com> <20171103195855.15283-2-geomatsi@gmail.com>
 <CAMty3ZCs8kq1vUGLOi0ZghY7n0iXgUQ1E=ngBO6Y4wm7wMLF7Q@mail.gmail.com>
From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 4 Nov 2017 18:39:23 +0300
Message-ID: <CAFGfvX4f8hFACySyyo_syKJViDeww39UGrTO-hWjAQfWr7gWcA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: orange-pi-zero-plus2: fix sdcard detect
Content-Type: multipart/alternative; boundary="001a114446cc9627a2055d2a06d6"
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

--001a114446cc9627a2055d2a06d6
Content-Type: text/plain; charset="UTF-8"

> Hi,
>


> > The sdcard detect pin on orange-pi-zero-plus2 is pulled up.
> > Fix cd-gpio description to enable sdcard detect.
> >
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> > index b6b7a561df8c..a42fd79a62a3 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> > @@ -71,7 +71,7 @@
> >         pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin>;
> >         vmmc-supply = <&reg_vcc3v3>;
> >         bus-width = <4>;
> > -       cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
> > +       cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;
>
> Was able to detect and do mount with existing dts


Did you try to boot from sdcard ? I am not able to boot my board from
sd-card without this change.
As I mentioned earlier in my email to buildroot mailing list, with mmc
debug enabled I see that mmc
tries to init sd-card when I remove it from the slot.

Maybe there is a minor differences between h/w versions or batches ? What
is you board version ?
My board is v1.0.


Regards,
Sergey

--001a114446cc9627a2055d2a06d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><span class=3D"">Hi,<br></span></=
blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""=
>
&gt; The sdcard detect pin on orange-pi-zero-plus2 is pulled up.<br>
&gt; Fix cd-gpio description to enable sdcard detect.<br>
&gt;<br>
&gt; Signed-off-by: Sergey Matyukevich &lt;<a href=3D"mailto:geomatsi@gmail=
.com">geomatsi@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm64/boot/dts/allwinner/<wbr>sun50i-h5-orangepi-zero-plus2=
.<wbr>dts | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/arch/arm64/boot/dts/<wbr>allwinner/sun50i-h5-orangepi-<wb=
r>zero-plus2.dts b/arch/arm64/boot/dts/<wbr>allwinner/sun50i-h5-orangepi-<w=
br>zero-plus2.dts<br>
&gt; index b6b7a561df8c..a42fd79a62a3 100644<br>
&gt; --- a/arch/arm64/boot/dts/<wbr>allwinner/sun50i-h5-orangepi-<wbr>zero-=
plus2.dts<br>
&gt; +++ b/arch/arm64/boot/dts/<wbr>allwinner/sun50i-h5-orangepi-<wbr>zero-=
plus2.dts<br>
&gt; @@ -71,7 +71,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;mmc0_pins_a&gt=
;, &lt;&amp;mmc0_cd_pin&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmmc-supply =3D &lt;&amp;reg_vcc3v3&g=
t;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-width =3D &lt;4&gt;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cd-gpios =3D &lt;&amp;pio 5 6 GPIO_ACTIVE_=
HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cd-gpios =3D &lt;&amp;pio 5 6 GPIO_ACTIVE_=
LOW&gt;;<br>
<br>
</span>Was able to detect and do mount with existing dts</blockquote><div><=
br></div><div>Did you try to boot from sdcard ? I am not able to boot my bo=
ard from sd-card without this change.</div><div>As I mentioned earlier in m=
y email to buildroot mailing list, with mmc debug enabled I see that mmc</d=
iv><div>tries to init sd-card when I remove it from the slot.</div><div><br=
></div><div>Maybe there is a minor differences between h/w versions or batc=
hes ? What is you board version ?</div><div>My board is v1.0.</div><div><br=
></div><div><br></div><div>Regards,</div><div>Sergey</div></div></div></div=
>

--001a114446cc9627a2055d2a06d6--
