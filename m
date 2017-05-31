From: Eddie Cai <eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] ARM: dts: rockchip:add sd card support for firefly
 reload board
Date: Wed, 31 May 2017 10:28:29 +0800
Message-ID: <CAJrj+DM7YDC1CPWLne-O6u1iRJxxK_+CMq9pa=hvkzZuKqFEMw@mail.gmail.com>
References: <1495782439-27142-1-git-send-email-eddie.cai.linux@gmail.com> <951b3bad-eae7-f870-2bc1-8e230bfa4904@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <951b3bad-eae7-f870-2bc1-8e230bfa4904-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

2017-05-26 19:31 GMT+08:00 Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>:
> On 26/05/17 08:07, Eddie Cai wrote:
>> firefly reload board not support sd card yet. so support it.
>
> I'm confused... According to pictures and the schematic the microSD
> socket and vcc_sd supply are on the baseboard, not the core module, and
> these nodes already exist in rk3288-firefly-reload.dts :/
agree, please ignore this patch
>
> Robin.
>
>> Signed-off-by: Eddie Cai <eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Reviewed-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi | 31 +++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi b/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
>> index 413b61f..2f41209 100644
>> --- a/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
>> +++ b/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
>> @@ -57,6 +57,17 @@
>>               clock-output-names = "ext_gmac";
>>       };
>>
>> +     vcc_sd: sdmmc-regulator {
>> +             compatible = "regulator-fixed";
>> +             gpio = <&gpio7 RK_PB3 GPIO_ACTIVE_LOW>;
>> +             pinctrl-names = "default";
>> +             pinctrl-0 = <&sdmmc_pwr>;
>> +             regulator-name = "vcc_sd";
>> +             regulator-min-microvolt = <3300000>;
>> +             regulator-max-microvolt = <3300000>;
>> +             startup-delay-us = <100000>;
>> +             vin-supply = <&vcc_io>;
>> +     };
>>
>>       vcc_flash: flash-regulator {
>>               compatible = "regulator-fixed";
>> @@ -281,6 +292,26 @@
>>                       rockchip,pins = <4 8 RK_FUNC_GPIO &pcfg_output_high>;
>>               };
>>       };
>> +
>> +     sdmmc {
>> +             sdmmc_pwr: sdmmc-pwr {
>> +                     rockchip,pins = <7 11 RK_FUNC_GPIO &pcfg_pull_none>;
>> +             };
>> +     };
>> +};
>> +
>> +&sdmmc {
>> +     bus-width = <4>;
>> +     cap-mmc-highspeed;
>> +     cap-sd-highspeed;
>> +     card-detect-delay = <200>;
>> +     disable-wp;
>> +     num-slots = <1>;
>> +     pinctrl-names = "default";
>> +     pinctrl-0 = <&sdmmc_clk>, <&sdmmc_cmd>, <&sdmmc_cd>, <&sdmmc_bus4>;
>> +     vmmc-supply = <&vcc_sd>;
>> +     vqmmc-supply = <&vccio_sd>;
>> +     status = "okay";
>>  };
>>
>>  &tsadc {
>>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
