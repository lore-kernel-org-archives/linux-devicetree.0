From: Jernej Skrabec <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 0/8] drm: sun8i: Add DE2 HDMI video support
Date: Wed, 30 Nov 2016 10:04:58 -0800 (PST)
Message-ID: <04ccf471-2ae5-4c75-bfd3-88ce49942200@googlegroups.com>
References: <cover.1480414715.git.moinejf@free.fr> <2256264.6LWGGhFAiO@avalon> <239b60f3-3ea7-4aa7-8e8d-353e1a1d4ee5@googlegroups.com>
 <3152670.pRMCOA29o4@avalon>
Reply-To: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_13989_24844867.1480529098317"
Return-path: <linux-sunxi+bncBDP4JJM5QYGRBS5J7TAQKGQEK3WPNNQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <3152670.pRMCOA29o4@avalon>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, moinejf-GANU6spQydw@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_13989_24844867.1480529098317
Content-Type: multipart/alternative;
	boundary="----=_Part_13990_1971241755.1480529098318"

------=_Part_13990_1971241755.1480529098318
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Dne sreda, 30. november 2016 09.08.22 UTC+1 je oseba Laurent Pinchart=20
napisala:
>
> Hi Jernej,=20
>
> On Tuesday 29 Nov 2016 15:24:25 Jernej Skrabec wrote:=20
> > Dne torek, 29. november 2016 23.56.31 UTC+1 je oseba Laurent Pinchart=
=20
> > napisala:=20
> > > On Tuesday 29 Nov 2016 14:47:20 Jernej Skrabec wrote:=20
> > >> Dne torek, 29. november 2016 22.37.03 UTC+1 je oseba Maxime Ripard=
=20
> > > napisala:=20
> > >>> On Tue, Nov 29, 2016 at 11:18:35AM +0100, Jean-Francois Moine wrote=
:=20
> > >>>> This patchset series adds HDMI video support to the Allwinner=20
> > >>>> sun8i SoCs which include the display engine 2 (DE2).=20
> > >>>> The driver contains the code for the A83T and H3 SoCs, and=20
> > >>>> some H3 boards, but it could be used/extended for other SoCs=20
> > >>>> (A64, H2, H5) and boards (Banana PIs, Orange PIs).=20
> > >>>=20
> > >>> Honestly, I'm getting a bit worried by the fact that you ignore=20
> > >>> reviews.=20
> > >>>=20
> > >>> On the important reviews that you got that are to be seen as major=
=20
> > >>> issues that block the inclusion, we have:=20
> > >>>   - The fact that the HDMI driver is actually just a designware IP,=
=20
> > >>>     and while you should use the driver that already exists, you=20
> just=20
> > >>>     duplicated all that code.=20
> > >>=20
> > >> That might be hard thing to do. A83T fits perfectly, but H3 and newe=
r=20
> > >> SoCs do not. They are using completely different HDMI phy. Decouplin=
g=20
> > >> controller and phy code means rewritting a good portion of the code,=
=20
> > >> unless some tricks are applied, like calling phy function pointers,=
=20
> if=20
> > >> they are defined.=20
> > >=20
> > > Same HDMI TX but different HDMI TX PHY ? Kieran is working on=20
> decoupling=20
> > > the PHY configuration code for a Renesas SoC, that might be of=20
> interest to=20
> > > you.=20
> >=20
> > Exactly. I'm developing only U-Boot driver, but Jean-Francois will=20
> probably=20
> > have more interest in this.=20
>
> We'll post patches as soon as they're ready.=20
>

Great. Is datasheet public? I'm curious if HDMI PHY is by any chance=20
similar.
=20

>
> By the way, do you know if the H3 and newer SoCs use a different PHY from=
=20
> Synopsys, or a custom PHY developed by Allwinner ?=20
>
>
Unfortunatelly, noone managed to identify PHY and Alliwinner never released=
=20
a
bit of information about HDMI. Does config2_id code 0xFE (PHY type) tell yo=
u
anything?
=20

