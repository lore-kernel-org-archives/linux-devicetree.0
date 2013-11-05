From: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2] mtd: gpmi: add a new DT property to use the datasheet's
 minimum required ECC
Date: Tue, 5 Nov 2013 14:19:49 +0800
Message-ID: <52788E05.6070907@freescale.com>
References: <1382929517-22606-1-git-send-email-b32955@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382929517-22606-1-git-send-email-b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

=D3=DA 2013=C4=EA10=D4=C228=C8=D5 11:05, Huang Shijie =D0=B4=B5=C0:
> In default way, we use the ecc_strength/ecc_step size calculated by o=
urselves
> and use all the OOB area.
>
> This patch adds a new property : "fsl,use-minimum-ecc"
>
> If we enable it, we will firstly try to use the datasheet's minimum r=
equired
> ECC provided by the MTD layer (the ecc_strength_ds/ecc_step_ds fields
> in the nand_chip{}). So we may have free space in the OOB area by usi=
ng the
> minimum ECC, and we may support JFFS2 with some SLC NANDs, such as Mi=
cron's
> SLC NAND.
>
> If we fail to use the minimum ECC, we will use the legacy method to c=
alculate
> the ecc_strength and ecc_step size.
>
> Signed-off-by: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> v1 --> v2:
> 	based on David's patch to fix the regression.
> ---
>  .../devicetree/bindings/mtd/gpmi-nand.txt          |    6 ++++++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |    3 +++
>  2 files changed, 9 insertions(+), 0 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Do=
cumentation/devicetree/bindings/mtd/gpmi-nand.txt
> index 551b2a1..4297795 100644
> --- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> @@ -17,6 +17,12 @@ Required properties:
>  Optional properties:
>    - nand-on-flash-bbt: boolean to enable on flash bbt option if not
>                         present false
> +  - fsl,use-minimum-ecc: By enabling this boolean property, the gpmi=
 will try
> +                       to use the datasheet's minimum required ECC p=
rovided by
> +                       the MTD layer (the ecc_strength_ds/ecc_step_d=
s fields
> +                       in the nand_chip{}). So we may have free spac=
e in the OOB
> +                       area by using the minimum ECC, and we may sup=
port JFFS2
> +                       with some SLC NANDs, such as Micron's SLC NAN=
D.
> =20
>  The device tree may optionally contain sub-nodes describing partitio=
ns of the
>  address space. See partition.txt for more detail.
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nan=
d/gpmi-nand/gpmi-nand.c
> index 7ac2280..3ec55d0 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -352,6 +352,9 @@ static int legacy_set_geometry(struct gpmi_nand_d=
ata *this)
> =20
>  int common_nfc_set_geometry(struct gpmi_nand_data *this)
>  {
> +	if (of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc"=
)
> +		&& set_geometry_by_ecc_info(this))
> +		return 0;
>  	return legacy_set_geometry(this);
>  }
> =20
any comment about this patch?

thanks
Huang Shijie

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
