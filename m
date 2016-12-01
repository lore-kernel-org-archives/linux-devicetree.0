Return-Path: <SRS0=jrXe=XQ=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CABymUCMo=ADmZLhQp4HoUM5DD2AfQH8gzSLaNWTNt0Hxd9tBLA@mail.gmail.com>
References: <1480499418-13905-1-git-send-email-baoyou.xie@linaro.org> <CABymUCMo=ADmZLhQp4HoUM5DD2AfQH8gzSLaNWTNt0Hxd9tBLA@mail.gmail.com>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Thu, 1 Dec 2016 12:42:25 +0800
Message-ID: <CA+DQWkwuaZZPPpVM9uYJiQ+Z=H2pFc9iJ08J61sQ57K5a2h4CQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: zx: add zx296718's topcrm node
Content-Type: multipart/alternative; boundary=001a113f7318b56e5a054291728f
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, catalin.marinas@arm.com, Will Deacon <will.deacon@arm.com>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--001a113f7318b56e5a054291728f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

cause of topcrm node has been add by another patch(
https://www.spinics.net/lists/arm-kernel/msg535883.html)
<https://wx2.qq.com/cgi-bin/mmwebwx-bin/webwxcheckurl?requrl=3Dhttps%3A%2F%=
2Fwww.spinics.net%2Flists%2Farm-kernel%2Fmsg535883.html&skey=3D%40crypt_180=
b6516_03c09cd122d18259116435c82637657d&deviceid=3De227231113535420&pass_tic=
ket=3DLcwX1HPKOyjV9bHO4rred18DfLeMWaWCRblxaVRH93blUR8NJfEP5tB259bk6RcB&opco=
de=3D2&scene=3D1&username=3D@7fde1b1ad7cef9d06704c35a39c01d2d292783bde3d0e6=
e10590ae244337bcc0>
so I will send another patch to support cpu-freq on zx296718.

everyone can ignore this patch.


On 1 December 2016 at 09:54, Jun Nie <jun.nie@linaro.org> wrote:

> 2016-11-30 17:50 GMT+08:00 Baoyou Xie <baoyou.xie@linaro.org>:
> > Enable topcrm clock node for zx296718, which is used for
> > CPU's frequency change.
>
> Please reference other device tree patches title to add a simple title
> with category information. Such as
> arm64: dts: uniphier: change MIO node to SD control node
>
> >
> > Furthermore, this patch adds the CPU clock phandle in CPU's node
> > and uses operating-points-v2 to register operating points.
> >
> > So it can be used by cpufreq-dt driver.
>
> Detail comment should provide more information to support title. So
> topcrm and cpu freq changes shall be split into two patches.
>
> >
> > Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> > ---
> >  arch/arm64/boot/dts/zte/zx296718.dtsi | 43
> +++++++++++++++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/zte/zx296718.dtsi
> b/arch/arm64/boot/dts/zte/zx296718.dtsi
> > index 6b239a3..992158a 100644
> > --- a/arch/arm64/boot/dts/zte/zx296718.dtsi
> > +++ b/arch/arm64/boot/dts/zte/zx296718.dtsi
> > @@ -44,6 +44,7 @@
> >  #include <dt-bindings/input/input.h>
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/clock/zx296718-clock.h>
> >
> >  / {
> >         compatible =3D "zte,zx296718";
> > @@ -81,6 +82,8 @@
> >                         compatible =3D "arm,cortex-a53","arm,armv8";
> >                         reg =3D <0x0 0x0>;
> >                         enable-method =3D "psci";
> > +                       clocks =3D <&topcrm A53_GATE>;
> > +                       operating-points-v2 =3D <&cluster0_opp>;
> >                 };
> >
> >                 cpu1: cpu@1 {
> > @@ -88,6 +91,7 @@
> >                         compatible =3D "arm,cortex-a53","arm,armv8";
> >                         reg =3D <0x0 0x1>;
> >                         enable-method =3D "psci";
> > +                       operating-points-v2 =3D <&cluster0_opp>;
> >                 };
> >
> >                 cpu2: cpu@2 {
> > @@ -95,6 +99,7 @@
> >                         compatible =3D "arm,cortex-a53","arm,armv8";
> >                         reg =3D <0x0 0x2>;
> >                         enable-method =3D "psci";
> > +                       operating-points-v2 =3D <&cluster0_opp>;
> >                 };
> >
> >                 cpu3: cpu@3 {
> > @@ -102,6 +107,38 @@
> >                         compatible =3D "arm,cortex-a53","arm,armv8";
> >                         reg =3D <0x0 0x3>;
> >                         enable-method =3D "psci";
> > +                       operating-points-v2 =3D <&cluster0_opp>;
> > +               };
> > +       };
> > +
> > +       cluster0_opp: opp_table0 {
> > +               compatible =3D "operating-points-v2";
> > +               opp-shared;
> > +
> > +               opp@500000000 {
> > +                       opp-hz =3D /bits/ 64 <500000000>;
> > +                       opp-microvolt =3D <857000>;
> > +                       clock-latency-ns =3D <500000>;
> > +               };
> > +               opp@648000000 {
> > +                       opp-hz =3D /bits/ 64 <648000000>;
> > +                       opp-microvolt =3D <857000>;
> > +                       clock-latency-ns =3D <500000>;
> > +               };
> > +               opp@800000000 {
> > +                       opp-hz =3D /bits/ 64 <800000000>;
> > +                       opp-microvolt =3D <882000>;
> > +                       clock-latency-ns =3D <500000>;
> > +               };
> > +               opp@1000000000 {
> > +                       opp-hz =3D /bits/ 64 <1000000000>;
> > +                       opp-microvolt =3D <892000>;
> > +                       clock-latency-ns =3D <500000>;
> > +               };
> > +               opp@1188000000 {
> > +                       opp-hz =3D /bits/ 64 <1188000000>;
> > +                       opp-microvolt =3D <1009000>;
> > +                       clock-latency-ns =3D <500000>;
> >                 };
> I see 1600m and 1800m for a53 clock source in clk driver. Aren't they
> supported by product chip?
> >         };
> >
> > @@ -279,6 +316,12 @@
> >                         dma-requests =3D <32>;
> >                 };
> >
> > +               topcrm: clock-controller@1461000 {
> > +                       compatible =3D "zte,zx296718-topcrm";
> > +                       reg =3D <0x01461000 0x1000>;
> > +                       #clock-cells =3D <1>;
> > +               };
> > +
>
> Top clock nodes patch is just merged into linux-next. You can prepare
> your patch based on it.
>
> https://www.spinics.net/lists/arm-kernel/msg535883.html
>
> >                 sysctrl: sysctrl@1463000 {
> >                         compatible =3D "zte,zx296718-sysctrl", "syscon"=
;
> >                         reg =3D <0x1463000 0x1000>;
> > --
> > 2.7.4
> >
>

--001a113f7318b56e5a054291728f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>cause of topcrm node has been add by another pat=
ch(<a target=3D"_blank" href=3D"https://wx2.qq.com/cgi-bin/mmwebwx-bin/webw=
xcheckurl?requrl=3Dhttps%3A%2F%2Fwww.spinics.net%2Flists%2Farm-kernel%2Fmsg=
535883.html&amp;skey=3D%40crypt_180b6516_03c09cd122d18259116435c82637657d&a=
mp;deviceid=3De227231113535420&amp;pass_ticket=3DLcwX1HPKOyjV9bHO4rred18DfL=
eMWaWCRblxaVRH93blUR8NJfEP5tB259bk6RcB&amp;opcode=3D2&amp;scene=3D1&amp;use=
rname=3D@7fde1b1ad7cef9d06704c35a39c01d2d292783bde3d0e6e10590ae244337bcc0">=
https://www.spinics.net/lists/arm-kernel/msg535883.html)</a><br></div>so I =
will send another patch to support cpu-freq on zx296718.<br><br></div>every=
one can ignore this patch.<br><br></div><div class=3D"gmail_extra"><br><div=
 class=3D"gmail_quote">On 1 December 2016 at 09:54, Jun Nie <span dir=3D"lt=
r">&lt;<a href=3D"mailto:jun.nie@linaro.org" target=3D"_blank">jun.nie@lina=
ro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">2016-11-30 17:50 GMT+08:00 Baoyou Xie &lt;<a href=3D"mailto:baoyou.xi=
e@linaro.org">baoyou.xie@linaro.org</a>&gt;:<br>
&gt; Enable topcrm clock node for zx296718, which is used for<br>
&gt; CPU&#39;s frequency change.<br>
<br>
</span>Please reference other device tree patches title to add a simple tit=
le<br>
with category information. Such as<br>
arm64: dts: uniphier: change MIO node to SD control node<br>
<span class=3D""><br>
&gt;<br>
&gt; Furthermore, this patch adds the CPU clock phandle in CPU&#39;s node<b=
r>
&gt; and uses operating-points-v2 to register operating points.<br>
&gt;<br>
&gt; So it can be used by cpufreq-dt driver.<br>
<br>
</span>Detail comment should provide more information to support title. So<=
br>
topcrm and cpu freq changes shall be split into two patches.<br>
<div><div class=3D"h5"><br>
&gt;<br>
&gt; Signed-off-by: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org"=
>baoyou.xie@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm64/boot/dts/zte/<wbr>zx296718.dtsi | 43 ++++++++++++++++=
++++++++++++++<wbr>+++++<br>
&gt;=C2=A0 1 file changed, 43 insertions(+)<br>
&gt;<br>
&gt; diff --git a/arch/arm64/boot/dts/zte/<wbr>zx296718.dtsi b/arch/arm64/b=
oot/dts/zte/<wbr>zx296718.dtsi<br>
&gt; index 6b239a3..992158a 100644<br>
&gt; --- a/arch/arm64/boot/dts/zte/<wbr>zx296718.dtsi<br>
&gt; +++ b/arch/arm64/boot/dts/zte/<wbr>zx296718.dtsi<br>
&gt; @@ -44,6 +44,7 @@<br>
&gt;=C2=A0 #include &lt;dt-bindings/input/input.h&gt;<br>
&gt;=C2=A0 #include &lt;dt-bindings/interrupt-<wbr>controller/arm-gic.h&gt;=
<br>
&gt;=C2=A0 #include &lt;dt-bindings/gpio/gpio.h&gt;<br>
&gt; +#include &lt;dt-bindings/clock/zx296718-<wbr>clock.h&gt;<br>
&gt;<br>
&gt;=C2=A0 / {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;zte,zx296718&quo=
t;;<br>
&gt; @@ -81,6 +82,8 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;arm,cortex-a53&quot;,&quot;arm,arm=
v8&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0 0x0&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0enable-method =3D &quot;psci&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0clocks =3D &lt;&amp;topcrm A53_GATE&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0operating-points-v2 =3D &lt;&amp;cluster0_opp&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu1: cpu=
@1 {<br>
&gt; @@ -88,6 +91,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;arm,cortex-a53&quot;,&quot;arm,arm=
v8&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0 0x1&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0enable-method =3D &quot;psci&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0operating-points-v2 =3D &lt;&amp;cluster0_opp&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu2: cpu=
@2 {<br>
&gt; @@ -95,6 +99,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;arm,cortex-a53&quot;,&quot;arm,arm=
v8&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0 0x2&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0enable-method =3D &quot;psci&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0operating-points-v2 =3D &lt;&amp;cluster0_opp&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu3: cpu=
@3 {<br>
&gt; @@ -102,6 +107,38 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;arm,cortex-a53&quot;,&quot;arm,arm=
v8&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0 0x3&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0enable-method =3D &quot;psci&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0operating-points-v2 =3D &lt;&amp;cluster0_opp&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cluster0_opp: opp_table0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D=
 &quot;operating-points-v2&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opp-shared;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opp@500000000 =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0opp-hz =3D /bits/ 64 &lt;500000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0opp-microvolt =3D &lt;857000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0clock-latency-ns =3D &lt;500000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opp@648000000 =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0opp-hz =3D /bits/ 64 &lt;648000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0opp-microvolt =3D &lt;857000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0clock-latency-ns =3D &lt;500000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opp@800000000 =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0opp-hz =3D /bits/ 64 &lt;800000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0opp-microvolt =3D &lt;882000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0clock-latency-ns =3D &lt;500000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opp@1000000000=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0opp-hz =3D /bits/ 64 &lt;1000000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0opp-microvolt =3D &lt;892000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0clock-latency-ns =3D &lt;500000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opp@1188000000=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0opp-hz =3D /bits/ 64 &lt;1188000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0opp-microvolt =3D &lt;1009000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0clock-latency-ns =3D &lt;500000&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
</div></div>I see 1600m and 1800m for a53 clock source in clk driver. Aren&=
#39;t they<br>
supported by product chip?<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;<br>
&gt; @@ -279,6 +316,12 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0dma-requests =3D &lt;32&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0topcrm: clock-=
controller@1461000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0compatible =3D &quot;zte,zx296718-topcrm&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0reg =3D &lt;0x01461000 0x1000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0#clock-cells =3D &lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
<br>
</span>Top clock nodes patch is just merged into linux-next. You can prepar=
e<br>
your patch based on it.<br>
<br>
<a href=3D"https://www.spinics.net/lists/arm-kernel/msg535883.html" rel=3D"=
noreferrer" target=3D"_blank">https://www.spinics.net/lists/<wbr>arm-kernel=
/msg535883.html</a><br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysctrl: =
sysctrl@1463000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;zte,zx296718-sysctrl&quot;, &quot;=
syscon&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x1463000 0x1000&gt;;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--001a113f7318b56e5a054291728f--
