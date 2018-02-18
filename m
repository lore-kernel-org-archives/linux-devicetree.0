Return-Path: <SRS0=rEJK=FM=nexb.com=pombredanne@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180216194415.6103-1-david.daney@cavium.com>
References: <20180216194415.6103-1-david.daney@cavium.com>
From: Philippe Ombredanne <pombredanne@nexb.com>
Date: Sun, 18 Feb 2018 18:31:14 +0100
Message-ID: <CAOFm3uGGRopoD-wsX51Duh5vnS5SmK7Qd_uGF=8c6_fYmWPJXw@mail.gmail.com>
Subject: Re: [PATCH v4] rtc: isl12026: Add driver.
Content-Type: text/plain; charset="UTF-8"
To: David Daney <david.daney@cavium.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Hi David,

On Fri, Feb 16, 2018 at 8:44 PM, David Daney <david.daney@cavium.com> wrote:
> The ISL12026 is a combination RTC and EEPROM device with I2C
> interface.  The standard RTC driver interface is provided.  The EEPROM
> is accessed via the NVMEM interface via the "eeprom0" directory in the
> sysfs entry for the device.
>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: David Daney <david.daney@cavium.com>

<snip>

> --- /dev/null
> +++ b/drivers/rtc/rtc-isl12026.c
> @@ -0,0 +1,529 @@
> +// SPDX-License-Identifier: GPL-2.0

<snip>

> +MODULE_LICENSE("GPL");

Your MODULE_LICENSE does not match your SPDX tag.
Per module.h, GPL would mean GPL-2.0+ not GPL-2.0
It would be best if you can sync the two.

-- 
Cordially
Philippe Ombredanne
