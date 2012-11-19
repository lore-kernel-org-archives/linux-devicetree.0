From: Qing Xu <qingx@marvell.com>
Subject: Re: [PATCH 4/7] mfd: max8925: support dt for power supply
Date: Mon, 19 Nov 2012 14:56:22 +0800
Message-ID: <50A9D816.7010208@marvell.com>
References: <1352187764-9901-1-git-send-email-qingx@marvell.com> <20121119002447.GH29066@lizard.sbx05977.paloaca.wayport.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121119002447.GH29066@lizard.sbx05977.paloaca.wayport.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Anton Vorontsov <anton.vorontsov@linaro.org>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "haojian.zhuang@gmail.com" <haojian.zhuang@gmail.com>, Chao Xie <cxie4@marvell.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On 11/19/2012 08:24 AM, Anton Vorontsov wrote:
> On Tue, Nov 06, 2012 at 03:42:44PM +0800, Qing Xu wrote:
>> From: Qing Xu <qingx@marvell.com>
>>
>> Signed-off-by: Qing Xu <qingx@marvell.com>
>> ---
> W/ this patch I'm getting this warning:
>
>    CC      drivers/power/max8925_power.o
>    drivers/power/max8925_power.c: In function =E2=80=98max8925_power_=
probe=E2=80=99:
>    drivers/power/max8925_power.c:479:3: warning: statement with no ef=
fect
>    [-Wunused-value]
>
>>   drivers/power/max8925_power.c |   57 +++++++++++++++++++++++++++++=
+++++++----
>>   1 files changed, 51 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/power/max8925_power.c b/drivers/power/max8925_p=
ower.c
>> index daa333b..dd2ac2d 100644
>> --- a/drivers/power/max8925_power.c
>> +++ b/drivers/power/max8925_power.c
>> @@ -426,14 +426,58 @@ static __devexit int max8925_deinit_charger(st=
ruct max8925_power_info *info)
>>   	return 0;
>>   }
>>  =20
>> +#ifdef CONFIG_OF
>> +static int max8925_power_dt_init(struct platform_device *pdev,
>> +			      struct max8925_power_pdata *pdata)
>> +{
>> +	struct device_node *nproot =3D pdev->dev.parent->of_node, *np;
>> +	int batt_detect, topoff_threshold, fast_charge,
>> +		no_temp_support, no_insert_detect;
> One variable declaration per line please.
>
>> +
>> +	if (!nproot)
>> +		return -ENODEV;
> Please add an empty line here.
>
>> +	np =3D of_find_node_by_name(nproot, "charger");
>> +	if (!np) {
>> +		dev_err(&pdev->dev, "failed to find charger node\n");
>> +		return -ENODEV;
>> +	}
> ditto.
>
>> +	of_property_read_u32(np, "topoff-threshold", &topoff_threshold);
>> +	of_property_read_u32(np, "batt-detect", &batt_detect);
>> +	of_property_read_u32(np, "fast-charge", &fast_charge);
>> +	of_property_read_u32(np, "no-insert-detect", &no_insert_detect);
>> +	of_property_read_u32(np, "no-temp-support", &no_temp_support);
>> +
>> +	pdata->batt_detect =3D batt_detect;
>> +	pdata->fast_charge =3D fast_charge;
>> +	pdata->topoff_threshold =3D topoff_threshold;
>> +	pdata->no_insert_detect =3D no_insert_detect;
>> +	pdata->no_temp_support =3D no_temp_support;
> ditto
>
>> +	pr_err("batt_detect%d, topoff_threshold%d, fast_charge%d,no_temp_s=
upport%d, no_insert_detect%d\n",
>> +		batt_detect, topoff_threshold, fast_charge,
>> +		no_temp_support, no_insert_detect);
> pr_err, are you sure? :)
>
>> +	return 0;
>> +}
>> +#else
>> +#define max8925_power_dt_init(x, y)	(-1)
> You should make it static inline function to get rid of the warning a=
bove.
>
>> +#endif
>> +
>> +static char *power_supplicants[] =3D {
>> +	"max8925-battery",
>> +};
>> +
>>   static __devinit int max8925_power_probe(struct platform_device *p=
dev)
>>   {
>>   	struct max8925_chip *chip =3D dev_get_drvdata(pdev->dev.parent);
>> -	struct max8925_power_pdata *pdata =3D NULL;
>> +	struct max8925_power_pdata *pdata =3D pdev->dev.platform_data;
>>   	struct max8925_power_info *info;
>>   	int ret;
>>  =20
>> -	pdata =3D pdev->dev.platform_data;
>> +	if (pdev->dev.parent->of_node && !pdata) {
>> +		pdata =3D devm_kzalloc(&pdev->dev,
>> +				     sizeof(struct max8925_power_pdata),
>> +				     GFP_KERNEL);
>>
> Please move this logic into max8925_power_dt_init().
> So it will look like
>
> 	if (!pdata)
> 		pdata =3D max8925_power_dt_init(pdev);
> 	if (!pdata) {
> 		dev_err(...);
> 		return ...;
> 	}
>
>> +		max8925_power_dt_init(pdev, pdata);
>> +	}
>>   	if (!pdata) {
>>   		dev_err(&pdev->dev, "platform data isn't assigned to "
>>   			"power supply\n");
>> @@ -453,8 +497,8 @@ static __devinit int max8925_power_probe(struct =
platform_device *pdev)
>>   	info->ac.properties =3D max8925_ac_props;
>>   	info->ac.num_properties =3D ARRAY_SIZE(max8925_ac_props);
>>   	info->ac.get_property =3D max8925_ac_get_prop;
>> -	info->ac.supplied_to =3D pdata->supplied_to;
>> -	info->ac.num_supplicants =3D pdata->num_supplicants;
>> +	info->ac.supplied_to =3D power_supplicants;
>> +	info->ac.num_supplicants =3D ARRAY_SIZE(power_supplicants);
>>   	ret =3D power_supply_register(&pdev->dev, &info->ac);
>>   	if (ret)
>>   		goto out;
>> @@ -465,8 +509,8 @@ static __devinit int max8925_power_probe(struct =
platform_device *pdev)
>>   	info->usb.properties =3D max8925_usb_props;
>>   	info->usb.num_properties =3D ARRAY_SIZE(max8925_usb_props);
>>   	info->usb.get_property =3D max8925_usb_get_prop;
>> -	info->usb.supplied_to =3D pdata->supplied_to;
>> -	info->usb.num_supplicants =3D pdata->num_supplicants;
>> +	info->usb.supplied_to =3D power_supplicants;
>> +	info->usb.num_supplicants =3D ARRAY_SIZE(power_supplicants);
>>  =20
>>   	ret =3D power_supply_register(&pdev->dev, &info->usb);
>>   	if (ret)
>> @@ -491,6 +535,7 @@ static __devinit int max8925_power_probe(struct =
platform_device *pdev)
>>   	info->no_insert_detect =3D pdata->no_insert_detect;
>>  =20
>>   	max8925_init_charger(chip, info);
>> +
> This change is unrelated.
>
>>   	return 0;
>>   out_battery:
>>   	power_supply_unregister(&info->battery);
>> --=20
>> 1.7.0.4
> Thanks,
> Anton.
Anton, thanks for your very careful review!
I updated in patch v2, please help to review it again.


Thanks,
Qing