> > >> Register addresses also differ, but that can be easily solved by=20
> using=20
> > >> undocumented magic value to restore them.=20
> > >=20
> > > I love that :-)=20
> >=20
> > Is it allowed to use magic number which was found in binary blob? I'm=
=20
> new in=20
> > all this.=20
>
> I don't really see a problem with that, we have many drivers in the kerne=
l=20
> that have been developed through reverse-engineering. You should not=20
> include=20
> large pieces of code that have been obtained through decompilation of a=
=20
> proprietary binary blob as those could be protected by copyright, but=20
> writing=20
> to undocumented registers based on information found through usage of a=
=20
> binary=20
> driver isn't a problem. (Please remember that I'm not a lawyer though)=20
>
> > >>>   - The fact that you ignored Rob (v6) and I (v5) comment on using=
=20
> OF=20
> > >>>     graph to model the connection between the display engine and th=
e=20
> > >>>     TCON. Something that Laurent also pointed out in this version.=
=20
> > >>>  =20
> > >>>   - The fact that you ignored that you needed an HDMI connector nod=
e=20
> > >>>     as a child of the HDMI controller. This has been reported by Ro=
b=20
> > >>>     (v6) and yet again in this version by Laurent.=20
> > >>>  =20
> > >>>   - And finally the fact that we can't have several display engine=
=20
> in=20
> > >>>     parallel, if needs be. This has happened in the past already on=
=20
> > >>>     Allwinner SoCs, so it's definitely something we should consider=
=20
> in=20
> > >>>     the DT bindings, since we can't break them.=20
> > >>>=20
> > >>> Until those are fixed, I cannot see how this driver can be merged,=
=20
> > >>> unfortunately.=20
>

Best regards,
Jernej =C5=A0krabec

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_13990_1971241755.1480529098318
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Laurent,<br><br>Dne sreda, 30. november 2016 09.08.22 U=
TC+1 je oseba Laurent Pinchart napisala:<blockquote class=3D"gmail_quote" s=
tyle=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-le=
ft: 1ex;">Hi Jernej,
<br>
<br>On Tuesday 29 Nov 2016 15:24:25 Jernej Skrabec wrote:
<br>&gt; Dne torek, 29. november 2016 23.56.31 UTC+1 je oseba Laurent Pinch=
art
<br>&gt; napisala:
<br>&gt; &gt; On Tuesday 29 Nov 2016 14:47:20 Jernej Skrabec wrote:
<br>&gt; &gt;&gt; Dne torek, 29. november 2016 22.37.03 UTC+1 je oseba Maxi=
me Ripard
<br>&gt; &gt; napisala:
<br>&gt; &gt;&gt;&gt; On Tue, Nov 29, 2016 at 11:18:35AM +0100, Jean-Franco=
is Moine wrote:
<br>&gt; &gt;&gt;&gt;&gt; This patchset series adds HDMI video support to t=
he Allwinner
<br>&gt; &gt;&gt;&gt;&gt; sun8i SoCs which include the display engine 2 (DE=
2).
<br>&gt; &gt;&gt;&gt;&gt; The driver contains the code for the A83T and H3 =
SoCs, and
<br>&gt; &gt;&gt;&gt;&gt; some H3 boards, but it could be used/extended for=
 other SoCs
<br>&gt; &gt;&gt;&gt;&gt; (A64, H2, H5) and boards (Banana PIs, Orange PIs)=
.
<br>&gt; &gt;&gt;&gt;=20
<br>&gt; &gt;&gt;&gt; Honestly, I&#39;m getting a bit worried by the fact t=
hat you ignore
<br>&gt; &gt;&gt;&gt; reviews.
<br>&gt; &gt;&gt;&gt;=20
<br>&gt; &gt;&gt;&gt; On the important reviews that you got that are to be =
seen as major
<br>&gt; &gt;&gt;&gt; issues that block the inclusion, we have:
<br>&gt; &gt;&gt;&gt; =C2=A0 - The fact that the HDMI driver is actually ju=
st a designware IP,
<br>&gt; &gt;&gt;&gt; =C2=A0 =C2=A0 and while you should use the driver tha=
t already exists, you just
<br>&gt; &gt;&gt;&gt; =C2=A0 =C2=A0 duplicated all that code.
<br>&gt; &gt;&gt;=20
<br>&gt; &gt;&gt; That might be hard thing to do. A83T fits perfectly, but =
H3 and newer
<br>&gt; &gt;&gt; SoCs do not. They are using completely different HDMI phy=
. Decoupling
<br>&gt; &gt;&gt; controller and phy code means rewritting a good portion o=
f the code,
<br>&gt; &gt;&gt; unless some tricks are applied, like calling phy function=
 pointers, if
