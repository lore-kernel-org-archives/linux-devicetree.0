Return-Path: <SRS0=sd1/=CC=amarulasolutions.com=jagan@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20171104154221.ao7kkcwqhnja3cxe@speedy.hunter>
References: <20171103195855.15283-1-geomatsi@gmail.com> <20171103195855.15283-2-geomatsi@gmail.com>
 <CAMty3ZCs8kq1vUGLOi0ZghY7n0iXgUQ1E=ngBO6Y4wm7wMLF7Q@mail.gmail.com> <20171104154221.ao7kkcwqhnja3cxe@speedy.hunter>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sat, 4 Nov 2017 21:17:48 +0530
Message-ID: <CAMty3ZCxXUaBf3t=3d7D+RU6rp83oJw8BHADU3TYDeM4Vx_k-w@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: orange-pi-zero-plus2: fix sdcard detect
Content-Type: multipart/alternative; boundary="94eb2c1af6c8cd8e1c055d2a2409"
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

--94eb2c1af6c8cd8e1c055d2a2409
Content-Type: text/plain; charset="UTF-8"

On 04-Nov-2017 9:12 PM, "Sergey Matyukevich" <geomatsi@gmail.com> wrote:

> > The sdcard detect pin on orange-pi-zero-plus2 is pulled up.
> > Fix cd-gpio description to enable sdcard detect.
> >
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
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
sd-card without this change. As I mentioned earlier in my email
to buildroot mailing list, with mmc debug enabled I see that mmc
tries to init sd-card when I remove it from the slot.

Maybe there is a minor differences between h/w versions or batches ?
What is you board version ? I tested on board v1.0.


I'm using same v1.0

--94eb2c1af6c8cd8e1c055d2a2409
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On 04-Nov-2017 9:12 PM, &quot;Sergey Matyukevich&quot; &lt;<a hre=
f=3D"mailto:geomatsi@gmail.com">geomatsi@gmail.com</a>&gt; wrote:<br type=
=3D"attribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div class=3D"quoted-text">&gt; &=
gt; The sdcard detect pin on orange-pi-zero-plus2 is pulled up.<br>
&gt; &gt; Fix cd-gpio description to enable sdcard detect.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Sergey Matyukevich &lt;<a href=3D"mailto:geomatsi@=
gmail.com">geomatsi@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 arch/arm64/boot/dts/allwinner/<wbr>sun50i-h5-orangepi-zero-=
plus2.<wbr>dts | 2 +-<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/arch/arm64/boot/dts/<wbr>allwinner/sun50i-h5-orangep=
i-<wbr>zero-plus2.dts b/arch/arm64/boot/dts/<wbr>allwinner/sun50i-h5-orange=
pi-<wbr>zero-plus2.dts<br>
&gt; &gt; index b6b7a561df8c..a42fd79a62a3 100644<br>
&gt; &gt; --- a/arch/arm64/boot/dts/<wbr>allwinner/sun50i-h5-orangepi-<wbr>=
zero-plus2.dts<br>
&gt; &gt; +++ b/arch/arm64/boot/dts/<wbr>allwinner/sun50i-h5-orangepi-<wbr>=
zero-plus2.dts<br>
&gt; &gt; @@ -71,7 +71,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;mmc0_pins=
_a&gt;, &lt;&amp;mmc0_cd_pin&gt;;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmmc-supply =3D &lt;&amp;reg_vcc=
3v3&gt;;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-width =3D &lt;4&gt;;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cd-gpios =3D &lt;&amp;pio 5 6 GPIO_AC=
TIVE_HIGH&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cd-gpios =3D &lt;&amp;pio 5 6 GPIO_AC=
TIVE_LOW&gt;;<br>
&gt;<br>
&gt; Was able to detect and do mount with existing dts<br>
<br>
</div><div class=3D"quoted-text">Did you try to boot from sdcard ? I am not=
 able to boot my board from<br>
sd-card without this change. As I mentioned earlier in my email<br>
to buildroot mailing list, with mmc debug enabled I see that mmc<br>
tries to init sd-card when I remove it from the slot.<br>
<br>
Maybe there is a minor differences between h/w versions or batches ?<br>
</div>What is you board version ? I tested on board v1.0.<br></blockquote><=
/div></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m usin=
g same v1.0</div><div dir=3D"auto"><div class=3D"gmail_extra"><div class=3D=
"gmail_quote"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
</blockquote></div><br></div></div></div>

--94eb2c1af6c8cd8e1c055d2a2409--
