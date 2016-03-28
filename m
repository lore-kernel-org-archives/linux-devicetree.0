From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [RFC PATCH v1 0/4] Add Rockchip RGA support
Date: Mon, 28 Mar 2016 23:46:22 +0200
Message-ID: <1571169.Hy8an0n7lM@diego>
References: <1458552518-25527-1-git-send-email-ykk@rock-chips.com> <13797722.SiyveTZ1bB@diego> <CACvgo52vL5_HQfgfnxRMzSJXYw-sWT3QozZaWswQXHr9-bwBSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACvgo52vL5_HQfgfnxRMzSJXYw-sWT3QozZaWswQXHr9-bwBSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-rockchip <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Montag, 28. M=E4rz 2016, 22:35:36 schrieb Emil Velikov:
> On 28 March 2016 at 19:44, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:
> > Am Montag, 28. M=E4rz 2016, 13:21:02 schrieb Emil Velikov:
> >> On 22 March 2016 at 00:42, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:
> >> > Hi Yakir,
> >> >=20
> >> > Am Montag, 21. M=E4rz 2016, 20:17:46 schrieb Yakir Yang:
> >> >> On 03/21/2016 07:29 PM, Heiko St=FCbner wrote:
> >> >> > Am Montag, 21. M=E4rz 2016, 17:28:38 schrieb Yakir Yang:
> >> >> >> This patch set would add the RGA direct rendering based 2d g=
raphics
> >> >> >> acceleration module.
> >> >> >=20
> >> >> > very cool to see that.
> >> >>=20
> >> >> ;)
> >> >>=20
> >> >> >> This patch set is based on git repository below:
> >> >> >> git://people.freedesktop.org/~airlied/linux drm-next
> >> >> >> commit id: 568d7c764ae01f3706085ac8f0d8a8ac7e826bd7
> >> >> >>=20
> >> >> >> And the RGA driver is based on Exynos G2D driver, it only ma=
nages
> >> >> >> the
> >> >> >> command lists received from user, so user should make the co=
mmand
> >> >> >> list
> >> >> >> to data and registers needed by operation to use.
> >> >> >>=20
> >> >> >> I have prepared an userspace demo application for testing:
> >> >> >>    https://github.com/yakir-Yang/libdrm-rockchip
> >> >> >>=20
> >> >> >> That is a rockchip libdrm library, and I have write a simple=
 test
> >> >> >> case
> >> >> >> "rockchip_rga_test" that would test the below RGA features:
> >> >> >> - solid
> >> >> >> - copy
> >> >> >> - rotation
> >> >> >> - flip
> >> >> >> - window clip
> >> >> >> - dithering
> >> >> >=20
> >> >> > Did you submit your libdrm changes as well?
> >> >> >=20
> >> >> > Userspace-interfaces need to be stable so the other side must=
 also
> >> >> > get
> >> >> > accepted - even before the kernel change if I remember correc=
tly.
> >> >>=20
> >> >> Got it, and I just saw exynos_fimg2d already landed at mainline
> >> >> libdrm.
> >> >> But I don't find the way to submit patches to libdrm, would you=
 like
> >> >> share some helps here ;)
> >> >=20
> >> > Looking at the libdrm sources on cgit.freedesktop.org, I did not=
 find
> >> > any
> >> > specific manual on submitting patches.
> >> >=20
> >> > But looking at the dri-list archive, dri-devel-PD4FTy7X32lNgt0PjOBp93gSJqDPrsil@public.gmane.org=
=2Eorg is
> >> > the
> >> > right list and looking at the libdrm history it looks like Emil =
Velikov
> >> > <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> seems to be doing maintenance-stuff i=
n
> >> > libdrm.
> >> > And as a 3rd recipient, please also include the linux-rockchip l=
ist.
> >> >=20
> >> > @Emil, please shout if I read that wrong :-)
> >>=20
> >> You got it spot on Heiko. There are a few notes though...
> >>=20
> >> As one reuses the existing hardware/IP block, it would be better t=
o
> >> avoid copy/pasting code around.
> >>=20
> >> Namely:
> >>  - (if possible) factor out the exynos g2d kernel functionality to=
 a
> >>=20
> >> separate kernel module and wire up the rockhip (via dt ?) to use i=
t
> >>=20
> >>  - factor out the g2d specifics out of exynos_drm.h (into
> >>=20
> >> exynos_g2d_drm.h perhaps ?) and make sure exynos_drm.h includes th=
e
> >> new header
> >=20
> > I think the IP blocks themself are quite different between Rockchip=
's RGA
> > and Samsung's g2d and I guess the similarities are more along the l=
ines
> > on how that gets integrated into the respective drm driver and user=
space.
> In this case, the exynos_g2d_drm.h seems like a good idea. As I'm
> obviously biased, it's better to check how others feel on the topic.
>=20
> >>  - if neither of these are possible, then please ensure that the n=
ew
> >>=20
> >> header uses correct types (see the docs [1]), use MIT/X11 license =
(if
> >> possible) and link where upstream userspace is happy with the
> >> interface (ideally more than a simple test app like libdrm)
> >> These might sound like an overkill, although getting UAPI right an=
d
> >> maintaining it forever forces us to do so.
> >=20
> > As for a real-world usecase, maybe the armsoc xserver might be some=
what
> > easy to use. While the core changes I did are in the core project
> > already, I'm still keeping the actual Rockchip support separate [0]=
 due
> > to the not-yet- resolved create_gem ioctl.
> >=20
> > Anyway, the armsoc xserver has some exa implementation hooks were I=
 guess
> > it might be relatively easy to hook up soc-specific things.
>=20
> Ouch the armsoc ddx... Last time I've checked it felt like a place
> where everyone is doing his own thing, with no actual reviews and/or
> maintainer.

The development rate is pretty low and maintainership is unclear but th=
e per-
soc voodoo is quite limited to the GEM-creation and everything else see=
ms=20
somewhat nice when compared for example to the older versions of the dd=
x.


> Iirc most/all of it's functionality was achievable with
> modesetting ddx (with or without glamor) ? I take it that things have
> changed and/or I misunderstood something ?

I don't really understand that whole stack or how xservers work on a wh=
ole ;-)
I was merely able to make the _binary_ mali-driver work with this one a=
nd=20
remembered that there were hooks for future per-soc exa functions.

I guess for that glamor thing you'd need an actual gpu driver and not t=
hat=20
libGL-override voodoo those crazy binary drivers do.

At least the modesetting ddx didn't like mali-binary-driver.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
