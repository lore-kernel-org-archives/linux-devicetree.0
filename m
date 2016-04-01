From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] mtd: nand: read (from DT) and store ECC algorithm
Date: Fri, 1 Apr 2016 21:32:40 +0200
Message-ID: <CACna6rz6mYSxAr1oSjcLc__sSKM1XdUf-cGOFanGvuij0nNC5Q@mail.gmail.com>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
	<1455300685-27009-2-git-send-email-zajec5@gmail.com>
	<20160401160722.GC117117@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160401160722.GC117117-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 1 April 2016 at 18:07, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> On Fri, Feb 12, 2016 at 07:11:24PM +0100, Rafa=C5=82 Mi=C5=82ecki wro=
te:
>> This will allow drivers handle ECC properly.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/mtd/nand/nand_base.c | 6 +++++-
>>  include/linux/mtd/nand.h     | 1 +
>>  2 files changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_ba=
se.c
>> index f2c8ff3..ef977f3 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -3979,7 +3979,7 @@ ident_done:
>>  static int nand_dt_init(struct nand_chip *chip)
>>  {
>>       struct device_node *dn =3D nand_get_flash_node(chip);
>> -     int ecc_mode, ecc_strength, ecc_step;
>> +     int ecc_mode, ecc_algo, ecc_strength, ecc_step;
>>
>>       if (!dn)
>>               return 0;
>> @@ -3991,6 +3991,7 @@ static int nand_dt_init(struct nand_chip *chip=
)
>>               chip->bbt_options |=3D NAND_BBT_USE_FLASH;
>>
>>       ecc_mode =3D of_get_nand_ecc_mode(dn);
>> +     ecc_algo =3D of_get_nand_ecc_algo(dn);
>>       ecc_strength =3D of_get_nand_ecc_strength(dn);
>>       ecc_step =3D of_get_nand_ecc_step_size(dn);
>>
>> @@ -4003,6 +4004,9 @@ static int nand_dt_init(struct nand_chip *chip=
)
>>       if (ecc_mode >=3D 0)
>>               chip->ecc.mode =3D ecc_mode;
>>
>> +     if (ecc_algo >=3D 0)
>> +             chip->ecc.algo =3D ecc_algo;
>> +
>
> While this might appear to handle the absence of the nand-ecc-algo
> property correctly, this isn't safe. This means that any existing DT
> without the property will get treated as Hamming ECC. Perhaps we need
> the enum to have a 0 value of 'NAND_ECC_ALGO_UNKNOWN' or something li=
ke
> that?

You're commenting on an old series. If you take a look at:
https://patchwork.ozlabs.org/patch/601180/
that also got applied to the:
https://github.com/linux-nand/linux/commits/nand/next
repo, you'll see we have NAND_ECC_UNKNOWN there.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
