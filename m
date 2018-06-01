From: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] arm: sun4i: Add support for Pengpod 1000 tablet
Date: Fri, 1 Jun 2018 23:46:05 +0530
Message-ID: <29aec3c3-61af-b814-351b-6faf31a8cea3@openedev.com>
References: <20180601175538.16716-1-rah@settrans.net>
Reply-To: jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Return-path: <linux-sunxi+bncBDH5TZWAZAFBB3U2Y3MAKGQET2GQCIY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180601175538.16716-1-rah-2mWpNWY8JZLk1uMJSBkQmQ@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: rah-2mWpNWY8JZLk1uMJSBkQmQ@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/01/2018 11:25 PM, Bob Ham wrote:
> This is initial support for the Pengpod 1000 tablet.  The display is
> not currently working but the UART, SD card and USB all work fine.
> 
> Signed-off-by: Bob Ham <rah-2mWpNWY8JZLk1uMJSBkQmQ@public.gmane.org>
> ---
>   arch/arm/boot/dts/Makefile                   |   1 +
>   arch/arm/boot/dts/sun4i-a10-pengpod-1000.dts | 232 +++++++++++++++++++++++++++
>   2 files changed, 233 insertions(+)
>   create mode 100644 arch/arm/boot/dts/sun4i-a10-pengpod-1000.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index ade7a38543dc..e6e93e7ffc8b 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -893,6 +893,7 @@ dtb-$(CONFIG_MACH_SUN4I) += \
>   	sun4i-a10-olinuxino-lime.dtb \
>   	sun4i-a10-pcduino.dtb \
>   	sun4i-a10-pcduino2.dtb \
> +	sun4i-a10-pengpod-1000.dtb \
>   	sun4i-a10-pov-protab2-ips9.dtb
>   dtb-$(CONFIG_MACH_SUN5I) += \
>   	sun5i-a10s-auxtek-t003.dtb \
> diff --git a/arch/arm/boot/dts/sun4i-a10-pengpod-1000.dts b/arch/arm/boot/dts/sun4i-a10-pengpod-1000.dts
> new file mode 100644
> index 000000000000..94560400114d
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun4i-a10-pengpod-1000.dts
> @@ -0,0 +1,232 @@
> +/*
> + * Copyright 2015 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> + * Copyright 2017 Robert Ham <rah-2mWpNWY8JZLk1uMJSBkQmQ@public.gmane.org>
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

We need to use SPDX-License for new dts files.
