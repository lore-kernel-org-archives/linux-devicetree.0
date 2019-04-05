Return-Path: <SRS0=qoK5=SH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay10.mail.gandi.net ([217.70.178.230]:34569 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbfDENFt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 5 Apr 2019 09:05:49 -0400
Date: Fri, 5 Apr 2019 15:06:31 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v5 03/13] media: v4l2-fwnode: add initial connector
 parsing support
Message-ID: <20190405130631.nl2magnbtasxoqle@uno.localdomain>
References: <20190405060317.11240-1-m.felsch@pengutronix.de>
 <20190405060317.11240-4-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="edpqpddxisljjtav"
Content-Disposition: inline
In-Reply-To: <20190405060317.11240-4-m.felsch@pengutronix.de>
Sender: devicetree-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, p.zabel@pengutronix.de, javierm@redhat.co, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>


--edpqpddxisljjtav
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Marco,
   thanks for the patch

On Fri, Apr 05, 2019 at 08:03:07AM +0200, Marco Felsch wrote:
> The patch adds the initial connector parsing code, so we can move from a
> driver specific parsing code to a generic one. Currently only the
> generic fields and the analog-connector specific fields are parsed. Parsing
> the other connector specific fields can be added by a simple callbacks.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>
> [1] https://patchwork.kernel.org/cover/10794703/
>
> v5:
> - s/strlcpy/strscpy/
>
> v2-v4:
> - nothing since the patch was squashed from series [1] into this
>   series.
>
>  drivers/media/v4l2-core/v4l2-fwnode.c | 113 ++++++++++++++++++++++++++
>  include/media/v4l2-fwnode.h           |  16 ++++
>  2 files changed, 129 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 20571846e636..a6bbe42ca518 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -592,6 +592,119 @@ void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fwnode_put_link);
>
> +static const struct v4l2_fwnode_connector_conv {
> +	enum v4l2_connector_type type;
> +	const char *name;
> +} connectors[] = {
> +	{
> +		.type = V4L2_CON_COMPOSITE,
> +		.name = "composite-video-connector",
> +	}, {
> +		.type = V4L2_CON_SVIDEO,
> +		.name = "svideo-connector",
> +	}, {
> +		.type = V4L2_CON_VGA,
> +		.name = "vga-connector",
> +	}, {
> +		.type = V4L2_CON_DVI,
> +		.name = "dvi-connector",
> +	}, {
> +		.type = V4L2_CON_HDMI,
> +		.name = "hdmi-connector"
> +	}
> +};
> +
> +static enum v4l2_connector_type
> +v4l2_fwnode_string_to_connector_type(const char *con_str)
> +{
> +	int i;

unsigned int

> +
> +	for (i = 0; i < ARRAY_SIZE(connectors); i++)
> +		if (!strcmp(con_str, connectors[i].name))
> +			return connectors[i].type;
> +
> +	/* no valid connector found */
> +	return V4L2_CON_UNKNOWN;
> +}
> +
> +static int
> +v4l2_fwnode_connector_parse_analog(struct fwnode_handle *fwnode,
> +				   struct v4l2_fwnode_connector *vc)
> +{
> +	u32 tvnorms;
> +	int ret;
> +
> +	ret = fwnode_property_read_u32(fwnode, "tvnorms", &tvnorms);
> +
> +	/* set it to V4L2_STD_ALL in case of not specified tvnorms */

Is this comment needed?

> +	vc->connector.analog.supported_tvnorms = ret ? V4L2_STD_ALL : tvnorms;

empty line before return?

> +	return 0;
> +}
> +
> +int v4l2_fwnode_parse_connector(struct fwnode_handle *__fwnode,
> +				struct v4l2_fwnode_connector *connector)
> +{
> +	struct fwnode_handle *fwnode;
> +	struct fwnode_endpoint __ep;
> +	const char *c_type_str, *label;
> +	int ret;
> +
> +	memset(connector, 0, sizeof(*connector));
> +
> +	fwnode = fwnode_graph_get_remote_port_parent(__fwnode);

You should fwnode_handle_put(fwnode) when done and in the error path

> +
> +	/* 1st parse all common properties */
> +	/* connector-type is stored within the compatible string */
> +	ret = fwnode_property_read_string(fwnode, "compatible", &c_type_str);
> +	if (ret)
> +		return -EINVAL;
> +
> +	connector->type = v4l2_fwnode_string_to_connector_type(c_type_str);
> +
> +	fwnode_graph_parse_endpoint(__fwnode, &__ep);
> +	connector->remote_port = __ep.port;
> +	connector->remote_id = __ep.id;
> +
> +	ret = fwnode_property_read_string(fwnode, "label", &label);
> +	if (!ret) {
> +		/* ensure label doesn't exceed V4L2_CONNECTOR_MAX_LABEL size */
> +		strscpy(connector->label, label, V4L2_CONNECTOR_MAX_LABEL);
> +	} else {
> +		/*
> +		 * labels are optional, if no one is given create one:

s/no one/none.

> +		 * <connector-type-string>@port<endpoint_port>/ep<endpoint_id>
> +		 */
> +		snprintf(connector->label, V4L2_CONNECTOR_MAX_LABEL,
> +			 "%s@port%u/ep%u", c_type_str, connector->remote_port,
> +			 connector->remote_id);
> +	}
> +
> +	/* now parse the connector specific properties */
> +	switch (connector->type) {
> +		/* fall through */

Could you move the /* fall through */ comment below case?

> +	case V4L2_CON_COMPOSITE:
here
> +	case V4L2_CON_SVIDEO:
> +		ret = v4l2_fwnode_connector_parse_analog(fwnode, connector);
> +		break;
> +		/* fall through */
> +	case V4L2_CON_VGA:
here
> +	case V4L2_CON_DVI:
here
> +	case V4L2_CON_HDMI:
> +		pr_warn("Connector specific parsing is currently not supported for %s\n",
> +			c_type_str);
> +		ret = 0;
> +		break;
> +		/* fall through */
> +	case V4L2_CON_UNKNOWN:
and here
> +	default:
> +		pr_err("Unknown connector type\n");
> +		ret = -EINVAL;
> +	};
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_fwnode_parse_connector);
> +
>  static int
>  v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
>  					  struct v4l2_async_notifier *notifier,
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index 04344b71656f..aa8bbef8589b 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -269,6 +269,22 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
>   */
>  void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link);
>
> +/**
> + * v4l2_fwnode_parse_connector() - parse the connector on endpoint
> + * @fwnode: pointer to the endpoint's fwnode handle where the connector is
> + *          connected to.

No full stop please (even if this is highly unconsistent in this
header, some lines have it, some don't, but it seems to me the most of
them do not)

> + * @connector: pointer to the V4L2 fwnode connector data structure
> + *
> + * Fill the connector data structure with the connector type, label and the
> + * endpoint id and port where the connector belongs to. If no label is present
> + * a unique one will be created. Labels with more than 40 characters are cut.
> + *
> + * Return: %0 on success or a negative error code on failure:
> + *	   %-EINVAL on parsing failure

This matches the other function's documentation style. Nice!

> + */
> +int v4l2_fwnode_parse_connector(struct fwnode_handle *fwnode,
> +				struct v4l2_fwnode_connector *connector);
> +

