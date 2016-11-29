From: Jernej Skrabec <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 3/5] ARM: dts: sun8i-h3: add HDMI video nodes
Date: Tue, 29 Nov 2016 14:15:04 -0800 (PST)
Message-ID: <6d075858-7939-4459-9787-5dec2e5e943f@googlegroups.com>
References: <cover.1479641523.git.moinejf@free.fr>
 <cdf50b8433e2d9a053e35f8788bfcd5d41504312.1479641523.git.moinejf@free.fr>
 <3188681480066911@web3h.yandex.ru>
 <20161125112213.83420594eb435b6bb1a4d164@free.fr>
Reply-To: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_3862_1491809682.1480457704718"
Return-path: <linux-sunxi+bncBDP4JJM5QYGRB2P367AQKGQE4RO36IQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161125112213.83420594eb435b6bb1a4d164-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: icenowy-ymACFijhrKM@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_3862_1491809682.1480457704718
Content-Type: multipart/alternative;
	boundary="----=_Part_3863_317279487.1480457704718"

------=_Part_3863_317279487.1480457704718
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Jean-Fran=C3=A7ois,

Dne petek, 25. november 2016 11.22.20 UTC+1 je oseba Jean-Fran=C3=A7ois Moi=
ne=20
napisala:
>
> On Fri, 25 Nov 2016 17:41:51 +0800=20
> Icenowy Zheng <ice...-ymACFijhrKM@public.gmane.org <javascript:>> wrote:=20
>
> > After removing CLK_PLL_DE's assigned-clock, the kernel passes=20
> compilation.=20
>
> The 'pll-de' and 'de' must have a fixed rate. Otherwise, if you do not=20
> use the legacy u-boot, I don't know which can be the rate of the DE.=20
>
> > However, it cannot recognize any HDMI screen...=20
> >=20
> > (My board is Orange Pi One, and I manually added status=3D"okay"; to=20
> &lcd0, &de, &hdmi)=20
> >=20
> > [   16.507802] sun8i-de2 1000000.de-controller: bound=20
> 1c0c000.lcd-controller (ops de2_lcd_ops [sun8i_de2_drm])=20
> > [   16.675948] sun8i-de2 1000000.de-controller: bound 1ee0000.hdmi (ops=
=20
> de2_hdmi_fini [sun8i_de2_hdmi])=20
> > [   16.685120] [drm] Supports vblank timestamp caching Rev 2=20
> (21.10.2013).=20
> > [   16.695876] [drm] No driver support for vblank timestamp query.=20
> > [   16.701862] sun8i-de2 1000000.de-controller: No connectors reported=
=20
> connected with modes=20
> > [   16.713061] [drm] Cannot find any crtc or sizes - going 1024x768=20
> > [   16.734214] Console: switching to colour frame buffer device 128x48=
=20
> > [   16.751022] sun8i-de2 1000000.de-controller: fb0:  frame buffer=20
> device=20
>
> I put a 'pr_warn' message is case the EDID cannot be read.=20
> Have you this message?=20
>
> Anyway, there is a problem with the EDID:=20
> - my Orange Pi 2 (H3) randomly fails to read it. But this succeeds after=
=20
>   rebooting once or twice.=20
>

My U-Boot driver never exhibited a problem with reading EDID on OPi2.=20
However,
I'm reusing code from Rockchip HDMI U-Boot driver for this (with some=20
Allwinner
adjustments).
=20

> - my Banana Pi M2+ (H3) reads it correctly each time.=20
> - my Banana Pi M3 (A83T) can never read it.=20
>
> BTW, on first tries, I was forcing a CEA mode thru the kernel command=20
> line. This was working with the OPi2 and BPiM3, but there was no sound.=
=20
> In the last version, I use a EDID in edid_firmware for having sound=20
> with the BPiM3. This works fine.=20
> But, forcing a CEA mode is no more possible, so, when the OPi2 cannot=20
> read the EDID, the system switches to a VGA mode (default 1024x768)=20
> which is not supported. It seems that this is your case.=20
>
> So, in brief, if your board cannot read the EDID, put a EDID somewhere=20
> and its path in /sys/module/drm_kms_helper/parameters/edid_firmware.=20
> There will be no console, but X11 will work correctly.=20
>
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

