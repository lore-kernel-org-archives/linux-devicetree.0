From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v3 1/7] drm: Add DRM support for tiny LCD displays
Date: Tue, 31 Jan 2017 19:01:10 +0100
Message-ID: <1d854076-841a-7af3-36d2-eaf97b148388@tronnes.org>
References: <20170131160319.9695-1-noralf@tronnes.org>
 <20170131160319.9695-2-noralf@tronnes.org>
 <20170131162341.ejr2b3bq7tghafzj@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170131162341.ejr2b3bq7tghafzj-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Den 31.01.2017 17.23, skrev Daniel Vetter:
> On Tue, Jan 31, 2017 at 05:03:13PM +0100, Noralf Trønnes wrote:
>> tinydrm provides helpers for very simple displays that can use
>> CMA backed framebuffers and need flushing on changes.
>>
>> Signed-off-by: Noralf Trønnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
>> Acked-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
> I spotted another tiny one, but yeah looks are supremely reasonable, ack
> on all the drm parts. And please send a pull request for all of it as soon
> as you have the dt acks.

The first DOC section is just an overview and the second is how to use
the core functionality. They are referenced separately in tinydrm.rst.
At least they show up when I build htmldocs :-)

Thanks Daniel.

Noralf.


> Cheers, Daniel
>
>> diff --git a/drivers/gpu/drm/tinydrm/core/tinydrm-core.c b/drivers/gpu/drm/tinydrm/core/tinydrm-core.c
>> new file mode 100644
>> index 0000000..c0a2eb6
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tinydrm/core/tinydrm-core.c
>> @@ -0,0 +1,377 @@
>> +/*
>> + * Copyright (C) 2016 Noralf Trønnes
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + */
>> +
>> +#include <drm/drm_atomic.h>
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_crtc_helper.h>
>> +#include <drm/tinydrm/tinydrm.h>
>> +#include <linux/device.h>
>> +#include <linux/dma-buf.h>
>> +
>> +/**
>> + * DOC: overview
> This kerneldoc DOC here isn't pulled into the .rst. I'd just merge it with
> the one below.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
