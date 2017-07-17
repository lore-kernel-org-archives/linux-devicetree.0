From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v2 2/6] [media] rockchip/rga: v4l2 m2m support
Date: Mon, 17 Jul 2017 05:43:16 +0300
Message-ID: <2354312.gltkBKX446@avalon>
References: <1500101920-24039-1-git-send-email-jacob-chen@iotwrt.com> <1500137353.2353.1.camel@ndufresne.ca> <CAFLEztQZKqDwOyRCYLapa=730mWs80SOi6RuXwq5VR6m+RjO5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFLEztQZKqDwOyRCYLapa=730mWs80SOi6RuXwq5VR6m+RjO5w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Chen <jacobchen110-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Personnel <nicolas-dDhyB4GVkw9AFePFGvp55w@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jacob,

On Sunday 16 Jul 2017 12:19:41 Jacob Chen wrote:
> 2017-07-16 0:49 GMT+08:00 Personnel:
> > Le samedi 15 juillet 2017 =E0 12:42 +0300, Laurent Pinchart a =E9cr=
it :
> >> On Saturday 15 Jul 2017 14:58:36 Jacob Chen wrote:
> >> > Rockchip RGA is a separate 2D raster graphic acceleration unit. =
It
> >> > accelerates 2D graphics operations, such as point/line drawing, =
image
> >> > scaling, rotation, BitBLT, alpha blending and image blur/sharpne=
ss.
> >> >=20
> >> > The drvier is mostly based on s5p-g2d v4l2 m2m driver.
> >> > And supports various operations from the rendering pipeline.
> >> >=20
> >> >  - copy
> >> >  - fast solid color fill
> >> >  - rotation
> >> >  - flip
> >> >  - alpha blending
> >>=20
> >> I notice that you don't support the drawing operations. How do you=
 plan
> >> to support them later through the V4L2 M2M API ? I hate stating th=
e
> >> obvious, but wouldn't the DRM API be better fit for a graphic acce=
lerator
> >> ?
> >=20
> > It could fit, maybe, but it really lacks some framework. Also, DRM =
is
> > not really meant for M2M operation, and it's also not great for mul=
ti-
> > process. Until recently, there was competing drivers for Exynos, bo=
th
> > implemented in V4L2 and DRM, for similar rational, all DRM ones are=

> > being deprecated/removed.
> >=20
> > I think 2D blitters in V4L2 are fine, but they terribly lack someth=
ing
> > to differentiate them from converters/scalers when looking up the H=
W
> > list. Could be as simple as a capability flag, if I can suggest. Fo=
r
> > the reference, the 2D blitter on IMX6 has been used to implement a =
live
> > video mixer in GStreamer.
> >=20
> > https://bugzilla.gnome.org/show_bug.cgi?id=3D772766
>=20
> We have write a drm RGA driver.
> https://patchwork.kernel.org/patch/8630841/
>=20
> Here are the reasons that why i rewrite it to V4l2 M2M.
> 1. V4l2 have a better buffer framework. If it use DRM-GEM to handle b=
uffers,
> there will be much redundant cache flush, and we have to add much hac=
k code
> to workaround.

I'm glad to hear that you find buffer handling easy in V4L2 :-)

> 2. This driver will be used in rockchip linux project. We mostly use =
it to
> scale/colorconvert/rotate/mix video/camera stream.
> A V4L2 M2M drvier can be directly used in gstreamer.
>=20
> The disadvantages of V4l2 M2M API is that it's not stateless.
> It's inconvenient if user change size frequently, but it's OK,
> we have not yet need this and I think it's possible to extend. ;)

CC'ing Alexandre Courbot. Alex, how's the request API going ? :-)

> >> Additionally, V4L2 M2M has one source and one destination. How do =
you
> >> implement alpha blending in that case, which by definition require=
s at
> >> least two sources ?
> >=20
> > This type of HW only do in-place blits. When using such a node, the=

> > buffer queued on the V4L2_CAPTURE contains the destination image, a=
nd
> > the buffer queued on the V4L2_OUTPUT is the source image.
>=20
> Yep.

So the device performs bi-directional DMA on the capture queue buffers =
?=20
Interesting, does videobuf2 support that properly ?

> >>> The code in rga-hw.c is used to configure regs accroding to opera=
tions.
> >>>=20
> >>> The code in rga-buf.c is used to create private mmu table for RGA=
.
> >>> The tables is stored in a list, and be removed when buffer is cle=
anup.
> >>=20
> >> Looking at the implementation it seems to be a scatter-gather list=
, not
> >> an MMU. Is that right ? Does the hardware documentation refer to i=
t as an
> >> MMU ?
>=20
> It's a 1-level MMU... We use it like a scatter-gather list,
> It's also the reason why we don't use RGA with DRM API.

You might want to explain this in the code, otherwise someone will ask =
you why=20
you don't implement support for the MMU through the IOMMU API. Calling =
it=20
scatter-gather would solve that problem, but if the hardware manual cal=
ls it=20
an MMU, there's no reason not to use that name in the code.

> >>> Signed-off-by: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
> >>> ---
> >>>=20
> >>>  drivers/media/platform/Kconfig                |  11 +
> >>>  drivers/media/platform/Makefile               |   2 +
> >>>  drivers/media/platform/rockchip-rga/Makefile  |   3 +
> >>>  drivers/media/platform/rockchip-rga/rga-buf.c | 122 ++++
> >>>  drivers/media/platform/rockchip-rga/rga-hw.c  | 652 ++++++++++++=
++++++
> >>>  drivers/media/platform/rockchip-rga/rga-hw.h  | 437 ++++++++++++=

> >>>  drivers/media/platform/rockchip-rga/rga.c     | 958 ++++++++++++=
++++++
> >>>  drivers/media/platform/rockchip-rga/rga.h     | 111 +++
> >>>  8 files changed, 2296 insertions(+)
> >>>  create mode 100644 drivers/media/platform/rockchip-rga/Makefile
> >>>  create mode 100644 drivers/media/platform/rockchip-rga/rga-buf.c=

> >>>  create mode 100644 drivers/media/platform/rockchip-rga/rga-hw.c
> >>>  create mode 100644 drivers/media/platform/rockchip-rga/rga-hw.h
> >>>  create mode 100644 drivers/media/platform/rockchip-rga/rga.c
> >>>  create mode 100644 drivers/media/platform/rockchip-rga/rga.h

--=20
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
