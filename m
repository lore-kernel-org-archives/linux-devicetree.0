From: Andreas Larsson <andreas@gaisler.com>
Subject: Re: [PATCH v3] gpio: Add device driver for GRGPIO cores and support
 custom accessors with gpio-generic
Date: Mon, 04 Mar 2013 10:46:36 +0100
Message-ID: <51346D7C.5080307@gaisler.com>
References: <1360653873-25368-1-git-send-email-andreas@gaisler.com> <CACRpkdaYQSrzm_Yj3ZH9YZLC_zPJN06X-9ZM9jd7=X0OB1shXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaYQSrzm_Yj3ZH9YZLC_zPJN06X-9ZM9jd7=X0OB1shXQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Anton Vorontsov <anton.vorontsov@linaro.org>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, software@gaisler.com
List-Id: devicetree@vger.kernel.org

On 2013-03-01 01:24, Linus Walleij wrote:
> On Tue, Feb 12, 2013 at 8:24 AM, Andreas Larsson <andreas@gaisler.com> wrote:
>
>> This driver supports GRGPIO gpio cores available in the GRLIB VHDL IP
>> core library from Aeroflex Gaisler.
>>
>> This also adds support to gpio-generic for using custom accessor
>> functions. The grgpio driver uses this to use ioread32be and iowrite32be
>> for big endian register accesses.
>>
>> Signed-off-by: Andreas Larsson <andreas@gaisler.com>
>
> Can you split this in two patches: one that adds the custom accessors
> and one that adds the driver?

Sure!

> Grant is currently thinking about optimizations on the call graph
> depths of the GPIO functions and may want to take this opportunity
> to alter something there.
>
>> +++ b/drivers/gpio/gpio-grgpio.c
> (...)
>> +struct grgpio_priv {
>> +       struct bgpio_chip bgc;
>> +       struct grgpio_regs __iomem *regs;
>> +
>> +       u32 imask;      /* irq mask shadow register */
>> +       s32 *irqmap;    /* maps offset to irq or -1 if no irq */
>
> irqmap? Argh what is this... I think you want to use irqdomain
> for this instead. (Documentation/IRQ-domain.txt)

Yeah, that comment is not clear. An entry in the irqmap array (for a 
gpio line) can be either -1 indicating no irq for that line or an index 
into the array of irq:s for the of device. Thus it is simply either -1 
or a valid second argument to irq_of_parse_and_map.

Given that this is generally running on SPARC, it seems irqdomain is not 
an option (IRQ_DOMAIN is not selected by SPARC).

Given this, is just a better formulated comment OK with you in this case?

>
> Check other GPIO drivers (e.g. STMPE or TC3589x) for some
> example of how to use irqdomain.
>
>> +static int grgpio_to_irq(struct gpio_chip *gc, unsigned offset)
>> +{
>> +       struct grgpio_priv *priv = grgpio_gc_to_priv(gc);
>> +       int index, irq;
>
> This is wher you should use irq_create_mapping(domain, hwirq);

Thanks for the feedback!

Cheers,
Andreas
