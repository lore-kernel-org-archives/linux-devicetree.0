From: Philippe Fouquet <ph.fouquet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH 2/8] ARM: sun4i: Add display blocks for
 the sun4i dtsi.
Date: Thu, 20 Apr 2017 00:23:41 -0700 (PDT)
Message-ID: <b82cab8e-5c42-4abc-b304-44b3b5df54f4@googlegroups.com>
References: <20170211174405.28395-1-plaes@plaes.org>
 <20170211174405.28395-3-plaes@plaes.org>
 <20170213091612.d5ifc4oi63xf7boi@lukather>
 <CAGb2v648uAKxpYaU_qhTLAyfe5snW1LG1VWmm+UMLRSQ5a7DKg@mail.gmail.com>
 <1487004405.20308.3.camel@plaes.org>
Reply-To: ph.fouquet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_2384_1773532930.1492673021228"
Return-path: <linux-sunxi+bncBDGIZTFA34NBB7WD4HDQKGQENNKOABA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1487004405.20308.3.camel-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_2384_1773532930.1492673021228
Content-Type: multipart/alternative;
	boundary="----=_Part_2385_261066125.1492673021228"

------=_Part_2385_261066125.1492673021228
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi

If you want I work with a Allwinner A20 (my board are derived from=20
OlinuXino-Micro-A20), and I will interest with LVDS function.

I use your patch but I have nothing to display on my screen.
You can see my work on=20
https://github.com/Philippe12/linux-sunxi/tree/sun7i-A20-lvds
My hardware is good, it word with u-boot and a older kernel 3.4.104

I use a dlc screen (dlc0700DDG-T-11) my fault is probably on simple-panel=
=20
information but I didn't seen were

If you can tell me some things to check.

Thank for your help
Best regards
Philippe FOUQUET


Le lundi 13 f=C3=A9vrier 2017 17:46:48 UTC+1, Priit Laes a =C3=A9crit :
>
> On Mon, 2017-02-13 at 17:20 +0800, Chen-Yu Tsai wrote:=20
> > On Mon, Feb 13, 2017 at 5:16 PM, Maxime Ripard=20
> > <maxime...-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org <javascript:>> wrote:=20
> > > Hi,=20
> > >=20
> > > On Sat, Feb 11, 2017 at 07:43:59PM +0200, Priit Laes wrote:=20
> > > > Added basic display pipeline consisting of tcon, display backend=20
> > > > and=20
> > > > frontend blocks.=20
> > > >=20
> > > > Signed-off-by: Priit Laes <pl...-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org <javascript:>>=20
> > > > ---=20
> > > >  arch/arm/boot/dts/sun4i-a10.dtsi | 104=20
> > > > +++++++++++++++++++++++++++++++++++++++=20
> > > >  1 file changed, 104 insertions(+)=20
> > > >=20
> > > > diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi=20
> > > > b/arch/arm/boot/dts/sun4i-a10.dtsi=20
> > > > index ba20b48..70991c9 100644=20
> > > > --- a/arch/arm/boot/dts/sun4i-a10.dtsi=20
> > > > +++ b/arch/arm/boot/dts/sun4i-a10.dtsi=20
> > > > @@ -779,6 +779,45 @@=20
> > > >                       #size-cells =3D <0>;=20
> > > >               };=20
> > > >=20
> > > > +             tcon0: lcd-controller@1c0c000 {=20
> > > > +                     compatible =3D "allwinner,sun5i-a13-tcon";=20
> > >=20
> > > There's a few bits here and there that need to be setup differently=
=20
> > > in=20
> > > A10, so you cannot reuse that compatible (same thing for the=20
> > > other).=20
> > >=20
> > > Also, I'd really like to have all the blocks listed here, and not=20
> > > only=20
> > > the first pipeline. Ideally, on the A10, the two pipelines should=20
> > > be=20
> > > enabled too.=20
> >=20
> > The display pipeline driver has to be fixed before that can happen=20
> > though. And I haven't started to work on what I proposed yet. Though=20
> > if someone wants to take over I can forward any design plans I have.=20
>
> Well, my plan was to get at least minimum bits mainlined and then build=
=20
> additional features on top.=20
>
> Wens, it would be cool though, if you could share your plans.=20
>
> Unfortunately I have only single A10 device (with LVDS and mini-HDMI)=20
> but I don't actually have other LVDS-displays I could easily use with=20
> A20 devices (I have CubieTruck and A20-Olinuxino Micro).=20
>
> P=C3=A4ikest,=20
> Priit :)=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_2385_261066125.1492673021228
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi</div><div><br></div>If you want I work with a Allw=
inner A20 (my board are derived from OlinuXino-Micro-A20), and I will inter=
est with LVDS function.<div><br></div><div>I use your patch but I have noth=
ing to display on my screen.</div><div>You can see my work on=C2=A0<a href=
=3D"https://github.com/Philippe12/linux-sunxi/tree/sun7i-A20-lvds">https://=
github.com/Philippe12/linux-sunxi/tree/sun7i-A20-lvds</a></div><div>My hard=
ware is good, it word with u-boot and a older kernel 3.4.104</div><div><br>=
</div><div>I use a dlc screen (dlc0700DDG-T-11) my fault is probably on sim=
ple-panel information but I didn&#39;t seen were</div><div><br></div><div>I=
f you can tell me some things to check.</div><div><br></div><div>Thank for =
your help</div><div>Best regards</div><div>Philippe FOUQUET</div><div><br><=
br>Le lundi 13 f=C3=A9vrier 2017 17:46:48 UTC+1, Priit Laes a =C3=A9crit=C2=
=A0:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex=
;border-left: 1px #ccc solid;padding-left: 1ex;">On Mon, 2017-02-13 at 17:2=
0 +0800, Chen-Yu Tsai wrote:
<br>&gt; On Mon, Feb 13, 2017 at 5:16 PM, Maxime Ripard
<br>&gt; &lt;<a href=3D"javascript:" target=3D"_blank" gdf-obfuscated-mailt=
o=3D"E1PQYSQYBgAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;javascr=
ipt:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;;return=
 true;">maxime...@free-electrons.<wbr>com</a>&gt; wrote:
