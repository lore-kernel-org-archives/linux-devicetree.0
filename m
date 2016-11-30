From: Jernej Skrabec <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH] ARM: dts: sun8i: add simplefb node for H3
Date: Wed, 30 Nov 2016 10:49:49 -0800 (PST)
Message-ID: <6794e52c-9a53-42ba-805d-f1912c1c7f25@googlegroups.com>
References: <20161128095900.27615-1-icenowy@aosc.xyz>
 <20161128114218.14d2ed434802a20fa6b62023@free.fr>
 <20161129215932.kmk6qodthicadpyb@lukather>
 <20161130103503.01061303ace71c74e1cac66f@free.fr>
Reply-To: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_16902_1564419019.1480531789188"
Return-path: <linux-sunxi+bncBDP4JJM5QYGRBTN67TAQKGQEANEN2KQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161130103503.01061303ace71c74e1cac66f-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, icenowy-ymACFijhrKM@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, jernej.skrabec-gGgVlfcn5nU@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_16902_1564419019.1480531789188
Content-Type: multipart/alternative;
	boundary="----=_Part_16903_2002916085.1480531789189"

------=_Part_16903_2002916085.1480531789189
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Jean-Fran=C3=A7ois,

Dne sreda, 30. november 2016 10.35.08 UTC+1 je oseba Jean-Fran=C3=A7ois Moi=
ne=20
napisala:
>
> On Tue, 29 Nov 2016 22:59:32 +0100=20
> Maxime Ripard <maxime...-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org <javascript:>> wrote:=20
>
> > > > I'm still not sure which pipeline should I use.=20
> > > >=20
> > > > And, it seems that HDMI Slow Clock is not needed?=20
> > > >=20
> > > > (seems that it's only for EDID, but simplefb won't use EDID)=20
> > >=20
> > > So, I don't see how this may work.=20
> > > How can the u-boot know the resolutions of the HDMI display device?=
=20
> > >=20
> > > In other words: I have a new H3 board with the last u-boot and kernel=
.=20
> > > I plug my (rather old or brand new) HDMI display device.=20
> > > After powering on the system, I hope to get something on the screen.=
=20
> > > How?=20
> >=20
> > If it works like the driver for the first display engine in U-Boot, it=
=20
> > will use the preferred mode reported by the EDID, and will fallback to=
=20
> > 1024x768 if it cannot access it.=20
>
> Icenowy wrote: "simplefb won't use EDID"=20
>
> Then, if it is like in the kernel, the 1024x768 mode is VGA. It does=20
> not work with HDMI (different timings).=20
>

U-Boot driver now accept any timings recommended by EDID. So far it
was tested with at least following resolutions:
- 1920x1080 @ 60 Hz
- 1280x1024 @ 60 Hz
- 1280x800 @ 60 Hz (slight clock difference)
- 800x480 (not sure about frame rate)
- 3840x2160 @ 30 Hz (4K)

and nobody complained so far. I'm pretty sure 1024x768 would work.


> > Maybe it would be worth exchanging on the EDID code that has been done=
=20
> > for the u-boot driver too, so that it can be fixed in your driver.=20
>
> The u-boot got my code, and, up to now, I could not fix the random or=20
> permanent failures of EDID reading in some boards.=20
>
>
I only have one OPi2, but as I said, EDID always worked for me. The only
code left from you is for DE2. HDMI stuff is basically copied from Rockhip
driver (including EDID reading), TCON code is now reverted to the same as
it is in sunxi_display.c. I think it is worth to take a look at EDID code=
=20
and
compare it.
=20

> --=20
> Ken ar c'henta=C3=B1        |              ** Breizh ha Linux atav! **=20
> Jef                |                http://moinejf.free.fr/


Best regards,
Jernej =C5=A0krabec=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_16903_2002916085.1480531789189
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jean-Fran=C3=A7ois,<br><br>Dne sreda, 30. november 2016=
 10.35.08 UTC+1 je oseba Jean-Fran=C3=A7ois Moine napisala:<blockquote clas=
