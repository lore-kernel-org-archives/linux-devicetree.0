From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mfd: Add driver for RAVE Supervisory Processor
Date: Mon, 12 Jun 2017 17:28:09 -0700
Message-ID: <CAHQ1cqH9LLZrVwzDh0Mwv45Mv2BdcMW+kFtELQ-VNrk-1F0ngA@mail.gmail.com>
References: <20170606180643.14258-1-andrew.smirnov@gmail.com> <1496824875.30073.123.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496824875.30073.123.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chris Healy <cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 7, 2017 at 1:41 AM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Hi Andrey,
>
> no code review, just 2 drive-by comments.
>
> Am Dienstag, den 06.06.2017, 11:06 -0700 schrieb Andrey Smirnov:
>> Add a driver for RAVE Supervisory Processor, an MCU implementing
>> varoius bits of housekeeping functionality (watchdoging, backlight
>> control, LED control, etc) on RAVE family of products by Zodiac
>> Inflight Innovations.
>>
>> This driver implementes core MFD/serdev device as well as
>> communication subroutines necessary for commanding the device.
>>
>> Cc: cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>> Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Cc: Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
> [...]
>
>> +++ b/drivers/mfd/rave-sp.c
>> @@ -0,0 +1,1009 @@
>> +/*
>> + * rave-sp.c - Multifunction core driver for Zodiac Inflight Innovations
>> + * SP MCU that is connected via dedicated UART port
>> + *
>> + * Copyright (C) 2017 Zodiac Inflight Innovations
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License as
>> + * published by the Free Software Foundation; either version 2 of
>> + * the License, or (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
>> + */
>
> [...]
>
>> +MODULE_DEVICE_TABLE(of, rave_sp_dt_ids);
>> +MODULE_LICENSE("GPL");
>
> Header says GPL v2, so this should be changed to match.
>

OK, will fix in v2.

> [...]
>> +
>> +#define COMPATIBLE_RAVE_SP_NIU               "zii,rave-sp-niu"
>> +#define COMPATIBLE_RAVE_SP_MEZZ              "zii,rave-sp-mezz"
>> +#define COMPATIBLE_RAVE_SP_ESB               "zii,rave-sp-esb"
>> +#define COMPATIBLE_RAVE_SP_RDU1              "zii,rave-sp-rdu1"
>> +#define COMPATIBLE_RAVE_SP_RDU2              "zii,rave-sp-rdu2"
>
> Can we get rid of those defines? They are only used in the of_device_id
> table.

Those defines are used by drivers for MFD cells, because,
unfortunately, communication protocols differ for between hardware
versions. So instead of having, say, "zii,rave-sp-watchdog-rdu2",
"zii,rave-sp-watchdog-rdu1", etc. I use "zii,rave-sp-watchdog" and
"compatible" from MFD parent to determine what protocol to use. I am
happy to change that if that doesn't seem like a good idea.

Thanks,
Andrey Smirnov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
