From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/12] drm/etnaviv: add etnaviv UAPI header
Date: Fri, 4 Dec 2015 14:24:49 +0000
Message-ID: <CACvgo52h7qNZLsmB0iJkC0wyucUdoFcPJvLkD1WLT+Jpm9bNMA@mail.gmail.com>
References: <1449237604-19064-1-git-send-email-l.stach@pengutronix.de>
	<1449237604-19064-4-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449237604-19064-4-git-send-email-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 4 December 2015 at 13:59, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> From: The etnaviv authors <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
>
> This adds the header defining the user/kernel API for the
> etnaviv DRM driver.
>
> Signed-off-by: Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  include/uapi/drm/etnaviv_drm.h | 221 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 221 insertions(+)
>  create mode 100644 include/uapi/drm/etnaviv_drm.h
>
> diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_drm.h
> new file mode 100644
> index 000000000000..0cce95efcd86
> --- /dev/null
> +++ b/include/uapi/drm/etnaviv_drm.h
> @@ -0,0 +1,221 @@
> +/*
> + * Copyright (C) 2015 Etnaviv Project
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License version 2 as published by
> + * the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef __ETNAVIV_DRM_H__
> +#define __ETNAVIV_DRM_H__
> +
> +#include <drm/drm.h>
> +
Guys, if we get to another revision of the patch can we make this a
"drm.h" please ?

Thanks
Emil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
