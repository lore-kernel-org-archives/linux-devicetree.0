From: Jernej Skrabec <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 0/8] drm: sun8i: Add DE2 HDMI video support
Date: Tue, 29 Nov 2016 14:47:20 -0800 (PST)
Message-ID: <8398357e-5c5e-4d76-9022-1c668aff5076@googlegroups.com>
References: <cover.1480414715.git.moinejf@free.fr>
 <20161129213650.uqcgekodq77wlmxs@lukather>
Reply-To: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_920_701122045.1480459640752"
Return-path: <linux-sunxi+bncBDP4JJM5QYGRB6MK7DAQKGQEJ47DPHQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161129213650.uqcgekodq77wlmxs@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: moinejf-GANU6spQydw@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_920_701122045.1480459640752
Content-Type: multipart/alternative;
	boundary="----=_Part_921_2032391095.1480459640753"

------=_Part_921_2032391095.1480459640753
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

Dne torek, 29. november 2016 22.37.03 UTC+1 je oseba Maxime Ripard napisala=
:
>
> On Tue, Nov 29, 2016 at 11:18:35AM +0100, Jean-Francois Moine wrote:=20
> > This patchset series adds HDMI video support to the Allwinner=20
> > sun8i SoCs which include the display engine 2 (DE2).=20
> > The driver contains the code for the A83T and H3 SoCs, and=20
> > some H3 boards, but it could be used/extended for other SoCs=20
> > (A64, H2, H5) and boards (Banana PIs, Orange PIs).=20
>
> Honestly, I'm getting a bit worried by the fact that you ignore=20
> reviews.=20
>
> On the important reviews that you got that are to be seen as major=20
> issues that block the inclusion, we have:=20
>   - The fact that the HDMI driver is actually just a designware IP,=20
>     and while you should use the driver that already exists, you just=20
>     duplicated all that code.=20
>
> =20
That might be hard thing to do. A83T fits perfectly, but H3 and newer SoCs=
=20
do
not. They are using completely different HDMI phy. Decoupling controller an=
d
phy code means rewritting a good portion of the code, unless some tricks ar=
e
applied, like calling phy function pointers, if they are defined.

Register addresses also differ, but that can be easily solved by using
undocumented magic value to restore them.
=20

>   - The fact that you ignored Rob (v6) and I (v5) comment on using OF=20
>     graph to model the connection between the display engine and the=20
>     TCON. Something that Laurent also pointed out in this version.=20
>
>   - The fact that you ignored that you needed an HDMI connector node=20
>     as a child of the HDMI controller. This has been reported by Rob=20
>     (v6) and yet again in this version by Laurent.=20
>
>   - And finally the fact that we can't have several display engine in=20
>     parallel, if needs be. This has happened in the past already on=20
>     Allwinner SoCs, so it's definitely something we should consider in=20
>     the DT bindings, since we can't break them.=20
>
> Until those are fixed, I cannot see how this driver can be merged,=20
> unfortunately.=20
>
> Maxime=20
>
> --=20
> Maxime Ripard, Free Electrons=20
> Embedded Linux and Kernel engineering=20
> http://free-electrons.com


Best regards,
Jernej =C5=A0krabec=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_921_2032391095.1480459640753
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Maxime,<br><br>Dne torek, 29. november 2016 22.37.03 UT=
C+1 je oseba Maxime Ripard napisala:<blockquote class=3D"gmail_quote" style=
=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: =
1ex;">On Tue, Nov 29, 2016 at 11:18:35AM +0100, Jean-Francois Moine wrote:
<br>&gt; This patchset series adds HDMI video support to the Allwinner
<br>&gt; sun8i SoCs which include the display engine 2 (DE2).
<br>&gt; The driver contains the code for the A83T and H3 SoCs, and
<br>&gt; some H3 boards, but it could be used/extended for other SoCs
<br>&gt; (A64, H2, H5) and boards (Banana PIs, Orange PIs).
<br>
<br>Honestly, I&#39;m getting a bit worried by the fact that you ignore
<br>reviews.
<br>
<br>On the important reviews that you got that are to be seen as major
<br>issues that block the inclusion, we have:
<br>=C2=A0 - The fact that the HDMI driver is actually just a designware IP=
,
<br>=C2=A0 =C2=A0 and while you should use the driver that already exists, =
you just
<br>=C2=A0 =C2=A0 duplicated all that code.
<br>
<br></blockquote><div>=C2=A0</div><div>That might be hard thing to do. A83T=
 fits perfectly, but H3 and newer SoCs do<br>not. They are using completely=
 different HDMI phy. Decoupling controller and<br>phy code means rewritting=
 a good portion of the code, unless some tricks are<br>applied, like callin=
g phy function pointers, if they are defined.<br><br>Register addresses als=
o differ, but that can be easily solved by using<br>undocumented magic valu=
e to restore them.<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: =
1ex;">=C2=A0 - The fact that you ignored Rob (v6) and I (v5) comment on usi=
ng OF
<br>=C2=A0 =C2=A0 graph to model the connection between the display engine =
and the
<br>=C2=A0 =C2=A0 TCON. Something that Laurent also pointed out in this ver=
sion.
<br>
<br>=C2=A0 - The fact that you ignored that you needed an HDMI connector no=
de
<br>=C2=A0 =C2=A0 as a child of the HDMI controller. This has been reported=
 by Rob
<br>=C2=A0 =C2=A0 (v6) and yet again in this version by Laurent.
<br>
<br>=C2=A0 - And finally the fact that we can&#39;t have several display en=
gine in
<br>=C2=A0 =C2=A0 parallel, if needs be. This has happened in the past alre=
ady on
<br>=C2=A0 =C2=A0 Allwinner SoCs, so it&#39;s definitely something we shoul=
d consider in
<br>=C2=A0 =C2=A0 the DT bindings, since we can&#39;t break them.
<br>
<br>Until those are fixed, I cannot see how this driver can be merged,
<br>unfortunately.
<br>
<br>Maxime
<br>
<br>--=20
<br>Maxime Ripard, Free Electrons
<br>Embedded Linux and Kernel engineering
<br><a href=3D"http://free-electrons.com" target=3D"_blank" rel=3D"nofollow=
" onmousedown=3D"this.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F=
%2Ffree-electrons.com\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNGC8C9pT7xKJEa=
bITLGL5cqtolifQ&#39;;return true;" onclick=3D"this.href=3D&#39;http://www.g=
oogle.com/url?q\x3dhttp%3A%2F%2Ffree-electrons.com\x26sa\x3dD\x26sntz\x3d1\=
x26usg\x3dAFQjCNGC8C9pT7xKJEabITLGL5cqtolifQ&#39;;return true;">http://free=
-electrons.com</a></blockquote><div><br>Best regards,<br>Jernej =C5=A0krabe=
c <br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_921_2032391095.1480459640753--

------=_Part_920_701122045.1480459640752--
