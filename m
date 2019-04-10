Return-Path: <SRS0=zLlM=SM=pengutronix.de=mfe@kernel.org>
Date: Wed, 10 Apr 2019 17:47:46 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v5 00/13] TVP5150 new features
Message-ID: <20190410154746.dsh2nxeucwbwwluo@pengutronix.de>
References: <20190405060317.11240-1-m.felsch@pengutronix.de>
 <20190406081933.3cc761e8@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190406081933.3cc761e8@coco.lan>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: p.zabel@pengutronix.de, javierm@redhat.co, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Hans Verkuil <hverkuil@xs4all.nl>
List-ID: <devicetree@vger.kernel.org>

Hi Mauro,

On 19-04-06 08:19, Mauro Carvalho Chehab wrote:
> Hi Marco,
> 
> Em Fri,  5 Apr 2019 08:03:04 +0200
> Marco Felsch <m.felsch@pengutronix.de> escreveu:
> 
> > Hi,
> > 
> > few months ago I send my v4 of this series [1] unfortunately I got no
> > feedback from Mauro but Jacopos feedback was quite helpfull =)
> > 
> > After my v4 I send another series which adds a generic way to parse
> > connector endpoints [2]. To make it easier for everyone I squashed both
> > series [1,2] into this one.
> > 
> > I recognized that patch ("media: v4l2-subdev: add stubs for
> > v4l2_subdev_get_try_*") was a possible blocker for this series so I
> > factored the patch out [3].
> > 
> > My main goal with the v5 was to simplify the link_setup() code a lot.
> > There were also some build-dep issues which I fixed too. Last
> > significant improvement is done on patch ("media: tvp5150: add
> > support to limit tv norms on connector").
> > 
> > I've tested it on a custom hardware and compile tested it too.
> > 
> > @Mauro
> > Please let me know how I can help you to speed up the review progress
> > since I wanted to get those changes merged in the near future =)
> 
> I asked Hans to do the review. I prefer that he would do reviews
> on patches from V4L2 drivers. Also, I'm currently OOT.

Thanks for your reply. Sorry for asking but what does that mean for the
tvp5150 related patches?

@Hans or Sakari
Do you have some feedback or concerns about patch 1-3? I integrated
Jacopo's feedback and wanna send a v6 tomorrow or on friday. Depending on
your feedback.

Regards,
  Marco

> > 
> > @Sakari, Hans
> > I've added you to the series since I made some core changes.
> > 
> > New patches (wasn't part of [1] or [2]):
> >   media: dt-bindings: tvp5150: cleanup bindings stlye
> >   media: dt-bindings: tvp5150: add optional tvnorms documentation
> >   media: tvp5150: make debug output more readable
> > 
> > New (squashed) patches (was part of [2]):
> >   dt-bindings: connector: analog: add tv norms property
> >   media: v4l2-fwnode: add v4l2_fwnode_connector
> >   media: v4l2-fwnode: add initial connector parsing support
> >   media: tvp5150: add support to limit tv norms on connector
> > 
> > Droped patches:
> >   media: v4l2-subdev: add stubs for v4l2_subdev_get_try_*
> > 
> > [1] https://patchwork.ozlabs.org/cover/1032891/
> > [2] https://patchwork.kernel.org/cover/10794703/
> > [3] https://www.mail-archive.com/linux-media@vger.kernel.org/msg146065.html
> > 
> > Regards,
> > 	Marco
> > 
> > Javier Martinez Canillas (1):
> >   partial revert of "[media] tvp5150: add HW input connectors support"
> > 
> > Marco Felsch (11):
> >   dt-bindings: connector: analog: add tv norms property
> >   media: v4l2-fwnode: add v4l2_fwnode_connector
> >   media: v4l2-fwnode: add initial connector parsing support
> >   media: tvp5150: add input source selection of_graph support
> >   media: dt-bindings: tvp5150: Add input port connectors DT bindings
> >   media: tvp5150: add FORMAT_TRY support for get/set selection handlers
> >   media: tvp5150: add s_power callback
> >   media: dt-bindings: tvp5150: cleanup bindings stlye
> >   media: dt-bindings: tvp5150: add optional tvnorms documentation
> >   media: tvp5150: add support to limit tv norms on connector
> >   media: tvp5150: make debug output more readable
> > 
> > Michael Tretter (1):
> >   media: tvp5150: initialize subdev before parsing device tree
> > 
> >  .../display/connector/analog-tv-connector.txt |   4 +
> >  .../devicetree/bindings/media/i2c/tvp5150.txt | 125 +++-
> >  drivers/media/i2c/tvp5150.c                   | 673 +++++++++++++-----
> >  drivers/media/v4l2-core/v4l2-fwnode.c         | 113 +++
> >  include/dt-bindings/media/tvnorms.h           |  42 ++
> >  include/dt-bindings/media/tvp5150.h           |   2 -
> >  include/media/v4l2-connector.h                |  34 +
> >  include/media/v4l2-fwnode.h                   |  49 ++
> >  8 files changed, 850 insertions(+), 192 deletions(-)
> >  create mode 100644 include/dt-bindings/media/tvnorms.h
> >  create mode 100644 include/media/v4l2-connector.h
> > 
> 
> 
> 
> Thanks,
> Mauro
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
