From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: Re: [RFC PATCH] ARM: dts: sun8i: add simplefb node
 for H3
Date: Wed, 30 Nov 2016 20:37:24 +0100
Message-ID: <20161130203724.a390595df0199ed19069f91d@free.fr>
References: <20161130220324.3Kg4VPEw@smtp1m.mail.yandex.net>
	<2717236.xBNAaGdqdc@jernej-laptop>
Reply-To: moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBB6GU7TAQKGQERTEOIGI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <2717236.xBNAaGdqdc@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 30 Nov 2016 20:14:11 +0100
Jernej =C5=A0krabec <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Dne =C4=8Detrtek, 01. december 2016 ob 03:03:14 CET je Icenowy Zheng napi=
sal(a):
> > 2016=E5=B9=B412=E6=9C=881=E6=97=A5 02:49=E4=BA=8E Jernej Skrabec <jerne=
j.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
> >=20
> > > Hi Jean-Fran=C3=A7ois,
> > >=20
> > > Dne sreda, 30. november 2016 10.35.08 UTC+1 je oseba Jean-Fran=C3=A7o=
is Moine=20
> napisala:
> > >> On Tue, 29 Nov 2016 22:59:32 +0100
> > >>=20
> > >> Maxime Ripard <maxime...-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > >> > > > I'm still not sure which pipeline should I use.
> > >> > > >=20
> > >> > > > And, it seems that HDMI Slow Clock is not needed?
> > >> > > >=20
> > >> > > > (seems that it's only for EDID, but simplefb won't use EDID)
> > >> > >=20
> > >> > > So, I don't see how this may work.
> > >> > > How can the u-boot know the resolutions of the HDMI display devi=
ce?
> > >> > >=20
> > >> > > In other words: I have a new H3 board with the last u-boot and
> > >> > > kernel.
> > >> > > I plug my (rather old or brand new) HDMI display device.
> > >> > > After powering on the system, I hope to get something on the scr=
een.
> > >> > > How?
> > >> >=20
> > >> > If it works like the driver for the first display engine in U-Boot=
, it
> > >> > will use the preferred mode reported by the EDID, and will fallbac=
k to
> > >> > 1024x768 if it cannot access it.
> > >>=20
> > >> Icenowy wrote: "simplefb won't use EDID"
> > >>=20
> > >> Then, if it is like in the kernel, the 1024x768 mode is VGA. It does
> > >> not work with HDMI (different timings).
> > >=20
> > > U-Boot driver now accept any timings recommended by EDID. So far it
> > > was tested with at least following resolutions:
> > > - 1920x1080 @ 60 Hz
> > > - 1280x1024 @ 60 Hz
> > > - 1280x800 @ 60 Hz (slight clock difference)
> > > - 800x480 (not sure about frame rate)
> > > - 3840x2160 @ 30 Hz (4K)
> >=20
> > I tested on 1024x600 (If my memory is right, it's @ 60Hz)
> >=20
> > > and nobody complained so far. I'm pretty sure 1024x768 would work.

Check the timings offered by the DRM core.

> > >=20
> > >> > Maybe it would be worth exchanging on the EDID code that has been =
done
> > >> > for the u-boot driver too, so that it can be fixed in your driver.
> > >>=20
> > >> The u-boot got my code, and, up to now, I could not fix the random o=
r
> > >> permanent failures of EDID reading in some boards.
> > >=20
> > > I only have one OPi2, but as I said, EDID always worked for me.

Happy guy!

> > > The only
> > > code left from you is for DE2. HDMI stuff is basically copied from Ro=
ckhip
> > > driver (including EDID reading), TCON code is now reverted to the sam=
e as
> > > it is in sunxi_display.c. I think it is worth to take a look at EDID =
code
> > > and compare it.
> >=20
> > So is the TCON of DE 2.0 identical to the original TCON?
> >=20
> > If so, we should reuse sun4i-tcon ...
>=20
> Well, TCON is splitted in two parts (two base addresses), one for HDMI an=
d one=20
> for TV. However, register offsets are same as before, so I guess driver=
=20
> reusage make sense. I think that there are few additional registers, but =
they=20
> can be ignored for simplefb.

The TCON1 of the H3 is not usable (no ckock). Analog TV has its own
clock and I/O area.

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
