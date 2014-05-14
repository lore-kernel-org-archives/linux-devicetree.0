From: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCR0LXRgNGB0LXQvdC10LI=?= <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
Subject: Re: [PATCH v6 3/3] ARM: sunxi: Add IR controller
 support in DT on A20
Date: Wed, 14 May 2014 12:58:04 -0700 (PDT)
Message-ID: <e47c9258-c495-4370-b7e5-f1793654fcc7@googlegroups.com>
References: <1400006342-2968-1-git-send-email-bay@hackerdom.ru>
 <1400006342-2968-4-git-send-email-bay@hackerdom.ru>
 <20140514075017.GH29258@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_34_27034841.1400097484931"
Return-path: <linux-sunxi+bncBCLIFP6QZ4HRBTUVZ6NQKGQES7E3F4Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140514075017.GH29258@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>, david-0WFrdVpeebksCylrc8G9yg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, srinivas.kandagatla-qxv4g6HH51o@public.gmane.org, wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_34_27034841.1400097484931
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Sending two changes as the patch.=20
I am not using ir1_pins_a because cubietruck has only one ir port, but=20
other A20 devices may have up to 2 ir ports.

Signed-off-by: Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi=20
b/arch/arm/boot/dts/sun7i-a20.dtsi
index 40ded74..53a9ab1 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -731,6 +731,7 @@
                                    allwinner,drive =3D <0>;
                                    allwinner,pull =3D <0>;
                        };
+
                        ir1_pins_a: ir1@0 {
                                    allwinner,pins =3D "PB22","PB23";
                                    allwinner,function =3D "ir1";
@@ -965,7 +966,7 @@
                        clocks =3D <&apb0_gates 7>, <&ir1_clk>;
                        clock-names =3D "apb", "ir";
                        interrupts =3D <0 6 4>;
-                       reg =3D <0x01C21c00 0x40>;
+                       reg =3D <0x01c21c00 0x40>;
                        status =3D "disabled";
                };
        };


