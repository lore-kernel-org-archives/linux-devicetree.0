From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: ux500: Move GPIO regulator for SD-card into
 board DTSs
Date: Tue, 21 Apr 2015 09:15:14 +0200
Message-ID: <CAPDyKFrDOGBkfg48mmsbktCWFTaNV4WnTm_Fui=Kp30u1yH-tQ@mail.gmail.com>
References: <1429538553-17366-1-git-send-email-ulf.hansson@linaro.org>
	<1429538553-17366-2-git-send-email-ulf.hansson@linaro.org>
	<20150420182634.GH3447@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150420182634.GH3447@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 20 April 2015 at 20:26, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, 20 Apr 2015, Ulf Hansson wrote:
>
>> The GPIO regulator for the SD-card isn't a ux500 SOC configuration, but
>> instead it's specific to the board. Move the definition of it, into the
>> board DTSs.
>
> What makes you think that?

Because of how it was structured today.

ste-dbx5x0.dtsi - common for all ux500 boards, thus I considered this
as the SoC configuration.

Then below are board configs which uses the above dtsi:
ste-href.dtsi - common for href boards (used by ste-hrefprev60.dtsi
and ste-hrefv60plus.dtsi), have vmmci
ste-snowball.dts, have vmmci
ste-ccu8540.dts, don't have vmmci
ste-ccu9540.dts, don't have vmmci

>
> We normally place the common pieces (of which there are many in this
> node) in the highest level DTSI file, then add the platform specific
> ones in the DTS files.

Okay, so maybe it's due to the naming of ste-dbx5x0.dtsi, that I
thought this was intended to cover the SoC configuration and not any
of the platform specific stuff.

So what your advise of doing this?

Kind regards
Uffe

>
>> Fixes: c94a4ab7af3f ("ARM: ux500: Disable the MMCI gpio-regulator by default")
>> Signed-off-by: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/ste-dbx5x0.dtsi  | 17 -----------------
>>  arch/arm/boot/dts/ste-href.dtsi    | 17 +++++++++++++++++
>>  arch/arm/boot/dts/ste-snowball.dts | 15 +++++++++++++++
>>  3 files changed, 32 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/ste-dbx5x0.dtsi b/arch/arm/boot/dts/ste-dbx5x0.dtsi
>> index bfd3f1c..2201cd5 100644
>> --- a/arch/arm/boot/dts/ste-dbx5x0.dtsi
>> +++ b/arch/arm/boot/dts/ste-dbx5x0.dtsi
>> @@ -1017,23 +1017,6 @@
>>                       status = "disabled";
>>               };
>>
>> -             vmmci: regulator-gpio {
>> -                     compatible = "regulator-gpio";
>> -
>> -                     regulator-min-microvolt = <1800000>;
>> -                     regulator-max-microvolt = <2900000>;
>> -                     regulator-name = "mmci-reg";
>> -                     regulator-type = "voltage";
>> -
>> -                     startup-delay-us = <100>;
>> -                     enable-active-high;
>> -
>> -                     states = <1800000 0x1
>> -                               2900000 0x0>;
>> -
>> -                     status = "disabled";
>> -             };
>> -
>>               mcde@a0350000 {
>>                       compatible = "stericsson,mcde";
>>                       reg = <0xa0350000 0x1000>, /* MCDE */
>> diff --git a/arch/arm/boot/dts/ste-href.dtsi b/arch/arm/boot/dts/ste-href.dtsi
>> index bf8f0ed..8cf499a 100644
>> --- a/arch/arm/boot/dts/ste-href.dtsi
>> +++ b/arch/arm/boot/dts/ste-href.dtsi
>> @@ -111,6 +111,23 @@
>>                       pinctrl-1 = <&i2c3_sleep_mode>;
>>               };
>>
>> +             vmmci: regulator-gpio {
>> +                     compatible = "regulator-gpio";
>> +
>> +                     regulator-min-microvolt = <1800000>;
>> +                     regulator-max-microvolt = <2900000>;
>> +                     regulator-name = "mmci-reg";
>> +                     regulator-type = "voltage";
>> +
>> +                     startup-delay-us = <100>;
>> +                     enable-active-high;
>> +
>> +                     states = <1800000 0x1
>> +                               2900000 0x0>;
>> +
>> +                     status = "disabled";
>> +             };
>> +
>>               // External Micro SD slot
>>               sdi0_per1@80126000 {
>>                       arm,primecell-periphid = <0x10480180>;
>> diff --git a/arch/arm/boot/dts/ste-snowball.dts b/arch/arm/boot/dts/ste-snowball.dts
>> index 206826a..65a7f63 100644
>> --- a/arch/arm/boot/dts/ste-snowball.dts
>> +++ b/arch/arm/boot/dts/ste-snowball.dts
>> @@ -146,8 +146,23 @@
>>               };
>>
>>               vmmci: regulator-gpio {
>> +                     compatible = "regulator-gpio";
>> +
>>                       gpios = <&gpio7 4 0x4>;
>>                       enable-gpio = <&gpio6 25 0x4>;
>> +
>> +                     regulator-min-microvolt = <1800000>;
>> +                     regulator-max-microvolt = <2900000>;
>> +                     regulator-name = "mmci-reg";
>> +                     regulator-type = "voltage";
>> +
>> +                     startup-delay-us = <100>;
>> +                     enable-active-high;
>> +
>> +                     states = <1800000 0x1
>> +                               2900000 0x0>;
>> +
>> +                     status = "disabled";
>>               };
>>
>>               // External Micro SD slot
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
