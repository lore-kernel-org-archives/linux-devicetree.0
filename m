From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 13/15] [media] mtk-mipicsi: add the function for
 Get/Set PARM for application
Date: Mon, 13 May 2019 11:24:44 +0200
Message-ID: <8dcbaa14-29bb-8469-fc36-82e34df81737@xs4all.nl>
References: <1555407015-18130-1-git-send-email-stu.hsieh@mediatek.com>
 <1555407015-18130-14-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555407015-18130-14-git-send-email-stu.hsieh@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stu Hsieh <stu.hsieh@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On 4/16/19 11:30 AM, Stu Hsieh wrote:
> This patch add the function for Get/Set PARM for application.
> 
> Application can get the information about number of link.
> 
> Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
> ---
>  .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> index 5e4028d0d5e1..5db9c68b0da9 100644
> --- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> +++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> @@ -346,6 +346,38 @@ static int get_subdev_link(const struct soc_camera_device *icd,
>  	return 0;
>  }
>  
> +static int mtk_mipicsi_get_parm(struct soc_camera_device *icd,
> +	struct v4l2_streamparm *a)
> +{
> +	unsigned int link = 0U;
> +	u8 link_reg_val = 0x0U;
> +	int ret = 0;
> +
> +	/*get camera link number*/
> +	ret = get_subdev_link(icd, &link, &link_reg_val);
> +	if (ret < 0)
> +		return ret;
> +
> +	a->parm.capture.timeperframe.numerator = 1;
> +	a->parm.capture.timeperframe.denominator = 30;
> +	a->parm.capture.reserved[0] = link_reg_val;
> +	a->parm.capture.reserved[1] = (u32)(icd->use_count);

No, no, don't use G/S_PARM for that. It's an awful API and other than
getting/setting the frame period it shouldn't be used for anything else.

I've CC-ed Sakari, he is the CSI specialist. I think some work was done
(or is in progress) regarding providing more CSI lane information.

> +	dev_info(icd->parent, "use count %d\n", icd->use_count);
> +
> +	return 0;
> +}
> +
> +static int mtk_mipicsi_set_param(struct soc_camera_device *icd,
> +	struct v4l2_streamparm *a)
> +{
> +	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
> +
> +	if (ici->ops->get_parm == NULL)
> +		return ici->ops->get_parm(icd, a);

This clearly was never tested since ici->ops->get_parm is NULL when
you call it. I'd drop this function altogether since there is no
point if you can make changes.

Regards,

	Hans

> +
> +	return 0;
> +}
> +
>  static u32 get_bytesperline(const u32 fmt, const u32 width)
>  {
>  	u32 bytesperline = 0;
> @@ -884,6 +916,8 @@ static struct soc_camera_host_ops mtk_soc_camera_host_ops = {
>  	.poll			= vb2_fop_poll,
>  	.querycap		= mtk_mipicsi_querycap,
>  	.set_bus_param		= mtk_mipicsi_set_bus_param,
> +	.get_parm		= mtk_mipicsi_get_parm,
> +	.set_parm		= mtk_mipicsi_set_param,
>  };
>  
>  static void mtk_mipicsi_ana_init(void __iomem *base)
> 
