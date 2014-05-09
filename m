From: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 3/7] mfd: add support for sun6i PRCM (Power/Reset/Clock
 Management) unit
Date: Fri, 09 May 2014 16:01:18 +0200
Message-ID: <536CDFAE.8070208@free-electrons.com>
References: <1399633911-7094-1-git-send-email-boris.brezillon@free-electrons.com> <1399633911-7094-4-git-send-email-boris.brezillon@free-electrons.com> <20140509135251.GY5767@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140509135251.GY5767@lee--X1>
Sender: linux-doc-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: =?UTF-8?B?RW1pbGlvIEzDs3Bleg==?= <emilio@elopez.com.ar>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Philipp Zabel <p.zabel@pengutronix.de>, Shuge <shuge@allwinnertech.com>, kevin@allwinnertech.com, Hans de Goede <hdegoede@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dev@linux-sunxi.org
List-Id: devicetree@vger.kernel.org


On 09/05/2014 15:52, Lee Jones wrote:
>> The PRCM (Power/Reset/Clock Management) block exposes several subdevices
>> in different subsystems (clk, reset ...)
>>
>> Add basic support for the PRCM unit with clk (AR100, AHB0, and APB0 clks)
>> and reset controller subdevices.
>>
>> Other subdevices might be added later (if needed).
>>
>> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
>> Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>> ---
>>  drivers/mfd/Kconfig      |   8 +++
>>  drivers/mfd/Makefile     |   1 +
>>  drivers/mfd/sun6i-prcm.c | 134 +++++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 143 insertions(+)
>>  create mode 100644 drivers/mfd/sun6i-prcm.c
> [...]
>
>> +/*
>> + * Copyright (C) 2014 Free Electrons
>> + *
>> + * License Terms: GNU General Public License v2
>> + * Author: Boris BREZILLON <boris.brezillon@free-electrons.com>
>> + *
>> + * Allwinner PRCM (Power/Reset/Clock Management) driver
>> + *
>> + */
>> +
>> +#include <linux/mfd/core.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
> Ah, now isn't that better?

Absolutely :-).

> Acked-by: Lee Jones <lee.jones@linaro.org>
>

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

