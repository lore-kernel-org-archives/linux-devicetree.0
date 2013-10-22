From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mtd: gpmi: fix the ecc regression
Date: Tue, 22 Oct 2013 11:56:39 -0700
Message-ID: <20131022185639.GK23337@ld-irv-0074.broadcom.com>
References: <1382418628-4521-1-git-send-email-b32955@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1382418628-4521-1-git-send-email-b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Huang,

On Tue, Oct 22, 2013 at 01:10:28PM +0800, Huang Shijie wrote:
> The patch "2febcdf mtd: gpmi: set the BCHs geometry with the ecc info"
> makes the gpmi to use the ECC info provided by the MTD code, and creates
> a different NAND ecc layout for the BCH which brings a regression to us:
>    We can not mount the ubifs which was created by the old NAND ecc layout.
> 
> This patch adds a new property : "fsl,use-mtd-ecc-info".

You have a regression in your driver. You need to fix the regression
first, so we can get that into 3.12 (or at this point, more likely
-stable). This could be something like you simple diff you sent earlier.

*After* we fix the regression, we can discuss new DT bindings.

> If we do not enable it, we will use the ecc strength calculated by ourselves
> and use all the OOB area (this is the legacy method);
> 
> If we enable it, we will use the ecc strength provided by the MTD layer,
> and create a new NAND ecc layout which may has free space in the OOB
> (for some SLC nand, we may support the JFFS2 with the new NAND ecc layout).
> 
> Signed-off-by: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  .../devicetree/bindings/mtd/gpmi-nand.txt          |    4 ++++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |    7 ++++++-
>  2 files changed, 10 insertions(+), 1 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> index 551b2a1..fe84a3d 100644
> --- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> @@ -17,6 +17,10 @@ Required properties:
>  Optional properties:
>    - nand-on-flash-bbt: boolean to enable on flash bbt option if not
>                         present false
> +  - fsl,use-mtd-ecc-info: By enabling this boolean property, the gpmi can uses
> +                       the MTD's ECC info (if the MTD has). So we may have free
> +                       space in the OOB area, and we may support the JFFS2 with
> +                       some SLC nand, such as Micron's SLC nand.

As Mark mentioned, this description is very Linux-specific. And
honestly, I don't even understand what this description means except
that I reviewed your patches and this recent regression report. It is
not self explanatory at all.

Rhetorical question: What is "the MTD's ECC info"? What am I specifying
by putting this property in the device tree?

(Answer (?): you're looking for the ECC requirements from the data
sheet, which happens to be automatically discoverable in some cases.)

... so why don't you just add a DT property to actually specify the ECC
selection itself, rather than indirectly specifying it through a vague
specification and knowledge of how your driver handles it?

Or, is the difference between your "legacy" and "new" layout more than
just the choice of ECC strength and step size? If so, then this should
be documented [1], and that well-specified difference in layout should
become part of the DT binding.

>  The device tree may optionally contain sub-nodes describing partitions of the
>  address space. See partition.txt for more detail.
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 5a1bbc7..62c0712 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -271,7 +271,9 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
>  		dev_err(this->dev,
>  			"We can not support this nand chip."
>  			" Its required ecc strength(%d) is beyond our"
> -			" capability(%d).\n", geo->ecc_strength,
> +			" capability(%d). If you have not enabled the"
> +			"'fsl,use-mtd-ecc-info', enable it and try again.\n",
> +			geo->ecc_strength,
>  			(GPMI_IS_MX6Q(this) ? MX6_ECC_STRENGTH_MAX
>  					: MXS_ECC_STRENGTH_MAX));
>  		return -EINVAL;
> @@ -352,6 +354,9 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
>  
>  int common_nfc_set_geometry(struct gpmi_nand_data *this)
>  {
> +	if (!of_property_read_bool(this->dev->of_node, "fsl,use-mtd-ecc-info"))
> +		return legacy_set_geometry(this);
> +
>  	return set_geometry_by_ecc_info(this) ? 0 : legacy_set_geometry(this);
>  }

Your first patch just needs to involve rearranging the calls to
legacy_set_geometry() and set_geometry_by_ecc_info() without any new
help from device tree.

Brian

[1] Is it somewhere in your 50-line comments in
drivers/mtd/nand/gpmi-nand/gpmi-nand.c? Perhaps this should migrate to
Documentation/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
