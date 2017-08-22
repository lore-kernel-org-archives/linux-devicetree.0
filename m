From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v3 3/3] v4l: fwnode: Support generic parsing of graph endpoints in a single port
Date: Tue, 22 Aug 2017 15:55:15 +0300
Message-ID: <10978432.O0Rl2h0LPT@avalon>
References: <20170818112317.30933-1-sakari.ailus@linux.intel.com> <20170818112317.30933-4-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170818112317.30933-4-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Friday, 18 August 2017 14:23:17 EEST Sakari Ailus wrote:
> This is the preferred way to parse the endpoints.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 51 ++++++++++++++++++++++++++++++++
>  include/media/v4l2-fwnode.h           |  7 +++++
>  2 files changed, 58 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c
> b/drivers/media/v4l2-core/v4l2-fwnode.c index cb0fc4b4e3bf..961bcdf22d9a
> 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -508,6 +508,57 @@ int v4l2_fwnode_endpoints_parse(
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fwnode_endpoints_parse);
> 
> +/**
> + * v4l2_fwnode_endpoint_parse - Parse V4L2 fwnode endpoints in a port node

This doesn't match the function name.

> + * @dev: local struct device
> + * @notifier: async notifier related to @dev
> + * @port: port number
> + * @endpoint: endpoint number
> + * @asd_struct_size: size of the driver's async sub-device struct,
> including
> + *		     sizeof(struct v4l2_async_subdev)
> + * @parse_single: driver's callback function called on each V4L2 fwnode
> endpoint
> + *
> + * Parse all V4L2 fwnode endpoints related to a given port.

It doesn't, it parses a single endpoint only.

As for patch 2/3, more detailed documentation is needed.

> This is
> + * the preferred interface over v4l2_fwnode_endpoints_parse() and
> + * should be used by new drivers.

I think converting one driver as an example would make it clearer how this 
function is supposed to be used.

> + */
> +int v4l2_fwnode_endpoint_parse_port(
> +	struct device *dev, struct v4l2_async_notifier *notifier,
> +	unsigned int port, unsigned int endpoint, size_t asd_struct_size,
> +	int (*parse_single)(struct device *dev,
> +			    struct v4l2_fwnode_endpoint *vep,
> +			    struct v4l2_async_subdev *asd))
> +{
> +	struct fwnode_handle *fwnode;
> +	struct v4l2_async_subdev *asd;
> +	int ret;
> +
> +	fwnode = fwnode_graph_get_remote_node(dev_fwnode(dev), port, endpoint);
> +	if (!fwnode)
> +		return -ENOENT;
> +
> +	asd = devm_kzalloc(dev, asd_struct_size, GFP_KERNEL);
> +	if (!asd)
> +		return -ENOMEM;
> +
> +	ret = notifier_realloc(dev, notifier, notifier->num_subdevs + 1);
> +	if (ret)
> +		goto out_free;
> +
> +	ret = __v4l2_fwnode_endpoint_parse(dev, notifier, fwnode, asd,
> +					   parse_single);
> +	if (ret)
> +		goto out_free;
> +
> +	return 0;
> +
> +out_free:
> +	devm_kfree(dev, asd);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_fwnode_endpoint_parse_port);
> +
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>");
>  MODULE_AUTHOR("Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index c75a768d4ef7..5adf28e7b070 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -131,4 +131,11 @@ int v4l2_fwnode_endpoints_parse(
>  			    struct v4l2_fwnode_endpoint *vep,
>  			    struct v4l2_async_subdev *asd));
> 
> +int v4l2_fwnode_endpoint_parse_port(
> +	struct device *dev, struct v4l2_async_notifier *notifier,
> +	unsigned int port, unsigned int endpoint, size_t asd_struct_size,
> +	int (*parse_single)(struct device *dev,
> +			    struct v4l2_fwnode_endpoint *vep,
> +			    struct v4l2_async_subdev *asd));
> +
>  #endif /* _V4L2_FWNODE_H */


-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
