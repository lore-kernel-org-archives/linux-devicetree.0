From: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Subject: Re: [PATCH v3] ARM: sun8i: h2+: add support for Banana Pi M2 Zero board
Date: Mon, 25 Dec 2017 15:25:37 +0100
Message-ID: <CAOFm3uHrWXHaW-tLnk0ySAPNMSZLj7kFHF3XW8V7kuk5ZT3ROQ@mail.gmail.com>
References: <20171224054029.12278-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171224054029.12278-1-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Dec 24, 2017 at 6:40 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> Banana Pi M2 Zero board is a H2+-based board by Sinovoip, with a form
> factor and GPIO holes similar to Raspberry Pi Zero.
>
> It features:
> - Allwinner H2+ SoC
> - Single-chip (16-bit) 512MiB DDR3 DRAM
> - Ampak AP6212 Wi-Fi/Bluetooth module
> - MicroSD slot
> - Two MicroUSB Type-B ports (one can only be used to power the board and
>   the other features OTG functionality)
> - Two keys, a reset and a GPIO-connected key.
> - HDMI Type-C (miniHDMI) connector connected to the HDMI part of H2+.
> - CSI connector to connect the camera sensor provided by Sinovoip.
>
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> Changes in v3:
> - Add comments about Vbus problem in &usbphy node.
>
> Changes in v2:
> - Use high active SD card detect on the production batch.
>
>  arch/arm/boot/dts/Makefile                         |   1 +
>  .../boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts    | 162 +++++++++++++++++++++
>  2 files changed, 163 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 0bb8db33704a..937a8768671f 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -962,6 +962,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
>         sun8i-a83t-cubietruck-plus.dtb \
>         sun8i-a83t-tbs-a711.dtb \
>         sun8i-h2-plus-orangepi-r1.dtb \
> +       sun8i-h2-plus-bananapi-m2-zero.dtb \
>         sun8i-h2-plus-orangepi-zero.dtb \
>         sun8i-h3-bananapi-m2-plus.dtb \
>         sun8i-h3-beelink-x2.dtb \
> diff --git a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> new file mode 100644
> index 000000000000..5bc182ddc5f7
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> @@ -0,0 +1,162 @@
> +/*
> + * Copyright (C) 2017 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> + *
> + * Based on sun8i-h3-bananapi-m2-plus.dts, which is:
> + *   Copyright (C) 2016 Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +

Could you use SPDX tags instead of this long legalese?
-- 
Cordially
Philippe Ombredanne
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
