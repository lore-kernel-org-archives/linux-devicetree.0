From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v10 2/2] media: i2c: Add support for OV5647 sensor.
Date: Tue, 7 Mar 2017 12:45:45 +0200
Message-ID: <20170307104545.GI3220@valkosipuli.retiisi.org.uk>
References: <cover.1488798062.git.roliveir@synopsys.com>
 <67b5055a198316f74c5c1339e14a9f18a4106e69.1488798062.git.roliveir@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <67b5055a198316f74c5c1339e14a9f18a4106e69.1488798062.git.roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ramiro,

On Mon, Mar 06, 2017 at 11:16:34AM +0000, Ramiro Oliveira wrote:
...
> +static int __sensor_init(struct v4l2_subdev *sd)
> +{
> +	int ret;
> +	u8 resetval, rdval;
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +
> +	dev_dbg(&client->dev, "sensor init\n");

This looks like a debugging time leftover. Please remove.

With that,

Acked-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

...

> +static int ov5647_parse_dt(struct device_node *np)
> +{
> +	struct v4l2_of_endpoint bus_cfg;
> +	struct device_node *ep;
> +
> +	int ret;
> +
> +	ep = of_graph_get_next_endpoint(np, NULL);
> +	if (!ep)
> +		return -EINVAL;
> +
> +	ret = v4l2_of_parse_endpoint(ep, &bus_cfg);
> +
> +	of_node_put(ep);
> +	return ret;
> +}

This will conflict with my fwnode patchset. Let's see in which order the
patches will be merged, one of the sets has to be changed. The work is
trivial though.

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
