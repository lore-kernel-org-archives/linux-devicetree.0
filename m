From: Tomasz Figa via iommu <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
Subject: Re: [PATCH v7 14/21] iommu/mediatek: Add mmu1 support
Date: Tue, 18 Jun 2019 15:19:07 +0900
Message-ID: <CAAFQd5A5GUn1Zq1xF2_2V0MReNPd5bra2F=nquvodSAZUua5AQ@mail.gmail.com>
References: <1560169080-27134-1-git-send-email-yong.wu@mediatek.com>
	<1560169080-27134-15-git-send-email-yong.wu@mediatek.com>
Reply-To: Tomasz Figa <tfiga-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <1560169080-27134-15-git-send-email-yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>,
	Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, " <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?WWluZ2pvZSBDaGVuICjpmbPoi7HmtLIp?= <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, anan.sun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>,
	Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, " <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 10, 2019 at 9:21 PM Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> Normally the M4U HW connect EMI with smi. the diagram is like below:
>               EMI
>                |
>               M4U
>                |
>             smi-common
>                |
>        -----------------
>        |    |    |     |    ...
>     larb0 larb1  larb2 larb3
>
> Actually there are 2 mmu cells in the M4U HW, like this diagram:
>
>               EMI
>            ---------
>             |     |
>            mmu0  mmu1     <- M4U
>             |     |
>            ---------
>                |
>             smi-common
>                |
>        -----------------
>        |    |    |     |    ...
>     larb0 larb1  larb2 larb3
>
> This patch add support for mmu1. In order to get better performance,
> we could adjust some larbs go to mmu1 while the others still go to
> mmu0. This is controlled by a SMI COMMON register SMI_BUS_SEL(0x220).
>
> mt2712, mt8173 and mt8183 M4U HW all have 2 mmu cells. the default
> value of that register is 0 which means all the larbs go to mmu0
> defaultly.
>
> This is a preparing patch for adjusting SMI_BUS_SEL for mt8183.
>
> Signed-off-by: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  drivers/iommu/mtk_iommu.c | 46 +++++++++++++++++++++++++++++-----------------
>  1 file changed, 29 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 3a14301..ec4ce74 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -72,26 +72,32 @@
>  #define F_INT_CLR_BIT                          BIT(12)
>
>  #define REG_MMU_INT_MAIN_CONTROL               0x124
> -#define F_INT_TRANSLATION_FAULT                        BIT(0)
> -#define F_INT_MAIN_MULTI_HIT_FAULT             BIT(1)
> -#define F_INT_INVALID_PA_FAULT                 BIT(2)
> -#define F_INT_ENTRY_REPLACEMENT_FAULT          BIT(3)
> -#define F_INT_TLB_MISS_FAULT                   BIT(4)
> -#define F_INT_MISS_TRANSACTION_FIFO_FAULT      BIT(5)
> -#define F_INT_PRETETCH_TRANSATION_FIFO_FAULT   BIT(6)
> +                                               /* mmu0 | mmu1 */
> +#define F_INT_TRANSLATION_FAULT                        (BIT(0) | BIT(7))
> +#define F_INT_MAIN_MULTI_HIT_FAULT             (BIT(1) | BIT(8))
> +#define F_INT_INVALID_PA_FAULT                 (BIT(2) | BIT(9))
> +#define F_INT_ENTRY_REPLACEMENT_FAULT          (BIT(3) | BIT(10))
> +#define F_INT_TLB_MISS_FAULT                   (BIT(4) | BIT(11))
> +#define F_INT_MISS_TRANSACTION_FIFO_FAULT      (BIT(5) | BIT(12))
> +#define F_INT_PRETETCH_TRANSATION_FIFO_FAULT   (BIT(6) | BIT(13))

If there are two IOMMUs, shouldn't we have two driver instances handle
them, instead of making the driver combine them two internally?

And, what is even more important from security point of view actually,
have two separate page tables (aka IOMMU groups) for them?

Best regards,
Tomasz
