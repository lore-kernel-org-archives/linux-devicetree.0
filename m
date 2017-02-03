From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 0/2] drm/panel: Add support for the Sitronix ST7789V
Date: Fri, 3 Feb 2017 19:48:51 +0100
Message-ID: <2db19e6e-9857-1c92-dc77-c6b862cc771f@tronnes.org>
References: <cover.d573d2c400f1a8ef8d2696fda74f3e860bff50ca.1486115846.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.d573d2c400f1a8ef8d2696fda74f3e860bff50ca.1486115846.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org


Den 03.02.2017 10.59, skrev Maxime Ripard:
> Hi,
>
> Here is an attempt at supporting the ST7789V LCD controller from Sitronix.

What happens if there's another panel driven by ST7789V that needs
a different controller initialization?
Maybe it's better to name it after the panel, not the controller.

> It is controlled through an SPI bus, with a twist, since each byte sent
> must be prefixed by a bit, which needs an 9-bits-per-word SPI controller,
> which is quite rare. Else, you would need to bitbang it.

It's possible to support SPI controllers that can't do 9-bit by using
8-bit mode and blocks of 9 bytes to send 8x 9-bit words padded with
zeroes. Zero is MIPI DCS no-op command.

Noralf.

> Let me know what you think,
> Maxime
>
> Maxime Ripard (2):
>    dt-bindings: display: panel: Add bindings for the Sitronix ST7789V panel
>    drm/panel: Add driver for sitronix ST7789V panel
>
>   Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt |  36 ++++++-
>   drivers/gpu/drm/panel/Kconfig                                        |   4 +-
>   drivers/gpu/drm/panel/Makefile                                       |   1 +-
>   drivers/gpu/drm/panel/panel-sitronix-st7789v.c                       | 435 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>   4 files changed, 476 insertions(+), 0 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt
>   create mode 100644 drivers/gpu/drm/panel/panel-sitronix-st7789v.c
>
> base-commit: 2a6e628efb37432a83bb42b00e3c403b1d8873dd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
