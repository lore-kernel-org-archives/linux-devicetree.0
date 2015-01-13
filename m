From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 1/2] mtd: hisilicon: add a new NAND controller driver
 for hisilicon hip04 Soc
Date: Mon, 12 Jan 2015 20:02:54 -0800
Message-ID: <20150113040254.GK9759@ld-irv-0074>
References: <1421047734-30818-1-git-send-email-wangzhou1@hisilicon.com>
 <1421047734-30818-2-git-send-email-wangzhou1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421047734-30818-2-git-send-email-wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, caizhiyong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, yubingxu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

One more thing:

On Mon, Jan 12, 2015 at 03:28:53PM +0800, Zhou Wang wrote:
> diff --git a/drivers/mtd/nand/hisi504_nand.c b/drivers/mtd/nand/hisi5=
04_nand.c
> new file mode 100644
> index 0000000..2000f21
> --- /dev/null
> +++ b/drivers/mtd/nand/hisi504_nand.c
=2E..
> +static int hisi_nand_read_page_hwecc(struct mtd_info *mtd,
> +	struct nand_chip *chip, uint8_t *buf, int oob_required, int page)
> +{
> +	struct hinfc_host *host =3D chip->priv;
> +	int max_bitflips =3D 0, stat =3D 0, stat_max, status_ecc;

    drivers/mtd/nand/hisi504_nand.c:547:34: warning: =E2=80=98stat_max=E2=
=80=99 may be used uninitialized in this function [-Wmaybe-uninitialize=
d]
      int max_bitflips =3D 0, stat =3D 0, stat_max, status_ecc;
                                      ^

> +	int stat_1, stat_2;
> +
> +	chip->read_buf(mtd, buf, mtd->writesize);
> +	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
> +
> +	/* errors which can not be corrected by ECC */
> +	if (host->irq_status & HINFC504_INTS_UE) {
> +		mtd->ecc_stats.failed++;
> +	} else if (host->irq_status & HINFC504_INTS_CE) {
> +		/* TODO: need add other ECC modes! */

You may want a 'default' case that sets stat_max to zero, then.

> +		switch (chip->ecc.strength) {
> +		case 1:
> +			stat =3D hweight8(hinfc_read(host, HINFC504_ECC_STATUS)>>
> +						HINFC504_ECC_1_BIT_SHIFT);
> +			stat_max =3D 1;
> +			break;
> +		case 16:
> +			status_ecc =3D hinfc_read(host, HINFC504_ECC_STATUS) >>
> +					HINFC504_ECC_16_BIT_SHIFT & 0x0fff;
> +			stat_2 =3D status_ecc & 0x3f;
> +			stat_1 =3D status_ecc >> 6 & 0x3f;
> +			stat =3D stat_1 + stat_2;
> +			stat_max =3D max_t(int, stat_1, stat_2);
> +		}
> +		mtd->ecc_stats.corrected +=3D stat;
> +		max_bitflips =3D max_t(int, max_bitflips, stat_max);
> +	}
> +	host->irq_status =3D 0;
> +
> +	return max_bitflips;
> +}

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
