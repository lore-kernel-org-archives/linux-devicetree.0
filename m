From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH 1/3] ARM: at91: use chipid device for soc detection
Date: Wed, 23 Mar 2016 12:22:49 +0100
Message-ID: <56F27C89.9070004@atmel.com>
References: <1458285681-25684-1-git-send-email-ludovic.desroches@atmel.com>
 <20160318103418.GA2531@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160318103418.GA2531@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: plagnioj@jcrosoft.com, boris.brezillon@free-electrons.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Le 18/03/2016 11:34, Alexandre Belloni a =E9crit :
> On 18/03/2016 at 08:21:19 +0100, Ludovic Desroches wrote :
>> So far, the CIDR and EXID registers were in the DBGU interface. This=
 device
>> has disappeared with the SAMA5D2 family. These registers are exposed
>> through a new device called chipid.
>>
>> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
>> [nicolas.ferre@atmel.com: remove useless warnings]
> Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
>=20
>> ---
>>  .../devicetree/bindings/arm/atmel-at91.txt         |  4 ++
>>  arch/arm/mach-at91/soc.c                           | 81 +++++++++++=
++++++-----

We may need to split this patch in 2 for going through separate arm-soc
branches: what do you think Alexandre?

Anyway, I can do it myself: no need to re-send a version:
Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

We'll queue it in our upcoming at91-4.7-dt and at91-4.7-soc branches.

Bye,



