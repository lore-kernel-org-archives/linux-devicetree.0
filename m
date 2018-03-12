From: =?UTF-8?Q?Joonas_Kylm=c3=a4l=c3=a4?= <joonas.kylmala-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH 5/9] media: platform: Add Sunxi Cedrus
 decoder driver
Date: Mon, 12 Mar 2018 17:15:00 +0000
Message-ID: <a133f4f9-8b99-323f-5e57-c2c6966d3ecb@iki.fi>
References: <20180309100933.15922-3-paul.kocialkowski@bootlin.com>
 <20180309101445.16190-3-paul.kocialkowski@bootlin.com>
Reply-To: joonas.kylmala-X3B1VOXEql0@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDKPPPP3Z4PBBW7LTLKQKGQE7ZZLH2A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180309101445.16190-3-paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Florent Revest <revestflo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Thomas van Kleef <thomas-XCRq7eEM0/pmR6Xm/wNWPw@public.gmane.org>, "Signed-off-by : Bob Ham" <rah-2mWpNWY8JZLk1uMJSBkQmQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Paul Kocialkowski:
> diff --git a/drivers/media/platform/sunxi-cedrus/sunxi_cedrus_regs.h b/drivers/media/platform/sunxi-cedrus/sunxi_cedrus_regs.h
> new file mode 100644
> index 000000000000..7384daa94737
> --- /dev/null
> +++ b/drivers/media/platform/sunxi-cedrus/sunxi_cedrus_regs.h
> @@ -0,0 +1,170 @@
> +/*
> + * Sunxi Cedrus codec driver
> + *
> + * Copyright (C) 2016 Florent Revest
> + * Florent Revest <florent.revest-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> + *
> + * Based on Cedrus
> + *
> + * Copyright (c) 2013 Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef SUNXI_CEDRUS_REGS_H
> +#define SUNXI_CEDRUS_REGS_H
> +
> +/*
> + * For more information consult http://linux-sunxi.org/VE_Register_guide
> + */
> +
> +/* Special registers values */
> +
> +/* VE_CTRL:
> + * The first 3 bits indicate the engine (0 for MPEG, 1 for H264, b for AVC...)
> + * The 16th and 17th bits indicate the memory type (3 for DDR3 32 bits)
> + * The 20th bit is unknown but needed
> + */
> +#define VE_CTRL_MPEG		0x130000
> +#define VE_CTRL_H264		0x130001
> +#define VE_CTRL_AVC		0x13000b
> +#define VE_CTRL_REINIT		0x130007
> +
> +/* VE_MPEG_CTRL:
> + * The bit 3 (0x8) is used to enable IRQs
> + * The other bits are unknown but needed
> + */
> +#define VE_MPEG_CTRL_MPEG2	0x800001b8
> +#define VE_MPEG_CTRL_MPEG4	(0x80084118 | BIT(7))
> +#define VE_MPEG_CTRL_MPEG4_P	(VE_MPEG_CTRL_MPEG4 | BIT(12))
> +
> +/* VE_MPEG_VLD_ADDR:
> + * The bits 27 to 4 are used for the address
> + * The bits 31 to 28 (0x7) are used to select the MPEG or JPEG engine
> + */
> +#define VE_MPEG_VLD_ADDR_VAL(x)	((x & 0x0ffffff0) | (x >> 28) | (0x7 << 28))
> +
> +/* VE_MPEG_TRIGGER:
> + * The first three bits are used to trigger the engine
> + * The bits 24 to 26 are used to select the input format (1 for MPEG1, 2 for 

Trailing whitespace.
