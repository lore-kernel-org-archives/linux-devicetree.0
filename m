From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 5/6] ARM: zynq: Add OCM controller driver
Date: Thu, 27 Nov 2014 14:57:13 +0100
Message-ID: <857cab03bd6445c59cc345349a00f67c@BL2FFO11FD010.protection.gbl>
References: <cover.1415962281.git.michal.simek@xilinx.com>
	<6741d995fbec801d795c5db481e39425bd912f8a.1415962281.git.michal.simek@xilinx.com>
 <CACRpkdbZ8Pwy=04dhJq5ONZ1B-SQK1f=eLZjjCDmV7UQ0aHduA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbZ8Pwy=04dhJq5ONZ1B-SQK1f=eLZjjCDmV7UQ0aHduA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Josh Cartwright <josh.cartwright-acOepvfBmUk@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>, Jingoo
List-Id: devicetree@vger.kernel.org

On 11/27/2014 02:20 PM, Linus Walleij wrote:
> On Fri, Nov 14, 2014 at 11:52 AM, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> 
>> The driver provide memory allocator which can
>> be used by others drivers to allocate memory inside OCM.
>> All location for 64kB blocks are supported
> 
> Allocation?
> 
>> and driver is trying to allocate the largest continuous
>> block of memory.
> 
> Isn't all genalloc allocations continuous?

I hope it is but blocks can be at different locations.

Two locations 0 or 0xfffc0000.
it means for every 64k block can be at low or high address location
first block 0x0 or 0xfffc0000
second block 0x10000 or 0xfffd0000
third block 0x20000 or 0xfffe0000
four block 0x30000 or 0xffff0000

it is worth to allocate to biggest continuous memory.
For example 2 blocks low and then 2 blocks high.

2 blocks with 128kB is better then 4 blocks with 64kB

> 
> (...)
>> +       zynq_ocmc->pool = devm_gen_pool_create(&pdev->dev,
>> +                                              ilog2(ZYNQ_OCMC_GRANULARITY),
>> +                                              -1);
> 
> Do this:
> 
> #include <linux/sizes.h>
> 
> zynq_ocmc->pool = devm_gen_pool_create(&pdev->dev,
>                                        ilog2(SZ_64K),
>                                        -1);
> 
> And get rid of the #define for ZYNQ_OCMC_GRANULARITY

ilog2 from 32 is different to ilog2 from ilog2 from 0x10000.
But I will look at gen pool internals.

Do you have any opinion regarding calling zynq_slcr_get_ocm_config()?

Is it better to expose slcr this interface to drivers?
Or use regmap and read this value directly?

Also I do read for CONFIG_SMP case jump trampoline size - maybe
you can have better idea how this can be done.

Thanks for your input,
Michal

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
