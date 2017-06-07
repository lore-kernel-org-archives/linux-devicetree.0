From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] mfd: Add driver for RAVE Supervisory Processor
Date: Wed, 07 Jun 2017 10:41:15 +0200
Message-ID: <1496824875.30073.123.camel@pengutronix.de>
References: <20170606180643.14258-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170606180643.14258-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, cphealy@gmail.com, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Andrey,

no code review, just 2 drive-by comments.

Am Dienstag, den 06.06.2017, 11:06 -0700 schrieb Andrey Smirnov:
> Add a driver for RAVE Supervisory Processor, an MCU implementing
> varoius bits of housekeeping functionality (watchdoging, backlight
> control, LED control, etc) on RAVE family of products by Zodiac
> Inflight Innovations.
> 
> This driver implementes core MFD/serdev device as well as
> communication subroutines necessary for commanding the device.
> 
> Cc: cphealy@gmail.com
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
[...]

> +++ b/drivers/mfd/rave-sp.c
> @@ -0,0 +1,1009 @@
> +/*
> + * rave-sp.c - Multifunction core driver for Zodiac Inflight Innovations
> + * SP MCU that is connected via dedicated UART port
> + *
> + * Copyright (C) 2017 Zodiac Inflight Innovations
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of
> + * the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */

[...]

> +MODULE_DEVICE_TABLE(of, rave_sp_dt_ids);
> +MODULE_LICENSE("GPL");

Header says GPL v2, so this should be changed to match.

[...]
> +
> +#define COMPATIBLE_RAVE_SP_NIU		"zii,rave-sp-niu"
> +#define COMPATIBLE_RAVE_SP_MEZZ		"zii,rave-sp-mezz"
> +#define COMPATIBLE_RAVE_SP_ESB		"zii,rave-sp-esb"
> +#define COMPATIBLE_RAVE_SP_RDU1		"zii,rave-sp-rdu1"
> +#define COMPATIBLE_RAVE_SP_RDU2		"zii,rave-sp-rdu2"

Can we get rid of those defines? They are only used in the of_device_id
table.

Regards,
Lucas