<br>&gt; &gt;&gt; they are defined.
<br>&gt; &gt;=20
<br>&gt; &gt; Same HDMI TX but different HDMI TX PHY ? Kieran is working on=
 decoupling
<br>&gt; &gt; the PHY configuration code for a Renesas SoC, that might be o=
f interest to
<br>&gt; &gt; you.
<br>&gt;=20
<br>&gt; Exactly. I&#39;m developing only U-Boot driver, but Jean-Francois =
will probably
<br>&gt; have more interest in this.
<br>
<br>We&#39;ll post patches as soon as they&#39;re ready.
<br></blockquote><div><br>Great. Is datasheet public? I&#39;m curious if HD=
MI PHY is by any chance similar.<br>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;pa=
dding-left: 1ex;">
<br>By the way, do you know if the H3 and newer SoCs use a different PHY fr=
om=20
<br>Synopsys, or a custom PHY developed by Allwinner ?
<br>
<br></blockquote><div><br>Unfortunatelly, noone managed to identify PHY and=
 Alliwinner never released a<br>bit of information about HDMI. Does config2=
_id code 0xFE (PHY type) tell you<br>anything?<br>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px=
 #ccc solid;padding-left: 1ex;">&gt; &gt;&gt; Register addresses also diffe=
r, but that can be easily solved by using
<br>&gt; &gt;&gt; undocumented magic value to restore them.
<br>&gt; &gt;=20
<br>&gt; &gt; I love that :-)
<br>&gt;=20
<br>&gt; Is it allowed to use magic number which was found in binary blob? =
I&#39;m new in
<br>&gt; all this.
<br>
<br>I don&#39;t really see a problem with that, we have many drivers in the=
 kernel=20
<br>that have been developed through reverse-engineering. You should not in=
clude=20
<br>large pieces of code that have been obtained through decompilation of a=
=20
<br>proprietary binary blob as those could be protected by copyright, but w=
riting=20
<br>to undocumented registers based on information found through usage of a=
 binary=20
<br>driver isn&#39;t a problem. (Please remember that I&#39;m not a lawyer =
though)
<br>
<br>&gt; &gt;&gt;&gt; =C2=A0 - The fact that you ignored Rob (v6) and I (v5=
) comment on using OF
<br>&gt; &gt;&gt;&gt; =C2=A0 =C2=A0 graph to model the connection between t=
he display engine and the
<br>&gt; &gt;&gt;&gt; =C2=A0 =C2=A0 TCON. Something that Laurent also point=
ed out in this version.
<br>&gt; &gt;&gt;&gt; =C2=A0=20
<br>&gt; &gt;&gt;&gt; =C2=A0 - The fact that you ignored that you needed an=
 HDMI connector node
<br>&gt; &gt;&gt;&gt; =C2=A0 =C2=A0 as a child of the HDMI controller. This=
 has been reported by Rob
<br>&gt; &gt;&gt;&gt; =C2=A0 =C2=A0 (v6) and yet again in this version by L=
aurent.
<br>&gt; &gt;&gt;&gt; =C2=A0=20
<br>&gt; &gt;&gt;&gt; =C2=A0 - And finally the fact that we can&#39;t have =
several display engine in
<br>&gt; &gt;&gt;&gt; =C2=A0 =C2=A0 parallel, if needs be. This has happene=
d in the past already on
<br>&gt; &gt;&gt;&gt; =C2=A0 =C2=A0 Allwinner SoCs, so it&#39;s definitely =
something we should consider in
<br>&gt; &gt;&gt;&gt; =C2=A0 =C2=A0 the DT bindings, since we can&#39;t bre=
ak them.
<br>&gt; &gt;&gt;&gt;=20
<br>&gt; &gt;&gt;&gt; Until those are fixed, I cannot see how this driver c=
an be merged,
<br>&gt; &gt;&gt;&gt; unfortunately.
<br></blockquote><br>Best regards,<br>Jernej =C5=A0krabec<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_13990_1971241755.1480529098318--

------=_Part_13989_24844867.1480529098317--
