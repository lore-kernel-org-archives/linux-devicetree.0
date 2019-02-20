From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v14 05/13] media: staging/imx7: add MIPI CSI-2 receiver
 subdev for i.MX7
Date: Wed, 20 Feb 2019 09:56:24 +0100
Message-ID: <6c6c0e29-d65b-3796-578c-2e3e6f742d11@xs4all.nl>
References: <20190206151328.21629-1-rui.silva@linaro.org>
 <20190206151328.21629-6-rui.silva@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20190206151328.21629-6-rui.silva@linaro.org>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rui Miguel Silva <rui.silva@linaro.org>, sakari.ailus@linux.intel.com, Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2/6/19 4:13 PM, Rui Miguel Silva wrote:
> Adds MIPI CSI-2 subdev for i.MX7 to connect with sensors with a MIPI
> CSI-2 interface.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---
>  drivers/staging/media/imx/Makefile         |    1 +
>  drivers/staging/media/imx/imx7-mipi-csis.c | 1186 ++++++++++++++++++++
>  2 files changed, 1187 insertions(+)
>  create mode 100644 drivers/staging/media/imx/imx7-mipi-csis.c
> 
> diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
> index 074f016d3519..d2d909a36239 100644
> --- a/drivers/staging/media/imx/Makefile
> +++ b/drivers/staging/media/imx/Makefile
> @@ -14,3 +14,4 @@ obj-$(CONFIG_VIDEO_IMX_CSI) += imx-media-csi.o
>  obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
>  
>  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
> +obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-mipi-csis.o
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> new file mode 100644
> index 000000000000..516d308dc44b
> --- /dev/null
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -0,0 +1,1186 @@

<snip>

> +static int mipi_csi_registered(struct v4l2_subdev *mipi_sd)
> +{
> +	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < CSIS_PADS_NUM; i++) {
> +		state->pads[i].flags = (i == CSIS_PAD_SINK) ?
> +			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
> +	}
> +
> +	/* set a default mbus format  */
> +	ret = imx_media_init_mbus_fmt(&state->format_mbus,
> +				      MIPI_CSIS_DEF_PIX_HEIGHT,
> +				      MIPI_CSIS_DEF_PIX_WIDTH, 0,
> +				      V4L2_FIELD_NONE, NULL);
> +	if (ret)
> +		return ret;
> +
> +	return media_entity_pads_init(&mipi_sd->entity, CSIS_PADS_NUM,
> +				      state->pads);
> +}
> +
> +static const struct v4l2_subdev_core_ops mipi_csis_core_ops = {
> +	.log_status	= mipi_csis_log_status,
> +};
> +
> +static const struct media_entity_operations mipi_csis_entity_ops = {
> +	.link_setup	= mipi_csis_link_setup,
> +	.link_validate	= v4l2_subdev_link_validate,
> +};
> +
> +static const struct v4l2_subdev_video_ops mipi_csis_video_ops = {
> +	.s_stream	= mipi_csis_s_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops mipi_csis_pad_ops = {
> +	.init_cfg		= mipi_csis_init_cfg,
> +	.get_fmt		= mipi_csis_get_fmt,
> +	.set_fmt		= mipi_csis_set_fmt,
> +};
> +
> +static const struct v4l2_subdev_ops mipi_csis_subdev_ops = {
> +	.core	= &mipi_csis_core_ops,
> +	.video	= &mipi_csis_video_ops,
> +	.pad	= &mipi_csis_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops mipi_csis_internal_ops = {
> +	.registered = mipi_csi_registered,
> +};

This struct is not used, and therefor mipi_csi_registered() is never called
either. Should it be called or can this be removed?

Regards,

	Hans
