Return-Path: <SRS0=zLlM=SM=pengutronix.de=mfe@kernel.org>
Date: Wed, 10 Apr 2019 11:51:31 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v5 02/13] media: v4l2-fwnode: add v4l2_fwnode_connector
Message-ID: <20190410095131.hadur65xxawvihnm@pengutronix.de>
References: <20190405060317.11240-1-m.felsch@pengutronix.de>
 <20190405060317.11240-3-m.felsch@pengutronix.de>
 <20190405124303.lkfdd3pqnlxinke4@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190405124303.lkfdd3pqnlxinke4@uno.localdomain>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, p.zabel@pengutronix.de, javierm@redhat.co, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi Jacopo,

On 19-04-05 14:43, Jacopo Mondi wrote:
> Hi Marco,
> 
> On Fri, Apr 05, 2019 at 08:03:06AM +0200, Marco Felsch wrote:
> > Currently every driver needs to parse the connector endpoints by it self.
> > This is the initial work to make this generic. The generic connector has
> > some common fields and some connector specific parts. The generic one
> > includes:
> >   - type
> >   - label
> >   - remote_port (the port where the connector is connected to)
> >   - remote_id   (the endpoint where the connector is connected to)
> >
> > The specific fields are within a union, since only one of them can be
> > available at the time. Since this is the initial support the patch adds
> > only the analog-connector specific ones.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  include/media/v4l2-connector.h | 34 ++++++++++++++++++++++++++++++++++
> >  include/media/v4l2-fwnode.h    | 33 +++++++++++++++++++++++++++++++++
> >  2 files changed, 67 insertions(+)
> >  create mode 100644 include/media/v4l2-connector.h
> >
> > diff --git a/include/media/v4l2-connector.h b/include/media/v4l2-connector.h
> > new file mode 100644
> > index 000000000000..967336e38215
> > --- /dev/null
> > +++ b/include/media/v4l2-connector.h
> > @@ -0,0 +1,34 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * v4l2-connector.h
> > + *
> > + * V4L2 connector types.
> > + *
> > + * Copyright 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
> > + */
> > +
> > +#ifndef V4L2_CONNECTOR_H
> > +#define V4L2_CONNECTOR_H
> > +
> > +#define V4L2_CONNECTOR_MAX_LABEL 41
> > +
> > +/**
> > + * enum v4l2_connector_type - connector type
> > + * @V4L2_CON_UNKNOWN:   unknown connector type, no V4L2 connetor configuration
> > + * @V4L2_CON_COMPOSITE: analog composite connector
> > + * @V4L2_CON_SVIDEO:    analog svideo connector
> > + * @V4L2_CON_VGA:       analog vga connector
> > + * @V4L2_CON_DVI:	analog or digital dvi connector
> > + * @V4L2_CON_HDMI:      digital hdmi connetor
> > + */
> > +enum v4l2_connector_type {
> > +	V4L2_CON_UNKNOWN,
> > +	V4L2_CON_COMPOSITE,
> > +	V4L2_CON_SVIDEO,
> > +	V4L2_CON_VGA,
> > +	V4L2_CON_DVI,
> > +	V4L2_CON_HDMI,
> > +};
> > +
> > +#endif /* V4L2_CONNECTOR_H */
> > +
> > diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> > index 6c07825e18b9..04344b71656f 100644
> > --- a/include/media/v4l2-fwnode.h
> > +++ b/include/media/v4l2-fwnode.h
> > @@ -22,6 +22,7 @@
> >  #include <linux/list.h>
> >  #include <linux/types.h>
> >
> > +#include <media/v4l2-connector.h>
> >  #include <media/v4l2-mediabus.h>
> >  #include <media/v4l2-subdev.h>
> >
> > @@ -126,6 +127,38 @@ struct v4l2_fwnode_link {
> >  	unsigned int remote_port;
> >  };
> >
> > +/**
> > + * struct v4l2_fwnode_connector_analog - analog connector data structure
> > + * @supported_tvnorms: tv norms this connector supports, set to V4L2_STD_ALL
> > + *                     if no restrictions are specified.
> > + */
> > +struct v4l2_fwnode_connector_analog {
> > +	v4l2_std_id supported_tvnorms;
> > +};
> > +
> > +/** struct v4l2_fwnode_connector - the connector data structure
> 
> Break the line please

Yes, missed that.

> > + * @remote_port: identifier of the port the remote endpoint belongs to
> 
> I liked best the description in the commmit message:
> @remote_port: identifier of the remote endpoint port the connector connects to
> 
> but I see the exact same sentence you used already in an existing
> comment, so feel free to chose the one you prefer.

Let me change this. I was inspired by the v4l2_fwnode_link description.
I think the commit description is a bit intuitiver.

> > + * @remote_id: identifier of the id the remote endpoint belongs to
> 
> identifier of the remote endpoint the connector connect/belong to?

Here too.

> > + * @label: connetor label
> > + * @type: connector type
> > + * @connector: union with connector configuration data struct
> 
> just "connector configuration" ?

Yes that sounds better.

> > + * @connector.analog: embedded &struct v4l2_fwnode_connector_analog.
> > + *                    Used if connector is of type analog.
> 
> just "analog connector configuration" ?
> 

The connector and connetor.analog description is inspired by the
v4l2_fwnode_endpoint description. Your sounds a bit more natural so I
will pick them.

> > + */
> > +struct v4l2_fwnode_connector {
> > +	/* common fields for all v4l2_fwnode_connectors */
> 
> I would drop this

Okay, I will drop both commit messages.

> > +	unsigned int remote_port;
> > +	unsigned int remote_id;
> > +	char label[V4L2_CONNECTOR_MAX_LABEL];
> > +	enum v4l2_connector_type type;
> > +
> > +	/* connector specific fields */
> 
> and this too :)
> 
> All minor stuff, feel free to pick what you like from the comments.

Thanks a lot for the review =) I will add your Reviewed-by tag in the
next verion.

> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> Thanks
>   j

Regards,
  Marco

> > +	union {
> > +		struct v4l2_fwnode_connector_analog analog;
> > +		/* future connectors */
> > +	} connector;
> > +};
> > +
> >  /**
> >   * v4l2_fwnode_endpoint_parse() - parse all fwnode node properties
> >   * @fwnode: pointer to the endpoint's fwnode handle
> > --
> > 2.20.1
> >



-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
