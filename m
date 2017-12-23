From: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Subject: Re: [PATCH] clk: rockchip: Switch dt-binding headers for rk3328 to GPL/X11
Date: Sat, 23 Dec 2017 17:19:58 +0100
Message-ID: <CAOFm3uGdESYGtXP24AkHOLcLAJuGXhz1uvig=GVGAt-OagXFEw@mail.gmail.com>
References: <20171223152254.11617-1-manu@freebsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171223152254.11617-1-manu-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emmanuel Vadot <manu-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Kate Stewart <kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Emmanuel,

On Sat, Dec 23, 2017 at 4:22 PM, Emmanuel Vadot <manu-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
> Since those files are also needed kernel side, switch their licences
> to GPL/X11 so it can be used in BSD kernels.
>
> Signed-off-by: Emmanuel Vadot <manu-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
> ---
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
>   * Author: Elaine <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
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

You just poked a big pointy stick in my left eye. It hurts! Why not
use a proper SPDX tag here, like you did below?

Each time such a long legalese is added to the kernel instead of an
SPDX tag there is an endangered animal species that disappears from
the face of the earth for good.  You do not want to bear this grave
responsibility, do you?

Also are you sure Elaine, other contributors and Rockchip Electronics
Co. Ltd. agree to this change?
It might be best if the patch were to come from them directly or at
least you will need proper acks for sure.

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

What you call X11 is called MIT in SPDX and in Thomas doc patches [1],
e.g. this tag is supposed to match the eyes-poking long legalese
above, this should be instead:

+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */

Finally if the goal of this proposed license update is usage in
FreeBSD and other BSD kernels, why use MIT as a second license? Would
not a BSD be better and avoid license inflation on the BSD side?

[1] https://lkml.org/lkml/2017/12/4/934
-- 
Cordially
Philippe Ombredanne
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
