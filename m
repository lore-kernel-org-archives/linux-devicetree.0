From: punnaiah choudary kalluri <punnaia@xilinx.com>
Subject: Re: [PATCH v6 1/3] nand: pl353: Add basic driver for arm pl353 smc
 nand interface
Date: Tue, 14 Apr 2015 12:09:26 +0530
Message-ID: <CAGnW=Ba7oYT6qf=ag49r6Z-xkVTANcvLqK8848Hg2fTd6L6egw@mail.gmail.com>
References: <1428941550-4620-1-git-send-email-punnaia@xilinx.com>
	<858a607d-7c5a-4066-aa79-ab14c456b8e5@BN1BFFO11FD046.protection.gbl>
	<1428951432.3868.21.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1428951432.3868.21.camel@x220>
Sender: linux-doc-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, Grant Likely <grant.likely@linaro.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>, Arnd Bergmann <arnd@arndb.de>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>, "jussi.kivilinna@iki.fi" <jussi.kivilinna@iki.fi>, Alexandre Courbot <acourbot@nvidia.co>
List-Id: devicetree@vger.kernel.org

Hi Paul Bolle,

On Tue, Apr 14, 2015 at 12:27 AM, Paul Bolle <pebolle@tiscali.nl> wrote:
> On Mon, 2015-04-13 at 21:42 +0530, Punnaiah Choudary Kalluri wrote:
>
>> --- a/drivers/mtd/nand/Makefile
>> +++ b/drivers/mtd/nand/Makefile
>
>> +obj-$(CONFIG_MTD_NAND_PL353)         += pl353_nand.o
>
> (I think pl353_nand.o can be part of a module. If that's incorrect, you
> can stop reading here.)
>
>> --- /dev/null
>> +++ b/drivers/mtd/nand/pl353_nand.c
>
>> + * This program is free software; you can redistribute it and/or modify it under
>> + * the terms of the GNU General Public License version 2 as published by the
>> + * Free Software Foundation; either version 2 of the License, or (at your
>> + * option) any later version.
>
> This states the license of this driver is GPL v2 or later.
>
>> +MODULE_LICENSE("GPL v2");
>
> And according to include/linux/module.h this states the license is GPL
> v2. So either the comment at the top of this file or the license ident
> used in the MODULE_LICENSE() macro needs to change.

Thanks for the review. I will change the licence ident to "GPL".

I will wait some time for further functional comments on this driver
before sending the next version
of patches.

Regards,
Punnaiah

>
> Thanks,
>
>
> Paul Bolle
>
