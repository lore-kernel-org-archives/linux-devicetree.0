From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH V3 2/2] pinctrl: Add Pistachio SoC pin control driver
Date: Tue, 28 Apr 2015 17:49:25 -0700
Message-ID: <CAL1qeaH8gg2Df=GbQdW+GvMEzzYgMgAZwO9LSerj=xYYWSnsBA@mail.gmail.com>
References: <1428435862-14354-1-git-send-email-abrestic@chromium.org>
	<1428435862-14354-3-git-send-email-abrestic@chromium.org>
	<554016A5.7040209@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <554016A5.7040209@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Govindraj Raja <govindraj.raja@imgtec.com>, Kevin Cernekee <cernekee@chromium.org>, Paul Bolle <pebolle@tiscali.nl>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 28, 2015 at 4:24 PM, Ezequiel Garcia
<ezequiel.garcia@imgtec.com> wrote:
> Andrew,
>
> On 04/07/2015 04:44 PM, Andrew Bresticker wrote:
> [..]
>> +static int pistachio_pinmux_enable(struct pinctrl_dev *pctldev,
>> +                                unsigned func, unsigned group)
>> +{
>> +     struct pistachio_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
>> +     const struct pistachio_pin_group *pg = &pctl->groups[group];
>> +     const struct pistachio_function *pf = &pctl->functions[func];
>> +     struct pinctrl_gpio_range *range;
>> +     unsigned int i;
>> +     u32 val;
>> +
>> +     if (pg->mux_reg > 0) {
>> +             for (i = 0; i < ARRAY_SIZE(pg->mux_option); i++) {
>> +                     if (pg->mux_option[i] == func)
>> +                             break;
>> +             }
>> +             if (i == ARRAY_SIZE(pg->mux_option)) {
>> +                     dev_err(pctl->dev, "Cannot mux pin %u to function %u\n",
>> +                             group, func);
>> +                     return -EINVAL;
>> +             }
>> +
>> +             val = pctl_readl(pctl, pg->mux_reg);
>> +             val &= ~(pg->mux_mask << pg->mux_shift);
>> +             val |= i << pg->mux_shift;
>> +             pctl_writel(pctl, val, pg->mux_reg);
>> +
>> +             if (pf->scenarios) {
>> +                     for (i = 0; i < pf->nscenarios; i++) {
>> +                             if (pf->scenarios[i] == group)
>> +                                     break;
>> +                     }
>> +                     if (WARN_ON(i == pf->nscenarios))
>> +                             return -EINVAL;
>> +
>> +                     val = pctl_readl(pctl, pf->scenario_reg);
>> +                     val &= ~(pf->scenario_mask << pf->scenario_shift);
>> +                     val |= i << pf->scenario_shift;
>> +                     pctl_writel(pctl, val, pf->scenario_reg);
>> +             }
>> +     }
>> +
>> +     range = pinctrl_find_gpio_range_from_pin(pctl->pctldev, group);
>> +     if (range)
>> +             gpio_disable(gc_to_bank(range->gc), group - range->pin_base);
>> +
>
> If you plan to submit a v4, how about using "pg->pins" here instead of "group"?
>
> Using "group" relies on having the same numberspace for the group and the pin,
> and it'll break when introducing the RPU pinctrl.

Sure, will do.

-Andrew
