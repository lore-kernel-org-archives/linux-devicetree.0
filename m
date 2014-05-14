Return-Path: <matthias.bgg@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cebe44ba-c543-4f4a-9aeb-810156fe8250@BN1AFFO11FD036.protection.gbl>
References: <1400087579-4250-1-git-send-email-matthias.bgg@gmail.com>
	<1400087579-4250-3-git-send-email-matthias.bgg@gmail.com>
	<cebe44ba-c543-4f4a-9aeb-810156fe8250@BN1AFFO11FD036.protection.gbl>
Date: Wed, 14 May 2014 23:04:46 +0200
Message-ID: <CABuKBeK-ypwHkKkfwQohSo20qNtJDWby7gQRYwX8Ke8gRjqp1Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] dt-bindings: add mtk-timer bindings
From: Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c16fc6c16f6c04f9628711
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
Cc: Florian Vaussard <florian.vaussard@epfl.ch>, Kumar Gala <galak@codeaurora.org>, mark.rutland@arm.com, thierry.reding@gmail.com, linux-doc@vger.kernel.org, andrew@lunn.ch, tglx@linutronix.de, linux@arm.linux.org.uk, sboyd@codeaurora.org, ijc+devicetree@hellion.org.uk, daniel.lezcano@linaro.org, maxime.ripard@free-electrons.com, rdunlap@infradead.org, olof@lixom.net, robherring2@gmail.com, pawel.moll@arm.com, devicetree@vger.kernel.org, jason@lakedaemon.net, robh+dt@kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org, sebastian.hesselbarth@gmail.com, silvio.fricke@gmail.com, linux-arm-kernel@lists.infradead.org, heiko.stuebner@bq.com, jic23@kernel.org, gregory.clement@free-electrons.com, marc.zyngier@arm.com
List-ID: <devicetree@vger.kernel.org>

--001a11c16fc6c16f6c04f9628711
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

El dia 14/05/2014 19:46, "S=C3=B6ren Brinkmann" <soren.brinkmann@xilinx.com=
> va
escriure:
>
> Hi Matthias,
>
> On Wed, 2014-05-14 at 07:12PM +0200, Matthias Brugger wrote:
> > Add binding documentation for the General Porpose Timer driver of
> > the Mediatek SoCs.
> >
> > Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> > ---
> >  .../devicetree/bindings/timer/mediatek,mtk-timer.txt   | 18
++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644
Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> >
> > diff --git
a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> > new file mode 100644
> > index 0000000..938adf6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> > @@ -0,0 +1,18 @@
> > +Mediatek MT6589, MT6577 and MT6572 Timers
> > +---------------------------------------
> > +
> > +Required properties:
> > +- compatible: Should be "mediatek,mtk6589-timer"
>
> Don't you want compatible strings for the other supported SOCs too?
>

I'm not sure if it makes sense to define the compatible strings for all the
SoCs that have this timer as it's actually totally the same IP.

In other cases e.g. the arm gic, not all compatible strings are defined,
that's why I use cortex-a15-gic in the dtsi although I'm using a cortex A7
SoC.

I would instead say, that the SoC version of the compatible string, mt6589,
is something arbitrary. So I propose to use the first known SoC which uses
the timer. That would be AFAIK mt6577.

> > +- reg: Should contain location and length for timers register.
> > +- clocks: Clocks driving the timer hardware. This list shoud include
two
> > +     clocks. The order is system clock and as second clock the RTC
clock.
>
> Sorry for being pedantic, but we had so many ugly bindings in our vendor
> tree. I'm still getting caught up on the clocks. I have the feeling the
SOC
> has two clocks (system and rtc) which are used to drive this timer,
> while the timer probably refers differently to its clock inputs.
> If this was the case, the names 'rtc' and 'system' clock are SOC specific
> names/implementation details. From the timer perspective it is probably
> just important that it receives two clock inputs. Since the timer is
> described here and not the SOC, these SOC specific names should
> disappear and be replaced with the names the timer IP uses for its input
> clocks.

The timer is exactly identically described in the three SoC datasheets. In
the description the clocks are called system and RTC, so I think we are on
the safe side here. :)

>
> The clock-names should be listed too, probably as optional properties.

This will lead to a problem, as the clock-names description includes the
order of the clocks. If we make this property optional, it can be easily
missunderstood. So I propose to do it the way other drivers in the kernel
(e.g. arm,sp804) do it and leave the clock-names property as it is.