=D1=81=D1=80=D0=B5=D0=B4=D0=B0, 14 =D0=BC=D0=B0=D1=8F 2014 =D0=B3., 13:50:1=
7 UTC+6 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=
=D1=8C Maxime Ripard =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
>
> On Wed, May 14, 2014 at 12:39:02AM +0600, Alexander Bersenev wrote:=20
> > This patch adds IR controller in A20 Device-Tree:=20
> > - Two IR devices found in A20 user manual=20
> > - Pins for two devices=20
> > - One IR device physically found on Cubieboard 2=20
> > - One IR device physically found on Cubietruck=20
> >=20
> > Signed-off-by: Alexander Bersenev <b...-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org <javascript:>>=20
> > Signed-off-by: Alexsey Shestacov <wing...-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org <javascript:>=
>=20
>
> > ---=20
> >  arch/arm/boot/dts/sun7i-a20-cubieboard2.dts |  6 ++++++=20
> >  arch/arm/boot/dts/sun7i-a20-cubietruck.dts  |  6 ++++++=20
> >  arch/arm/boot/dts/sun7i-a20.dtsi            | 31=20
> +++++++++++++++++++++++++++++=20
> >  3 files changed, 43 insertions(+)=20
> >=20
> > diff --git a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts=20
> b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts=20
> > index feeff64..2564e8c 100644=20
> > --- a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts=20
> > +++ b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts=20
> > @@ -164,6 +164,12 @@=20
> >                                  reg =3D <1>;=20
> >                          };=20
> >                  };=20
> > +=20
> > +                ir0: ir@01c21800 {=20
> > +                        pinctrl-names =3D "default";=20
> > +                        pinctrl-0 =3D <&ir0_pins_a>;=20
> > +                        status =3D "okay";=20
> > +                };=20
> >          };=20
> >  =20
> >          leds {=20
> > diff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts=20
> b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts=20
> > index e288562..e375e89 100644=20
> > --- a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts=20
> > +++ b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts=20
> > @@ -232,6 +232,12 @@=20
> >                                  reg =3D <1>;=20
> >                          };=20
> >                  };=20
> > +=20
> > +                ir0: ir@01c21800 {=20
> > +                        pinctrl-names =3D "default";=20
> > +                        pinctrl-0 =3D <&ir0_pins_a>;=20
> > +                        status =3D "okay";=20
> > +                };=20
> >          };=20
> >  =20
> >          leds {=20
>
> Please make these two changes a separate patch.=20
>
> > diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi=20
> b/arch/arm/boot/dts/sun7i-a20.dtsi=20
> > index 0ae2b77..40ded74 100644=20
> > --- a/arch/arm/boot/dts/sun7i-a20.dtsi=20
> > +++ b/arch/arm/boot/dts/sun7i-a20.dtsi=20
> > @@ -724,6 +724,19 @@=20
> >                                  allwinner,drive =3D <2>;=20
> >                                  allwinner,pull =3D <0>;=20
> >                          };=20
> > +=20
> > +                        ir0_pins_a: ir0@0 {=20
> > +                                    allwinner,pins =3D "PB3","PB4";=20
> > +                                    allwinner,function =3D "ir0";=20
> > +                                    allwinner,drive =3D <0>;=20
> > +                                    allwinner,pull =3D <0>;=20
> > +                        };=20
>
> Extra line=20
>
> > +                        ir1_pins_a: ir1@0 {=20
> > +                                    allwinner,pins =3D "PB22","PB23";=
=20
> > +                                    allwinner,function =3D "ir1";=20
> > +                                    allwinner,drive =3D <0>;=20
> > +                                    allwinner,pull =3D <0>;=20
> > +                        };=20
> >                  };=20
>
> Do you use ir1_pins_a at all?=20
>
> I also prefer whenever such additions are in a patch of their own.=20
>
> >                  timer@01c20c00 {=20
> > @@ -937,5 +950,23 @@=20
> >                          #interrupt-cells =3D <3>;=20
> >                          interrupts =3D <1 9 0xf04>;=20
> >                  };=20
> > +=20
> > +                ir0: ir@01c21800 {=20
> > +                        compatible =3D "allwinner,sun7i-a20-ir";=20
> > +                        clocks =3D <&apb0_gates 6>, <&ir0_clk>;=20
> > +                        clock-names =3D "apb", "ir";=20
> > +                        interrupts =3D <0 5 4>;=20
> > +                        reg =3D <0x01c21800 0x40>;=20
> > +                        status =3D "disabled";=20
> > +                };=20
> > +=20
> > +                ir1: ir@01c21c00 {=20
> > +                        compatible =3D "allwinner,sun7i-a20-ir";=20
> > +                        clocks =3D <&apb0_gates 7>, <&ir1_clk>;=20
> > +                        clock-names =3D "apb", "ir";=20
> > +                        interrupts =3D <0 6 4>;=20
> > +                        reg =3D <0x01C21c00 0x40>;=20
>
> You're mixing upper and lower case letters here, please make it lower=20
> case.=20
>
> Thanks!=20
> Maxime=20
>
> --=20
> Maxime Ripard, Free Electrons=20
> Embedded Linux, Kernel and Android engineering=20
> http://free-electrons.com=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_34_27034841.1400097484931
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sending two changes as the patch.&nbsp;</div><div>I a=
m not using&nbsp;<span style=3D"color: rgb(80, 0, 80);">ir1_</span><wbr sty=
le=3D"color: rgb(80, 0, 80);"><span style=3D"color: rgb(80, 0, 80);">pins_a=
 because cubietruck has only one ir port, but other A20 devices may have up=
 to 2 ir ports.</span></div><div><br></div><div>Signed-off-by: Alexander Be=
rsenev &lt;bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org&gt;</div><div><br></div><div>diff --git a/arch/=
arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi</div><div>in=
dex 40ded74..53a9ab1 100644</div><div>--- a/arch/arm/boot/dts/sun7i-a20.dts=
i</div><div>+++ b/arch/arm/boot/dts/sun7i-a20.dtsi</div><div>@@ -731,6 +731=
,7 @@</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; allwinne=
r,drive =3D &lt;0&gt;;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; allwinner,pull =3D &lt;0&gt;;</div><div>&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };</div><div>+</d=
iv><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; ir1_pins_a: ir1@0 {</div><div>&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; allwinner,pins =3D "PB22","PB23";</div><div>&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; allwinner,function =3D "ir1";</d=
iv><div>@@ -965,7 +966,7 @@</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; clocks =3D &lt;&amp;apb0_gat=
es 7&gt;, &lt;&amp;ir1_clk&gt;;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; clock-names =3D "apb", "=
ir";</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; interrupts =3D &lt;0 6 4&gt;;</div><div>- &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =3D=
 &lt;0x01C21c00 0x40&gt;;</div><div>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =3D &lt;0x01c21c00 0x40&gt;;</d=
iv><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; status =3D "disabled";</div><div>&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; };</div><div>&nbsp; &nbsp; &nbsp; &nbsp; };<=
/div><div><br></div><br>=D1=81=D1=80=D0=B5=D0=B4=D0=B0, 14 =D0=BC=D0=B0=D1=
=8F 2014&nbsp;=D0=B3., 13:50:17 UTC+6 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE=
=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Maxime Ripard =D0=BD=D0=B0=D0=BF=D0=B8=
=D1=81=D0=B0=D0=BB:<blockquote class=3D"gmail_quote" style=3D"margin: 0;mar=
gin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On Wed, May=
 14, 2014 at 12:39:02AM +0600, Alexander Bersenev wrote:
