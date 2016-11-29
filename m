From: Jernej Skrabec <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 0/8] drm: sun8i: Add DE2 HDMI video support
Date: Tue, 29 Nov 2016 15:24:25 -0800 (PST)
Message-ID: <239b60f3-3ea7-4aa7-8e8d-353e1a1d4ee5@googlegroups.com>
References: <cover.1480414715.git.moinejf@free.fr> <20161129213650.uqcgekodq77wlmxs@lukather> <8398357e-5c5e-4d76-9022-1c668aff5076@googlegroups.com>
 <2256264.6LWGGhFAiO@avalon>
Reply-To: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_6744_1714802487.1480461865753"
Return-path: <linux-sunxi+bncBDP4JJM5QYGRBKU47DAQKGQEHB5XHWA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <2256264.6LWGGhFAiO@avalon>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, moinejf-GANU6spQydw@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_6744_1714802487.1480461865753
Content-Type: multipart/alternative;
	boundary="----=_Part_6745_530421893.1480461865754"

------=_Part_6745_530421893.1480461865754
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Dne torek, 29. november 2016 23.56.31 UTC+1 je oseba Laurent Pinchart=20
napisala:
>
> Hi Jernej,=20
>
> (CC'ing Kieran Bingham)=20
>
> On Tuesday 29 Nov 2016 14:47:20 Jernej Skrabec wrote:=20
> > Dne torek, 29. november 2016 22.37.03 UTC+1 je oseba Maxime Ripard=20
> napisala:=20
> > > On Tue, Nov 29, 2016 at 11:18:35AM +0100, Jean-Francois Moine wrote:=
=20
> > >> This patchset series adds HDMI video support to the Allwinner=20
> > >> sun8i SoCs which include the display engine 2 (DE2).=20
> > >> The driver contains the code for the A83T and H3 SoCs, and=20
> > >> some H3 boards, but it could be used/extended for other SoCs=20
> > >> (A64, H2, H5) and boards (Banana PIs, Orange PIs).=20
> > >=20
> > > Honestly, I'm getting a bit worried by the fact that you ignore=20
> > > reviews.=20
> > >=20
> > > On the important reviews that you got that are to be seen as major=20
> > >=20
> > > issues that block the inclusion, we have:=20
> > >   - The fact that the HDMI driver is actually just a designware IP,=
=20
> > >     and while you should use the driver that already exists, you just=
=20
> > >     duplicated all that code.=20
> >=20
> > That might be hard thing to do. A83T fits perfectly, but H3 and newer=
=20
> SoCs=20
> > do not. They are using completely different HDMI phy. Decoupling=20
> controller=20
> > and phy code means rewritting a good portion of the code, unless some=
=20
> tricks=20
> > are applied, like calling phy function pointers, if they are defined.=
=20
>
> Same HDMI TX but different HDMI TX PHY ? Kieran is working on decoupling=
=20
> the=20
> PHY configuration code for a Renesas SoC, that might be of interest to=20
> you.=20
>

Exactly. I'm developing only U-Boot driver, but Jean-Francois will probably
have more interest in this.
=20

>
> > Register addresses also differ, but that can be easily solved by using=
=20
> > undocumented magic value to restore them.=20
>
> I love that :-)=20
>
>
Is it allowed to use magic number which was found in binary blob? I'm new i=
n
all this.
=20

