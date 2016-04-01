From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] mtd: nand: read (from DT) and store ECC algorithm
Date: Fri, 1 Apr 2016 09:07:22 -0700
Message-ID: <20160401160722.GC117117@google.com>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
 <1455300685-27009-2-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455300685-27009-2-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 12, 2016 at 07:11:24PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> This will allow drivers handle ECC properly.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/mtd/nand/nand_base.c | 6 +++++-
>  include/linux/mtd/nand.h     | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_bas=
e.c
> index f2c8ff3..ef977f3 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3979,7 +3979,7 @@ ident_done:
>  static int nand_dt_init(struct nand_chip *chip)
>  {
>  	struct device_node *dn =3D nand_get_flash_node(chip);
> -	int ecc_mode, ecc_strength, ecc_step;
> +	int ecc_mode, ecc_algo, ecc_strength, ecc_step;
> =20
>  	if (!dn)
>  		return 0;
> @@ -3991,6 +3991,7 @@ static int nand_dt_init(struct nand_chip *chip)
>  		chip->bbt_options |=3D NAND_BBT_USE_FLASH;
> =20
>  	ecc_mode =3D of_get_nand_ecc_mode(dn);
> +	ecc_algo =3D of_get_nand_ecc_algo(dn);
>  	ecc_strength =3D of_get_nand_ecc_strength(dn);
>  	ecc_step =3D of_get_nand_ecc_step_size(dn);
> =20
> @@ -4003,6 +4004,9 @@ static int nand_dt_init(struct nand_chip *chip)
>  	if (ecc_mode >=3D 0)
>  		chip->ecc.mode =3D ecc_mode;
> =20
> +	if (ecc_algo >=3D 0)
> +		chip->ecc.algo =3D ecc_algo;
> +

While this might appear to handle the absence of the nand-ecc-algo
property correctly, this isn't safe. This means that any existing DT
without the property will get treated as Hamming ECC. Perhaps we need
the enum to have a 0 value of 'NAND_ECC_ALGO_UNKNOWN' or something like
that?

Brian

>  	if (ecc_strength >=3D 0)
>  		chip->ecc.strength =3D ecc_strength;
> =20
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 25854d2..8deca1b 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -513,6 +513,7 @@ struct nand_hw_control {
>   */
>  struct nand_ecc_ctrl {
>  	nand_ecc_modes_t mode;
> +	enum nand_ecc_algo algo;
>  	int steps;
>  	int size;
>  	int bytes;
> --=20
> 1.8.4.5
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
