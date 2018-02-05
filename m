From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH] Revert "ARM: dts: sunxi: Add regulators for Sinovoip BPI-M2"
Date: Mon, 05 Feb 2018 17:05:12 +0800
Message-ID: <207CD143-6535-42C9-BEF3-9D2614336482@aosc.io>
References: <20180203112353.13497-1-icenowy@aosc.io> <20180205095558.2e713c24cdb7c3232943db52@bidouilliste.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180205095558.2e713c24cdb7c3232943db52-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



于 2018年2月5日 GMT+08:00 下午4:55:58, Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org> 写到:
>
> Hello,
>
>On Sat,  3 Feb 2018 19:23:53 +0800
>Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>
>> This reverts commit 7daa213700758b5b08fc0daab09bb139dd334165.
>> 
>> The original commit has several problems:
>> 
>> - vdd-cpus and aldo3 (AVCC of the SoC) are not set to always-on,
>which
>> leads to system hang when disabling unused regulators.
>
> Indeed I should have make those always-on.
>
>> - GMAC (which uses dldo1 and aldo2) and Wi-Fi (which uses aldo1) are
>not
>> considered, and will fail to work after adding this commit.
>
> While I understand the problem with vdd-cpus and aldo3 I don't see why
>when you don't declare regulator the code should do something with it.
>DT is supposed to describe the hardware and the code should not use
>hardware not described right ?
> The gmac node doesn't declare any regulators and the mmc2 uses
>reg_vcc3v0 (haven't checked on the schematics yet if it is correct).

It's because the regulator support isn't present before
this commit. However these parts really need special
regulators. I don't have M2 schematics at hand, so you'd
check it by yourself.

P.S. a proper device tree with AXP shouldn't use
reg_vcc3v0/3v3/1v8/etc. They're dummy
regulator nodes for
not implemented or not controllable regulators.

>
>> This indicates that this patch should be not tested at all.
>
> This have indeed not been tested with linux.
> I think that this commit should not be reverted, I'll send a proper
>patch tonight or tomorow night max.

Please test patches sent to Linux on Linux :-)

>
> P.S.: Also as I'm the original sender I think I should have been in CC
>no ?

get_maintainer.pl didn't mention you and I forgot... sorry.

>
> Cheers,
>
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts | 57
>------------------------
>>  1 file changed, 57 deletions(-)
>> 
>> diff --git a/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
>b/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
>> index 51e6f1d21c32..a565316eb340 100644
>> --- a/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
>> +++ b/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
>> @@ -86,10 +86,6 @@
>>  	};
>>  };
>>  
>> -&cpu0 {
>> -	cpu-supply = <&reg_dcdc3>;
>> -};
>> -
>>  &ehci0 {
>>  	status = "okay";
>>  };
>> @@ -155,17 +151,6 @@
>>  	status = "okay";
>>  };
>>  
>> -&p2wi {
>> -	status = "okay";
>> -
>> -	axp22x: pmic@68 {
>> -		compatible = "x-powers,axp221";
>> -		reg = <0x68>;
>> -		interrupt-parent = <&nmi_intc>;
>> -		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
>> -	};
>> -};
>> -
>>  &pio {
>>  	gmac_phy_reset_pin_bpi_m2: gmac_phy_reset_pin@0 {
>>  		pins = "PA21";
>> @@ -191,48 +176,6 @@
>>  	};
>>  };
>>  
>> -#include "axp22x.dtsi"
>> -
>> -&reg_dc5ldo {
>> -	regulator-min-microvolt = <700000>;
>> -	regulator-max-microvolt = <1320000>;
>> -	regulator-name = "vdd-cpus";
>> -};
>> -
>> -&reg_dcdc1 {
>> -	regulator-always-on;
>> -	regulator-min-microvolt = <3000000>;
>> -	regulator-max-microvolt = <3000000>;
>> -	regulator-name = "vdd-3v0";
>> -};
>> -
>> -&reg_dcdc2 {
>> -	regulator-min-microvolt = <700000>;
>> -	regulator-max-microvolt = <1320000>;
>> -	regulator-name = "vdd-gpu";
>> -};
>> -
>> -&reg_dcdc3 {
>> -	regulator-always-on;
>> -	regulator-min-microvolt = <700000>;
>> -	regulator-max-microvolt = <1320000>;
>> -	regulator-name = "vdd-cpu";
>> -};
>> -
>> -&reg_dcdc4 {
>> -	regulator-always-on;
>> -	regulator-min-microvolt = <700000>;
>> -	regulator-max-microvolt = <1320000>;
>> -	regulator-name = "vdd-sys-dll";
>> -};
>> -
>> -&reg_dcdc5 {
>> -	regulator-always-on;
>> -	regulator-min-microvolt = <1500000>;
>> -	regulator-max-microvolt = <1500000>;
>> -	regulator-name = "vcc-dram";
>> -};
>> -
>>  &uart0 {
>>  	pinctrl-names = "default";
>>  	pinctrl-0 = <&uart0_pins_a>;
>> -- 
>> 2.15.1
>> 
>> 
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
