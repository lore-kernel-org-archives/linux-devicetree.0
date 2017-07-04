From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: dts: rockchip: add regulator nodes for
 rk3229-evb
Date: Tue, 4 Jul 2017 17:37:19 +0800
Message-ID: <49a73ff1-ec3b-846a-9b6c-1e7edb85a275@rock-chips.com>
References: <1499155967-26090-1-git-send-email-frank.wang@rock-chips.com>
 <1499155967-26090-2-git-send-email-frank.wang@rock-chips.com>
 <8062361.VWy3dYvDhe@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8062361.VWy3dYvDhe@diego>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wmc-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 2017/7/4 16:34, Heiko Stübner wrote:
> Hi Frank,
>
> Am Dienstag, 4. Juli 2017, 16:12:42 CEST schrieb Frank Wang:
>> This patch adds vcc_io, vdd_arm and vdd_log regulator nodes
>> for rk3229-evb board.
>>
>> Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/rk3229-evb.dts | 54
>> ++++++++++++++++++++++++++++++++++++++++ 1 file changed, 54 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/rk3229-evb.dts
>> b/arch/arm/boot/dts/rk3229-evb.dts index 82e8a53..8b10c64 100644
>> --- a/arch/arm/boot/dts/rk3229-evb.dts
>> +++ b/arch/arm/boot/dts/rk3229-evb.dts
>> @@ -78,6 +78,52 @@
>>   		regulator-always-on;
>>   		regulator-boot-on;
>>   	};
>> +
>> +	vdd_arm: vdd-arm-regulator {
>> +		compatible = "pwm-regulator";
>> +		rockchip,pwm_id = <1>;
>> +		rockchip,pwm_voltage = <1100000>;
> This doesn't look like a part of the mainline pwm-regulator binding
> (both rockchip,* properties)
>
>> +		pwms = <&pwm1 0 25000 1>;
>> +		regulator-name = "vdd_arm";
>> +		regulator-min-microvolt = <950000>;
>> +		regulator-max-microvolt = <1400000>;
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +	};
> please also add supplies for regulators. Information on supplies
> should be easily extractable from the board schematics.
>
> This not only results in a nice tree in debugfs (regulator/regulator_summary)
> but also makes sure supplying regulators are not accidentially turned off.
> (pwm-supply for pwm-regulators, vin-supply for fixed regulators)
>
>
>> +
>> +	vdd_log: vdd-log-regulator {
>> +		compatible = "pwm-regulator";
>> +		rockchip,pwm_id = <2>;
>> +		rockchip,pwm_voltage = <1200000>;
>> +		pwms = <&pwm2 0 25000 1>;
>> +		regulator-name = "vdd_log";
>> +		regulator-min-microvolt = <1000000>;
>> +		regulator-max-microvolt = <1300000>;
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +	};
>> +
>> +	regulators {
>> +		compatible = "simple-bus";
> don't create a subnode/bus for regulators. Just add them
> regularly. Take a look at all the other boards (like rk3399-firefly,
> gru, veyron) for reference.
>
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		vccio_1v8_reg: regulator@0 {
> Same here, no regulator@0 please, just name this one
> 	vccio_1v8: vccio-1v8-regulator {
>
> (removed _reg from phandle and changed node name)
>
>> +			compatible = "regulator-fixed";
>> +			regulator-name = "vccio_1v8";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1800000>;
>> +			regulator-always-on;
>> +		};
>> +
>> +		vccio_3v3_reg: regulator@1 {
>> +			compatible = "regulator-fixed";
>> +			regulator-name = "vccio_3v3";
>> +			regulator-min-microvolt = <3300000>;
>> +			regulator-max-microvolt = <3300000>;
>> +			regulator-always-on;
>> +		};
>> +	};
>>   };

Thanks and noted your comments above. I will fix them (also include 
another comment about eMMC in PATCH 4/6 ) and resend these series soon.


BR.
Frank

>
> Thanks
> Heiko
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