s=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #c=
cc solid;padding-left: 1ex;">On Tue, 29 Nov 2016 22:59:32 +0100
<br>Maxime Ripard &lt;<a href=3D"javascript:" target=3D"_blank" gdf-obfusca=
ted-mailto=3D"YJ3gy_N_CgAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#3=
9;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#3=
9;;return true;">maxime...@free-electrons.<wbr>com</a>&gt; wrote:
<br>
<br>&gt; &gt; &gt; I&#39;m still not sure which pipeline should I use.
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; And, it seems that HDMI Slow Clock is not needed?
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; (seems that it&#39;s only for EDID, but simplefb won&#39=
;t use EDID)
<br>&gt; &gt;=20
<br>&gt; &gt; So, I don&#39;t see how this may work.
<br>&gt; &gt; How can the u-boot know the resolutions of the HDMI display d=
evice?
<br>&gt; &gt;=20
<br>&gt; &gt; In other words: I have a new H3 board with the last u-boot an=
d kernel.
<br>&gt; &gt; I plug my (rather old or brand new) HDMI display device.
<br>&gt; &gt; After powering on the system, I hope to get something on the =
screen.
<br>&gt; &gt; How?
<br>&gt;=20
<br>&gt; If it works like the driver for the first display engine in U-Boot=
, it
<br>&gt; will use the preferred mode reported by the EDID, and will fallbac=
k to
<br>&gt; 1024x768 if it cannot access it.
<br>
<br>Icenowy wrote: &quot;simplefb won&#39;t use EDID&quot;
<br>
<br>Then, if it is like in the kernel, the 1024x768 mode is VGA. It does
<br>not work with HDMI (different timings).
<br></blockquote><div><br>U-Boot driver now accept any timings recommended =
by EDID. So far it<br>was tested with at least following resolutions:<br>- =
1920x1080 @ 60 Hz<br>- 1280x1024 @ 60 Hz<br>- 1280x800 @ 60 Hz (slight cloc=
k difference)<br>- 800x480 (not sure about frame rate)<br>-<span class=3D"l=
it"> 3840x2160</span> @ 30 Hz (4K)<br><br>and nobody complained so far. I&#=
39;m pretty sure 1024x768 would work.<br><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid=
;padding-left: 1ex;">
<br>&gt; Maybe it would be worth exchanging on the EDID code that has been =
done
<br>&gt; for the u-boot driver too, so that it can be fixed in your driver.
<br>
<br>The u-boot got my code, and, up to now, I could not fix the random or
<br>permanent failures of EDID reading in some boards.
<br>
<br></blockquote><div><br>I only have one OPi2, but as I said, EDID always =
worked for me. The only<br>code left from you is for DE2. HDMI stuff is bas=
ically copied from Rockhip<br>driver (including EDID reading), TCON code is=
 now reverted to the same as<br>it is in sunxi_display.c. I think it is wor=
th to take a look at EDID code and<br>compare it.<br>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: =
1px #ccc solid;padding-left: 1ex;">--=20
<br>Ken ar c&#39;henta=C3=B1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0**=
 Breizh ha Linux atav! **
<br>Jef=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<a href=3D"http:=
//moinejf.free.fr/" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.=
href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Fmoinejf.free.fr%2F\=
x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNESRA_te-ZTLUIi7EVaDrS5Q9YJ7w&#39;;r=
eturn true;" onclick=3D"this.href=3D&#39;http://www.google.com/url?q\x3dhtt=
p%3A%2F%2Fmoinejf.free.fr%2F\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNESRA_t=
e-ZTLUIi7EVaDrS5Q9YJ7w&#39;;return true;">http://moinejf.free.fr/</a></bloc=
kquote><div><br>Best regards,<br>Jernej =C5=A0krabec <br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_16903_2002916085.1480531789189--

------=_Part_16902_1564419019.1480531789188--