All minor comments:
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

>  /**
>   * typedef parse_endpoint_func - Driver's callback function to be called on
>   *	each V4L2 fwnode endpoint.
> --
> 2.20.1
>

--edpqpddxisljjtav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlynUtcACgkQcjQGjxah
Vjwm/w/+Ov53sw77lhsgWSlcuEXb6Aku+BBiWTM3IZwK86XRGKaoWKVicoWZVmhG
uXaQW9MDgYLV0ZOmSC0h75OdfsVcIDRVTAj4zUmDKRKpCb+rHJ2YuFmD1DLI4qbt
hNzsFYB3TBwQQ+mVF3VvouPvzz24vnVIQTwo9EFNR4lFdOl1heWywBDPMUwTqJBW
+ka/Fz8QLzdJkzW8FcBYNTXbgBAaMNcojrGL/DzJBbWglaGo3ZRXWBPZd2E8Frot
9NsoDAOlP29zKhweMJd7suIsbLBWS1Bl2RTu4MLMWlX8W2lL8Fsi6MPbnD8uwa1D
uBykre63DAQSnW8/NMuZIuAOxmOuNUWg0syYvvQtfJ/waUqNrVoKkzXJSLlUmGAu
Pg6BZhFeRVScw1nsEny+3o2d15fW5IBlNn3T/cg68sOcm7NtwuGzP59Xn7P0niWd
6I9212eC85jn7t12ec2ZuNFOVidbx13XgW+jaAJGR1OYEn0KURSffcv5yYs+cfNY
s7W+LFMg7+AMY927A4Z1farkBnJy9IR/p4PtQQTjxR4JZ6OICjspFpDipL55clHJ
WNYvj+4lgrRHq5b4RKPC9e5ngzt1TQnIg6xT6VPEaM9YSmvT6FvTup/IbUFLIasE
gNDkD9+d/e1waEAPzHLxIrpsd6VkaPdoamBaJDhsmiXzHYwhAqQ=
=4CID
-----END PGP SIGNATURE-----

--edpqpddxisljjtav--
