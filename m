From: punnaiah choudary kalluri <punnaia@xilinx.com>
Subject: Re: [PATCH v6 2/2] memory: pl353: Add driver for arm pl353 static
 memory controller
Date: Tue, 14 Apr 2015 12:14:32 +0530
Message-ID: <CAGnW=BY_-Hiw1GoFs0vfmsTgybh=FvW2inG_fJAtdUj7aRchXw@mail.gmail.com>
References: <1428941512-26411-1-git-send-email-punnaia@xilinx.com>
	<a1f437fe-51cf-4a89-87b4-8f0a305e68ed@BN1AFFO11FD026.protection.gbl>
	<1428950956.3868.16.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428950956.3868.16.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, Grant Likely <grant.likely@linaro.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>, Arnd Bergmann <arnd@arndb.de>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>, "jussi.kivilinna@iki.fi" <jussi.kivilinna@iki.fi>, Alexandre Courbot <acourbot@nvidia.co>
List-Id: devicetree@vger.kernel.org

Hi Paul Bolle

On Tue, Apr 14, 2015 at 12:19 AM, Paul Bolle <pebolle@tiscali.nl> wrote:
> On Mon, 2015-04-13 at 21:41 +0530, Punnaiah Choudary Kalluri wrote:
>> --- a/drivers/memory/Kconfig
>> +++ b/drivers/memory/Kconfig
>
>> +config PL353_SMC
>> +     bool "ARM PL353 Static Memory Controller (SMC) driver"
>> +     depends on ARM
>> +     help
>> +       This driver is for the ARM PL353 Static Memory Controller (SMC)
>> +       module.
>
> This adds a bool symbol.
>
>> --- a/drivers/memory/Makefile
>> +++ b/drivers/memory/Makefile
>
>> +obj-$(CONFIG_PL353_SMC)              += pl353-smc.o
>
> Which means pl353-smc.o can never be part of a module, right?
>
> (If that's not right you can stop reading here.)
>
>> --- /dev/null
>> +++ b/drivers/memory/pl353-smc.c
>
>> + * This program is free software: you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation, either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>
> This states the license is GPL v2 or later.
>
>> +#include <linux/module.h>
>
> I wonder whether this include is needed, since this is built-in only
> code.
>
>> +MODULE_DEVICE_TABLE(of, pl353_smc_of_match);
>
> According to include/linux/module.h this will be preprocessed away for
> built-in code.
>
>> +static struct platform_driver pl353_smc_driver = {
>> +     .probe          = pl353_smc_probe,
>> +     .remove         = pl353_smc_remove,
>> +     .driver         = {
>> +             .name   = "pl353-smc",
>> +             .owner  = THIS_MODULE,
>
> THIS_MODULE will be equivalent to NULL for built-in code, according to
> include/linux/export.h.
>
>> +             .pm     = &pl353_smc_dev_pm_ops,
>> +             .of_match_table = pl353_smc_of_match,
>> +     },
>> +};
>
>> +module_platform_driver(pl353_smc_driver);
>
> Speaking from memory: for built-in only code this is equivalent to
> having a wrapper that only does
>     register_platform_driver(&pl353_smc_driver);
>
> and mark that wrapper with device_initcall().
>
>> +MODULE_AUTHOR("Xilinx, Inc.");
>> +MODULE_DESCRIPTION("ARM PL353 SMC Driver");
>> +MODULE_LICENSE("GPL v2");
>
> For built-in only code these macros will be effectively preprocessed
> away.
>
> (Would you make PL353_SMC a tristate symbol then you should note that
> according to include/linux/module.h "GPL" is the license ident that
> matches the license stated in the comment at the top of this file.)

Ok. I will make PL353_SMC as tristate symbol and also i will change the
licence ident to "GPL".

Thanks for the review.

I will wait some time for further functional comments on this driver before
sending the next version of patches

Thanks,
Punnaiah
>
> Thanks,
>
>
> Paul Bolle
>
