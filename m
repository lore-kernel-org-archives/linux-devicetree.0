From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH] drivers/memory/Kconfig: Add CONFIG_OF dependency
Date: Mon, 23 Jul 2018 18:14:24 +0200
Message-ID: <20180723181424.3c07f5b8@bbrezillon>
References: <20180721200049.7553-1-anders.roxell@linaro.org>
        <a83ff193-be57-f566-cafb-132075025b56@infradead.org>
        <20180722082939.2de739f1@bbrezillon>
        <CAK8P3a1_8OSqyKsbw+m3ZzLWfPqDK4ynG3WoPTk+K2uJJsiq5A@mail.gmail.com>
        <20180723114107.664164d2@bbrezillon>
        <CAK8P3a10SsWuPXzOyRcNKa+ukvj_Gq13JyDTngoU8DJu6_MR0Q@mail.gmail.com>
        <CAK8P3a0p_8HWz0kLLrkwmpcbt4BsMiDG=hFK4SxeJygucZ1yMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a0p_8HWz0kLLrkwmpcbt4BsMiDG=hFK4SxeJygucZ1yMg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, Anders Roxell <anders.roxell@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, 23 Jul 2018 18:04:52 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> On Mon, Jul 23, 2018 at 5:40 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Mon, Jul 23, 2018 at 11:41 AM, Boris Brezillon
> > <boris.brezillon@bootlin.com> wrote:  
> >> On Mon, 23 Jul 2018 11:34:43 +0200
> >> Arnd Bergmann <arnd@arndb.de> wrote:
> >>  
> >>> On Sun, Jul 22, 2018 at 8:29 AM, Boris Brezillon
> >>> <boris.brezillon@bootlin.com> wrote:  
> >>> > +Arnd, Rob and the DT ML.
> >>> >
> >>> > On Sat, 21 Jul 2018 14:53:47 -0700
> >>> > Randy Dunlap <rdunlap@infradead.org> wrote:
> >>> >  
> >>> >> On 07/21/2018 01:00 PM, Anders Roxell wrote:  
> >>> >> > JZ4780_NEMC doesn't depend on OF, and if OF isn't enabled we get this
> >>> >> > error:
> >>> >> > drivers/memory/jz4780-nemc.c: In function ‘jz4780_nemc_num_banks’:
> >>> >> > drivers/memory/jz4780-nemc.c:72:10: error: implicit declaration of
> >>> >> >  function ‘of_read_number’; did you mean ‘down_read_nested’?
> >>> >> >  [-Werror=implicit-function-declaration]
> >>> >> >    bank = of_read_number(prop, 1);
> >>> >> >           ^~~~~~~~~~~~~~
> >>> >> >           down_read_nested  
> >>> >
> >>> > Looks like of.h defines stubs so that people can compile-test without
> >>> > CONFIG_OF selected. Maybe we should move of_read_number() and
> >>> > of_read_ulong() out of the #ifdef CONFIG_OF section.  
> >>>
> >>> That seems fine, though the added dependency seems appropriate
> >>> here as well. of_read_number() is rarely used, and for the most part in
> >>> powerpc specific code that is guaranteed to have CONFIG_OF enabled,
> >>> so it's not that likely to cause many more problems.  
> >>
> >> Ok, then I'll let Miquel apply Anders' patch to the NAND tree.
> >>
> >> Thanks for your feedback.  
> >
> > My randconfig build bot just ran into a second problem with this driver
> > with CONFIG_GPIOLIB disabled:
> >
> > drivers/mtd/nand/raw/jz4740_nand.c: In function 'jz_nand_dev_ready':
> > drivers/mtd/nand/raw/jz4740_nand.c:133:9: error: implicit declaration
> > of function 'gpiod_get_value_cansleep'; did you mean
> > 'gpio_get_value_cansleep'? [-Werror=implicit-function-declaration]
> >   return gpiod_get_value_cansleep(nand->busy_gpio);
> >          ^~~~~~~~~~~~~~~~~~~~~~~~
> >          gpio_get_value_cansleep
> > drivers/mtd/nand/raw/jz4740_nand.c: In function 'jz_nand_probe':
> > drivers/mtd/nand/raw/jz4740_nand.c:388:20: error: implicit declaration
> > of function 'devm_gpiod_get_optional'; did you mean
> > 'devm_gpio_request_one'? [-Werror=implicit-function-declaration]
> >   nand->busy_gpio = devm_gpiod_get_optional(&pdev->dev, "busy", GPIOD_IN);
> >                     ^~~~~~~~~~~~~~~~~~~~~~~
> >                     devm_gpio_request_one
> > drivers/mtd/nand/raw/jz4740_nand.c:388:64: error: 'GPIOD_IN'
> > undeclared (first use in this function); did you mean 'GPIOF_IN'?
> >   nand->busy_gpio = devm_gpiod_get_optional(&pdev->dev, "busy", GPIOD_IN);
> >                                                                 ^~~~~~~~
> >                                                                 GPIOF_IN
> >
> >
> > We could add another dependency here or (my preference) include
> > linux/gpio/consumer.h to fix that. Do you want a separate patch for
> > it, or should Anders send a combined patch?  
> 
> One more failure, not analyzed yet:
> 
> /git/arm-soc/drivers/mtd/nand/raw/jz4740_nand.c: In function
> 'jz_nand_select_chip':
> /git/arm-soc/drivers/mtd/nand/raw/jz4740_nand.c:87:9: error: implicit
> declaration of function 'readl'; did you mean 'krealloc'?
> [-Werror=implicit-function-declaration]
>   ctrl = readl(nand->base + JZ_REG_NAND_CTRL);
>          ^~~~~

Yep, somehow io.h was indirectly included by gpio.h. I fixed that in my
patch when replacing gpio.h by gpio/consumer.h by including linux/io.h.
