From: Chanwoo Choi <cwchoi00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 2/7] extcon: arizona: Update to use the new device
 properties API
Date: Sun, 21 Jun 2015 23:18:47 +0900
Message-ID: <CAGTfZH25L74HcrcNBwuts1+N4cAsRUDDBLNmkRbMg98Ap-oVoQ@mail.gmail.com>
References: <1434731014-19980-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
	<1434731014-19980-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Reply-To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434731014-19980-3-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Charles,

Applied it.

Thanks,
Chanwoo Choi


On Sat, Jun 20, 2015 at 1:23 AM, Charles Keepax
<ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> The device properties API will load data from both device tree and ACPI,
> update the binding to use this API instead of the OF API.
>
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
>  drivers/extcon/extcon-arizona.c |   11 +++++------
>  1 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
> index 1fbe3b4..57755e8 100644
> --- a/drivers/extcon/extcon-arizona.c
> +++ b/drivers/extcon/extcon-arizona.c
> @@ -24,6 +24,7 @@
>  #include <linux/input.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/extcon.h>
>
> @@ -1110,12 +1111,12 @@ static void arizona_micd_set_level(struct arizona *arizona, int index,
>         regmap_update_bits(arizona->regmap, reg, mask, level);
>  }
>
> -static int arizona_extcon_of_get_pdata(struct arizona *arizona)
> +static int arizona_extcon_device_get_pdata(struct arizona *arizona)
>  {
>         struct arizona_pdata *pdata = &arizona->pdata;
>         unsigned int val = ARIZONA_ACCDET_MODE_HPL;
>
> -       of_property_read_u32(arizona->dev->of_node, "wlf,hpdet-channel", &val);
> +       device_property_read_u32(arizona->dev, "wlf,hpdet-channel", &val);
>         switch (val) {
>         case ARIZONA_ACCDET_MODE_HPL:
>         case ARIZONA_ACCDET_MODE_HPR:
> @@ -1147,10 +1148,8 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>         if (!info)
>                 return -ENOMEM;
>
> -       if (IS_ENABLED(CONFIG_OF)) {
> -               if (!dev_get_platdata(arizona->dev))
> -                       arizona_extcon_of_get_pdata(arizona);
> -       }
> +       if (!dev_get_platdata(arizona->dev))
> +               arizona_extcon_device_get_pdata(arizona);
>
>         info->micvdd = devm_regulator_get(&pdev->dev, "MICVDD");
>         if (IS_ERR(info->micvdd)) {
> --
> 1.7.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
