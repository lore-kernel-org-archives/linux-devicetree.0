From: Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] mtd: nand: read (from DT) and store ECC algorithm
Date: Mon, 15 Feb 2016 16:31:30 -0500
Message-ID: <CAC=U0a0TybW0jHavZtuWk5-1AEX809rX_e-+qGwYwehk=+cpAw@mail.gmail.com>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
	<1455300685-27009-2-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455300685-27009-2-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 12, 2016 at 1:11 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.=
com> wrote:
>
> This will allow drivers handle ECC properly.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Reviewed-by: Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks Rafal
>
> ---
>  drivers/mtd/nand/nand_base.c | 6 +++++-
>  include/linux/mtd/nand.h     | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_bas=
e.c
> index f2c8ff3..ef977f3 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3979,7 +3979,7 @@ ident_done:
>  static int nand_dt_init(struct nand_chip *chip)
>  {
>         struct device_node *dn =3D nand_get_flash_node(chip);
> -       int ecc_mode, ecc_strength, ecc_step;
> +       int ecc_mode, ecc_algo, ecc_strength, ecc_step;
>
>         if (!dn)
>                 return 0;
> @@ -3991,6 +3991,7 @@ static int nand_dt_init(struct nand_chip *chip)
>                 chip->bbt_options |=3D NAND_BBT_USE_FLASH;
>
>         ecc_mode =3D of_get_nand_ecc_mode(dn);
> +       ecc_algo =3D of_get_nand_ecc_algo(dn);
>         ecc_strength =3D of_get_nand_ecc_strength(dn);
>         ecc_step =3D of_get_nand_ecc_step_size(dn);
>
> @@ -4003,6 +4004,9 @@ static int nand_dt_init(struct nand_chip *chip)
>         if (ecc_mode >=3D 0)
>                 chip->ecc.mode =3D ecc_mode;
>
> +       if (ecc_algo >=3D 0)
> +               chip->ecc.algo =3D ecc_algo;
> +
>         if (ecc_strength >=3D 0)
>                 chip->ecc.strength =3D ecc_strength;
>
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 25854d2..8deca1b 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -513,6 +513,7 @@ struct nand_hw_control {
>   */
>  struct nand_ecc_ctrl {
>         nand_ecc_modes_t mode;
> +       enum nand_ecc_algo algo;
>         int steps;
>         int size;
>         int bytes;
> --
> 1.8.4.5
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
