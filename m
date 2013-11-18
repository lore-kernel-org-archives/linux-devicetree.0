From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 3/7] gpio: davinci: use irqdomain
Date: Mon, 18 Nov 2013 16:34:13 +0200
Message-ID: <528A2565.4000802@ti.com>
References: <1383905510-31760-1-git-send-email-prabhakar.csengg@gmail.com>	<1383905510-31760-4-git-send-email-prabhakar.csengg@gmail.com>
	<CACRpkdaJg4wqtD5xhPVrHJHxFoVwau6jidbOuQ9xFSK_6drxPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <CACRpkdaJg4wqtD5xhPVrHJHxFoVwau6jidbOuQ9xFSK_6drxPQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prabhakar Lad <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DLOS <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,
On 11/18/2013 03:11 PM, Linus Walleij wrote:
> On Fri, Nov 8, 2013 at 11:11 AM, Prabhakar Lad
> <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> From: "Lad, Prabhakar" <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> This patch converts the davinci gpio driver to use irqdomain
>> support.
>>
>> Signed-off-by: Lad, Prabhakar <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> (...)
>> @@ -282,8 +283,7 @@ gpio_irq_handler(unsigned irq, struct irq_desc *desc)
>>          desc->irq_data.chip->irq_ack(&desc->irq_data);
>>          while (1) {
>>                  u32             status;
>> -               int             n;
>> -               int             res;
>> +               int             bit;
>
> Why is this an int? I think u8 would suffice.
>
>>                  /* now demux them to the right lowlevel handler */
>> -               n = d->irq_base;
>> -               if (irq & 1) {
>> -                       n += 16;
>> -                       status >>= 16;
>> -               }
>> -
>>                  while (status) {
>> -                       res = ffs(status);
>> -                       n += res;
>> -                       generic_handle_irq(n - 1);
>> -                       status >>= res;
>> +                       bit = __ffs(status);
>> +                       status &= ~(1 << bit);
>> +                       generic_handle_irq(irq_find_mapping(d->irq_domain,
>> +                                                           bit));
>
> This is a nice hunk of the patch.
>
> I would use <linux/bitops.h> and do:
> status &= ~BIT(bit);
>
>
>> @@ -313,10 +307,7 @@ static int gpio_to_irq_banked(struct gpio_chip *chip, unsigned offset)
>>   {
>>          struct davinci_gpio_controller *d = chip2controller(chip);
>>
>> -       if (d->irq_base >= 0)
>> -               return d->irq_base + offset;
>> -       else
>> -               return -ENODEV;
>> +       return irq_create_mapping(d->irq_domain, offset);
>>   }
>
> I think we recently established that map creating cannot be done
> in gpio_to_irq* functions as that will not work properly if you request
> an IRQ from device tree without first obtaining the IRQ from the GPIO
> number with this function.

Why? Could you point on corresponding thread, pls?
Current call tree is:
irq_create_of_mapping()
|-hwirq = omain->ops->xlate()
|-irq_create_mapping(domain, hwirq)

>
> Instead call irq_create_mapping() on *all* used IRQ lines in the
> probe function and use irq_find_mapping() here too.
>
>> +       for (gpio = 0, bank = 0; gpio < ngpio; bank++, bank_irq++, gpio += 16) {
>>                  /* disabled by default, enabled only as needed */
>>                  g = gpio2regs(gpio);
>>                  writel(~0, &g->clr_falling);
>> @@ -467,14 +483,6 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>>                   */
>>                  irq_set_handler_data(bank_irq, &chips[gpio / 32]);
>
> So for example here you could call iurq_create_mapping();
>
> Also: please write a patch that marks the IRQ lines.
> Call gpio_lock_as_irq(*gpio_chip, offset); in the
> irqchip startup/shutdown functions. (Can be a separate
> patch.)

It seems, some misunderstanding is here. So I'd like to clarify few 
points and would be very appreciate for your comments:
1) This patch itself will work unless we switch to DT (as in the 
following patch)

2) After this patch the following object structure will be created 
during Davinci GPIO driver initialization (DA850 has 144 IRQ lines):
- gpio_chip0(0..31)
   |- irq_domain1
- gpio_chip1(32..63)
   |- irq_domain2
- gpio_chip2(64..95)
   |- irq_domain3
- gpio_chip3(96..127)
   |- irq_domain4
- gpio_chip4(128..143)
   |- irq_domain5

3) But in case of DT only one GPIO controller node will be created
Example:
gpio: gpio@1e26000 {
	compatible = "ti,dm6441-gpio";
	gpio-controller;
	reg = <0x226000 0x1000>;
	interrupt-parent = <&intc>;
	interrupts = <42 IRQ_TYPE_EDGE_BOTH 43 IRQ_TYPE_EDGE_BOTH
		44 IRQ_TYPE_EDGE_BOTH 45 IRQ_TYPE_EDGE_BOTH
		46 IRQ_TYPE_EDGE_BOTH 47 IRQ_TYPE_EDGE_BOTH
		48 IRQ_TYPE_EDGE_BOTH 49 IRQ_TYPE_EDGE_BOTH
		50 IRQ_TYPE_EDGE_BOTH>;
	interrupt-controller;
	#interrupt-cells = <2>;
	ti,ngpio = <144>;
	ti,davinci-gpio-unbanked = <0>;
}

4) As result, to make GPIO bindings/mappings work - we'll need to 
implement .of_xlate() callback per GPIO chip, which will provide us with 
valid valid gpio_chip and offset of gpio inside chip
(It was discussed before and supposed to be done as next step).

For example, gpio_chip3 and offset=15 should be selected:
devA {
    gpios = <&gpio 111 GPIO_ACTIVE_HIGH>;
}

5) What should be done to make GPIO IRQ bindings/mappings work?

Example:
devB {
    interrupt-parent = <&gpio>;
    interrupts = <111 IRQ_TYPE_EDGE_BOTH>;
}

Should we implement one IRQ domain per all GPIO chips (per GPIO controller)?

Thanks.

Regards,
-Grygorii
