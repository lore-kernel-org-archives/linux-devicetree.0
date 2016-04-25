From: Caesar Wang <caesar.upstream-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND v2 4/4] ARM64: dts: rockchip: add dts file for
 RK3399 evaluation board
Date: Mon, 25 Apr 2016 09:47:15 +0800
Message-ID: <571D7723.1020707@gmail.com>
References: <1461304307-14113-1-git-send-email-jay.xu@rock-chips.com>
 <1461304307-14113-5-git-send-email-jay.xu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461304307-14113-5-git-send-email-jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E5=9C=A8 2016=E5=B9=B404=E6=9C=8822=E6=97=A5 13:51, Jianqun Xu =E5=86=99=
=E9=81=93:
> This patch add rk3399-evb.dts for RK3399 evaluation board.
> Tested on RK3399 evb.
>
> Signed-off-by: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> changes in v2:
> - remove rk808 since without i2c, which will upstream independently
> - remove es8316 since without i2c, which will upstream independently
> - fix codingstyle issues
>
>   arch/arm64/boot/dts/rockchip/Makefile       |   1 +
>   arch/arm64/boot/dts/rockchip/rk3399-evb.dts | 122 +++++++++++++++++=
+++++++++++
>   2 files changed, 123 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-evb.dts
>
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/=
dts/rockchip/Makefile
> index df37865..7037a16 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -1,6 +1,7 @@
>   dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-evb-act8846.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-geekbox.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-r88.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-evb.dtb
>  =20
>   always		:=3D $(dtb-y)
>   subdir-y	:=3D $(dts-dirs)
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb.dts b/arch/arm64=
/boot/dts/rockchip/rk3399-evb.dts
> new file mode 100644
> index 0000000..309f870
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
> @@ -0,0 +1,122 @@
> +/*
> + * Copyright (c) 2016 Fuzhou Rockchip Electronics Co., Ltd
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dua=
l
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License a=
s
> + *     published by the Free Software Foundation; either version 2 o=
f the
> + *     License, or (at your option) any later version.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty o=
f
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentatio=
n
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom th=
e
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall b=
e
> + *     included in all copies or substantial portions of the Softwar=
e.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIN=
D,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTI=
ES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/pwm/pwm.h>
> +#include "rk3399.dtsi"
> +
> +/ {
> +	compatible =3D "rockchip,rk3399-evb", "rockchip,rk3399";

I pick them up in my github.=20
(https://github.com/Caesar-github/rockchip/tree/wip/fixes-thermal-0425)

Can we add the following strings to match the loader (coreboot)?
  No matter, we can match the loader(coreboot) to bring up the evb boar=
d=20
on now or in the future.

=2E..,"google,rk3399evb-rev3",=20
google,rk3399evb-rev2",google,rk3399evb-rev1","google,rk3399evb-rev0"

Bring up my evb board:
=2E..
Compat preference: google,rk3399evb-rev0
Config conf@4, kernel kernel@1, fdt fdt@4, compat google,rk3399evb-rev0=
=20
(match) rockchip,rk3399-evb rockchip,rk3399
Config conf@3, kernel kernel@1, fdt fdt@3, compat rockchip,r88=20
rockchip,rk3368
Config conf@2, kernel kernel@1, fdt fdt@2, compat geekbuying,geekbox=20
rockchip,rk3368
Config conf@1 (default), kernel kernel@1, fdt fdt@1, compat=20
rockchip,rk3368-evb-act8846 rockchip,rk3368
Choosing best match conf@4.
Shutting down all USB controllers.
Exiting depthcharge with code 4 at timestamp: 6031792
WARNING: Skipping low memory range [0x0:0x500000]!
Relocating kernel to 0x680000
jumping to kernel
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version=20
4.6.0-rc4-next-20160422-00016-g0ac0bfb-dirty (wxt@nb) (gcc version=20
4.9.x-google 20140827 (prerelease) (GCC) ) #16 SMP PR
=2E...


--
<cut>


-
Caesar

--=20
Thanks,
Caesar

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
