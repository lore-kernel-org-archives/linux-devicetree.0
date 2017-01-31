From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 1/7] drm: Add DRM support for tiny LCD displays
Date: Tue, 31 Jan 2017 17:23:41 +0100
Message-ID: <20170131162341.ejr2b3bq7tghafzj@phenom.ffwll.local>
References: <20170131160319.9695-1-noralf@tronnes.org>
 <20170131160319.9695-2-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170131160319.9695-2-noralf@tronnes.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, thomas.petazzoni@free-electrons.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 31, 2017 at 05:03:13PM +0100, Noralf Trønnes wrote:
> tinydrm provides helpers for very simple displays that can use
> CMA backed framebuffers and need flushing on changes.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I spotted another tiny one, but yeah looks are supremely reasonable, ack
on all the drm parts. And please send a pull request for all of it as soon
as you have the dt acks.

Cheers, Daniel

> diff --git a/drivers/gpu/drm/tinydrm/core/tinydrm-core.c b/drivers/gpu/drm/tinydrm/core/tinydrm-core.c
> new file mode 100644
> index 0000000..c0a2eb6
> --- /dev/null
> +++ b/drivers/gpu/drm/tinydrm/core/tinydrm-core.c
> @@ -0,0 +1,377 @@
> +/*
> + * Copyright (C) 2016 Noralf Trønnes
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/tinydrm/tinydrm.h>
> +#include <linux/device.h>
> +#include <linux/dma-buf.h>
> +
> +/**
> + * DOC: overview

This kerneldoc DOC here isn't pulled into the .rst. I'd just merge it with
the one below.
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
