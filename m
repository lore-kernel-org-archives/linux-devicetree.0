From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 5/7] ARM: dts: sun8i: a83t: cubietruck-plus:
 Add AXP818 regulator nodes
Date: Tue, 3 Oct 2017 10:14:30 +0800
Message-ID: <CAGb2v64dYZePt20h+Q4iB0Xcp1qc=VCpMzJfzkxjPQMqfxnfJg@mail.gmail.com>
References: <20170929032514.31727-1-wens@csie.org> <20170929032514.31727-6-wens@csie.org>
 <20171002162405.jndvig3fxuj6d3ce@flea>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBIPFZPHAKGQEKDVSDWA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171002162405.jndvig3fxuj6d3ce@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 3, 2017 at 12:24 AM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi,
>
> On Fri, Sep 29, 2017 at 03:25:12AM +0000, Chen-Yu Tsai wrote:
>> +#include "axp81x.dtsi"
>> +
>> +&reg_aldo1 {
>> +     regulator-always-on;
>> +     regulator-min-microvolt = <1800000>;
>> +     regulator-max-microvolt = <1800000>;
>> +     regulator-name = "vcc18-csi2-dsi-efuse-hdmi-d4dp";
>> +};
>
> I'm not really fond of these names. It's easy to miss some components
> (especially since we most of the time don't have the schematics), and
> if it's not complete, the obscure name isn't worth it either.

If we don't have schematics, then yeah it's impossible to name them
accurately. But we do have it for this board.

> What about vcc-1.8 for this one ?

It's only vcc-1.8 for some components, as the next one provides
vcc-1.8 for the SoC's PLLs. The pin for that is named "vcc18-pll"
in the datasheet.

>
>> +&reg_aldo2 {
>> +     regulator-always-on;
>> +     regulator-min-microvolt = <1800000>;
>> +     regulator-max-microvolt = <1800000>;
>> +     regulator-name = "vdd-drampll-vcc18-pll-adc-cpvdd-ldoin";
>> +};
>
> dram-pll?
>
>> +&reg_aldo3 {
>> +     regulator-always-on;
>> +     regulator-min-microvolt = <3000000>;
>> +     regulator-max-microvolt = <3000000>;
>> +     regulator-name = "vcc-pl-avcc";
>> +};
>
> avcc?
>
> etc..

The schematics don't provide rail names for the outputs. They
are all just have names matching the regulators. The ones that
do look pretty here are because they are only tied to one thing.

If the names are too long and confusing, I suggest we just use
the regulator names from the PMIC.

>
>>       status = "disabled";
>>  };
>>
>> +&reg_vcc3v3 {
>> +     status = "disabled";
>> +};
>> +
>>  &reg_vcc5v0 {
>>       status = "disabled";
>>  };
>
> Why not simply remove the DTSI then?

I'm still using the USB VBUS regulators. But I suppose I should weigh the
amount of used vs unused shared code.

ChenYu
