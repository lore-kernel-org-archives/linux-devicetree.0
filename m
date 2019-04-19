From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v2 05/15] [media] mtk-mipicsi: get the w/h/bytepwerline
 for mtk_mipicsi
Date: Fri, 19 Apr 2019 11:52:07 +0800
Message-ID: <1555645927.24433.4.camel@mtksdaap41>
References: <1555407015-18130-1-git-send-email-stu.hsieh@mediatek.com>
         <1555407015-18130-6-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555407015-18130-6-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stu Hsieh <stu.hsieh@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi, Stu:

On Tue, 2019-04-16 at 17:30 +0800, Stu Hsieh wrote:
> This patch get the w/h/bytepwerline to save in mtk_mipicsi.
> 
> Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
> ---
>  .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> index 16f6bc480f4e..10782fccca79 100644
> --- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> +++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> @@ -99,6 +99,9 @@ struct mtk_mipicsi_dev {
>  	u32 id;
>  	int clk_num;
>  	struct clk		*clk[MIPICSI_CLK];
> +	u32 width;
> +	u32 height;
> +	u32 bytesperline;
>  };
>  
>  #define MTK_MIPICSI_BUS_PARAM (V4L2_MBUS_MASTER |	\
> @@ -110,13 +113,36 @@ struct mtk_mipicsi_dev {
>  		V4L2_MBUS_PCLK_SAMPLE_FALLING |	\
>  		V4L2_MBUS_DATA_ACTIVE_HIGH)
>  
> +static u32 get_bytesperline(const u32 fmt, const u32 width)
> +{
> +	u32 bytesperline = 0;
> +
> +	switch (fmt) {
> +	case MEDIA_BUS_FMT_UYVY8_2X8:
> +	case MEDIA_BUS_FMT_VYUY8_2X8:
> +	case MEDIA_BUS_FMT_YUYV8_2X8:
> +	case MEDIA_BUS_FMT_YVYU8_2X8:
> +		bytesperline = width * 2U;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return bytesperline;
> +}
> +
>  static int mtk_mipicsi_add_device(struct soc_camera_device *icd)
>  {
> +	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
> +	struct mtk_mipicsi_dev *mipicsi = ici->priv;
>  	struct v4l2_subdev *sd = soc_camera_to_subdev(icd);
>  	struct v4l2_subdev_format format = {
>  		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>  	};
>  	int ret;
> +	u32 width;
> +	u32 height;
> +	u32 fmt;
>  
>  	/* Get width/height info from subdev. Then use them to set register */
>  	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &format);
> @@ -125,6 +151,19 @@ static int mtk_mipicsi_add_device(struct soc_camera_device *icd)
>  		return ret;
>  	}
>  
> +	width = format.format.width;
> +	height = format.format.height;
> +	fmt = format.format.code;
> +	mipicsi->bytesperline = get_bytesperline(fmt, width);
> +	if ((width == 0U) || (height == 0U) || (mipicsi->bytesperline == 0U)) {

You could check more completely, for example, if the valid range of width is 1 ~ 4095, you could check as:

#define WIDTH_MIN 1
#define WIDTH_MAX 4095

if ((width < WIDTH_MIN) || (width > WIDTH_MAX)) {
	/* invalid value */
}

Regards,
CK

> +		dev_err(icd->parent, "invalid sub device width/height/bytesperline %d/%d/%d\n",
> +			width, height, mipicsi->bytesperline);
> +		return -EINVAL;
> +	}
> +
> +	mipicsi->width = width;
> +	mipicsi->height = height;
> +
>  	/*
>  	 * If power domain was closed before, it will be open.
>  	 * Then clock will be open and register will be set
