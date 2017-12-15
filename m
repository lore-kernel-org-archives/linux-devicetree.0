From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH 2/2] media: coda: Add i.MX51 (CodaHx4) support
Date: Fri, 15 Dec 2017 15:22:07 +0100
Message-ID: <e26f7f6a-afa6-c55c-d94e-095df27c19ae@xs4all.nl>
References: <20171213140918.22500-1-p.zabel@pengutronix.de>
 <20171213140918.22500-2-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171213140918.22500-2-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Chris Healy <Chris.Healy-c8ZVq/bFV1I@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On 13/12/17 15:09, Philipp Zabel wrote:
> Add support for the CodaHx4 VPU used on i.MX51.
> 
> Decoding h.264, MPEG-4, and MPEG-2 video works, as well as encoding
> h.264. MPEG-4 encoding is not enabled, it currently produces visual
> artifacts.
> 
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  drivers/media/platform/coda/coda-bit.c    | 45 ++++++++++++++++++++++---------
>  drivers/media/platform/coda/coda-common.c | 44 +++++++++++++++++++++++++++---
>  drivers/media/platform/coda/coda.h        |  1 +
>  3 files changed, 74 insertions(+), 16 deletions(-)
> 

<snip>

> +	[CODA_IMX51] = {
> +		.firmware     = {
> +			"vpu_fw_imx51.bin",
> +			"vpu/vpu_fw_imx51.bin",
> +			"v4l-codahx4-imx51.bin"
> +		},
> +		.product      = CODA_HX4,
> +		.codecs       = codahx4_codecs,
> +		.num_codecs   = ARRAY_SIZE(codahx4_codecs),
> +		.vdevs        = codahx4_video_devices,
> +		.num_vdevs    = ARRAY_SIZE(codahx4_video_devices),
> +		.workbuf_size = 128 * 1024,
> +		.tempbuf_size = 304 * 1024,
> +		.iram_size    = 0x14000,
> +	},

What's the status of the firmware? Is it going to be available in some firmware
repository? I remember when testing other imx devices that it was a bit tricky
to get hold of the firmware. And googling v4l-codahx4-imx51.bin doesn't find
anything other than this patch.

Regards,

	Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
