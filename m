From: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v3 3/7] drm/tinydrm: Add MIPI DBI support
Date: Mon, 06 Feb 2017 13:30:09 +0200
Message-ID: <87efzbblq6.fsf@intel.com>
References: <20170131160319.9695-1-noralf@tronnes.org> <20170131160319.9695-4-noralf@tronnes.org> <20170206084848.GC27607@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170206084848.GC27607-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Noralf =?utf-8?Q?Tr=C3=B8nn?= =?utf-8?Q?es?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Cc: thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 06 Feb 2017, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Jan 31, 2017 at 05:03:15PM +0100, Noralf Trønnes wrote:
>> Add support for MIPI DBI compatible controllers.
>> Interface type C option 1 and 3 are supported (SPI).
>> 
>> Signed-off-by: Noralf Trønnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
>> ---
>>  Documentation/gpu/tinydrm.rst      |   12 +
>>  drivers/gpu/drm/tinydrm/Kconfig    |    3 +
>>  drivers/gpu/drm/tinydrm/Makefile   |    3 +
>>  drivers/gpu/drm/tinydrm/mipi-dbi.c | 1005 ++++++++++++++++++++++++++++++++++++
>>  include/drm/tinydrm/mipi-dbi.h     |  107 ++++
>>  5 files changed, 1130 insertions(+)
>>  create mode 100644 drivers/gpu/drm/tinydrm/mipi-dbi.c
>>  create mode 100644 include/drm/tinydrm/mipi-dbi.h
>
> Any reason why this is in the tinydrm subdirectory? Looks like this
> could be useful to drivers outside of it.
>
>> diff --git a/drivers/gpu/drm/tinydrm/mipi-dbi.c b/drivers/gpu/drm/tinydrm/mipi-dbi.c
>> new file mode 100644
>> index 0000000..5ded299
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tinydrm/mipi-dbi.c
>> @@ -0,0 +1,1005 @@
>> +/*
>> + * MIPI Display Bus Interface (DBI) LCD controller support
>> + *
>> + * Copyright 2016 Noralf Trønnes
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + */
>> +
>> +#include <drm/tinydrm/mipi-dbi.h>
>> +#include <drm/tinydrm/tinydrm-helpers.h>
>> +#include <linux/debugfs.h>
>> +#include <linux/dma-buf.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/module.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/spi/spi.h>
>> +#include <video/mipi_display.h>
>> +
>> +#define MIPI_DBI_MAX_SPI_READ_SPEED 2000000 /* 2MHz */
>> +
>> +#define DCS_POWER_MODE_DISPLAY			BIT(2)
>> +#define DCS_POWER_MODE_DISPLAY_NORMAL_MODE	BIT(3)
>> +#define DCS_POWER_MODE_SLEEP_MODE		BIT(4)
>> +#define DCS_POWER_MODE_PARTIAL_MODE		BIT(5)
>> +#define DCS_POWER_MODE_IDLE_MODE		BIT(6)
>> +#define DCS_POWER_MODE_RESERVED_MASK		(BIT(0) | BIT(1) | BIT(7))
>
> Should these perhaps be defined in include/video/mipi_display.h since
> that already defines the MIPI_DCS_GET_POWER_MODE that this is used with?

Agreed.

>
>> +/**
>> + * mipi_dbi_command - MIPI DCS command with optional parameter(s)
>> + * @mipi: MIPI structure
>> + * @cmd: Command
>> + * @seq...: Optional parameter(s)
>> + *
>> + * Send MIPI DCS command to the controller. Use mipi_dbi_command_read() for
>> + * get/read.
>> + *
>> + * Returns:
>> + * Zero on success, negative error code on failure.
>> + */
>> +#define mipi_dbi_command(mipi, cmd, seq...) \
>> +({ \
>> +	u8 d[] = { seq }; \
>> +	mipi_dbi_command_buf(mipi, cmd, d, ARRAY_SIZE(d)); \
>> +})
>
> I feel obligated to object to this because I objected to the same macro
> when Andrzej wanted to add the same macro for MIPI DSI. But since I'm
> apparently the only one that doesn't like this, maybe it's time for me
> to embrace this.

I think that's less interesting for MIPI DSI now that we have specific
functions for most standard DCS commands anyway. That also avoids the
need to have a list of read functions like here.

I guess the question is if it feels like too much duplication to have
the DCS commands as functions also for DBI. And whether it's worth
trying to deduplicate DSI and DBI in this case, or if it gets just too
confusing/complicated.

BR,
Jani.


>
> Thierry
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Jani Nikula, Intel Open Source Technology Center
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