> > >   - The fact that you ignored Rob (v6) and I (v5) comment on using OF=
=20
> > >     graph to model the connection between the display engine and the=
=20
> > >     TCON. Something that Laurent also pointed out in this version.=20
> > >  =20
> > >   - The fact that you ignored that you needed an HDMI connector node=
=20
> > >     as a child of the HDMI controller. This has been reported by Rob=
=20
> > >     (v6) and yet again in this version by Laurent.=20
> > >  =20
> > >   - And finally the fact that we can't have several display engine in=
=20
> > >     parallel, if needs be. This has happened in the past already on=
=20
> > >     Allwinner SoCs, so it's definitely something we should consider i=
n=20
> > >     the DT bindings, since we can't break them.=20
> > >=20
> > > Until those are fixed, I cannot see how this driver can be merged,=20
> > > unfortunately.=20
>
> --=20
> Regards,=20
>
> Laurent Pinchart=20
>
>
Best regards,
Jernej =C5=A0krabec=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_6745_530421893.1480461865754
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Laurent,<br><br>Dne torek, 29. november 2016 23.56.31 U=
TC+1 je oseba Laurent Pinchart napisala:<blockquote class=3D"gmail_quote" s=
tyle=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-le=
ft: 1ex;">Hi Jernej,
<br>
<br>(CC&#39;ing Kieran Bingham)
<br>
<br>On Tuesday 29 Nov 2016 14:47:20 Jernej Skrabec wrote:
<br>&gt; Dne torek, 29. november 2016 22.37.03 UTC+1 je oseba Maxime Ripard=
 napisala:
<br>&gt; &gt; On Tue, Nov 29, 2016 at 11:18:35AM +0100, Jean-Francois Moine=
 wrote:
<br>&gt; &gt;&gt; This patchset series adds HDMI video support to the Allwi=
nner
<br>&gt; &gt;&gt; sun8i SoCs which include the display engine 2 (DE2).
<br>&gt; &gt;&gt; The driver contains the code for the A83T and H3 SoCs, an=
d
<br>&gt; &gt;&gt; some H3 boards, but it could be used/extended for other S=
oCs
<br>&gt; &gt;&gt; (A64, H2, H5) and boards (Banana PIs, Orange PIs).
<br>&gt; &gt;=20
<br>&gt; &gt; Honestly, I&#39;m getting a bit worried by the fact that you =
ignore
<br>&gt; &gt; reviews.
<br>&gt; &gt;=20
<br>&gt; &gt; On the important reviews that you got that are to be seen as =
major
<br>&gt; &gt;=20
<br>&gt; &gt; issues that block the inclusion, we have:
<br>&gt; &gt; =C2=A0 - The fact that the HDMI driver is actually just a des=
ignware IP,
<br>&gt; &gt; =C2=A0 =C2=A0 and while you should use the driver that alread=
y exists, you just
<br>&gt; &gt; =C2=A0 =C2=A0 duplicated all that code.
<br>&gt;=20
<br>&gt; That might be hard thing to do. A83T fits perfectly, but H3 and ne=
wer SoCs
<br>&gt; do not. They are using completely different HDMI phy. Decoupling c=
ontroller
<br>&gt; and phy code means rewritting a good portion of the code, unless s=
ome tricks
<br>&gt; are applied, like calling phy function pointers, if they are defin=
ed.
<br>
<br>Same HDMI TX but different HDMI TX PHY ? Kieran is working on decouplin=
g the=20
<br>PHY configuration code for a Renesas SoC, that might be of interest to =
you.
<br></blockquote><div><br>Exactly. I&#39;m developing only U-Boot driver, b=
ut Jean-Francois will probably<br>have more interest in this.<br>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;b=
order-left: 1px #ccc solid;padding-left: 1ex;">
<br>&gt; Register addresses also differ, but that can be easily solved by u=
sing
<br>&gt; undocumented magic value to restore them.
<br>
<br>I love that :-)
<br>
<br></blockquote><div><br>Is it allowed to use magic number which was found=
 in binary blob? I&#39;m new in<br>all this.<br>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #=
ccc solid;padding-left: 1ex;">&gt; &gt; =C2=A0 - The fact that you ignored =
Rob (v6) and I (v5) comment on using OF
<br>&gt; &gt; =C2=A0 =C2=A0 graph to model the connection between the displ=
ay engine and the
<br>&gt; &gt; =C2=A0 =C2=A0 TCON. Something that Laurent also pointed out i=
n this version.
<br>&gt; &gt; =C2=A0=20
<br>&gt; &gt; =C2=A0 - The fact that you ignored that you needed an HDMI co=
nnector node
<br>&gt; &gt; =C2=A0 =C2=A0 as a child of the HDMI controller. This has bee=
n reported by Rob
<br>&gt; &gt; =C2=A0 =C2=A0 (v6) and yet again in this version by Laurent.
<br>&gt; &gt; =C2=A0=20
<br>&gt; &gt; =C2=A0 - And finally the fact that we can&#39;t have several =
display engine in
<br>&gt; &gt; =C2=A0 =C2=A0 parallel, if needs be. This has happened in the=
 past already on
<br>&gt; &gt; =C2=A0 =C2=A0 Allwinner SoCs, so it&#39;s definitely somethin=
g we should consider in
<br>&gt; &gt; =C2=A0 =C2=A0 the DT bindings, since we can&#39;t break them.
<br>&gt; &gt;=20
<br>&gt; &gt; Until those are fixed, I cannot see how this driver can be me=
rged,
<br>&gt; &gt; unfortunately.
<br>
<br>--=20
<br>Regards,
<br>
<br>Laurent Pinchart
<br>
<br></blockquote><div><br>Best regards,<br>Jernej =C5=A0krabec <br></div></=
div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_6745_530421893.1480461865754--

------=_Part_6744_1714802487.1480461865753--
