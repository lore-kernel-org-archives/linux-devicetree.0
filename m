From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] clk: rockchip: Switch dt-binding headers for rk3328 to GPL/X11
Date: Sat, 23 Dec 2017 17:15:06 +0100
Message-ID: <58250763.La9K9Nn0rI@phil>
References: <20171223152254.11617-1-manu@freebsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171223152254.11617-1-manu@freebsd.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Emmanuel Vadot <manu@freebsd.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, zhangqing@rock-chips.com, gregkh@linuxfoundation.org, tglx@linutronix.de, kstewart@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Emmanuel,

Am Samstag, 23. Dezember 2017, 16:22:54 CET schrieb Emmanuel Vadot:
> Since those files are also needed kernel side, switch their licences
> to GPL/X11 so it can be used in BSD kernels.
> 
> Signed-off-by: Emmanuel Vadot <manu@freebsd.org>

definitly no objection from me (especially as the file only contains
constant definitions, so copyrightability might be debateable),
but could you:

(1) Adapt all rockchip clock headers in one patch, so we don't do this
    for each header invididually
(2) Do the same for the power/rk3* headers, but in a separate patch
    as this goes through a different tree


Thanks
Heiko

>  include/dt-bindings/clock/rk3328-cru.h   | 44 ++++++++++++++++++++++++++------
>  include/dt-bindings/power/rk3328-power.h |  2 +-
>  2 files changed, 37 insertions(+), 9 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/rk3328-cru.h b/include/dt-bindings/clock/rk3328-cru.h
> index d2b26a4b43eb..bbcf03641f89 100644
> --- a/include/dt-bindings/clock/rk3328-cru.h
> +++ b/include/dt-bindings/clock/rk3328-cru.h
> @@ -2,15 +2,43 @@
>   * Copyright (c) 2016 Rockchip Electronics Co. Ltd.
>   * Author: Elaine <zhangqing@rock-chips.com>
>   *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
>   *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
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
>   */
>  
>  #ifndef _DT_BINDINGS_CLK_ROCKCHIP_RK3328_H
> diff --git a/include/dt-bindings/power/rk3328-power.h b/include/dt-bindings/power/rk3328-power.h
> index 02e3d7fc1cce..301f30967b39 100644
> --- a/include/dt-bindings/power/rk3328-power.h
> +++ b/include/dt-bindings/power/rk3328-power.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0 or X11 */
>  #ifndef __DT_BINDINGS_POWER_RK3328_POWER_H__
>  #define __DT_BINDINGS_POWER_RK3328_POWER_H__
>  
> 
