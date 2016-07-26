From: Caesar Wang <wxt@rock-chips.com>
Subject: Re: [PATCH 1/4] iio: adc: rockchip_saradc: reset saradc controller
 before programming it
Date: Tue, 26 Jul 2016 18:49:56 +0800
Message-ID: <57974054.8040700@rock-chips.com>
References: <1469513510-1516-1-git-send-email-wxt@rock-chips.com> <20160726100007.5166e7f9.john@metanate.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160726100007.5166e7f9.john@metanate.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Keeping <john@metanate.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Caesar Wang <wxt@rock-chips.com>, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, dianders@chromium.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, linux@roeck-us.net, jic23@kernel.org
List-Id: devicetree@vger.kernel.org


On 2016=E5=B9=B407=E6=9C=8826=E6=97=A5 17:00, John Keeping wrote:
> On Tue, 26 Jul 2016 14:11:47 +0800, Caesar Wang wrote:
>
>> SARADC controller needs to be reset before programming it, otherwise
>> it will not function properly.
>>
>> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
>> Cc: Jonathan Cameron <jic23@kernel.org>
>> Cc: Heiko Stuebner <heiko@sntech.de>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: linux-iio@vger.kernel.org
>> Cc: linux-rockchip@lists.infradead.org
>> ---
>>
>> diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/roc=
kchip_saradc.c
>> index f9ad6c2..2f0e110 100644
>> --- a/drivers/iio/adc/rockchip_saradc.c
>> +++ b/drivers/iio/adc/rockchip_saradc.c
>> @@ -218,6 +231,13 @@ static int rockchip_saradc_probe(struct platfor=
m_device *pdev)
>>   	if (IS_ERR(info->regs))
>>   		return PTR_ERR(info->regs);
>>  =20
>> +	info->reset =3D devm_reset_control_get(&pdev->dev, "saradc-apb");
>> +	if (IS_ERR(info->reset)) {
>> +		ret =3D PTR_ERR(info->reset);
>> +		dev_err(&pdev->dev, "failed to get saradc reset: %d\n", ret);
>> +		return ret;
>> +	}
> Does this need to handle ENOENT so as to avoid failing with old devic=
e
> tree blobs?

I'm no sure why we have to support the old device tree,
We can apply this series patches if we need to support the reset proper=
ty.
---

Maybe, I can follow you suggestion to handle the ENOENT, as following:

+ /*
+ * The reset should be an optional property, as it should work
+ * with old devicetrees as well
+ */
+ info->reset =3D devm_reset_control_get(&pdev->dev, "saradc-apb");
+ if (IS_ERR(info->reset)) {
+ if (PTR_ERR(info->reset) =3D=3D -EPROBE_DEFER) {
+ ret =3D -EPROBE_DEFER;
+ return ret;
+ }
+ dev_dbg(&pdev->dev, "no reset control found\n");
+ info->reset =3D NULL;
+ }
=2E..

+ if (info->reset)
+ rockchip_saradc_reset_controller(info->reset);
+

How about it?


-
Caesar
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


--=20
caesar wang | software engineer | wxt@rock-chip.com
