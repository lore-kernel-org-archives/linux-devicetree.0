From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v4 1/3] pinctrl: Add sleep related configuration
Date: Thu, 13 Jul 2017 14:35:23 +0800
Message-ID: <CAMz4kuLFyw4gGbvXFmPozM2J85kkEXf-UGm0FhwxZWSvvBWKWA@mail.gmail.com>
References: <62a67526907157d41235403bd05af309fd4db16b.1498045588.git.baolin.wang@spreadtrum.com>
 <20170626161348.vrtlpat5eof5aa2c@rob-hp-laptop> <20170627082132.GB32447@spreadtrum.com>
 <20170627120626.GA1067@spreadtrum.com> <CACRpkdapE2+7jR3J0Qw5Hnvg-19-sR5uCYnvMoHiAbowm8-Uug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdapE2+7jR3J0Qw5Hnvg-19-sR5uCYnvMoHiAbowm8-Uug@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 12 July 2017 at 20:30, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Jun 27, 2017 at 2:06 PM, Baolin Wang <baolin.wang@spreadtrum.com> wrote:
>
>> If we introduce "sleep-input-enable" config, we can set the pin's config
>> as below:
>>
>> vio_sd0_ms_3: regctrl3 {
>>         pins = "SC9860_RFCTL30", "SC9860_RFCTL31", "SC9860_RFCTL32";
>>         function = "func1";
>>         sprd,sleep-mode = <0x3>;
>>         sleep-input-enable;
>> };
>
> This looks like a "default" mode. Is that correct?

This can be not default. In some situation, user can change the pins
function and other config.

> I.e. do you set up this on probe then do not touch it?
>
> It seems some of the problems come from the insistance to use a single
> node for all configuration. Compare to this nomadik:
>
>                i2c0 {
>                         i2c0_default_mux: i2c0_mux {
>                                 i2c0_default_mux {
>                                         function = "i2c0";
>                                         groups = "i2c0_a_1";
>                                 };
>                         };
>                         i2c0_default_mode: i2c0_default {
>                                 i2c0_default_cfg {
>                                         pins = "GPIO62_D3", "GPIO63_D2";
>                                         input-enable;
>                                 };
>                         };
>                 };
>
> It is easy to imagine:
>
>                i2c0 {
>                         i2c0_default_mux: i2c0_mux {
>                                 i2c0_default_mux {
>                                         function = "i2c0";
>                                         groups = "i2c0_a_1";
>                                 };
>                         };
>                         i2c0_default_mode: i2c0_default {
>                                 i2c0_default_cfg {
>                                         pins = "GPIO62_D3", "GPIO63_D2";
>                                         input-enable;
>                                 };
>                         };
>                         i2c0_default_mode_sleep: i2c0_default_sleep {
>                                 i2c0_default_cfg {
>                                         pins = "GPIO62_D3", "GPIO63_D2";
>                                         sleep-hardware-state;
>                                         input-disable;
>                                 };
>                         };
>                 };
>
> Notice the new bool property "sleep-hardware-state" that just
> indicate that this should be programmed into the registers for
> the sleep state.

That means we should introduce one "sleep-hardware-state" config.

So my instance can change to be :
grp1: regctrl3 {
        pins = "SC9860_RFCTL30", "SC9860_RFCTL31", "SC9860_RFCTL32";
        function = "func1";
        sprd,sleep-mode = <0x3>;

        grp1_sleep_mode: regctrl3_default_sleep {
                 pins = "SC9860_RFCTL30", "SC9860_RFCTL31", "SC9860_RFCTL32";
                 sleep-hardware-state;
                 input-enable;
       }
};

That sounds reasonable and I will try to check if it can work.

>
>> But If we create one extra "sleep-xxx" state for sleep-related configs,
>> it will be like:
>>
>> grp1: regctrl3 {
>>         pins = "SC9860_RFCTL30", "SC9860_RFCTL31";
>>         function = "func1";
>>         sprd,sleep-mode = <0x3>;
>> };
>>
>> sleep-input: input_grp {
>>         pins = "SC9860_RFCTL30", "SC9860_RFCTL31", "SC9860_RFCTL32";
>>         input-enable;
>> };
>>
>> pinctrl-names = "sleep-input";
>> pinctrl-0 = <&sleep-input>;
>>
>> "sleep-input" state will be selected when initializing pinctrl driver,
>
> The state you should use for initial configuration should be called
> just "init".

Yes.

>
>> "grp1"
>> will be selected by user to set other pin configuration.
>
> Like "default"?
>
>> Then we need config "SC9860_RFCTL30" pin in 2 different places, which is
>> more inconvenient for users.
>
> I'm not so sure about that. Having a lot more sleep,* config options
> may be even more inconvenient for users, and especially for the
> community of developers as a whole.

Make sense. Thanks for your suggestion.

>
> Several config nodes on the other hand, we have had in the pin
> control subsystem since day 1.
>
> Yours,
> Linus Walleij



-- 
Baolin.wang
Best Regards
