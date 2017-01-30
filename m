From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 2/8] pinctrl: stm32: use gpio-ranges to declare bank range
Date: Mon, 30 Jan 2017 17:29:55 +0100
Message-ID: <2d0cd144-9a72-52d5-b2c9-c6c9e09ac494@st.com>
References: <1485533721-9019-1-git-send-email-alexandre.torgue@st.com>
 <1485533721-9019-3-git-send-email-alexandre.torgue@st.com>
 <CACRpkdYtZCJVrZhXOPXd-MNMX0Ry_H1dLQopKwsj9HnO03BtKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdYtZCJVrZhXOPXd-MNMX0Ry_H1dLQopKwsj9HnO03BtKg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, Patrice Chotard <patrice.chotard@st.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Olof Johansson <olof@lixom.net>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On 01/30/2017 04:19 PM, Linus Walleij wrote:
> On Fri, Jan 27, 2017 at 5:15 PM, Alexandre TORGUE
> <alexandre.torgue@st.com> wrote:
>
>> Use device tree entries to declare gpio range. It will allow to use
>> no contiguous gpio bank and holes inside a bank.
>>
>> Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>
>
> (...)
>> +       of_property_read_string(np, "st,bank-name", &bank->gpio_chip.label);
>> +
>> +       if (!of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0, &args))
>> +               bank_nr = args.args[1] / STM32_GPIO_PINS_PER_BANK;
>> +       else {
>> +               range->name = bank->gpio_chip.label;
>> +               range->id = bank_nr;
>> +               range->pin_base = range->id * STM32_GPIO_PINS_PER_BANK;
>> +               range->base = range->id * STM32_GPIO_PINS_PER_BANK;
>> +               range->npins = npins;
>> +               range->gc = &bank->gpio_chip;
>> +               pinctrl_add_gpio_range(pctl->pctl_dev,
>> +                                      &pctl->banks[bank_nr].range);
>> +       }

I Keep the old way to get range in order to keep compatibility with 
older device tree (if no gpio ranges are defined).

>
> Why are you doing this?
>
> There is already code in drivers/gpio/gpiolib-of.c to pick ranges
> from the device tree and add when you're adding the GPIO chips.

Yes, If I declare gpio-ranges inside DT node, the range is well handled 
by the gpiolib. But in this condition I use gpio-ranges entry to get the 
pin base offset for the bank we are registering. For example, if there 
an hole between 2 banks (GPIOA, GPIOD, ...) I need to know at which pin 
offset the bank D starts. It is the only way I found.

The "else" statement is here to get compatibility with older device tree 
(which don't use gpio-ranges entry).

Regards
Alex


>
> Please use that or figure out what is needed to make it work for
> you instead of reimplementing it.
>
> Yours,
> Linus Walleij
>
