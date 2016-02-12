From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/5] mtd: atmel_nand: Support variable RB_EDGE
 interrupts
Date: Fri, 12 Feb 2016 10:27:57 -0800
Message-ID: <20160212182757.GO19540@google.com>
References: <1455098187-9442-1-git-send-email-romain.izard.pro@gmail.com>
 <1455098187-9442-2-git-send-email-romain.izard.pro@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455098187-9442-2-git-send-email-romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 10, 2016 at 10:56:23AM +0100, Romain Izard wrote:
> The NFC controller used to accelerate the NAND transfers on SAMA5 chips
> can use either RB_EDGE0 or RB_EDGE3 as its ready/busy interrupt bit.
> 
> Use the controller's compatible string to select the correct bit.
> 
> For the binding:
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> Reviewed-by: Wenyou Yang <Wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Tested-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> v4: collect tested-by and reviewed-by tags
> v3: constify atmel_nand_nfc_caps structures
> v2: use of_device_get_match_data
>     rename struct atmel_nand_nfc_priv as atmel_nand_nfc_caps
>     rename member rb_edge as rb_mask
>     do not create defines for unused status bits
> 
>  .../devicetree/bindings/mtd/atmel-nand.txt         |  2 +-
>  drivers/mtd/nand/atmel_nand.c                      | 35 +++++++++++++++++-----
>  drivers/mtd/nand/atmel_nand_nfc.h                  |  3 +-
>  3 files changed, 30 insertions(+), 10 deletions(-)

Applied patches 1-4, with the following style diff:

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index aaad1b98dd0d..20cbaabb2959 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -2395,7 +2395,7 @@ static int atmel_nand_nfc_probe(struct platform_device *pdev)
 
 	nfc->caps = (const struct atmel_nand_nfc_caps *)
 		of_device_get_match_data(&pdev->dev);
-	if (NULL == nfc->caps)
+	if (!nfc->caps)
 		return -ENODEV;
 
 	nfc_writel(nfc->hsmc_regs, IDR, 0xffffffff);
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