------=_Part_3863_317279487.1480457704718
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jean-Fran=C3=A7ois,<br><br>Dne petek, 25. november 2016=
 11.22.20 UTC+1 je oseba Jean-Fran=C3=A7ois Moine napisala:<blockquote clas=
s=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #c=
cc solid;padding-left: 1ex;">On Fri, 25 Nov 2016 17:41:51 +0800
<br>Icenowy Zheng &lt;<a href=3D"javascript:" target=3D"_blank" gdf-obfusca=
ted-mailto=3D"nM5JXKD5CAAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#3=
9;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#3=
9;;return true;">ice...-ymACFijhrKM@public.gmane.org</a>&gt; wrote:
<br>
<br>&gt; After removing CLK_PLL_DE&#39;s assigned-clock, the kernel passes =
compilation.
<br>
<br>The &#39;pll-de&#39; and &#39;de&#39; must have a fixed rate. Otherwise=
, if you do not
<br>use the legacy u-boot, I don&#39;t know which can be the rate of the DE=
.
<br>
<br>&gt; However, it cannot recognize any HDMI screen...
<br>&gt;=20
<br>&gt; (My board is Orange Pi One, and I manually added status=3D&quot;ok=
ay&quot;; to &amp;lcd0, &amp;de, &amp;hdmi)
<br>&gt;=20
<br>&gt; [ =C2=A0 16.507802] sun8i-de2 1000000.de-controller: bound 1c0c000=
.lcd-controller (ops de2_lcd_ops [sun8i_de2_drm])
<br>&gt; [ =C2=A0 16.675948] sun8i-de2 1000000.de-controller: bound 1ee0000=
.hdmi (ops de2_hdmi_fini [sun8i_de2_hdmi])
<br>&gt; [ =C2=A0 16.685120] [drm] Supports vblank timestamp caching Rev 2 =
(21.10.2013).
<br>&gt; [ =C2=A0 16.695876] [drm] No driver support for vblank timestamp q=
uery.
<br>&gt; [ =C2=A0 16.701862] sun8i-de2 1000000.de-controller: No connectors=
 reported connected with modes
<br>&gt; [ =C2=A0 16.713061] [drm] Cannot find any crtc or sizes - going 10=
24x768
<br>&gt; [ =C2=A0 16.734214] Console: switching to colour frame buffer devi=
ce 128x48
<br>&gt; [ =C2=A0 16.751022] sun8i-de2 1000000.de-controller: fb0: =C2=A0fr=
ame buffer device
<br>
<br>I put a &#39;pr_warn&#39; message is case the EDID cannot be read.
<br>Have you this message?
<br>
<br>Anyway, there is a problem with the EDID:
<br>- my Orange Pi 2 (H3) randomly fails to read it. But this succeeds afte=
r
<br>=C2=A0 rebooting once or twice.
<br></blockquote><div><br>My U-Boot driver never exhibited a problem with r=
eading EDID on OPi2. However,<br>I&#39;m reusing code from Rockchip HDMI U-=
Boot driver for this (with some Allwinner<br>adjustments).<br>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;bord=
er-left: 1px #ccc solid;padding-left: 1ex;">- my Banana Pi M2+ (H3) reads i=
t correctly each time.
<br>- my Banana Pi M3 (A83T) can never read it.
<br>
<br>BTW, on first tries, I was forcing a CEA mode thru the kernel command
<br>line. This was working with the OPi2 and BPiM3, but there was no sound.
<br>In the last version, I use a EDID in edid_firmware for having sound
<br>with the BPiM3. This works fine.
<br>But, forcing a CEA mode is no more possible, so, when the OPi2 cannot
<br>read the EDID, the system switches to a VGA mode (default 1024x768)
<br>which is not supported. It seems that this is your case.
<br>
<br>So, in brief, if your board cannot read the EDID, put a EDID somewhere
<br>and its path in /sys/module/drm_kms_helper/<wbr>parameters/edid_firmwar=
e.
<br>There will be no console, but X11 will work correctly.
<br>
<br>--=20
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

------=_Part_3863_317279487.1480457704718--

------=_Part_3862_1491809682.1480457704718--
