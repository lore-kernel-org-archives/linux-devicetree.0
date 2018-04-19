From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH 02/15] media: staging/imx7: add imx7 CSI subdev driver
Date: Thu, 19 Apr 2018 15:03:34 +0100
Message-ID: <m3in8n9tu1.fsf@linaro.org>
References: <20180419101812.30688-1-rui.silva@linaro.org>
 <20180419101812.30688-3-rui.silva@linaro.org>
 <20180419122230.6wygwob2ajbkbv7o@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-reply-to: <20180419122230.6wygwob2ajbkbv7o@mwanda>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ryan Harkin <ryan.harkin@linaro.org>, Rob Herring <robh+dt@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, mchehab@kernel.org, Shawn Guo <shawnguo@kernel.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,
On Thu 19 Apr 2018 at 12:22, Dan Carpenter wrote:
> On Thu, Apr 19, 2018 at 11:17:59AM +0100, Rui Miguel Silva 
> wrote:
>> +static int imx7_csi_link_setup(struct media_entity *entity,
>> +			       const struct media_pad *local,
>> +			       const struct media_pad *remote, u32 
>> flags)
>> +{
>> +	struct v4l2_subdev *sd = 
>> media_entity_to_v4l2_subdev(entity);
>> +	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
>> +	struct v4l2_subdev *remote_sd;
>> +	int ret = 0;
>> +
>> +	dev_dbg(csi->dev, "link setup %s -> %s\n", 
>> remote->entity->name,
>> +		local->entity->name);
>> +
>> +	mutex_lock(&csi->lock);
>> +
>> +	if (local->flags & MEDIA_PAD_FL_SINK) {
>> +		if (!is_media_entity_v4l2_subdev(remote->entity)) 
>> {
>> +			ret = -EINVAL;
>> +			goto unlock;
>> +		}
>> +
>> +		remote_sd = 
>> media_entity_to_v4l2_subdev(remote->entity);
>> +
>> +		if (flags & MEDIA_LNK_FL_ENABLED) {
>> +			if (csi->src_sd) {
>> +				ret = -EBUSY;
>> +				goto unlock;
>> +			}
>> +			csi->src_sd = remote_sd;
>> +		} else {
>> +			csi->src_sd = NULL;
>> +		}
>> +
>> +		goto init;
>> +	}
>> +
>> +	/* source pad */
>> +	if (flags & MEDIA_LNK_FL_ENABLED) {
>> +		if (csi->sink) {
>> +			ret = -EBUSY;
>> +			goto unlock;
>> +		}
>> +		csi->sink = remote->entity;
>> +	} else {
>> +		v4l2_ctrl_handler_free(&csi->ctrl_hdlr);
>> +		v4l2_ctrl_handler_init(&csi->ctrl_hdlr, 0);
>> +		csi->sink = NULL;
>> +	}
>> +
>> +init:
>> +	if (csi->sink || csi->src_sd)
>> +		imx7_csi_init(csi);
>> +	else
>> +		imx7_csi_deinit(csi);
>> +
>> +unlock:
>> +	mutex_unlock(&csi->lock);
>> +
>> +	return 0;
>
> This should be "return ret;" because the failure paths go 
> through here
> as well.

Agree.

>
>> +}
>> +
>> +static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
>> +				      struct media_link *link,
>> +				      struct v4l2_subdev_format 
>> *source_fmt,
>> +				      struct v4l2_subdev_format 
>> *sink_fmt)
>> +{
>> +	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
>> +	struct v4l2_fwnode_endpoint upstream_ep;
>> +	int ret;
>> +
>> +	ret = v4l2_subdev_link_validate_default(sd, link, 
>> source_fmt, sink_fmt);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = imx7_csi_get_upstream_endpoint(csi, &upstream_ep, 
>> true);
>> +	if (ret) {
>> +		v4l2_err(&csi->sd, "failed to find upstream 
>> endpoint\n");
>> +		return ret;
>> +	}
>> +
>> +	mutex_lock(&csi->lock);
>> +
>> +	csi->upstream_ep = upstream_ep;
>> +	csi->is_csi2 = (upstream_ep.bus_type == V4L2_MBUS_CSI2);
>> +
>> +	mutex_unlock(&csi->lock);
>> +
>> +	return ret;
>
> return 0;

ack.

>
>> +}
>> +
>
> [ snip ]
>
>> +
>> +static int imx7_csi_remove(struct platform_device *pdev)
>> +{
>> +	return 0;
>> +}
>
> There is no need for this empty (struct 
> platform_driver)->remove()
> function.  See platform_drv_remove() for how it's called.

right.

>
> This looks nice, though.

Thanks,
---
Cheers,
	Rui
