From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2 0/4] DRM driver for ILI9225 display panels
Date: Fri, 1 Dec 2017 14:17:47 +0100
Message-ID: <b0186865-7f67-0fe3-27aa-d8bbe0ad8e6e@tronnes.org>
References: <1511122328-31133-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511122328-31133-1-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Den 19.11.2017 21.12, skrev David Lechner:
> This is a new driver for ILI9225 based display panels.

Thanks, applied to drm-misc.

Noralf.

> v2 changes:
> * New patch for ilitek vendor prefix.
> * Use "ilitek" instead of "generic" in dt-bindings
> * New patch to export 2 mipi_dbi_* functions
> * Clean up ILI9225 driver based on feedback
>
> David Lechner (4):
>    dt-bindings: Add vendor prefix for ilitek
>    dt-bindings: Add binding for Ilitek ILI9225 display panels
>    drm/tinydrm: export mipi_dbi_buf_copy and mipi_dbi_spi_cmd_max_speed
>    drm/tinydrm: add driver for ILI9225 panels
>
>   .../devicetree/bindings/display/ilitek,ili9225.txt |  25 ++
>   .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>   MAINTAINERS                                        |   6 +
>   drivers/gpu/drm/tinydrm/Kconfig                    |  10 +
>   drivers/gpu/drm/tinydrm/Makefile                   |   1 +
>   drivers/gpu/drm/tinydrm/ili9225.c                  | 468 +++++++++++++++++++++
>   drivers/gpu/drm/tinydrm/mipi-dbi.c                 |  24 +-
>   include/drm/tinydrm/mipi-dbi.h                     |   4 +-
>   8 files changed, 534 insertions(+), 5 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9225.txt
>   create mode 100644 drivers/gpu/drm/tinydrm/ili9225.c
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