<br>&gt; This patch adds IR controller in A20 Device-Tree:
<br>&gt; - Two IR devices found in A20 user manual
<br>&gt; - Pins for two devices
<br>&gt; - One IR device physically found on Cubieboard 2
<br>&gt; - One IR device physically found on Cubietruck
<br>&gt;=20
<br>&gt; Signed-off-by: Alexander Bersenev &lt;<a href=3D"javascript:" targ=
et=3D"_blank" gdf-obfuscated-mailto=3D"YJq3Ua9tyFYJ" onmousedown=3D"this.hr=
ef=3D'javascript:';return true;" onclick=3D"this.href=3D'javascript:';retur=
n true;">b...-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org</a>&gt;
<br>&gt; Signed-off-by: Alexsey Shestacov &lt;<a href=3D"javascript:" targe=
t=3D"_blank" gdf-obfuscated-mailto=3D"YJq3Ua9tyFYJ" onmousedown=3D"this.hre=
f=3D'javascript:';return true;" onclick=3D"this.href=3D'javascript:';return=
 true;">wing...-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org</a>&gt;
<br>&gt; ---
<br>&gt; &nbsp;arch/arm/boot/dts/sun7i-a20-<wbr>cubieboard2.dts | &nbsp;6 +=
+++++
<br>&gt; &nbsp;arch/arm/boot/dts/sun7i-a20-<wbr>cubietruck.dts &nbsp;| &nbs=
p;6 ++++++
<br>&gt; &nbsp;arch/arm/boot/dts/sun7i-a20.<wbr>dtsi &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;| 31 +++++++++++++++++++++++++++++
<br>&gt; &nbsp;3 files changed, 43 insertions(+)
<br>&gt;=20
<br>&gt; diff --git a/arch/arm/boot/dts/sun7i-a20-<wbr>cubieboard2.dts b/ar=
ch/arm/boot/dts/sun7i-a20-<wbr>cubieboard2.dts
<br>&gt; index feeff64..2564e8c 100644
<br>&gt; --- a/arch/arm/boot/dts/sun7i-a20-<wbr>cubieboard2.dts
<br>&gt; +++ b/arch/arm/boot/dts/sun7i-a20-<wbr>cubieboard2.dts
<br>&gt; @@ -164,6 +164,12 @@
<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<wbr>&nbsp;&nbsp;&nbsp;reg =3D &lt;1=
&gt;;
<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;};
<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
<br>&gt; +
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ir0: ir@01c21800 {
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;<wbr>pinctrl-names =3D "default";
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;<wbr>pinctrl-0 =3D &lt;&amp;ir0_pins_a&gt;;
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;<wbr>status =3D "okay";
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
<br>&gt; &nbsp;
<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;leds {
<br>&gt; diff --git a/arch/arm/boot/dts/sun7i-a20-<wbr>cubietruck.dts b/arc=
h/arm/boot/dts/sun7i-a20-<wbr>cubietruck.dts
<br>&gt; index e288562..e375e89 100644
<br>&gt; --- a/arch/arm/boot/dts/sun7i-a20-<wbr>cubietruck.dts
<br>&gt; +++ b/arch/arm/boot/dts/sun7i-a20-<wbr>cubietruck.dts
<br>&gt; @@ -232,6 +232,12 @@
<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<wbr>&nbsp;&nbsp;&nbsp;reg =3D &lt;1=
&gt;;
<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;};
<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
<br>&gt; +
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ir0: ir@01c21800 {
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;<wbr>pinctrl-names =3D "default";
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;<wbr>pinctrl-0 =3D &lt;&amp;ir0_pins_a&gt;;
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;<wbr>status =3D "okay";
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
<br>&gt; &nbsp;
<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;leds {
<br>
<br>Please make these two changes a separate patch.
<br>
<br>&gt; diff --git a/arch/arm/boot/dts/sun7i-a20.<wbr>dtsi b/arch/arm/boot=
/dts/sun7i-a20.<wbr>dtsi
<br>&gt; index 0ae2b77..40ded74 100644
<br>&gt; --- a/arch/arm/boot/dts/sun7i-a20.<wbr>dtsi
<br>&gt; +++ b/arch/arm/boot/dts/sun7i-a20.<wbr>dtsi
<br>&gt; @@ -724,6 +724,19 @@
<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<wbr>&nbsp;&nbsp;&nbsp;allwinner,dri=
ve =3D &lt;2&gt;;
<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<wbr>&nbsp;&nbsp;&nbsp;allwinner,pul=
l =3D &lt;0&gt;;
<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;};
<br>&gt; +
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;ir0_<wbr>pins_a: ir0@0 {
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<wbr>&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;allw=
inner,pins =3D "PB3","PB4";
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<wbr>&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;allw=
inner,function =3D "ir0";
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<wbr>&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;allw=
inner,drive =3D &lt;0&gt;;
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<wbr>&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;allw=
inner,pull =3D &lt;0&gt;;
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;};
<br>
<br>Extra line
<br>
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;ir1_<wbr>pins_a: ir1@0 {
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<wbr>&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;allw=
inner,pins =3D "PB22","PB23";
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<wbr>&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;allw=
inner,function =3D "ir1";
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<wbr>&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;allw=
inner,drive =3D &lt;0&gt;;
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<wbr>&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;allw=
inner,pull =3D &lt;0&gt;;
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;};
<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
<br>
<br>Do you use ir1_pins_a at all?
<br>
<br>I also prefer whenever such additions are in a patch of their own.
<br>
<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;timer@<wbr>01c20c00 {
<br>&gt; @@ -937,5 +950,23 @@
<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;#<wbr>interrupt-cells =3D &lt;3&gt;;
<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;<wbr>interrupts =3D &lt;1 9 0xf04&gt;;
<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
<br>&gt; +
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ir0: ir@01c21800 {
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;<wbr>compatible =3D "allwinner,sun7i-a20-ir";
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;<wbr>clocks =3D &lt;&amp;apb0_gates 6&gt;, &lt;&amp;ir0_clk&gt;;
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;<wbr>clock-names =3D "apb", "ir";
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;<wbr>interrupts =3D &lt;0 5 4&gt;;
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;reg =3D &lt;0x01c21800 0x40&gt;;
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;<wbr>status =3D "disabled";
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
<br>&gt; +
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ir1: ir@01c21c00 {
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;<wbr>compatible =3D "allwinner,sun7i-a20-ir";
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;<wbr>clocks =3D &lt;&amp;apb0_gates 7&gt;, &lt;&amp;ir1_clk&gt;;
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;<wbr>clock-names =3D "apb", "ir";
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;<wbr>interrupts =3D &lt;0 6 4&gt;;
<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;reg =3D &lt;0x01C21c00 0x40&gt;;
<br>
<br>You're mixing upper and lower case letters here, please make it lower
<br>case.
<br>
<br>Thanks!
<br>Maxime
<br>
<br>--=20
<br>Maxime Ripard, Free Electrons
<br>Embedded Linux, Kernel and Android engineering
<br><a href=3D"http://free-electrons.com" target=3D"_blank" onmousedown=3D"=
this.href=3D'http://www.google.com/url?q\75http%3A%2F%2Ffree-electrons.com\=
46sa\75D\46sntz\0751\46usg\75AFQjCNGC8C9pT7xKJEabITLGL5cqtolifQ';return tru=
e;" onclick=3D"this.href=3D'http://www.google.com/url?q\75http%3A%2F%2Ffree=
-electrons.com\46sa\75D\46sntz\0751\46usg\75AFQjCNGC8C9pT7xKJEabITLGL5cqtol=
ifQ';return true;">http://free-electrons.com</a>
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_34_27034841.1400097484931--
