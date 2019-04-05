Return-Path: <SRS0=8UCU=SH=jmondi.org=jacopo@kernel.org>
Date: Fri, 5 Apr 2019 14:43:03 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v5 02/13] media: v4l2-fwnode: add v4l2_fwnode_connector
Message-ID: <20190405124303.lkfdd3pqnlxinke4@uno.localdomain>
References: <20190405060317.11240-1-m.felsch@pengutronix.de>
 <20190405060317.11240-3-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j7imzh55zrwuwglw"
Content-Disposition: inline
In-Reply-To: <20190405060317.11240-3-m.felsch@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, p.zabel@pengutronix.de, javierm@redhat.co, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>


--j7imzh55zrwuwglw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Marco,

On Fri, Apr 05, 2019 at 08:03:06AM +0200, Marco Felsch wrote:
> Currently every driver needs to parse the connector endpoints by it self.
> This is the initial work to make this generic. The generic connector has
> some common fields and some connector specific parts. The generic one
> includes:
>   - type
>   - label
>   - remote_port (the port where the connector is connected to)
>   - remote_id   (the endpoint where the connector is connected to)
>
> The specific fields are within a union, since only one of them can be
> available at the time. Since this is the initial support the patch adds
> only the analog-connector specific ones.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  include/media/v4l2-connector.h | 34 ++++++++++++++++++++++++++++++++++
>  include/media/v4l2-fwnode.h    | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 include/media/v4l2-connector.h
>
> diff --git a/include/media/v4l2-connector.h b/include/media/v4l2-connector.h
> new file mode 100644
> index 000000000000..967336e38215
> --- /dev/null
> +++ b/include/media/v4l2-connector.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * v4l2-connector.h
> + *
> + * V4L2 connector types.
> + *
> + * Copyright 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
> + */
> +
> +#ifndef V4L2_CONNECTOR_H
> +#define V4L2_CONNECTOR_H
> +
> +#define V4L2_CONNECTOR_MAX_LABEL 41
> +
> +/**
> + * enum v4l2_connector_type - connector type
> + * @V4L2_CON_UNKNOWN:   unknown connector type, no V4L2 connetor configuration
> + * @V4L2_CON_COMPOSITE: analog composite connector
> + * @V4L2_CON_SVIDEO:    analog svideo connector
> + * @V4L2_CON_VGA:       analog vga connector
> + * @V4L2_CON_DVI:	analog or digital dvi connector
> + * @V4L2_CON_HDMI:      digital hdmi connetor
> + */
> +enum v4l2_connector_type {
> +	V4L2_CON_UNKNOWN,
> +	V4L2_CON_COMPOSITE,
> +	V4L2_CON_SVIDEO,
> +	V4L2_CON_VGA,
> +	V4L2_CON_DVI,
> +	V4L2_CON_HDMI,
> +};
> +
> +#endif /* V4L2_CONNECTOR_H */
> +
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index 6c07825e18b9..04344b71656f 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -22,6 +22,7 @@
>  #include <linux/list.h>
>  #include <linux/types.h>
>
> +#include <media/v4l2-connector.h>
>  #include <media/v4l2-mediabus.h>
>  #include <media/v4l2-subdev.h>
>
> @@ -126,6 +127,38 @@ struct v4l2_fwnode_link {
>  	unsigned int remote_port;
>  };
>
> +/**
> + * struct v4l2_fwnode_connector_analog - analog connector data structure
> + * @supported_tvnorms: tv norms this connector supports, set to V4L2_STD_ALL
> + *                     if no restrictions are specified.
> + */
> +struct v4l2_fwnode_connector_analog {
> +	v4l2_std_id supported_tvnorms;
> +};
> +
> +/** struct v4l2_fwnode_connector - the connector data structure

Break the line please

> + * @remote_port: identifier of the port the remote endpoint belongs to

I liked best the description in the commmit message:
@remote_port: identifier of the remote endpoint port the connector connects to

but I see the exact same sentence you used already in an existing
comment, so feel free to chose the one you prefer.

> + * @remote_id: identifier of the id the remote endpoint belongs to

identifier of the remote endpoint the connector connect/belong to?

> + * @label: connetor label
> + * @type: connector type
> + * @connector: union with connector configuration data struct

just "connector configuration" ?

> + * @connector.analog: embedded &struct v4l2_fwnode_connector_analog.
> + *                    Used if connector is of type analog.

just "analog connector configuration" ?

> + */
> +struct v4l2_fwnode_connector {
> +	/* common fields for all v4l2_fwnode_connectors */

I would drop this

> +	unsigned int remote_port;
> +	unsigned int remote_id;
> +	char label[V4L2_CONNECTOR_MAX_LABEL];
> +	enum v4l2_connector_type type;
> +
> +	/* connector specific fields */

and this too :)

All minor stuff, feel free to pick what you like from the comments.

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j
> +	union {
> +		struct v4l2_fwnode_connector_analog analog;
> +		/* future connectors */
> +	} connector;
> +};
> +
>  /**
>   * v4l2_fwnode_endpoint_parse() - parse all fwnode node properties
>   * @fwnode: pointer to the endpoint's fwnode handle
> --
> 2.20.1
>

--j7imzh55zrwuwglw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlynTVcACgkQcjQGjxah
VjxuAg/9Ga2GoHPyuocsU4IeQyyv0V2Z6WxW93Gp+BjRN9HK565vX3EquVdeshca
DAislG7iCslQGur05E2AXg0IPNEUETZbW1V7TTaRHZjHdEbWsXCctTr+HSrJQ0cR
bKddI7w9mVszqKpmobopZhDmyTH8ZaGX0MJidJ6/JBcN0HKLrd82GNNo7gXbTd6T
RM7PDTYiGWtW8SJBsVyRGbjtI+16mwmgPuwoTirPo8zSEFv+mKYNIo2CBXGCH0Lx
0prmHn0WNU9JLcSgaP17zNlpTwtyXvdGsrhxw4s3fS6EYJ2ehiFS8eCfLwuHxXgs
gEGAxCYeFcE2AGn9cdJ2d4yXEoeboZ+1ISlIo4V5VKN3yNGA9I1aM6ws+zkJeq1M
bByRkKhSF1tM8L6FySNTFBU6u6CGfCYL8WFEranmgWQOK8UIZFT1AJpXYKqbQtbZ
cZ5BLAUZnIbbPdH1v25RlNc8u/qCMNQkt0NvU02sqcxHXTf4QhJ5Aup5Kp75CRiD
ImyEBMijyiPpPL/9U9bMUaupYCLRbu1B2zpZwDrs4CpzIb1oYEZiq8Z544BGgWWf
B87GAilzm7AFjEEpdtHYuS9ylawLW9LsqbCCYnXQFIXnf4JoUWMK9Za9+klcAtOD
S0droCFtzDb3itpLG37sSP+FzkjePcwYNl9Gr5yqio2wWoqrgzQ=
=8QIP
-----END PGP SIGNATURE-----

--j7imzh55zrwuwglw--
