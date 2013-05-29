From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH v2 7/9] gpio-tz1090: add TZ1090 gpio driver
Date: Wed, 29 May 2013 17:06:56 +0100
Message-ID: <51A627A0.3000603@imgtec.com>
References: <1369412476-14245-1-git-send-email-james.hogan@imgtec.com> <1369412476-14245-8-git-send-email-james.hogan@imgtec.com> <CACRpkdb-JNbWxUiiJf=2Y8C0txcKBVoFjBCwkaMVq4my1nzHzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb-JNbWxUiiJf=2Y8C0txcKBVoFjBCwkaMVq4my1nzHzQ@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On 29/05/13 16:32, Linus Walleij wrote:
> On Fri, May 24, 2013 at 6:21 PM, James Hogan <james.hogan@imgtec.com> wrote:
> 
>> Add a GPIO driver for the main GPIOs found in the TZ1090 (Comet) SoC.
>> This doesn't include low-power GPIOs as they're controlled separately
>> via the Powerdown Controller (PDC) registers.
>>
>> The driver is instantiated by device tree and supports interrupts for
>> all GPIOs.
> 
> (...)
> 
> This is looking much better.
> 
> However I have some more improvement comments, due to new
> knowledge. I am sorry about the moving target but it's not my fault...

No worries :-)

> And it will look like:
> interrupts = <13 IRQ_TYPE_LEVEL_HIGH>;
> 
> Which is way easier to understand and you no longer
> need to insert comments to explain things.

Very nice. I like this. Thanks.

>> +/* REG_GPIO_IRQ_PLRT */
>> +#define GPIO_POLARITY_LOW      0
>> +#define GPIO_POLARITY_HIGH     1
>> +
>> +/* REG_GPIO_IRQ_TYPE */
>> +#define GPIO_LEVEL_TRIGGERED   0
>> +#define GPIO_EDGE_TRIGGERED    1
> 
> Why does the comment start with REG_* but not the actual
> definition?

Legacy reasons (those constants were originally in that
<asm/soc-tz1090/gpio.h> header). I'll clean up the naming.

> 
> (...)
>> +/* caller must hold LOCK2 */
>> +static inline void _tz1090_gpio_mod_bit(struct tz1090_gpio_bank *bank,
>> +                                       unsigned int reg_offs,
>> +                                       unsigned int offset,
>> +                                       int val)
>> +{
>> +       u32 value;
>> +
>> +       value = tz1090_gpio_read(bank, reg_offs);
>> +       value &= ~BIT(offset);
>> +       value |= !!val << offset;
> 
> I can't parse that last line, it is equivalent to writing:
> 
> if (val)
>     value |= BIT(offset);
> 
> Which I think is easier to understand.

Apparently I was demonstrating how premature optimisation is the root of
all evil (as disassembling it testifies) :-). I'll stop doing this.

> 
> 
>> +/* set polarity to trigger on next edge, whether rising or falling */
>> +static void tz1090_gpio_irq_next_edge(struct tz1090_gpio_bank *bank,
>> +                                     unsigned int offset)
>> +{
>> +       unsigned int value_p, value_i;
>> +       int lstat;
>> +
>> +       __global_lock2(lstat);
>> +       /* irq_polarity[offset] = !input[offset] */
> 
> This comments probably need to be a bit more verbose, like explain
> to readers what is happening here.

Okay

>> +postcore_initcall(tz1090_gpio_init);
> 
> Is it really necessary to have this so early?

It was necessary when I wanted GPIO setup to precede platform code that
hadn't been converted to DT yet but messed with GPIOs. For upstream I
think I can change it to subsys_initcall to match the majority of other
gpio drivers.

(for the record, in drivers/gpio/*.c:
      1 core_initcall
      1 device_initcall
      1 late_initcall
      2 pure_initcall
      3 arch_initcall
     14 postcore_initcall
     29 subsys_initcall)

> Apart from these remarks it is looking very good.

Thanks for reviewing.

Cheers
James

