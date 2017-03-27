From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 2/8] pinctrl: stm32: use gpio-ranges to declare bank range
Date: Mon, 27 Mar 2017 12:23:49 +0200
Message-ID: <7be9d251-f177-ce15-9d91-d8533ddffa06@st.com>
References: <1485533721-9019-1-git-send-email-alexandre.torgue@st.com>
 <1485533721-9019-3-git-send-email-alexandre.torgue@st.com>
 <CACRpkdYtZCJVrZhXOPXd-MNMX0Ry_H1dLQopKwsj9HnO03BtKg@mail.gmail.com>
 <2d0cd144-9a72-52d5-b2c9-c6c9e09ac494@st.com>
 <CACRpkdbhqT688-1MajRshqgn0bH0h2s=LM06gEQYgRmMZC_n0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdbhqT688-1MajRshqgn0bH0h2s=LM06gEQYgRmMZC_n0g@mail.gmail.com>
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

Hi Linus

On 02/01/2017 04:01 PM, Linus Walleij wrote:
> On Mon, Jan 30, 2017 at 5:29 PM, Alexandre Torgue
> <alexandre.torgue@st.com> wrote:
>> On 01/30/2017 04:19 PM, Linus Walleij wrote:
>
>>>> +       if (!of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0,
>>>> &args))
>>>> +               bank_nr = args.args[1] / STM32_GPIO_PINS_PER_BANK;
>>>> +       else {
>>>> +               range->name = bank->gpio_chip.label;
>>>> +               range->id = bank_nr;
>>>> +               range->pin_base = range->id * STM32_GPIO_PINS_PER_BANK;
>>>> +               range->base = range->id * STM32_GPIO_PINS_PER_BANK;
>>>> +               range->npins = npins;
>>>> +               range->gc = &bank->gpio_chip;
>>>> +               pinctrl_add_gpio_range(pctl->pctl_dev,
>>>> +                                      &pctl->banks[bank_nr].range);
>>>> +       }
>>
>>
>> I Keep the old way to get range in order to keep compatibility with older
>> device tree (if no gpio ranges are defined).
>
> Aha I understand. Sorry for my stupidity.
>
> Go ahead with this!

I saw an issue about this patch. It doesn't seem to be merged, so I will 
send a V2 only for this patch.

Regards
Alex


>
> Yours,
> Linus Walleij
>
