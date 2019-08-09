Return-Path: <SRS0=2AmA=WF=pengutronix.de=mfe@kernel.org>
Date: Fri, 9 Aug 2019 10:59:59 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v6 03/13] media: v4l2-fwnode: add initial connector
 parsing support
Message-ID: <20190809085959.kvebdfigg4ajef2t@pengutronix.de>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-4-m.felsch@pengutronix.de>
 <67f45a50-1eef-89d7-c008-17f085940eb2@xs4all.nl>
 <20190514152004.30d7838b@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514152004.30d7838b@coco.lan>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Jacopo Mondi <jacopo@jmondi.org>
List-ID: <devicetree@vger.kernel.org>

Hi Mauro, Hans,

On 19-05-14 15:20, Mauro Carvalho Chehab wrote:
> Em Mon, 6 May 2019 12:10:41 +0200
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
> > On 4/15/19 2:44 PM, Marco Felsch wrote:
> > > The patch adds the initial connector parsing code, so we can move from a
> > > driver specific parsing code to a generic one. Currently only the
> > > generic fields and the analog-connector specific fields are parsed. Parsing
> > > the other connector specific fields can be added by a simple callbacks.
> > > 
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > > [1] https://patchwork.kernel.org/cover/10794703/
> > > 
> > > v6:
> > > - use 'unsigned int' count var
> > > - fix comment and style issues
> > > - place '/* fall through */' to correct places
> > > - fix error handling and cleanup by releasing fwnode
> > > - drop vga and dvi parsing support as those connectors are rarely used
> > >   these days
> > > 
> > > v5:
> > > - s/strlcpy/strscpy/
> > > 
> > > v2-v4:
> > > - nothing since the patch was squashed from series [1] into this
> > >   series.
> > > 
> > >  drivers/media/v4l2-core/v4l2-fwnode.c | 111 ++++++++++++++++++++++++++
> > >  include/media/v4l2-fwnode.h           |  16 ++++
> > >  2 files changed, 127 insertions(+)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > > index 20571846e636..f1cca95c8fef 100644
> > > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > > @@ -592,6 +592,117 @@ void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
> > >  }
> > >  EXPORT_SYMBOL_GPL(v4l2_fwnode_put_link);
> > >  
> > > +static const struct v4l2_fwnode_connector_conv {
> > > +	enum v4l2_connector_type type;
> > > +	const char *name;
> > > +} connectors[] = {
> > > +	{
> > > +		.type = V4L2_CON_COMPOSITE,
> > > +		.name = "composite-video-connector",
> > > +	}, {
> > > +		.type = V4L2_CON_SVIDEO,
> > > +		.name = "svideo-connector",
> > > +	}, {
> > > +		.type = V4L2_CON_HDMI,
> > > +		.name = "hdmi-connector",
> > > +	},
> > > +};
> > > +
> > > +static enum v4l2_connector_type
> > > +v4l2_fwnode_string_to_connector_type(const char *con_str)
> > > +{
> > > +	unsigned int i;
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(connectors); i++)
> > > +		if (!strcmp(con_str, connectors[i].name))
> > > +			return connectors[i].type;
> > > +
> > > +	/* no valid connector found */
> > > +	return V4L2_CON_UNKNOWN;
> > > +}
> > > +
> > > +static int
> > > +v4l2_fwnode_connector_parse_analog(struct fwnode_handle *fwnode,
> > > +				   struct v4l2_fwnode_connector *vc)
> > > +{
> > > +	u32 tvnorms;
> > > +	int ret;
> > > +
> > > +	ret = fwnode_property_read_u32(fwnode, "tvnorms", &tvnorms);
> > > +
> > > +	/* tvnorms is optional */
> > > +	vc->connector.analog.supported_tvnorms = ret ? V4L2_STD_ALL : tvnorms;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +int v4l2_fwnode_parse_connector(struct fwnode_handle *__fwnode,
> > > +				struct v4l2_fwnode_connector *connector)
> > > +{
> > > +	struct fwnode_handle *fwnode;
> > > +	struct fwnode_endpoint __ep;
> > > +	const char *c_type_str, *label;
> > > +	int ret;
> > > +
> > > +	memset(connector, 0, sizeof(*connector));
> > > +
> > > +	fwnode = fwnode_graph_get_remote_port_parent(__fwnode);
> > > +	if (!fwnode)
> > > +		return -EINVAL;
> > > +
> > > +	/* parse all common properties first */
> > > +	/* connector-type is stored within the compatible string */
> > > +	ret = fwnode_property_read_string(fwnode, "compatible", &c_type_str);
> > > +	if (ret) {
> > > +		fwnode_handle_put(fwnode);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	connector->type = v4l2_fwnode_string_to_connector_type(c_type_str);
> > > +
> > > +	fwnode_graph_parse_endpoint(__fwnode, &__ep);
> > > +	connector->remote_port = __ep.port;
> > > +	connector->remote_id = __ep.id;
> > > +
> > > +	ret = fwnode_property_read_string(fwnode, "label", &label);
> > > +	if (!ret) {
> > > +		/* ensure label doesn't exceed V4L2_CONNECTOR_MAX_LABEL size */
> > > +		strscpy(connector->label, label, V4L2_CONNECTOR_MAX_LABEL);
> > > +	} else {
> > > +		/*
> > > +		 * labels are optional, if none is given create one:
> > > +		 * <connector-type-string>@port<endpoint_port>/ep<endpoint_id>
> > > +		 */
> > > +		snprintf(connector->label, V4L2_CONNECTOR_MAX_LABEL,
> > > +			 "%s@port%u/ep%u", c_type_str, connector->remote_port,
> > > +			 connector->remote_id);
> > > +	}
> > > +
> > > +	/* now parse the connector specific properties */
> > > +	switch (connector->type) {
> > > +	case V4L2_CON_COMPOSITE:
> > > +		/* fall through */
> > > +	case V4L2_CON_SVIDEO:
> > > +		ret = v4l2_fwnode_connector_parse_analog(fwnode, connector);
> > > +		break;
> > > +	case V4L2_CON_HDMI:
> > > +		pr_warn("Connector specific parsing is currently not supported for %s\n",
> > > +			c_type_str);  
> > 
> > Why warn? Just drop this.

Wanted to cache all cases here without adding hdmi handling.

> good point. I would prefer to have some warning here, in order to warn a
> developer that might be using it that this part of the code would require 
> some change.
> 
> perhaps pr_warn_once()?

Okay, I will change it to pr_warn_once().

Regards,
  Marco

> > 
> > > +		ret = 0;
> > > +		break;
> > > +	case V4L2_CON_UNKNOWN:
> > > +		/* fall through */
> > > +	default:
> > > +		pr_err("Unknown connector type\n");
> > > +		ret = -EINVAL;
> > > +	};
> > > +
> > > +	fwnode_handle_put(fwnode);
> > > +
> > > +	return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(v4l2_fwnode_parse_connector);
> > > +
> > >  static int
> > >  v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
> > >  					  struct v4l2_async_notifier *notifier,
> > > diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> > > index f4df1b95c5ef..e072f2915ddb 100644
> > > --- a/include/media/v4l2-fwnode.h
> > > +++ b/include/media/v4l2-fwnode.h
> > > @@ -269,6 +269,22 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
> > >   */
> > >  void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link);
> > >  
> > > +/**
> > > + * v4l2_fwnode_parse_connector() - parse the connector on endpoint
> > > + * @fwnode: pointer to the endpoint's fwnode handle where the connector is
> > > + *          connected to
> > > + * @connector: pointer to the V4L2 fwnode connector data structure
> > > + *
> > > + * Fill the connector data structure with the connector type, label and the
> > > + * endpoint id and port where the connector belongs to. If no label is present
> > > + * a unique one will be created. Labels with more than 40 characters are cut.
> > > + *
> > > + * Return: %0 on success or a negative error code on failure:
> > > + *	   %-EINVAL on parsing failure
> > > + */
> > > +int v4l2_fwnode_parse_connector(struct fwnode_handle *fwnode,
> > > +				struct v4l2_fwnode_connector *connector);
> > > +
> > >  /**
> > >   * typedef parse_endpoint_func - Driver's callback function to be called on
> > >   *	each V4L2 fwnode endpoint.
> > >   
> > 
> > Regards,
> > 
> > 	Hans
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
