From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/5] regulator/axp20x: use axp2xx consolidated header
Date: Sat, 13 Sep 2014 21:01:51 +0100
Message-ID: <5414A2AF.6000005@kernel.org>
References: <1410477357-6407-1-git-send-email-jacob.jun.pan@linux.intel.com> <1410477357-6407-4-git-send-email-jacob.jun.pan@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410477357-6407-4-git-send-email-jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, IIO <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DEVICE TREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Aaron Lu <aaron.lu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Zubair Lutfullah <zubair.lutfullah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ramakrishna Pallala <ramakrishna.pallala-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Max
List-Id: devicetree@vger.kernel.org

On 12/09/14 00:15, Jacob Pan wrote:
> AXP20x driver has been extended to support axp288 variant. Header file
> and common data structures has also been renamed to suit the new
> scope of devices supported.
> 
> This patch makes use of the renamed header and structure.
> 
> Acked-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  drivers/regulator/axp20x-regulator.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
> index 004aadb..c9b6803 100644
> --- a/drivers/regulator/axp20x-regulator.c
> +++ b/drivers/regulator/axp20x-regulator.c
> @@ -20,7 +20,7 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> -#include <linux/mfd/axp20x.h>
> +#include <linux/mfd/axp2xx.h>
Err, doesn't this break bisection.  Rename 'must' be done in one go, not
split across patches.
>  #include <linux/regulator/driver.h>
>  #include <linux/regulator/of_regulator.h>
>  
> @@ -161,7 +161,7 @@ static struct of_regulator_match axp20x_matches[] = {
>  
>  static int axp20x_set_dcdc_freq(struct platform_device *pdev, u32 dcdcfreq)
>  {
> -	struct axp20x_dev *axp20x = dev_get_drvdata(pdev->dev.parent);
> +	struct axp2xx_dev *axp20x = dev_get_drvdata(pdev->dev.parent);
>  
>  	if (dcdcfreq < 750) {
>  		dcdcfreq = 750;
> @@ -232,7 +232,7 @@ static int axp20x_set_dcdc_workmode(struct regulator_dev *rdev, int id, u32 work
>  static int axp20x_regulator_probe(struct platform_device *pdev)
>  {
>  	struct regulator_dev *rdev;
> -	struct axp20x_dev *axp20x = dev_get_drvdata(pdev->dev.parent);
> +	struct axp2xx_dev *axp20x = dev_get_drvdata(pdev->dev.parent);
>  	struct regulator_config config = { };
>  	struct regulator_init_data *init_data;
>  	int ret, i;
> 