>>  2 files changed, 67 insertions(+), 18 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.txt b/=
Documentation/devicetree/bindings/arm/atmel-at91.txt
>> index 7fd64ec..0b1fcbf 100644
>> --- a/Documentation/devicetree/bindings/arm/atmel-at91.txt
>> +++ b/Documentation/devicetree/bindings/arm/atmel-at91.txt
>> @@ -41,6 +41,10 @@ compatible: must be one of:
>>         - "atmel,sama5d43"
>>         - "atmel,sama5d44"
>> =20
>> +Chipid required properties:
>> +- compatible: Should be "atmel,sama5d2-chipid"
>> +- reg : Should contain registers location and length
>> +
>>  PIT Timer required properties:
>>  - compatible: Should be "atmel,at91sam9260-pit"
>>  - reg: Should contain registers location and length
>> diff --git a/arch/arm/mach-at91/soc.c b/arch/arm/mach-at91/soc.c
>> index 54343ff..034d563 100644
>> --- a/arch/arm/mach-at91/soc.c
>> +++ b/arch/arm/mach-at91/soc.c
>> @@ -22,48 +22,93 @@
>>  #include "soc.h"
>> =20
>>  #define AT91_DBGU_CIDR			0x40
>> -#define AT91_DBGU_CIDR_VERSION(x)	((x) & 0x1f)
>> -#define AT91_DBGU_CIDR_EXT		BIT(31)
>> -#define AT91_DBGU_CIDR_MATCH_MASK	0x7fffffe0
>>  #define AT91_DBGU_EXID			0x44
>> +#define AT91_CHIPID_CIDR		0x00
>> +#define AT91_CHIPID_EXID		0x04
>> +#define AT91_CIDR_VERSION(x)		((x) & 0x1f)
>> +#define AT91_CIDR_EXT			BIT(31)
>> +#define AT91_CIDR_MATCH_MASK		0x7fffffe0
>> =20
>> -struct soc_device * __init at91_soc_init(const struct at91_soc *soc=
s)
>> +int __init at91_get_cidr_exid_from_dbgu(u32 *cidr, u32 *exid)
>>  {
>> -	struct soc_device_attribute *soc_dev_attr;
>> -	const struct at91_soc *soc;
>> -	struct soc_device *soc_dev;
>>  	struct device_node *np;
>>  	void __iomem *regs;
>> -	u32 cidr, exid;
>> =20
>>  	np =3D of_find_compatible_node(NULL, NULL, "atmel,at91rm9200-dbgu"=
);
>>  	if (!np)
>>  		np =3D of_find_compatible_node(NULL, NULL,
>>  					     "atmel,at91sam9260-dbgu");
>> +	if (!np)
>> +		return -ENODEV;
>> =20
>> -	if (!np) {
>> -		pr_warn("Could not find DBGU node");
>> -		return NULL;
>> +	regs =3D of_iomap(np, 0);
>> +	of_node_put(np);
>> +
>> +	if (!regs) {
>> +		pr_warn("Could not map DBGU iomem range");
>> +		return -ENXIO;
>>  	}
>> =20
>> +	*cidr =3D readl(regs + AT91_DBGU_CIDR);
>> +	*exid =3D readl(regs + AT91_DBGU_EXID);
>> +
>> +	iounmap(regs);
>> +
>> +	return 0;
>> +}
>> +
>> +int __init at91_get_cidr_exid_from_chipid(u32 *cidr, u32 *exid)
>> +{
>> +	struct device_node *np;
>> +	void __iomem *regs;
>> +
>> +	np =3D of_find_compatible_node(NULL, NULL, "atmel,sama5d2-chipid")=
;
>> +	if (!np)
>> +		return -ENODEV;
>> +
>>  	regs =3D of_iomap(np, 0);
>>  	of_node_put(np);
>> =20
>>  	if (!regs) {
>>  		pr_warn("Could not map DBGU iomem range");
>> -		return NULL;
>> +		return -ENXIO;
>>  	}
>> =20
>> -	cidr =3D readl(regs + AT91_DBGU_CIDR);
>> -	exid =3D readl(regs + AT91_DBGU_EXID);
>> +	*cidr =3D readl(regs + AT91_CHIPID_CIDR);
>> +	*exid =3D readl(regs + AT91_CHIPID_EXID);
>> =20
>>  	iounmap(regs);
>> =20
>> +	return 0;
>> +}
>> +
>> +struct soc_device * __init at91_soc_init(const struct at91_soc *soc=
s)
>> +{
>> +	struct soc_device_attribute *soc_dev_attr;
>> +	const struct at91_soc *soc;
>> +	struct soc_device *soc_dev;
>> +	u32 cidr, exid;
>> +	int ret;
>> +
>> +	/*
>> +	 * With SAMA5D2 and later SoCs, CIDR and EXID registers are no mor=
e
>> +	 * in the dbgu device but in the chipid device whose purpose is on=
ly
>> +	 * to expose these two registers.
>> +	 */
>> +	ret =3D at91_get_cidr_exid_from_dbgu(&cidr, &exid);
>> +	if (ret)
>> +		ret =3D at91_get_cidr_exid_from_chipid(&cidr, &exid);
>> +	if (ret) {
>> +		if (ret =3D=3D -ENODEV)
>> +			pr_warn("Could not find identification node");
>> +		return NULL;
>> +	}
>> +
>>  	for (soc =3D socs; soc->name; soc++) {
>> -		if (soc->cidr_match !=3D (cidr & AT91_DBGU_CIDR_MATCH_MASK))
>> +		if (soc->cidr_match !=3D (cidr & AT91_CIDR_MATCH_MASK))
>>  			continue;
>> =20
>> -		if (!(cidr & AT91_DBGU_CIDR_EXT) || soc->exid_match =3D=3D exid)
>> +		if (!(cidr & AT91_CIDR_EXT) || soc->exid_match =3D=3D exid)
>>  			break;
>>  	}
>> =20
>> @@ -79,7 +124,7 @@ struct soc_device * __init at91_soc_init(const st=
ruct at91_soc *socs)
>>  	soc_dev_attr->family =3D soc->family;
>>  	soc_dev_attr->soc_id =3D soc->name;
>>  	soc_dev_attr->revision =3D kasprintf(GFP_KERNEL, "%X",
>> -					   AT91_DBGU_CIDR_VERSION(cidr));
>> +					   AT91_CIDR_VERSION(cidr));
>>  	soc_dev =3D soc_device_register(soc_dev_attr);
>>  	if (IS_ERR(soc_dev)) {
>>  		kfree(soc_dev_attr->revision);
>> @@ -91,7 +136,7 @@ struct soc_device * __init at91_soc_init(const st=
ruct at91_soc *socs)
>>  	if (soc->family)
>>  		pr_info("Detected SoC family: %s\n", soc->family);
>>  	pr_info("Detected SoC: %s, revision %X\n", soc->name,
>> -		AT91_DBGU_CIDR_VERSION(cidr));
>> +		AT91_CIDR_VERSION(cidr));
>> =20
>>  	return soc_dev;
>>  }
>> --=20
>> 2.5.0
>>
>=20


--=20
Nicolas Ferre