>
> > +
> > +Examples:
> > +
> > +     timer {
> > +             compatible =3D "mediatek,mtk6589-timer";
> > +             reg =3D <0x10008000 0x80>;
> > +             interrupts =3D <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
> > +             clocks =3D <&system_clk>, <&rtc_clk>;
> > +             clock-names =3D "system-clk", "rtc-clk";
>
>
>         S=C3=B6ren

--001a11c16fc6c16f6c04f9628711
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
El dia 14/05/2014 19:46, &quot;S=C3=B6ren Brinkmann&quot; &lt;<a href=3D"ma=
ilto:soren.brinkmann@xilinx.com">soren.brinkmann@xilinx.com</a>&gt; va escr=
iure:<br>
&gt;<br>
&gt; Hi Matthias,<br>
&gt;<br>
&gt; On Wed, 2014-05-14 at 07:12PM +0200, Matthias Brugger wrote:<br>
&gt; &gt; Add binding documentation for the General Porpose Timer driver of=
<br>
&gt; &gt; the Mediatek SoCs.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Matthias Brugger &lt;<a href=3D"mailto:matthias.bg=
g@gmail.com">matthias.bgg@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0.../devicetree/bindings/timer/mediatek,mtk-timer.txt =C2=A0=
 | 18 ++++++++++++++++++<br>
&gt; &gt; =C2=A01 file changed, 18 insertions(+)<br>
&gt; &gt; =C2=A0create mode 100644 Documentation/devicetree/bindings/timer/=
mediatek,mtk-timer.txt<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk=
-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt=
<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..938adf6<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.=
txt<br>
&gt; &gt; @@ -0,0 +1,18 @@<br>
&gt; &gt; +Mediatek MT6589, MT6577 and MT6572 Timers<br>
&gt; &gt; +---------------------------------------<br>
&gt; &gt; +<br>
&gt; &gt; +Required properties:<br>
&gt; &gt; +- compatible: Should be &quot;mediatek,mtk6589-timer&quot;<br>
&gt;<br>
&gt; Don&#39;t you want compatible strings for the other supported SOCs too=
?<br>
&gt;</p>
<p dir=3D"ltr">I&#39;m not sure if it makes sense to define the compatible =
strings for all the SoCs that have this timer as it&#39;s actually totally =
the same IP.</p>
<p dir=3D"ltr">In other cases e.g. the arm gic, not all compatible strings =
are defined, that&#39;s why I use cortex-a15-gic in the dtsi although I&#39=
;m using a cortex A7 SoC.</p>
<p dir=3D"ltr">I would instead say, that the SoC version of the compatible =
string, mt6589, is something arbitrary. So I propose to use the first known=
 SoC which uses the timer. That would be AFAIK mt6577.</p>
<p dir=3D"ltr">&gt; &gt; +- reg: Should contain location and length for tim=
ers register.<br>
&gt; &gt; +- clocks: Clocks driving the timer hardware. This list shoud inc=
lude two<br>
&gt; &gt; + =C2=A0 =C2=A0 clocks. The order is system clock and as second c=
lock the RTC clock.<br>
&gt;<br>
&gt; Sorry for being pedantic, but we had so many ugly bindings in our vend=
or<br>
&gt; tree. I&#39;m still getting caught up on the clocks. I have the feelin=
g the SOC<br>
&gt; has two clocks (system and rtc) which are used to drive this timer,<br=
>
&gt; while the timer probably refers differently to its clock inputs.<br>
&gt; If this was the case, the names &#39;rtc&#39; and &#39;system&#39; clo=
ck are SOC specific<br>
&gt; names/implementation details. From the timer perspective it is probabl=
y<br>
&gt; just important that it receives two clock inputs. Since the timer is<b=
r>
&gt; described here and not the SOC, these SOC specific names should<br>
&gt; disappear and be replaced with the names the timer IP uses for its inp=
ut<br>
&gt; clocks.</p>
<p dir=3D"ltr">The timer is exactly identically described in the three SoC =
datasheets. In the description the clocks are called system and RTC, so I t=
hink we are on the safe side here. :)</p>
<p dir=3D"ltr">&gt;<br>
&gt; The clock-names should be listed too, probably as optional properties.=
</p>
<p dir=3D"ltr">This will lead to a problem, as the clock-names description =
includes the order of the clocks. If we make this property optional, it can=
 be easily missunderstood. So I propose to do it the way other drivers in t=
he kernel (e.g. arm,sp804) do it and leave the clock-names property as it i=
s.</p>

<p dir=3D"ltr">&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +Examples:<br>
&gt; &gt; +<br>
&gt; &gt; + =C2=A0 =C2=A0 timer {<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;=
mediatek,mtk6589-timer&quot;;<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x1000800=
0 0x80&gt;;<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D &lt;GI=
C_SPI 113 IRQ_TYPE_LEVEL_LOW&gt;;<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&amp;s=
ystem_clk&gt;, &lt;&amp;rtc_clk&gt;;<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-names =3D &quot=
;system-clk&quot;, &quot;rtc-clk&quot;;<br>
&gt;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 S=C3=B6ren<br>
</p>

--001a11c16fc6c16f6c04f9628711--
