From: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH v6 1/2] mtd: hisilicon: add a new NAND controller driver
 for hisilicon hip04 Soc
Date: Wed, 14 Jan 2015 20:45:05 +0800
Message-ID: <54B664D1.6060508@hisilicon.com>
References: <1421047734-30818-1-git-send-email-wangzhou1@hisilicon.com> <1421047734-30818-2-git-send-email-wangzhou1@hisilicon.com> <20150113040254.GK9759@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150113040254.GK9759@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, caizhiyong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, yubingxu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015/1/13 12:02, Brian Norris wrote:
> One more thing:
>=20
> On Mon, Jan 12, 2015 at 03:28:53PM +0800, Zhou Wang wrote:
>> diff --git a/drivers/mtd/nand/hisi504_nand.c b/drivers/mtd/nand/hisi=
504_nand.c
>> new file mode 100644
>> index 0000000..2000f21
>> --- /dev/null
>> +++ b/drivers/mtd/nand/hisi504_nand.c
> ...
>> +static int hisi_nand_read_page_hwecc(struct mtd_info *mtd,
>> +	struct nand_chip *chip, uint8_t *buf, int oob_required, int page)
>> +{
>> +	struct hinfc_host *host =3D chip->priv;
>> +	int max_bitflips =3D 0, stat =3D 0, stat_max, status_ecc;
>=20
>     drivers/mtd/nand/hisi504_nand.c:547:34: warning: =E2=80=98stat_ma=
x=E2=80=99 may be used uninitialized in this function [-Wmaybe-uninitia=
lized]
>       int max_bitflips =3D 0, stat =3D 0, stat_max, status_ecc;

In fact, there is no chance to run "default case" there as hisi_nfc_ecc=
_probe
will check this and print error.
I will initialize stat_max with 0 to eliminate this warning.

>                                       ^
>=20
>> +	int stat_1, stat_2;
>> +
>> +	chip->read_buf(mtd, buf, mtd->writesize);
>> +	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
>> +
>> +	/* errors which can not be corrected by ECC */
>> +	if (host->irq_status & HINFC504_INTS_UE) {
>> +		mtd->ecc_stats.failed++;
>> +	} else if (host->irq_status & HINFC504_INTS_CE) {
>> +		/* TODO: need add other ECC modes! */
>=20
> You may want a 'default' case that sets stat_max to zero, then.
>=20
>> +		switch (chip->ecc.strength) {
>> +		case 1:
>> +			stat =3D hweight8(hinfc_read(host, HINFC504_ECC_STATUS)>>
>> +						HINFC504_ECC_1_BIT_SHIFT);
>> +			stat_max =3D 1;
>> +			break;
>> +		case 16:
>> +			status_ecc =3D hinfc_read(host, HINFC504_ECC_STATUS) >>
>> +					HINFC504_ECC_16_BIT_SHIFT & 0x0fff;
>> +			stat_2 =3D status_ecc & 0x3f;
>> +			stat_1 =3D status_ecc >> 6 & 0x3f;
>> +			stat =3D stat_1 + stat_2;
>> +			stat_max =3D max_t(int, stat_1, stat_2);
>> +		}
>> +		mtd->ecc_stats.corrected +=3D stat;
>> +		max_bitflips =3D max_t(int, max_bitflips, stat_max);
>> +	}
>> +	host->irq_status =3D 0;
>> +
>> +	return max_bitflips;
>> +}
>=20
> Brian

Thanks for your comment!
Zhou Wang
>=20
> .
>=20


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