<br>&gt; &gt; Hi,
<br>&gt; &gt;=20
<br>&gt; &gt; On Sat, Feb 11, 2017 at 07:43:59PM +0200, Priit Laes wrote:
<br>&gt; &gt; &gt; Added basic display pipeline consisting of tcon, display=
 backend
<br>&gt; &gt; &gt; and
<br>&gt; &gt; &gt; frontend blocks.
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; Signed-off-by: Priit Laes &lt;<a href=3D"javascript:" ta=
rget=3D"_blank" gdf-obfuscated-mailto=3D"E1PQYSQYBgAJ" rel=3D"nofollow" onm=
ousedown=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this=
.href=3D&#39;javascript:&#39;;return true;">pl...-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org</a>&gt;
<br>&gt; &gt; &gt; ---
<br>&gt; &gt; &gt; =C2=A0arch/arm/boot/dts/sun4i-a10.<wbr>dtsi | 104
<br>&gt; &gt; &gt; ++++++++++++++++++++++++++++++<wbr>+++++++++
<br>&gt; &gt; &gt; =C2=A01 file changed, 104 insertions(+)
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; diff --git a/arch/arm/boot/dts/sun4i-a10.<wbr>dtsi
<br>&gt; &gt; &gt; b/arch/arm/boot/dts/sun4i-a10.<wbr>dtsi
<br>&gt; &gt; &gt; index ba20b48..70991c9 100644
<br>&gt; &gt; &gt; --- a/arch/arm/boot/dts/sun4i-a10.<wbr>dtsi
<br>&gt; &gt; &gt; +++ b/arch/arm/boot/dts/sun4i-a10.<wbr>dtsi
<br>&gt; &gt; &gt; @@ -779,6 +779,45 @@
<br>&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0#size-<wbr>cells =3D &lt;0&gt;;
<br>&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0tcon0: lcd-controller@1c0c000 {
<br>&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wb=
r>compatible =3D &quot;allwinner,sun5i-a13-tcon&quot;;
<br>&gt; &gt;=20
<br>&gt; &gt; There&#39;s a few bits here and there that need to be setup d=
ifferently
<br>&gt; &gt; in
<br>&gt; &gt; A10, so you cannot reuse that compatible (same thing for the
<br>&gt; &gt; other).
<br>&gt; &gt;=20
<br>&gt; &gt; Also, I&#39;d really like to have all the blocks listed here,=
 and not
<br>&gt; &gt; only
<br>&gt; &gt; the first pipeline. Ideally, on the A10, the two pipelines sh=
ould
<br>&gt; &gt; be
<br>&gt; &gt; enabled too.
<br>&gt;=20
<br>&gt; The display pipeline driver has to be fixed before that can happen
<br>&gt; though. And I haven&#39;t started to work on what I proposed yet. =
Though
<br>&gt; if someone wants to take over I can forward any design plans I hav=
e.
<br>
<br>Well, my plan was to get at least minimum bits mainlined and then build
<br>additional features on top.
<br>
<br>Wens, it would be cool though, if you could share your plans.
<br>
<br>Unfortunately I have only single A10 device (with LVDS and mini-HDMI)
<br>but I don&#39;t actually have other LVDS-displays I could easily use wi=
th
<br>A20 devices (I have CubieTruck and A20-Olinuxino Micro).
<br>
<br>P=C3=A4ikest,
<br>Priit :)
<br></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_2385_261066125.1492673021228--

------=_Part_2384_1773532930.1492673021228--
