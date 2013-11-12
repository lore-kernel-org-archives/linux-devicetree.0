From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH 02/12] mtd: nand: davinci: check required ti,
 davinci-chipselect property
Date: Tue, 12 Nov 2013 10:50:07 -0500
Message-ID: <52824E2F.9090302@ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,
 <1384187188-5776-3-git-send-email-ivan.khoronzhuk@ti.com>
 <4F5844B3A985794BA902E12C070812375F8CEF@DNCE04.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4F5844B3A985794BA902E12C070812375F8CEF@DNCE04.ent.ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Strashko,
 Grygorii" <grygorii.strashko@ti.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Rob Landley <rob@landley.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Monday 11 November 2013 11:53 AM, Khoronzhuk, Ivan wrote:
> The property "ti,davinci-chipselect" is required. So we have to check
> if it is set.
> 
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
> ---
>  drivers/mtd/nand/davinci_nand.c |   10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
> index d87213f..8e1c88e 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -541,10 +541,14 @@ static struct davinci_nand_pdata
>                                 GFP_KERNEL);
>                 pdev->dev.platform_data = pdata;
>                 if (!pdata)
> -                       return NULL;
> +                       return ERR_PTR(-ENOMEM);
> +
This change don't follow commit message.

>                 if (!of_property_read_u32(pdev->dev.of_node,
>                         "ti,davinci-chipselect", &prop))
>                         pdev->id = prop;
> +               else
> +                       return ERR_PTR(-EINVAL);
> +
So the check already exist but the error case wasn't handled.
This should be reflected in change log.

>                 if (!of_property_read_u32(pdev->dev.of_node,
>                         "ti,davinci-mask-ale", &prop))
>                         pdata->mask_ale = prop;
> @@ -598,6 +602,10 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
>         nand_ecc_modes_t                ecc_mode;
> 
>         pdata = nand_davinci_get_pdata(pdev);
> +       if (IS_ERR(pdata)) {
> +               return PTR_ERR(pdata);
> +       }
> +
Again not related to commit log. You might want to split this patch
then.

Regards,
Santosh
