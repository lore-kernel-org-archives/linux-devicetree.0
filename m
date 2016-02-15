From: Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] of: mtd: add helper reading "nand-ecc-algo" from DT
Date: Mon, 15 Feb 2016 16:43:15 -0500
Message-ID: <CAC=U0a2v7-6OGvUCiyNgvey_RQonG3XYnnfP-VeuRFLUwbVTiQ@mail.gmail.com>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455300685-27009-1-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 12, 2016 at 1:11 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.=
com> wrote:
> This allows specifying algorithm used for NAND ECC. There are two
> available values: "bch" and "hamming". It's important as having just
> ECC parameters (step, strength) isn't enough to determine algorithm,
> e.g. you can't distinct BCH-1 and Hamming.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Reviewed-by: Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks Rafal
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt |  3 +++
>  drivers/of/of_mtd.c                            | 33 ++++++++++++++++=
++++++++++
>  include/linux/mtd/nand.h                       |  5 ++++
>  include/linux/of_mtd.h                         |  6 +++++
>  4 files changed, 47 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documen=
tation/devicetree/bindings/mtd/nand.txt
> index b53f92e..a2c2df5 100644
> --- a/Documentation/devicetree/bindings/mtd/nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> @@ -3,6 +3,9 @@
>  - nand-ecc-mode : String, operation mode of the NAND ecc mode.
>    Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob=
_first",
>    "soft_bch".
> +- nand-ecc-algo : string, algorithm of NAND ecc.
> +                 Supported values are: "bch", "hamming". The default=
 one is
> +                 "bch".
>  - nand-bus-width : 8 or 16 bus width if not present 8
>  - nand-on-flash-bbt: boolean to enable on flash bbt option if not pr=
esent false
>
> diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
> index b7361ed..f2a6630 100644
> --- a/drivers/of/of_mtd.c
> +++ b/drivers/of/of_mtd.c
> @@ -50,6 +50,39 @@ int of_get_nand_ecc_mode(struct device_node *np)
>  EXPORT_SYMBOL_GPL(of_get_nand_ecc_mode);
>
>  /**
> + * It maps 'enum nand_ecc_algo' found in include/linux/mtd/nand.h in=
to the
> + * device tree binding of 'nand-ecc-algo'.
> + */
> +static const char * const nand_ecc_algos[] =3D {
> +       [NAND_ECC_BCH]          =3D "bch",
> +       [NAND_ECC_HAMMING]      =3D "hamming",
> +};
> +
> +/**
> + * of_get_nand_ecc_algo - Get nand ecc algorithm for given device_no=
de
> + * @np:        Pointer to the given device_node
> + *
> + * The function gets ecc algorithm string from property 'nand-ecc-al=
go' and
> + * returns its index in nand_ecc_algos table, or errno in error case=
=2E
> + */
> +int of_get_nand_ecc_algo(struct device_node *np)
> +{
> +       const char *pm;
> +       int err, i;
> +
> +       err =3D of_property_read_string(np, "nand-ecc-algo", &pm);
> +       if (err < 0)
> +               return err;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(nand_ecc_algos); i++)
> +               if (!strcasecmp(pm, nand_ecc_algos[i]))
> +                       return i;
> +
> +       return -ENODEV;
> +}
> +EXPORT_SYMBOL_GPL(of_get_nand_ecc_algo);
> +
> +/**
>   * of_get_nand_ecc_step_size - Get ECC step size associated to
>   * the required ECC strength (see below).
>   * @np:        Pointer to the given device_node
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 7604f4b..25854d2 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -119,6 +119,11 @@ typedef enum {
>         NAND_ECC_SOFT_BCH,
>  } nand_ecc_modes_t;
>
> +enum nand_ecc_algo {
> +       NAND_ECC_BCH,
> +       NAND_ECC_HAMMING,
> +};
> +
>  /*
>   * Constants for Hardware ECC
>   */
> diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
> index e266caa..0f6aca5 100644
> --- a/include/linux/of_mtd.h
> +++ b/include/linux/of_mtd.h
> @@ -13,6 +13,7 @@
>
>  #include <linux/of.h>
>  int of_get_nand_ecc_mode(struct device_node *np);
> +int of_get_nand_ecc_algo(struct device_node *np);
>  int of_get_nand_ecc_step_size(struct device_node *np);
>  int of_get_nand_ecc_strength(struct device_node *np);
>  int of_get_nand_bus_width(struct device_node *np);
> @@ -25,6 +26,11 @@ static inline int of_get_nand_ecc_mode(struct devi=
ce_node *np)
>         return -ENOSYS;
>  }
>
> +static inline int of_get_nand_ecc_algo(struct device_node *np)
> +{
> +       return -ENOSYS;
> +}
> +
>  static inline int of_get_nand_ecc_step_size(struct device_node *np)
>  {
>         return -ENOSYS;
> --
> 1.8.4.5
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
