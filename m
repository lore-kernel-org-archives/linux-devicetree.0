From: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: move regulator settings from common to
 specifics
Date: Thu, 7 Jul 2016 02:06:23 +0800
Message-ID: <d2f0c905-d81f-efbe-7c44-b2ba240bd04c@soulik.info>
References: <1467818724-21500-1-git-send-email-ayaka@soulik.info>
 <1467818724-21500-3-git-send-email-ayaka@soulik.info>
 <3015470.z4L7UQJKa9@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3015470.z4L7UQJKa9@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org



at July, 7th,  Heiko Stuebner Wrote:
> Hi,
>
> Am Mittwoch, 6. Juli 2016, 23:25:23 schrieb ayaka:
>> The regulator settings are the same in the firefly beta and
>> firefly. But the firefly reload is different. I remove
>> the difference part from the common header dtsi, but remained those
>> common one to keep references.
>>
>> Signed-off-by: ayaka <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
> applies to all 3 patches: we require real names both in the patch/mail from
> as well as the Signed-off-by line, see [0] at number 11. To my untrained eye
> the name given doesn't look like a real name, please correct me if I'm
> wrong.
>
>
> [0] https://www.kernel.org/doc/Documentation/SubmittingPatches
>
>
>> ---
>>   arch/arm/boot/dts/rk3288-firefly-beta.dts | 30
>> ++++++++++++++++++++++++++++++ arch/arm/boot/dts/rk3288-firefly.dts
>> | 30 ++++++++++++++++++++++++++++++ arch/arm/boot/dts/rk3288-firefly.dtsi
>>      | 14 +++++++-------
>>   3 files changed, 67 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/rk3288-firefly-beta.dts
>> b/arch/arm/boot/dts/rk3288-firefly-beta.dts index 75d77e3..6c08dae2
>> 100644
>> --- a/arch/arm/boot/dts/rk3288-firefly-beta.dts
>> +++ b/arch/arm/boot/dts/rk3288-firefly-beta.dts
>> @@ -69,3 +69,33 @@
>>   &pwm0 {
>>   	status = "okay";
>>   };
>> +
>> +&gmac {
>> +	phy-supply = <&vcc_lan>;
>> +};
> Not 100% sure, but I guess this does not need to be duplicated.
> The supply is named vcc_lan in all board revisions only the supplying
> regulator seems different, so it should be enough to point the vcc_lan
> phandle to the correct regulator in the relevant file, but the gmac
> assignment could stay in the main file?
>
But I can't have two label in two different place.
So I have no choice but to do so. If the dts compiler in kernel support
the overwrite now and unresolved symbols now, I would glad to know that.
>> +
>> +&io_domains {
>> +		audio-supply = <&vcca_33>;
>> +		flash1-supply = <&vcc_lan>;
>> +};
> same here
>
>> +
>> +&regulators {
>> +	vcca_18: REG7  {
>> +		regulator-name = "vcca_18";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +	};
>> +
>> +	vcca_33: REG8 {
>> +		regulator-name = "vcca_33";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	vcc_lan: REG9 {
>> +		regulator-name = "vcc_lan";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +	};
>> +};
>> diff --git a/arch/arm/boot/dts/rk3288-firefly.dts
>> b/arch/arm/boot/dts/rk3288-firefly.dts index c07fe92..1964b6f 100644
>> --- a/arch/arm/boot/dts/rk3288-firefly.dts
>> +++ b/arch/arm/boot/dts/rk3288-firefly.dts
>> @@ -69,3 +69,33 @@
>>   &pwm1 {
>>   	status = "okay";
>>   };
>> +
>> +&gmac {
>> +	phy-supply = <&vcc_lan>;
>> +};
>> +
>> +&io_domains {
>> +		audio-supply = <&vcca_33>;
>> +		flash1-supply = <&vcc_lan>;
>> +};
>> +
>> +&regulators {
>> +	vcca_18: REG7  {
>> +		regulator-name = "vcca_18";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +	};
>> +
>> +	vcca_33: REG8 {
>> +		regulator-name = "vcca_33";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	vcc_lan: REG9 {
>> +		regulator-name = "vcc_lan";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +	};
>> +};
>> diff --git a/arch/arm/boot/dts/rk3288-firefly.dtsi
>> b/arch/arm/boot/dts/rk3288-firefly.dtsi index 1d7f03c..205348f 100644
>> --- a/arch/arm/boot/dts/rk3288-firefly.dtsi
>> +++ b/arch/arm/boot/dts/rk3288-firefly.dtsi
>> @@ -68,11 +68,9 @@
>>   		compatible = "rockchip,rk3288-io-voltage-domain";
>>   		rockchip,grf = <&grf>;
>>
>> -		audio-supply = <&vcca_33>;
>>   		bb-supply = <&vcc_io>;
>>   		dvp-supply = <&dovdd_1v8>;
>>   		flash0-supply = <&vcc_flash>;
>> -		flash1-supply = <&vcc_lan>;
>>   		gpio30-supply = <&vcc_io>;
>>   		gpio1830-supply = <&vcc_io>;
>>   		lcdc-supply = <&vcc_io>;
>> @@ -225,7 +223,6 @@
>>   	clock_in_out = "input";
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&rgmii_pins>, <&phy_rst>, <&phy_pmeb>, <&phy_int>;
>> -	phy-supply = <&vcc_lan>;
>>   	phy-mode = "rgmii";
>>   	snps,reset-active-low;
>>   	snps,reset-delays-us = <0 10000 1000000>;
>> @@ -296,7 +293,7 @@
>>   		inl2-supply = <&vcc_sys>;
>>   		inl3-supply = <&vcc_20>;
>>
>> -		regulators {
>> +		regulators: regulators {
> the phandle name is to generic, as this is part of the act8846 and not
> something generic. So please name the phandle act8846_regulators /
> act8846_regs or so.
I forget that, I would re-send new patches. I am very sorry to re-send 
the same patches three times.
I should not be such hurry.
>
>>   			vcc_ddr: REG1 {
>>   				regulator-name = "vcc_ddr";
>>   				regulator-min-microvolt = <1200000>;
>> @@ -339,24 +336,27 @@
>>   				regulator-always-on;
>>   			};
>>
>> -			vcca_18: REG7 {
>> +			REG7  {
>>   				regulator-name = "vcca_18";
>>   				regulator-min-microvolt = <1800000>;
>>   				regulator-max-microvolt = <1800000>;
>>   			};
>>
>> -			vcca_33: REG8 {
>> +
> unecessary new empty line
It would be removed
>> +			REG8 {
>>   				regulator-name = "vcca_33";
>>   				regulator-min-microvolt = <3300000>;
>>   				regulator-max-microvolt = <3300000>;
>> +				regulator-always-on;
>>   			};
>>
>> -			vcc_lan: REG9 {
>> +			REG9 {
>>   				regulator-name = "vcc_lan";
>>   				regulator-min-microvolt = <3300000>;
>>   				regulator-max-microvolt = <3300000>;
>>   			};
>>
>> +
> unecessary new empty line
It would be removed
>
>>   			vdd_10: REG10 {
>>   				regulator-name = "vdd_10";
>>   				regulator-min-microvolt = <1000000>;
>> --
>> 2.7.4
>
> Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
