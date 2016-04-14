From: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
Subject: Re: [PATCH RESEND 1/2] pinctrl: ns2: add pinmux driver support for
 Broadcom NS2 SoC
Date: Thu, 14 Apr 2016 13:23:33 +0530
Message-ID: <CAL2FKYmAoaK=E8wrKc+sHPfM3cZ5O8GnZB2yfMx-GvUH3g1pKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Pramod Kumar <pramodku@broadcom.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Wed, Apr 13, 2016 at 6:49 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Mar 29, 2016 at 5:22 PM, Yendapally Reddy Dhananjaya Reddy
> <yendapally.reddy@broadcom.com> wrote:
>
>> This adds the initial support of the Broadcom NS2 pinmux driver
>>
>> Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
>> Reviewed-by: Ray Jui <ray.jui@broadcom.com>
>
> Sorry for slow replies. :(
>
> This mostly looks good. Some small things needs fixing:
>
>> +config PINCTRL_NS2_MUX
>> +       bool "Broadcom Northstar2 pinmux driver"
>
> This is a bool driver, yet it uses MODULE* macros at the end of the file.
> Check the recent commits from Paul Gortmaker cleaning this up.
> Just a git log -p --author=Gortmaker in the main kernel tree will quickly
> give you an idea of what you have to do.
>

Sure. I will address this in the v2 patch set.

>
>> +static const unsigned int gpio_0_1_pins[] = {24, 25};
>> +static const unsigned int pwm_0_pins[] = {24};
>> +static const unsigned int pwm_1_pins[] = {25};
>
> So either the same pins are used for GPIO or PWM.
> And this pattern persists.
>
> Do you have a brewing GPIO driver for this block as well?
> Is it a separate front-end calling to pinctrl using the
> pinctrl_gpio_* calls or do you plan to patch it into this
> driver?
>
> This is more of a question.
>

This SoC supports group based configuration and there is a top level register
to select groups. Once the gpio_0_1_pins group is selected, there is one more
register to select between gpio_0_1 and pwm (only four pins). The pins
24 and 25 are shared between nor pins and gpio at the top group level. Once
gpio group is selected, then we can select to be either gpio or pwm. I missed
these two pins to be added to nor_data_pins and will add in the next version.

static const unsigned nor_data_pins[] =  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
        10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25};

NS2_PIN_GROUP(nand, 0, 0, 31, 1, 0),
NS2_PIN_GROUP(nor_data, 0, 0, 31, 1, 1),
NS2_PIN_GROUP(gpio_0_1, 0, 0, 31, 1, 0),

To select PWM, we need to select gpio and pwm as well.

gpio: gpio {
function = "gpio";
groups = "gpio_0_1_grp";

pwm: pwm {
function = "pwm";
groups = "pwm0_grp", "pwm1_grp";
};

Already available gpio driver "pinctrl-iproc-gpio.c" will be the gpio driver
for this soc as well without pin request.

> Apart from this it looks good.
>
> Yours,
> Linus Walleij

Thanks & Regards
Dhananjay
