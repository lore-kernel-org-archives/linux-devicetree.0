From: Chanwoo Choi <cwchoi00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 1/7] extcon: arizona: Simplify pdata symantics for micd_dbtime
Date: Sun, 21 Jun 2015 23:17:56 +0900
Message-ID: <CAGTfZH3BvPz82j-JQhLDYAp=VcKSy9jtsTPhe53PfioPq684Fw@mail.gmail.com>
References: <1434731014-19980-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
	<1434731014-19980-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Reply-To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434731014-19980-2-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Charles,

Looks good go me. But you need the review from MFD maintainer
before appling it.

Thanks,
Chanwoo Choi

On Sat, Jun 20, 2015 at 1:23 AM, Charles Keepax
<ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> Currently micd_dbtime can be set to 0 for default, 1 for 4 measurements,
> or a greater than 16-bit value for 2 measurements. This patch simplifies
> the symantics to 2 for 2 measurements, 4 for 4 measurements and any
> other value for the default.
>
> I am not super keen on changing the symantics of the pdata at this stage
> in the drivers life, but acceptance of the DT binding for this field has
> been made conditional on this happening.
>
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
>  drivers/extcon/extcon-arizona.c   |   14 +++++++++++---
>  include/linux/mfd/arizona/pdata.h |    3 +++
>  2 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
> index 9262b45..1fbe3b4 100644
> --- a/drivers/extcon/extcon-arizona.c
> +++ b/drivers/extcon/extcon-arizona.c
> @@ -1267,11 +1267,19 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>                                    arizona->pdata.micd_rate
>                                    << ARIZONA_MICD_RATE_SHIFT);
>
> -       if (arizona->pdata.micd_dbtime)
> +       switch (arizona->pdata.micd_dbtime) {
> +       case ARIZONA_MICD_DBTIME_FOUR_READINGS:
>                 regmap_update_bits(arizona->regmap, ARIZONA_MIC_DETECT_1,
>                                    ARIZONA_MICD_DBTIME_MASK,
> -                                  arizona->pdata.micd_dbtime
> -                                  << ARIZONA_MICD_DBTIME_SHIFT);
> +                                  ARIZONA_MICD_DBTIME);
> +               break;
> +       case ARIZONA_MICD_DBTIME_TWO_READINGS:
> +               regmap_update_bits(arizona->regmap, ARIZONA_MIC_DETECT_1,
> +                                  ARIZONA_MICD_DBTIME_MASK, 0);
> +               break;
> +       default:
> +               break;
> +       }
>
>         BUILD_BUG_ON(ARRAY_SIZE(arizona_micd_levels) != 0x40);
>
> diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/arizona/pdata.h
> index aa5c48b..bd68355 100644
> --- a/include/linux/mfd/arizona/pdata.h
> +++ b/include/linux/mfd/arizona/pdata.h
> @@ -53,6 +53,9 @@
>
>  #define ARIZONA_MAX_PDM_SPK 2
>
> +#define ARIZONA_MICD_DBTIME_TWO_READINGS 2
> +#define ARIZONA_MICD_DBTIME_FOUR_READINGS 4
> +
>  struct regulator_init_data;
>
>  struct arizona_micbias {
> --
> 1.7.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
