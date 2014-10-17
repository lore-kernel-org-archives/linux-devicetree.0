From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: socfpga: Add a 3.3V fixed regulator node
Date: Fri, 17 Oct 2014 08:37:22 -0500
Message-ID: <54411B92.1060705@opensource.altera.com>
References: <1413493413-8041-1-git-send-email-dinguyen@opensource.altera.com> <1413493413-8041-3-git-send-email-dinguyen@opensource.altera.com> <54407454.50903@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54407454.50903-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 10/16/14, 8:43 PM, Jaehoon Chung wrote:
> Hi, Dinh.
> 
> On 10/17/2014 06:03 AM, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
>> From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>
>> Without the 3.3V regulator node, the SDMMC driver will give these warnings:
>>
>> dw_mmc ff704000.dwmmc0: No vmmc regulator found
>> dw_mmc ff704000.dwmmc0: No vqmmc regulator found
>>
>> This patch adds the regulator node, and points the SD/MMC to the regulator.
>>
>> Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/socfpga_arria5.dtsi         | 11 ++++++++++-
>>  arch/arm/boot/dts/socfpga_arria5_socdk.dts    |  5 +++++
>>  arch/arm/boot/dts/socfpga_cyclone5.dtsi       |  9 +++++++++
>>  arch/arm/boot/dts/socfpga_cyclone5_socdk.dts  |  2 ++
>>  arch/arm/boot/dts/socfpga_cyclone5_sockit.dts |  5 +++++
>>  5 files changed, 31 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/socfpga_arria5.dtsi b/arch/arm/boot/dts/socfpga_arria5.dtsi
>> index 03e8268..8093781 100644
>> --- a/arch/arm/boot/dts/socfpga_arria5.dtsi
>> +++ b/arch/arm/boot/dts/socfpga_arria5.dtsi
>> @@ -29,7 +29,7 @@
>>  			};
>>  		};
>>  
>> -		dwmmc0@ff704000 {
>> +		mmc0: dwmmc0@ff704000 {
>>  			num-slots = <1>;
>>  			broken-cd;
>>  			bus-width = <4>;
>> @@ -41,4 +41,13 @@
>>  			cpu1-start-addr = <0xffd080c4>;
>>  		};
>>  	};
>> +
>> +	regulator_3_3v_hps: fixed_3_3v_hps_regulator@0 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "HPS 3.3V";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
> 
> Always-on is right?

yes, it's always on.

> 
>> +	};
>>  };
>> diff --git a/arch/arm/boot/dts/socfpga_arria5_socdk.dts b/arch/arm/boot/dts/socfpga_arria5_socdk.dts
>> index 27d551c..b7e4023 100644
>> --- a/arch/arm/boot/dts/socfpga_arria5_socdk.dts
>> +++ b/arch/arm/boot/dts/socfpga_arria5_socdk.dts
>> @@ -68,6 +68,11 @@
>>  	};
>>  };
>>  
>> +&mmc0 {
>> +	vmmc-supply = <&regulator_3_3v_hps>;
>> +	vqmmc-supply = <&regulator_3_3v_hps>;
>> +};
>> +
>>  &usb1 {
>>  	status = "okay";
>>  };
>> diff --git a/arch/arm/boot/dts/socfpga_cyclone5.dtsi b/arch/arm/boot/dts/socfpga_cyclone5.dtsi
>> index 28c05e7..743bc3b 100644
>> --- a/arch/arm/boot/dts/socfpga_cyclone5.dtsi
>> +++ b/arch/arm/boot/dts/socfpga_cyclone5.dtsi
>> @@ -48,4 +48,13 @@
>>  			cpu1-start-addr = <0xffd080c4>;
>>  		};
>>  	};
>> +
>> +	regulator_3_3v_hps: fixed_3_3v_hps_regulator@0 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "HPS 3.3V";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>>  };
>> diff --git a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
>> index 739c3b7..e1f56ba 100644
>> --- a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
>> +++ b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
>> @@ -70,6 +70,8 @@
>>  
>>  &mmc0 {
>>  	cd = <&gpio1 18 0>;
>> +	vmmc-supply = <&regulator_3_3v_hps>;
>> +	vqmmc-supply = <&regulator_3_3v_hps>;
> 
> Is vmmc and vqmmc  used the common supply?
> 

Yes..

Dinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
