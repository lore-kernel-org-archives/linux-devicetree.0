From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/6] rpmsg: glink: Add support for rpmsg glink chrdev
Date: Thu, 15 Feb 2018 10:28:39 -0800
Message-ID: <20180215182839.GA25607@builder>
References: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
 <1513634534-22861-4-git-send-email-clew@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1513634534-22861-4-git-send-email-clew-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Lew <clew-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, aneela-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon 18 Dec 14:02 PST 2017, Chris Lew wrote:

> RPMSG provides a char device interface to userspace. Probe the rpmsg
> chrdev channel to enable the rpmsg_ctrl device creation on glink
> transports.
> 
> Signed-off-by: Chris Lew <clew-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 179132226dc2..786f2eca01f1 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -132,6 +132,13 @@ enum {
>  	GLINK_STATE_CLOSING,
>  };
>  
> +struct qcom_glink_device {
> +	struct rpmsg_device rpdev;
> +	struct qcom_glink *glink;
> +};
> +
> +#define to_glink_device(_x) container_of(_x, struct qcom_glink_device, rpdev)
> +
>  /**
>   * struct glink_channel - internal representation of a channel
>   * @rpdev:	rpdev reference, only used for primary endpoints
> @@ -1339,6 +1346,10 @@ static struct device_node *qcom_glink_match_channel(struct device_node *node,
>  	return NULL;
>  }
>  
> +static const struct rpmsg_device_ops glink_chrdev_ops = {
> +	.create_ept = qcom_glink_create_ept,
> +};

I can't remember and I see no apparent reason why we don't just
advertise the intents as the last step of create_ept, meaning that the
difference in ops would go away.

This would also make sure that we do advertise some intents for channels
associated with the rpmsg_char - and even if we don't have an attached
driver we can override the intent sizes on a channel.

> +
>  static const struct rpmsg_device_ops glink_device_ops = {
>  	.create_ept = qcom_glink_create_ept,
>  	.announce_create = qcom_glink_announce_create,
> @@ -1547,6 +1558,30 @@ static void qcom_glink_work(struct work_struct *work)
>  	}
>  }
>  
> +static void qcom_glink_device_release(struct device *dev)
> +{
> +	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
> +	struct qcom_glink_device *gdev = to_glink_device(rpdev);
> +
> +	kfree(gdev);
> +}
> +
> +static int qcom_glink_create_chrdev(struct qcom_glink *glink)
> +{
> +	struct qcom_glink_device *gdev;
> +
> +	gdev = kzalloc(sizeof(*gdev), GFP_KERNEL);
> +	if (!gdev)
> +		return -ENOMEM;
> +
> +	gdev->glink = glink;
> +	gdev->rpdev.ops = &glink_chrdev_ops;
> +	gdev->rpdev.dev.parent = glink->dev;
> +	gdev->rpdev.dev.release = qcom_glink_device_release;
> +
> +	return rpmsg_chrdev_register_device(&gdev->rpdev);

This rpdev will end up being the first parameter to
qcom_glink_create_ept() where we do:

	container_of(rpdev->ept, struct glink_channel, ept)

to get the struct glink_channel that backs the endpoint of the passed
rpmsg_device. So the registered rpdev must reference a rpmsg_endpoint
that is contained within a glink_channel.


So I think you need to create two objects here; a glink_channel with
the glink pointer referencing the glink instance and a rpmsg_device
referencing the rpmsg_endpoint of the channel.

You can get a initialized (and dangling) glink_channel by calling
qcom_glink_alloc_channel(). Note though that this element won't be freed
automagically (the rpmsg_device will).

> +}
> +

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
