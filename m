Return-Path: <SRS0=J67F=WZ=pengutronix.de=mfe@kernel.org>
Date: Thu, 29 Aug 2019 14:52:14 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v9 02/13] media: v4l2-fwnode: add v4l2_fwnode_connector
Message-ID: <20190829125214.q3u7fnpbpas5kpdp@pengutronix.de>
References: <20190822080556.17109-1-m.felsch@pengutronix.de>
 <20190822080556.17109-3-m.felsch@pengutronix.de>
 <c868ab4e-206b-bf66-a276-a9901b9fc41a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c868ab4e-206b-bf66-a276-a9901b9fc41a@xs4all.nl>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org, kernel@pengutronix.de, linux-media@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 19-08-29 11:59, Hans Verkuil wrote:
> On 8/22/19 10:05 AM, Marco Felsch wrote:
> > Currently every driver needs to parse the connector endpoints by it self.
> > This is the initial work to make this generic. A generic connector has
> > common members and connector specific members. The common members are:
> >   - type
> >   - label (optional)
> >   - links
> >   - nr_of_links
> > 
> > The specific members are stored within a union, since only one of them
> > can be available at the time. Since this is the initial support the
> > patch adds only the analog-connector specific ones.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> > [1] https://patchwork.kernel.org/cover/10794703/
> > 
> > v8:
> > - rename CON -> CONN
> > - supported_tvnorms_stds -> sdtv_stds and adapt description
> > 
> > v7:
> > - fix spelling issues
> > - constify label
> > - support variable label size
> > - replace single remote_port/id members by links member of variable
> >   size
> > - squash v4l2-connector into v4l2-fwnode
> > 
> > @Jacopo: I dropped your r b tag because I changed the port/id logic.
> > 
> > v6:
> > - fix some spelling and style issues
> > - rm unnecessary comments
> > - drop vga and dvi connector
> > - fix misspelt connector
> > 
> > v2-v4:
> > - nothing since the patch was squashed from series [1] into this
> >   series.
> > ---
> >  include/media/v4l2-fwnode.h | 45 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> > 
> > diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> > index f6a7bcd13197..7ca5669ef6fa 100644
> > --- a/include/media/v4l2-fwnode.h
> > +++ b/include/media/v4l2-fwnode.h
> > @@ -123,6 +123,51 @@ struct v4l2_fwnode_link {
> >  	unsigned int remote_port;
> >  };
> >  
> > +/**
> > + * enum v4l2_connector_type - connector type
> > + * @V4L2_CONN_UNKNOWN:   unknown connector type, no V4L2 connector configuration
> > + * @V4L2_CONN_COMPOSITE: analog composite connector
> > + * @V4L2_CONN_SVIDEO:    analog svideo connector
> > + * @V4L2_CONN_HDMI:      digital hdmi connector
> 
> Why exactly is CONN_HDMI added if there is no V4L2 driver that uses it?

Just for the sake of completeness..

> I would just drop it from this series.

Okay.

Regards,
  Marco


> Regards,
> 
> 	Hans
> 
> > + */
> > +enum v4l2_connector_type {
> > +	V4L2_CONN_UNKNOWN,
> > +	V4L2_CONN_COMPOSITE,
> > +	V4L2_CONN_SVIDEO,
> > +	V4L2_CONN_HDMI,
> > +};
> > +
> > +/**
> > + * struct v4l2_fwnode_connector_analog - analog connector data structure
> > + * @sdtv_stds: sdtv standards this connector supports, set to V4L2_STD_ALL
> > + *             if no restrictions are specified.
> > + */
> > +struct v4l2_fwnode_connector_analog {
> > +	v4l2_std_id sdtv_stds;
> > +};
> > +
> > +/**
> > + * struct v4l2_fwnode_connector - the connector data structure
> > + * @label: optional connector label
> > + * @type: connector type
> > + * @links: list of &struct v4l2_fwnode_link links the connector is connected to
> > + * @nr_of_links: total number of links
> > + * @connector: connector configuration
> > + * @connector.analog: analog connector configuration
> > + *                    &struct v4l2_fwnode_connector_analog
> > + */
> > +struct v4l2_fwnode_connector {
> > +	const char *label;
> > +	enum v4l2_connector_type type;
> > +	struct v4l2_fwnode_link *links;
> > +	unsigned int nr_of_links;
> > +
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
