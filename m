From: David Daney <ddaney.cavm@gmail.com>
Subject: Re: Re: [PATCH] gpio MIPS/OCTEON: Add a driver for OCTEON's on-chip
 GPIO pins.
Date: Thu, 20 Jun 2013 11:10:12 -0700
Message-ID: <51C34584.8070301@gmail.com>
References: <1371251915-18271-1-git-send-email-ddaney.cavm@gmail.com> <CACRpkdYHzBBbPNujYRGkMFGuQRzeYKs9jgfc3e3HWyxQFahvRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYHzBBbPNujYRGkMFGuQRzeYKs9jgfc3e3HWyxQFahvRQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

Sorry for not responding earlier, but my e-mail system seems to have 
malfunctioned with respect to this message...


On 06/17/2013 01:51 AM, Linus Walleij wrote:
> On Sat, Jun 15, 2013 at 1:18 AM, David Daney <ddaney.cavm@gmail.com> wrote:
>
>> From: David Daney <david.daney@cavium.com>
>>
>> The SOCs in the OCTEON family have 16 (or in some cases 20) on-chip
>> GPIO pins, this driver handles them all.  Configuring the pins as
>> interrupt sources is handled elsewhere (OCTEON's irq handling code).
>>
>> Signed-off-by: David Daney <david.daney@cavium.com>
>
>> This patch depends somewhat on patches in Ralf's MIPS/Linux -next tree
>> where we have patches that enable the Kconfig CAVIUM_OCTEON_SOC and
>> ARCH_REQUIRE_GPIOLIB symbols.  Apart from that it is stand-alone and
>> is probably suitable for merging via the GPIO tree.
>
> Really? You're using this:
>
> +#include <asm/octeon/octeon.h>
> +#include <asm/octeon/cvmx-gpio-defs.h>
>
> I cannot find this in my tree.

Weird, I see them here:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/mips/include/asm/octeon/cvmx-gpio-defs.h
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/mips/include/asm/octeon/octeon.h

Do you not have these?

>
> Further I ask why that second file is not part of *this* patch?
> It surely seems GPIO-related, and would probably need to
> go into include/linux/platform_data/gpio-octeon.h or something
> rather than such platform dirs.
>
> (...)
>> +config GPIO_OCTEON
>> +       tristate "Cavium OCTEON GPIO"
>> +       depends on GPIOLIB && CAVIUM_OCTEON_SOC
>
> depend on OF as well right? Or does the CAVIUM_OCTEON_SOC already
> imply that?

We already have 'select USE_OF', so I think adding OF here would be 
redundant.


>
> (...)
>> +++ b/drivers/gpio/gpio-octeon.c
>
>
>> +#define RX_DAT 0x80
>> +#define TX_SET 0x88
>> +#define TX_CLEAR 0x90
>
>
>> +/*
>> + * The address offset of the GPIO configuration register for a given
>> + * line.
>> + */
>> +static unsigned int bit_cfg_reg(unsigned int gpio)

>
> Maybe the passed variable shall be named "offset" here, as it is named
> offset on all call sites, and it surely local for this instance?

Well it is the gpio line, so perhaps it should universally be change to 
"line" or "pin"


>
>> +{
>> +       if (gpio < 16)
>> +               return 8 * gpio;
>> +       else
>> +               return 8 * (gpio - 16) + 0x100;
>
> Put this 0x100 in the #defines above with the name something like
> STRIDE.

But it is not a 'STRIDE', it is a discontinuity compensation and used in 
exactly one place.


>
>> +struct octeon_gpio {
>> +       struct gpio_chip chip;
>> +       u64 register_base;
>> +};
>
> OMG everything is 64 bit. Well has to come to this I guess.

Not everything.  This is custom logic in an SoC with 64-bit wide 
internal address buses, what would you suggest?


>
>> +static void octeon_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
>> +{
>> +       struct octeon_gpio *gpio = container_of(chip, struct octeon_gpio, chip);
>> +       u64 mask = 1ull << offset;
>
> And now BIT(offset) does not work anymore because it is defined as
> #define BIT(nr)                 (1UL << (nr))
> OK we will have to live with this FTM I guess.
>
>> +static int octeon_gpio_dir_out(struct gpio_chip *chip, unsigned offset,
>> +                              int value)
>> +{
>> +       struct octeon_gpio *gpio = container_of(chip, struct octeon_gpio, chip);
>> +       union cvmx_gpio_bit_cfgx cfgx;
>> +
>> +       octeon_gpio_set(chip, offset, value);
>> +
>> +       cfgx.u64 = 0;
>> +       cfgx.s.tx_oe = 1;
>
> This makes me want to review that magic header file of yours,
> I guess this comes from <asm/octeon/cvmx-gpio-defs.h>?

Not really magic, but yes that is where it comes from.

>
> Should not this latter variable be a bool?

I don't think so, it is not the result of a comparison operator.

>
> I'm not a fan of packed bitfields like this, I prefer if you just
> OR | and AND & the bits together in the driver.
>
>> +static int octeon_gpio_get(struct gpio_chip *chip, unsigned offset)
>> +{
>> +       struct octeon_gpio *gpio = container_of(chip, struct octeon_gpio, chip);
>> +       u64 read_bits = cvmx_read_csr(gpio->register_base + RX_DAT);
>> +
>> +       return ((1ull << offset) & read_bits) != 0;
>
> A common idiom we use for this is:
>
> return !!(read_bits & (1ull << offset));

I hate that idiom, but if its use is a condition of accepting the patch, 
I will change it.

>
>> +       pdev->dev.platform_data = chip;
>> +       chip->label = "octeon-gpio";
>> +       chip->dev = &pdev->dev;
>> +       chip->owner = THIS_MODULE;
>> +       chip->base = 0;
>> +       chip->can_sleep = 0;
>> +       chip->ngpio = 20;
>> +       chip->direction_input = octeon_gpio_dir_in;
>> +       chip->get = octeon_gpio_get;
>> +       chip->direction_output = octeon_gpio_dir_out;
>> +       chip->set = octeon_gpio_set;
>> +       err = gpiochip_add(chip);
>> +       if (err)
>> +               goto out;
>> +
>> +       dev_info(&pdev->dev, "OCTEON GPIO\n");
>
> This is like shouting "REAL MADRID!" in the bootlog, be a bit more
> precise: "octeon GPIO driver probed\n" or something so we know what
> is happening.

No, more akin to 'Real Madrid', as 'OCTEON' is the correct spelling of 
its given name.

I will happily add "driver probed", and grudgingly switch to lower case 
if it is a necessary condition of patch acceptance.

David Daney
