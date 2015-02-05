From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH] media: i2c: add support for omnivision's ov2659 sensor
Date: Thu, 05 Feb 2015 13:53:16 +0200
Message-ID: <3110055.vYzQi51GtK@avalon>
References: <1421365163-29394-1-git-send-email-prabhakar.csengg@gmail.com> <2517945.eGhlRo2yDj@avalon> <CA+V-a8uTzo3DL+rCGK2wPHtwqQTDxfzNOBXB+RVszJnThSBMqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+V-a8uTzo3DL+rCGK2wPHtwqQTDxfzNOBXB+RVszJnThSBMqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Lad, Prabhakar" <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: LMML <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Prabhakar,

On Wednesday 04 February 2015 20:55:02 Lad, Prabhakar wrote:
> On Wed, Feb 4, 2015 at 5:03 PM, Laurent Pinchart wrote:
> > On Thursday 15 January 2015 23:39:23 Lad, Prabhakar wrote:
> >> From: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
> >> 
> >> this patch adds support for omnivision's ov2659
> >> sensor.
> >> 
> >> Signed-off-by: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
> >> Signed-off-by: Lad, Prabhakar <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
> >> 
> >>  .../devicetree/bindings/media/i2c/ov2659.txt       |   33 +
> >>  .../devicetree/bindings/vendor-prefixes.txt        |    1 +
> >>  MAINTAINERS                                        |   10 +
> >>  drivers/media/i2c/Kconfig                          |   11 +
> >>  drivers/media/i2c/Makefile                         |    1 +
> >>  drivers/media/i2c/ov2659.c                         | 1623
> >>  +++++++++++++++++
> >>  include/media/ov2659.h                             |   33 +
> >>  7 files changed, 1712 insertions(+)
> >>  create mode 100644
> >>  Documentation/devicetree/bindings/media/i2c/ov2659.txt
> >>  create mode 100644 drivers/media/i2c/ov2659.c
> >>  create mode 100644 include/media/ov2659.h

[snip]

> >> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> >> new file mode 100644
> >> index 0000000..ce8ec8d
> >> --- /dev/null
> >> +++ b/drivers/media/i2c/ov2659.c
> >> @@ -0,0 +1,1623 @@

[snip]

> >> +static const struct ov2659_framesize ov2659_framesizes[] = {
> >> +     { /* QVGA */
> >> +             .width          = 320,
> >> +             .height         = 240,
> >> +             .regs           = ov2659_qvga,
> >> +             .max_exp_lines  = 248,
> >> +     }, { /* VGA */
> >> +             .width          = 640,
> >> +             .height         = 480,
> >> +             .regs           = ov2659_vga,
> >> +             .max_exp_lines  = 498,
> >> +     }, { /* SVGA */
> >> +             .width          = 800,
> >> +             .height         = 600,
> >> +             .regs           = ov2659_svga,
> >> +             .max_exp_lines  = 498,
> >> +     }, { /* XGA */
> >> +             .width          = 1024,
> >> +             .height         = 768,
> >> +             .regs           = ov2659_xga,
> >> +             .max_exp_lines  = 498,
> >> +     }, { /* 720P */
> >> +             .width          = 1280,
> >> +             .height         = 720,
> >> +             .regs           = ov2659_720p,
> >> +             .max_exp_lines  = 498,
> >> +     }, { /* SXGA */
> >> +             .width          = 1280,
> >> +             .height         = 1024,
> >> +             .regs           = ov2659_sxga,
> >> +             .max_exp_lines  = 1048,
> >> +     }, { /* UXGA */
> >> +             .width          = 1600,
> >> +             .height         = 1200,
> >> +             .regs           = ov2659_uxga,
> >> +             .max_exp_lines  = 498,
> >> +     },
> >> +};
> > 
> > That's what bothers me the most about drivers for Omnivision sensors. For
> > some reason (I'd bet on lack of proper documentation) they list a couple
> > of supported resolutions with corresponding register values, instead of
> > computing the register values from the format configured by userspace.
> > That's not the way we want to go. Prabhakar, do you have enough
> > documentation to fix that ?
>
> I am afraid I have limited documentation here.

How limited ? :-) I assume someone has documentation, given that the patch 
contains a larger number of #define's with register names.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
