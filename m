From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [RFC PATCH] ARM: dts: sun8i: add simplefb node
 for H3
Date: Wed, 30 Nov 2016 21:41:26 +0100
Message-ID: <185067972.ij8nq5Ea6J@jernej-laptop>
References: <20161130220324.3Kg4VPEw@smtp1m.mail.yandex.net> <2717236.xBNAaGdqdc@jernej-laptop> <20161130203724.a390595df0199ed19069f91d@free.fr>
Reply-To: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDP4JJM5QYGRB6HS7TAQKGQEZHTNYNA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161130203724.a390595df0199ed19069f91d-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne sreda, 30. november 2016 ob 20:37:24 CET je Jean-Francois Moine=20
napisal(a):
> On Wed, 30 Nov 2016 20:14:11 +0100
>=20
> Jernej =C5=A0krabec <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Dne =C4=8Detrtek, 01. december 2016 ob 03:03:14 CET je Icenowy Zheng=20
napisal(a):
> > > 2016=E5=B9=B412=E6=9C=881=E6=97=A5 02:49=E4=BA=8E Jernej Skrabec <jer=
nej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
> > >=20
> > > > Hi Jean-Fran=C3=A7ois,
> > > >=20
> > > > Dne sreda, 30. november 2016 10.35.08 UTC+1 je oseba Jean-Fran=C3=
=A7ois
> > > > Moine
> >=20
> > napisala:
> > > >> On Tue, 29 Nov 2016 22:59:32 +0100
> > > >>=20
> > > >> Maxime Ripard <maxime...-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > > >> > > > I'm still not sure which pipeline should I use.
> > > >> > > >=20
> > > >> > > > And, it seems that HDMI Slow Clock is not needed?
> > > >> > > >=20
> > > >> > > > (seems that it's only for EDID, but simplefb won't use EDID)
> > > >> > >=20
> > > >> > > So, I don't see how this may work.
> > > >> > > How can the u-boot know the resolutions of the HDMI display
> > > >> > > device?
> > > >> > >=20
> > > >> > > In other words: I have a new H3 board with the last u-boot and
> > > >> > > kernel.
> > > >> > > I plug my (rather old or brand new) HDMI display device.
> > > >> > > After powering on the system, I hope to get something on the
> > > >> > > screen.
> > > >> > > How?
> > > >> >=20
> > > >> > If it works like the driver for the first display engine in U-Bo=
ot,
> > > >> > it
> > > >> > will use the preferred mode reported by the EDID, and will fallb=
ack
> > > >> > to
> > > >> > 1024x768 if it cannot access it.
> > > >>=20
> > > >> Icenowy wrote: "simplefb won't use EDID"
> > > >>=20
> > > >> Then, if it is like in the kernel, the 1024x768 mode is VGA. It do=
es
> > > >> not work with HDMI (different timings).
> > > >=20
> > > > U-Boot driver now accept any timings recommended by EDID. So far it
> > > > was tested with at least following resolutions:
> > > > - 1920x1080 @ 60 Hz
> > > > - 1280x1024 @ 60 Hz
> > > > - 1280x800 @ 60 Hz (slight clock difference)
> > > > - 800x480 (not sure about frame rate)
> > > > - 3840x2160 @ 30 Hz (4K)
> > >=20
> > > I tested on 1024x600 (If my memory is right, it's @ 60Hz)
> > >=20
> > > > and nobody complained so far. I'm pretty sure 1024x768 would work.
>=20
> Check the timings offered by the DRM core.

I'm not really familiar with DRM code, but my Linux laptop happily works wi=
th=20
1024x768 @ 75 Hz and other non CEA resolutions through HDMI, so I guess it=
=20
should be possible here too. Isn't function drm_add_edid_modes() designed=
=20
exactly for that?

Anyway, this is off topic for simplefb. Simplefb driver will just take over=
=20
framebuffer set up by U-Boot with some additional info like width, height,=
=20
pitch... It doesn't have to deal with HW directly.

>=20
> > > >> > Maybe it would be worth exchanging on the EDID code that has bee=
n
> > > >> > done
> > > >> > for the u-boot driver too, so that it can be fixed in your drive=
r.
> > > >>=20
> > > >> The u-boot got my code, and, up to now, I could not fix the random=
 or
> > > >> permanent failures of EDID reading in some boards.
> > > >=20
> > > > I only have one OPi2, but as I said, EDID always worked for me.
>=20
> Happy guy!
>=20
> > > > The only
> > > > code left from you is for DE2. HDMI stuff is basically copied from
> > > > Rockhip
> > > > driver (including EDID reading), TCON code is now reverted to the s=
ame
> > > > as
> > > > it is in sunxi_display.c. I think it is worth to take a look at EDI=
D
> > > > code
> > > > and compare it.
> > >=20
> > > So is the TCON of DE 2.0 identical to the original TCON?
> > >=20
> > > If so, we should reuse sun4i-tcon ...
> >=20
> > Well, TCON is splitted in two parts (two base addresses), one for HDMI =
and
> > one for TV. However, register offsets are same as before, so I guess
> > driver reusage make sense. I think that there are few additional
> > registers, but they can be ignored for simplefb.
>=20
> The TCON1 of the H3 is not usable (no ckock). Analog TV has its own
> clock and I/O area.
>=20

True, H3 user manual can be misleading sometimes. But this doesn't change t=
he=20
fact that TCON0 has same register offsets with same meaning.

> --
> Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
> Jef		|		http://moinejf.free.fr/


--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
