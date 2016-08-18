From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v9 4/4] arm64: dts: rockchip: configure usb2-phy support
 for rk3399-evb
Date: Thu, 18 Aug 2016 10:53:22 +0800
Message-ID: <4752a1d7-9db9-bfe9-1544-f90f33d4f560@rock-chips.com>
References: <1469170846-15617-1-git-send-email-frank.wang@rock-chips.com>
 <1469170846-15617-5-git-send-email-frank.wang@rock-chips.com>
 <2024472.51n7WpJreO@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2024472.51n7WpJreO@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016/8/17 18:02, Heiko Stübner wrote:
> Am Freitag, 22. Juli 2016, 15:00:46 schrieb Frank Wang:
>> Add vcc5v0_host regulator for usb2-phy and enable host-port support.
>>
>> Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> applied to ny dts64 branch [0] with some changes:
>
> - the pin is named vcc5v0_host_en not host_vbus_drv in the schematics
>    please always try to use the names from the schematics
> - separated the enablement of the subnodes
>

Thanks for your valuable comments, I will try to improve the quality of 
my patches in future.

BR.
Frank

> Heiko
>
> [0] https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/commit/?id=1d3bc1d6c9c4658d554bcf89a71b35a6783a5b4e
>
>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3399-evb.dts |   44
>> +++++++++++++++++++++++++++ 1 file changed, 44 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
>> b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts index 1a3eb14..56aeedb 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
>> @@ -69,6 +69,25 @@
>>   		regulator-max-microvolt = <3300000>;
>>   	};
>>
>> +	vcc5v0_sys: vcc5v0-sys {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vcc5v0_sys";
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +	};
>> +
>> +	vcc5v0_host: vcc5v0-host-regulator {
>> +		compatible = "regulator-fixed";
>> +		enable-active-high;
>> +		gpio = <&gpio4 25 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&host_vbus_drv>;
>> +		regulator-name = "vcc5v0_host";
>> +		vin-supply = <&vcc5v0_sys>;
>> +	};
>> +
>>   	vcc_phy: vcc-phy-regulator {
>>   		compatible = "regulator-fixed";
>>   		regulator-name = "vcc_phy";
>> @@ -89,6 +108,24 @@
>>   	status = "okay";
>>   };
>>
>> +&u2phy0 {
>> +	status = "okay";
>> +
>> +	u2phy0_host: host-port {
>> +		phy-supply = <&vcc5v0_host>;
>> +		status = "okay";
>> +	};
>> +};
>> +
>> +&u2phy1 {
>> +	status = "okay";
>> +
>> +	u2phy1_host: host-port {
>> +		phy-supply = <&vcc5v0_host>;
>> +		status = "okay";
>> +	};
>> +};
>> +
>>   &uart2 {
>>   	status = "okay";
>>   };
>> @@ -121,4 +158,11 @@
>>   				<1 18 RK_FUNC_GPIO &pcfg_pull_down>;
>>   		};
>>   	};
>> +
>> +	usb2 {
>> +		host_vbus_drv: host-vbus-drv {
>> +			rockchip,pins =
>> +				<4 25 RK_FUNC_GPIO &pcfg_pull_none>;
>> +		};
>> +	};
>>   };

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
