Return-Path: <SRS0=x+AZ=WP=pengutronix.de=mfe@kernel.org>
Date: Mon, 19 Aug 2019 11:17:49 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v7 02/13] media: v4l2-fwnode: add v4l2_fwnode_connector
Message-ID: <20190819091748.n7v6m2h33xuitrl4@pengutronix.de>
References: <eb395727-c1d1-685f-623a-aebf7ba474ea@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb395727-c1d1-685f-623a-aebf7ba474ea@xs4all.nl>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On 19-08-16 12:59, Hans Verkuil wrote:
> On 8/15/19 1:57 PM, Marco Felsch wrote:
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
> > index f6a7bcd13197..e39c198882fc 100644
> > --- a/include/media/v4l2-fwnode.h
> > +++ b/include/media/v4l2-fwnode.h
> > @@ -123,6 +123,51 @@ struct v4l2_fwnode_link {
> >  	unsigned int remote_port;
> >  };
> >  
> > +/**
> > + * enum v4l2_connector_type - connector type
> > + * @V4L2_CON_UNKNOWN:   unknown connector type, no V4L2 connector configuration
> > + * @V4L2_CON_COMPOSITE: analog composite connector
> > + * @V4L2_CON_SVIDEO:    analog svideo connector
> > + * @V4L2_CON_HDMI:      digital hdmi connector
> > + */
> > +enum v4l2_connector_type {
> > +	V4L2_CON_UNKNOWN,
> > +	V4L2_CON_COMPOSITE,
> > +	V4L2_CON_SVIDEO,
> > +	V4L2_CON_HDMI,
> 
> Please use CONN instead of CON. CONN is the traditional abbreviation
> used for connectors. 'CON' is too generic (there are many words that
> start with 'con').

Okay.

> Regards,
> 
> 	Hans
> 
> > +};
> > +
> > +/**
> > + * struct v4l2_fwnode_connector_analog - analog connector data structure
> > + * @supported_tvnorms: tv norms this connector supports, set to V4L2_STD_ALL
> > + *                     if no restrictions are specified.
> > + */
> > +struct v4l2_fwnode_connector_analog {
> > +	v4l2_std_id supported_tvnorms;

After we found the correct dt-binding and naming convention I would
change that property to 'sdtv_stds'. Is that okay?

Regards,
  Marco

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
