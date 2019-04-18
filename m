From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v2 04/15] [media] mtk-mipicsi: add color format support
 for mt2712
Date: Thu, 18 Apr 2019 09:39:44 +0800
Message-ID: <1555551584.2407.10.camel@mtksdaap41>
References: <1555407015-18130-1-git-send-email-stu.hsieh@mediatek.com>
         <1555407015-18130-5-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555407015-18130-5-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stu Hsieh <stu.hsieh@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi, Stu:

On Tue, 2019-04-16 at 17:30 +0800, Stu Hsieh wrote:
> This patch add color format support for mt2712

Without this patch, I think this driver still support these color
format. In this patch, you just check for the non-supported color
format.

Regards,
CK

> 
> Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
> ---
>  .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> index ec4f6b503b32..16f6bc480f4e 100644
> --- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> +++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> @@ -138,6 +138,20 @@ static void mtk_mipicsi_remove_device(struct soc_camera_device *icd)
>  	(void)pm_runtime_put_sync(icd->parent);
>  }
>  
> +static bool is_supported(const u32 pixformat)
> +{
> +	switch (pixformat) {
> +	/* YUV422 */
> +	case V4L2_PIX_FMT_YUYV:
> +	case V4L2_PIX_FMT_UYVY:
> +	case V4L2_PIX_FMT_YVYU:
> +	case V4L2_PIX_FMT_VYUY:
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  static int mtk_mipicsi_set_fmt(struct soc_camera_device *icd,
>  				struct v4l2_format *f)
>  {
> @@ -153,6 +167,12 @@ static int mtk_mipicsi_set_fmt(struct soc_camera_device *icd,
>  	struct v4l2_mbus_framefmt *mf = &format.format;
>  	int ret = 0;
>  
> +	if (!is_supported(pix->pixelformat)) {
> +		dev_err(dev, "Format %x not support. set V4L2_PIX_FMT_YUYV as default\n",
> +			pix->pixelformat);
> +		pix->pixelformat = V4L2_PIX_FMT_YUYV;
> +	}
> +
>  	xlate = soc_camera_xlate_by_fourcc(icd, pix->pixelformat);
>  	if (xlate == NULL) {
>  		dev_err(dev, "Format 0x%x not found\n", pix->pixelformat);
