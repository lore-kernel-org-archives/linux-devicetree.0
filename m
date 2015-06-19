From: Chanwoo Choi <cwchoi00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/5] extcon: arizona: Add basic microphone detection
 DT/ACPI bindings
Date: Fri, 19 Jun 2015 11:25:57 +0900
Message-ID: <CAGTfZH0uds0swf-x0naTJeMRvOB6DkekdmSSGWA5KpNCWVOWZw@mail.gmail.com>
References: <1434638631-16451-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
	<1434638631-16451-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Reply-To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434638631-16451-3-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Charles,

On Thu, Jun 18, 2015 at 11:43 PM, Charles Keepax
<ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> This patch adds bindings for the basic microphone detection platform
> data.
>
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
>  drivers/extcon/extcon-arizona.c |   29 +++++++++++++++++++++++++++++
>  1 files changed, 29 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
> index 1153929..5bf1b19 100644
> --- a/drivers/extcon/extcon-arizona.c
> +++ b/drivers/extcon/extcon-arizona.c
> @@ -1115,6 +1115,7 @@ static int arizona_extcon_device_get_pdata(struct arizona *arizona)
>  {
>         struct arizona_pdata *pdata = &arizona->pdata;
>         unsigned int val = ARIZONA_ACCDET_MODE_HPL;
> +       unsigned int dbtime;
>
>         device_property_read_u32(arizona->dev, "wlf,hpdet-channel", &val);
>         switch (val) {
> @@ -1128,6 +1129,34 @@ static int arizona_extcon_device_get_pdata(struct arizona *arizona)
>                 pdata->hpdet_channel = ARIZONA_ACCDET_MODE_HPL;
>         }
>
> +       device_property_read_u32(arizona->dev, "wlf,micd-detect-debounce",
> +                                &pdata->micd_detect_debounce);
> +
> +       device_property_read_u32(arizona->dev, "wlf,micd-bias-start-time",
> +                                &pdata->micd_bias_start_time);
> +
> +       device_property_read_u32(arizona->dev, "wlf,micd-rate",
> +                                &pdata->micd_rate);
> +
> +       dbtime = 0;
> +       device_property_read_u32(arizona->dev, "wlf,micd-dbtime", &dbtime);
> +       switch (dbtime) {
> +       case 2:

I'd like you to define the constant variable for specific integer
value to improve the readability.
e.g.,

#define MICD_DBTIME_XXX 2
#define MICD_DBTIME_XXX 4

> +               pdata->micd_dbtime = 0x10000;

Also, you better to define the constant variable for "0x10000" to
improbe readability in the include/linux/mfd/arizona.h. If you just
use the hex value, the other developer cannot analyze the meaning of
"0x10000".

> +               break;
> +       case 4:

ditto.

> +               pdata->micd_dbtime = 0x0001;

ditto.

> +               break;
> +       default:
> +               break;
> +       }
> +
> +       device_property_read_u32(arizona->dev, "wlf,micd-timeout",
> +                                &pdata->micd_timeout);
> +
> +       pdata->micd_force_micbias = device_property_read_bool(arizona->dev,
> +                                               "wlf,micd-force-micbias");
> +
>         return 0;
>  }

Thanks,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
