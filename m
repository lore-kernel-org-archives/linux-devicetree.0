From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: vf-colibri-eval-v3: Use enable-gpios for BL_ON
Date: Thu, 28 Jan 2016 14:28:56 -0800
Message-ID: <7d06b5e8724a165758f8f7f906504e31@agner.ch>
References: <1452322793-26020-1-git-send-email-bhuvanchandra.dv@toradex.com>
 <20160128083914.GQ9070@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160128083914.GQ9070@tiger>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bhuvanchandra DV <bhuvanchandra.dv-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-01-28 00:39, Shawn Guo wrote:
> On Sat, Jan 09, 2016 at 12:29:53PM +0530, Bhuvanchandra DV wrote:
>> Use pwm-backlight driver 'enable-gpios' property for backlight on/off
>> control.
>>
>> Signed-off-by: Bhuvanchandra DV <bhuvanchandra.dv-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/vf-colibri.dtsi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/vf-colibri.dtsi b/arch/arm/boot/dts/vf-colibri.dtsi
>> index e5949b9..1c0da05 100644
>> --- a/arch/arm/boot/dts/vf-colibri.dtsi
>> +++ b/arch/arm/boot/dts/vf-colibri.dtsi
>> @@ -10,7 +10,10 @@
>>  / {
>>  	bl: backlight {
>>  		compatible = "pwm-backlight";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pinctrl_gpio_bl_on>;
>>  		pwms = <&pwm0 0 5000000 0>;
>> +		enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
>>  		status = "disabled";
>>  	};
>>  };
>> @@ -169,6 +172,12 @@
>>  			>;
>>  		};
>>
>> +		pinctrl_gpio_bl_on: gpio_bl_on {
>> +			fsl,pins = <
>> +				VF610_PAD_PTC0__GPIO_45		0x22ef
>> +			>;
>> +		};
>> +
> 
> @Stefan,
> 
> Do we need this?  My understanding is that on Vybrid, when gpio is
> requested, the pinctrl will set it up automatically.

Yes this is required. The GPIO driver asks the pinctrl driver to enable
the GPIO, and the pinctrl driver requires a "valid" pinmux configuration
to be able to find the IOMUXC register at all.

Acked-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
