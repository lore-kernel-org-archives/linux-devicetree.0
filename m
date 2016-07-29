From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v3 1/4] iio: adc: rockchip_saradc: reset saradc controller
 before programming it
Date: Sat, 30 Jul 2016 07:21:45 +0800
Message-ID: <579BE509.8010104@rock-chips.com>
References: <1469629447-544-1-git-send-email-wxt@rock-chips.com> <alpine.DEB.2.02.1607271642110.22647@pmeerw.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1607271642110.22647-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 2016=E5=B9=B407=E6=9C=8827=E6=97=A5 22:47, Peter Meerwald-Stadler wr=
ote:
>> SARADC controller needs to be reset before programming it, otherwise
>> it will not function properly.
> nitpicking on wording below
>  =20
>> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Tested-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>>
>> ---
>>
>> Changes in v3:
>> - %s/devm_reset_control_get_optional()/devm_reset_control_get()
>> - add Guente's test tag.
>>
>> Changes in v2:
>> - Make the reset as an optional property, since it should work
>> with old devicetrees as well.
>>
>>   .../bindings/iio/adc/rockchip-saradc.txt           |  7 +++++
>>   drivers/iio/adc/Kconfig                            |  1 +
>>   drivers/iio/adc/rockchip_saradc.c                  | 30 ++++++++++=
++++++++++++
>>   3 files changed, 38 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-sara=
dc.txt b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt
>> index bf99e2f..205593f 100644
>> --- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt
>> +++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt
>> @@ -16,6 +16,11 @@ Required properties:
>>   - vref-supply: The regulator supply ADC reference voltage.
>>   - #io-channel-cells: Should be 1, see ../iio-bindings.txt
>>  =20
>> +Optional properties:
>> +- resets: Must contain an entry for each entry in reset-names if ne=
ed support
>> +	  this option. See ../reset/reset.txt for details.
> '... if need support this option.' doesn't sound right, maybe
> simply: '... if needed.' or drop this clause.

I don't plan to resend this series patches.
I'm assuming that Jonathan will help me fix it when ready to apply it.:=
-)

Glad to resend this series patches if Jonathan boss ask me to do.

Thanks,

Caesar

>
>> +- reset-names: Must include the name "saradc-apb".
>> +
>>   Example:
>>   	saradc: saradc@2006c000 {
>>   		compatible =3D "rockchip,saradc";
>> @@ -23,6 +28,8 @@ Example:
>>   		interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
>>   		clocks =3D <&cru SCLK_SARADC>, <&cru PCLK_SARADC>;
>>   		clock-names =3D "saradc", "apb_pclk";
>> +		resets =3D <&cru SRST_SARADC>;
>> +		reset-names =3D "saradc-apb";
>>   		#io-channel-cells =3D <1>;
>>   		vref-supply =3D <&vcc18>;
>>   	};
>> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
>> index 1de31bd..7675772 100644
>> --- a/drivers/iio/adc/Kconfig
>> +++ b/drivers/iio/adc/Kconfig
>> @@ -389,6 +389,7 @@ config QCOM_SPMI_VADC
>>   config ROCKCHIP_SARADC
>>   	tristate "Rockchip SARADC driver"
>>   	depends on ARCH_ROCKCHIP || (ARM && COMPILE_TEST)
>> +	depends on RESET_CONTROLLER
>>   	help
>>   	  Say yes here to build support for the SARADC found in SoCs from
>>   	  Rockchip.
>> diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/roc=
kchip_saradc.c
>> index f9ad6c2..85d7012 100644
>> --- a/drivers/iio/adc/rockchip_saradc.c
>> +++ b/drivers/iio/adc/rockchip_saradc.c
>> @@ -21,6 +21,8 @@
>>   #include <linux/of_device.h>
>>   #include <linux/clk.h>
>>   #include <linux/completion.h>
>> +#include <linux/delay.h>
>> +#include <linux/reset.h>
>>   #include <linux/regulator/consumer.h>
>>   #include <linux/iio/iio.h>
>>  =20
>> @@ -53,6 +55,7 @@ struct rockchip_saradc {
>>   	struct clk		*clk;
>>   	struct completion	completion;
>>   	struct regulator	*vref;
>> +	struct reset_control	*reset;
>>   	const struct rockchip_saradc_data *data;
>>   	u16			last_val;
>>   };
>> @@ -190,6 +193,16 @@ static const struct of_device_id rockchip_sarad=
c_match[] =3D {
>>   };
>>   MODULE_DEVICE_TABLE(of, rockchip_saradc_match);
>>  =20
>> +/**
>> + * Reset SARADC Controller.
>> + */
>> +static void rockchip_saradc_reset_controller(struct reset_control *=
reset)
>> +{
>> +	reset_control_assert(reset);
>> +	usleep_range(10, 20);
>> +	reset_control_deassert(reset);
>> +}
>> +
>>   static int rockchip_saradc_probe(struct platform_device *pdev)
>>   {
>>   	struct rockchip_saradc *info =3D NULL;
>> @@ -218,6 +231,20 @@ static int rockchip_saradc_probe(struct platfor=
m_device *pdev)
>>   	if (IS_ERR(info->regs))
>>   		return PTR_ERR(info->regs);
>>  =20
>> +	/*
>> +	 * The reset should be an optional property, as it should work
>> +	 * with old devicetrees as well
>> +	 */
>> +	info->reset =3D devm_reset_control_get(&pdev->dev, "saradc-apb");
>> +	if (IS_ERR(info->reset)) {
>> +		ret =3D PTR_ERR(info->reset);
>> +		if (ret !=3D -ENOENT)
>> +			return ret;
>> +
>> +		dev_dbg(&pdev->dev, "no reset control found\n");
>> +		info->reset =3D NULL;
>> +	}
>> +
>>   	init_completion(&info->completion);
>>  =20
>>   	irq =3D platform_get_irq(pdev, 0);
>> @@ -252,6 +279,9 @@ static int rockchip_saradc_probe(struct platform=
_device *pdev)
>>   		return PTR_ERR(info->vref);
>>   	}
>>  =20
>> +	if (info->reset)
>> +		rockchip_saradc_reset_controller(info->reset);
>> +
>>   	/*
>>   	 * Use a default value for the converter clock.
>>   	 * This may become user-configurable in the future.
>>


--=20
caesar wang | software engineer | wxt-TNX95d0MmH73oGB3hsPCZA@public.gmane.org
