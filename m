Return-Path: <SRS0=rE90=SO=pengutronix.de=mfe@kernel.org>
Date: Fri, 12 Apr 2019 15:05:02 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v5 02/13] media: v4l2-fwnode: add v4l2_fwnode_connector
Message-ID: <20190412130502.g4boj4odgtkdqizr@pengutronix.de>
References: <20190405060317.11240-1-m.felsch@pengutronix.de>
 <20190405060317.11240-3-m.felsch@pengutronix.de>
 <abb9a8d6-bfdb-499c-7278-e6015f2c66d7@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abb9a8d6-bfdb-499c-7278-e6015f2c66d7@xs4all.nl>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, p.zabel@pengutronix.de, javierm@redhat.co, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi Hans,

On 19-04-12 14:17, Hans Verkuil wrote:
> On 4/5/19 8:03 AM, Marco Felsch wrote:
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
> 
> I would drop VGA and DVI for now. Only add them if they are needed. These
> connectors are rarely seen these days.

Okay, dropping shouldn't be a problem.

> > + * @V4L2_CON_HDMI:      digital hdmi connetor
> 
> connetor -> connector

Yes, thanks and thanks for the review.

Regards,

	Marco

> 
> Regards,
> 
> 	Hans
> 
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
> > + * @remote_port: identifier of the port the remote endpoint belongs to
> > + * @remote_id: identifier of the id the remote endpoint belongs to
> > + * @label: connetor label
> > + * @type: connector type
> > + * @connector: union with connector configuration data struct
> > + * @connector.analog: embedded &struct v4l2_fwnode_connector_analog.
> > + *                    Used if connector is of type analog.
> > + */
> > +struct v4l2_fwnode_connector {
> > +	/* common fields for all v4l2_fwnode_connectors */
> > +	unsigned int remote_port;
> > +	unsigned int remote_id;
> > +	char label[V4L2_CONNECTOR_MAX_LABEL];
> > +	enum v4l2_connector_type type;
> > +
> > +	/* connector specific fields */
> > +	union {
> > +		struct v4l2_fwnode_connector_analog analog;
> > +		/* future connectors */
> > +	} connector;
> > +};
> > +
> >  /**
> >   * v4l2_fwnode_endpoint_parse() - parse all fwnode node properties
> >   * @fwnode: pointer to the endpoint's fwnode handle
> > 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
