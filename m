From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [RFC 2/3] pinctrl: e3xx: Adding support for NI Ettus Research
 USRP E3xx pinconf
Date: Mon, 9 Nov 2015 19:55:01 -0800
Message-ID: <CAAtXAHf7PMbrMcnD2i76r_1aiB17xZzi2T1xBG_SD=La3zdr9g@mail.gmail.com>
References: <1446766883-25703-1-git-send-email-moritz.fischer@ettus.com>
	<1446766883-25703-3-git-send-email-moritz.fischer@ettus.com>
	<CACRpkdaX8JyxMq_peUyXMfMq4xDzKiCWv62UbfKFxM_TyM-_wg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaX8JyxMq_peUyXMfMq4xDzKiCWv62UbfKFxM_TyM-_wg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Linus,

Thanks for your review!

On Mon, Nov 9, 2015 at 2:21 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Nov 6, 2015 at 12:41 AM, Moritz Fischer
> <moritz.fischer@ettus.com> wrote:
>
>> The USRP E3XX series requires pinctrl to configure the idle state
>> FPGA image for minimizing power consumption.
>> This is required since different daughtercards have different uses
>> for pins on a common connector.
>>
>> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> (...)
>
>> +static const struct pinctrl_pin_desc e3xx_pins[] = {
>> +       /* pin0 doesn't exist */
>> +       PINCTRL_PIN(1, "DB_1"),
>> +       PINCTRL_PIN(2, "DB_2"),
> (...)
>> +       PINCTRL_PIN(119, "DB_119"),
>> +       PINCTRL_PIN(120, "DB_120"),
>> +};
>
> These should be the names on the data sheet for the balls/pins on the ASIC.
> Is this the case? I saw some discussion with Arnd that indicated it was
> rather rail names for a certain board and that is not OK.

Well so the chip is an FPGA, so in theory you can connect any logic
inside to (almost)
any ball on the outside (at design time). In our case we have a
daughter-board slot that gives
different meanings to what I call DB_1-DB_120. The pinctrl chip is a
soft-core in that FPGA.
Are you suggesting to use the balls of the FPGA as pin names instead?

>> +static int e3xx_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
>> +{
>> +       return 0;
>> +}
>> +
>> +static const char *e3xx_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
>> +                                              unsigned selector)
>> +{
>> +       return NULL;
>> +}
>> +
>> +static int e3xx_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
>> +                                      unsigned selector,
>> +                                      const unsigned **pins,
>> +                                      unsigned *num_pins)
>> +{
>> +       return -ENOTSUPP;
>> +}
>
> Hm maybe we should make these group callbacks optional
> in the pinctrl core?

I'll submit a patchset separately, seems like a good idea.
>
>> +static int e3xx_pinconf_cfg_set(struct pinctrl_dev *pctldev,
>> +                               unsigned pin,daughterboard
>> +                               unsigned long *configs,
>> +                               unsigned num_configs)
>> +{
>> +       u32 reg, mask;
>> +       int i;
>> +       struct e3xx_pinctrl *pctrl;
>> +       unsigned int param, arg;
>> +
>> +       if (pin >= E3XX_NUM_DB_PINS)
>> +               return -ENOTSUPP;
>> +       mask = BIT(pin % E3XX_PINS_PER_REG);
>> +
>> +       pctrl = pinctrl_dev_get_drvdata(pctldev);
>> +
>> +       clk_enable(pctrl->clk);
>
> Have you considered using pm_runtime_get_sync() etc with
> callbacks instead of hammering clk_enable/disable all the
> time? See
> drivers/hwtracing/coresight/coresight-replicator.c
> for an example of how to do it in the runtime PM ops
> callbacks. It requires some tweaks (look closely at all setup
> there) but it pays off.

Thanks for the pointer, I'll take a look.

>> +static int e3xx_pinconf_group_set(struct pinctrl_dev *pctldev,
>> +                                 unsigned selector,
>> +                                 unsigned long *configs,
>> +                                 unsigned num_configs)
>> +{
>> +       return -EAGAIN;
>> +}
>
> Maybe you should group this with the other group callbacks.

Will do.
>
> Apart from these remarks it looks pretty nice.

While testing I found some more (minor) issues, that I'll need to iron out
before I submit a real patch. In my cover letter I had a question about
how to deal with a situation where I'm exclusively either input or output,
Any suggestions on the correct semantics for expressing that?
The documentation seems to indicate that 'input-enable' *must not* influence
the output of a pin. How do I reconfigure a output to no longer be an output?

Cheers,

Moritz
