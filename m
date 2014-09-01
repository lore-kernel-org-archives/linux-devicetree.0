From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] mfd: Add hi6421 PMIC core driver
Date: Mon, 01 Sep 2014 16:17:10 +0800
Message-ID: <54042B86.4060008@linaro.org>
References: <1408973982-2072-1-git-send-email-guodong.xu@linaro.org> <1408973982-2072-3-git-send-email-guodong.xu@linaro.org> <20140827141127.GA24579@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140827141127.GA24579@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, zhangnian-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 08/27/2014 10:11 PM, Lee Jones wrote:
>> This adds driver to support HiSilicon Hi6421 PMIC. Hi6421 includes m=
ulti-
>> functions, such as regulators, codec, ADCs, Coulomb counter, etc.
>> This driver includes core APIs _only_.
>>
>> Drivers for individul components, like voltage regulators, are
>> implemented in corresponding driver directories and files.
>>
>> Registers in Hi6421 are memory mapped, so using regmap-mmio API.
>>
>> Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>=20
> The patch is missing version information normally indicated to in the
> =C2=A3SUBJECT line with a full description added here.  This looks li=
ke a
> first submission, but we both know that it's not.=20
>=20

Ok. I will add it back, continuing the versions. Actually I purposely
restarted version number in this submission because the Hi6421 regulato=
r
driver part has been accepted in v5, so this patchset is not inheriting
'exactly' to the previous ones. But seems I am thinking in a wrong way.

I will take this as my v7. And next patchset I send will be v8.

Thanks.

>>  drivers/mfd/Kconfig             |  13 +++++
>>  drivers/mfd/Makefile            |   1 +
>>  drivers/mfd/hi6421-pmic-core.c  | 112 +++++++++++++++++++++++++++++=
+++++++++++
>>  include/linux/mfd/hi6421-pmic.h |  42 +++++++++++++++
>>  4 files changed, 168 insertions(+)
>>  create mode 100644 drivers/mfd/hi6421-pmic-core.c
>>  create mode 100644 include/linux/mfd/hi6421-pmic.h
>=20
> [...]
>=20
>> diff --git a/drivers/mfd/hi6421-pmic-core.c b/drivers/mfd/hi6421-pmi=
c-core.c
>> new file mode 100644
>> index 0000000..c6cba8f
>> --- /dev/null
>> +++ b/drivers/mfd/hi6421-pmic-core.c
>> @@ -0,0 +1,112 @@
>=20
> [...]
>=20
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/mfd/core.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/mfd/hi6421-pmic.h>
>> +
>> +static struct of_device_id of_hi6421_pmic_match_tbl[] =3D {
>> +	{ .compatible =3D "hisilicon,hi6421-pmic", },
>> +	{ },
>> +};
>=20
> Unless you're going to use this to of_match() on in future, this
> should be down by the definition of 'struct platform_driver'.
>=20

Ok, Will do.

>> +static int hi6421_pmic_probe(struct platform_device *pdev)
>> +{
>=20
> [...]
>=20
>> +	/* set over-current protection debounce 8ms */
>> +	regmap_update_bits(pmic->regmap, HI6421_OCP_DEB_CTRL_REG,
>> +		(HI6421_OCP_DEB_SEL_MASK | HI6421_OCP_EN_DEBOUNCE_MASK |
>> +		 HI6421_OCP_AUTO_STOP_MASK),
>> +		(HI6421_OCP_DEB_SEL_8MS | HI6421_OCP_EN_DEBOUNCE_ENABLE));
>=20
> These might read a little better stacked and aligned.
>

Will do.

>
>> +	pmic->dev =3D &pdev->dev;
>
> Can't you retrieve this via dev->parent?
>

It is not used. I will remove dev from 'struct hi6421_pmic'.

Thanks.

Best regards,
Guodong Xu

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
