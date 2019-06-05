From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v4 2/3] media: uapi: Add RGB bus format for the
 GiantPlus GPM940B0 panel
Date: Wed, 5 Jun 2019 11:26:45 -0300
Message-ID: <20190605112645.5b357630@coco.lan>
References: <20190603153511.24384-1-paul@crapouillou.net>
        <20190603153511.24384-2-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603153511.24384-2-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Hans Verkuil <hansverk@cisco.com>, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, od@zcrc.me
List-Id: devicetree@vger.kernel.org

Em Mon,  3 Jun 2019 17:35:10 +0200
Paul Cercueil <paul@crapouillou.net> escreveu:

> The GiantPlus GPM940B0 is a 24-bit TFT panel where the RGB components
> are transferred sequentially on a 8-bit bus.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v2: New patch
>     
>     v3: No change
>     
>     v4: Add only MEDIA_BUS_FMT_RGB888_3X8, as we don't have to care about
>         endianness

Same comment as on version 3:

You should also patch the documentation text at:

	Documentation/media/uapi/v4l/subdev-formats.rst

In order to describe the new format that will be included.


> 
>  include/uapi/linux/media-bus-format.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 2a6b253cfb05..16c1fa2d89a4 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -34,7 +34,7 @@
>  
>  #define MEDIA_BUS_FMT_FIXED			0x0001
>  
> -/* RGB - next is	0x101c */
> +/* RGB - next is	0x101d */
>  #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
> @@ -55,6 +55,7 @@
>  #define MEDIA_BUS_FMT_RGB888_1X24		0x100a
>  #define MEDIA_BUS_FMT_RGB888_2X12_BE		0x100b
>  #define MEDIA_BUS_FMT_RGB888_2X12_LE		0x100c
> +#define MEDIA_BUS_FMT_RGB888_3X8		0x101c
>  #define MEDIA_BUS_FMT_RGB888_1X7X4_SPWG		0x1011
>  #define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA	0x1012
>  #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d



Thanks,
Mauro
