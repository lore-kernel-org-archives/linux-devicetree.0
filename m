From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v3 2/2] [media] platform: add video-multiplexer subdevice
 driver
Date: Thu, 4 May 2017 23:32:08 +0300
Message-ID: <20170504203208.GC7456@valkosipuli.retiisi.org.uk>
References: <1493905137-27051-1-git-send-email-p.zabel@pengutronix.de>
 <1493905137-27051-2-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1493905137-27051-2-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On Thu, May 04, 2017 at 03:38:57PM +0200, Philipp Zabel wrote:
...
> +static const struct of_device_id video_mux_dt_ids[] = {
> +	{ .compatible = "video-mux", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, video_mux_dt_ids);
> +
> +static struct platform_driver video_mux_driver = {

Shouldn't this be const?

With that,

Acked-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

> +	.probe		= video_mux_probe,
> +	.remove		= video_mux_remove,
> +	.driver		= {
> +		.of_match_table = video_mux_dt_ids,
> +		.name = "video-mux",
> +	},
> +};
> +
> +module_platform_driver(video_mux_driver);
> +
> +MODULE_DESCRIPTION("video stream multiplexer");
> +MODULE_AUTHOR("Sascha Hauer, Pengutronix");
> +MODULE_AUTHOR("Philipp Zabel, Pengutronix");
> +MODULE_LICENSE("GPL");

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
