Return-Path: <SRS0=33M/=TO=pengutronix.de=mfe@kernel.org>
Date: Tue, 14 May 2019 22:58:24 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v6 00/13] TVP5150 new features
Message-ID: <20190514205824.ov6prllx2fp77fur@pengutronix.de>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190506054713.crxc5pw6j5suvvq7@pengutronix.de>
 <20190514141824.5bd41389@coco.lan>
 <20190514172028.693ad354@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514172028.693ad354@coco.lan>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com, kernel@pengutronix.de, linux-media@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Mauro,

On 19-05-14 17:20, Mauro Carvalho Chehab wrote:
> Em Tue, 14 May 2019 14:18:24 -0300
> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> 
> > Em Mon, 6 May 2019 07:47:13 +0200
> > Marco Felsch <m.felsch@pengutronix.de> escreveu:
> > 
> > > Hi Mauro,
> > > 
> > > I know you are busy but can you have a look on it?  
> > 
> > You should really trust on the sub-maintainers for such kind of
> > reviews :-)

I trust all of them and many thanks to Hans and Jacopo for the reviews
:) I will integrate them this week. The point is that you are the
maintainer and in that case the one who picks the patches.

> > 
> > I'll take a look today.
> 
> Done. Please notice that I didn't run any test here.

Thanks for that will integrate it too and prepare a v7.

Regards,
  Marco

> 
> > 
> > > 
> > > Regards,
> > >   Marco
> > > 
> > > On 19-04-15 14:44, Marco Felsch wrote:  
> > > > Hi,
> > > > 
> > > > many thanks to Hans and Jacopo for the feedack :) this v6 address the
> > > > comments both made on my v5 [1].
> > > > 
> > > > In short this is round fixes just some minor issues rather than major
> > > > ones so the diff to the v5 is really small. The changed patches contain
> > > > the changelog so I omit it here.
> > > > 
> > > > I've tested it on a custom hardware but I can't test the em28xx usb
> > > > use-case since I haven't such a device. So other testers are welcome :)
> > > > 
> > > > Looking forward for your feedack,
> > > > 
> > > > 	Marco
> > > > 
> > > > [1] https://patchwork.kernel.org/cover/10886903/
> > > > 
> > > > Javier Martinez Canillas (1):
> > > >   partial revert of "[media] tvp5150: add HW input connectors support"
> > > > 
> > > > Marco Felsch (11):
> > > >   dt-bindings: connector: analog: add tv norms property
> > > >   media: v4l2-fwnode: add v4l2_fwnode_connector
> > > >   media: v4l2-fwnode: add initial connector parsing support
> > > >   media: tvp5150: add input source selection of_graph support
> > > >   media: dt-bindings: tvp5150: Add input port connectors DT bindings
> > > >   media: tvp5150: add FORMAT_TRY support for get/set selection handlers
> > > >   media: tvp5150: add s_power callback
> > > >   media: dt-bindings: tvp5150: cleanup bindings stlye
> > > >   media: dt-bindings: tvp5150: add optional tvnorms documentation
> > > >   media: tvp5150: add support to limit tv norms on connector
> > > >   media: tvp5150: make debug output more readable
> > > > 
> > > > Michael Tretter (1):
> > > >   media: tvp5150: initialize subdev before parsing device tree
> > > > 
> > > >  .../display/connector/analog-tv-connector.txt |   4 +
> > > >  .../devicetree/bindings/media/i2c/tvp5150.txt | 125 +++-
> > > >  drivers/media/i2c/tvp5150.c                   | 672 +++++++++++++-----
> > > >  drivers/media/v4l2-core/v4l2-fwnode.c         | 111 +++
> > > >  include/dt-bindings/media/tvnorms.h           |  56 ++
> > > >  include/dt-bindings/media/tvp5150.h           |   2 -
> > > >  include/media/v4l2-connector.h                |  30 +
> > > >  include/media/v4l2-fwnode.h                   |  49 ++
> > > >  8 files changed, 859 insertions(+), 190 deletions(-)
> > > >  create mode 100644 include/dt-bindings/media/tvnorms.h
> > > >  create mode 100644 include/media/v4l2-connector.h
> > > > 
> > > > -- 
> > > > 2.20.1
> > > > 
> > > > 
> > > >     
> > >   
> > 
> > 
> > 
> > Thanks,
> > Mauro
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
