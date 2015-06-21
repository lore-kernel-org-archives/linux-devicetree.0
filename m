From: Chanwoo Choi <cwchoi00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 3/7] extcon: arizona: Add basic microphone detection
 DT/ACPI bindings
Date: Sun, 21 Jun 2015 23:18:26 +0900
Message-ID: <CAGTfZH2dyy=msQBmLrWwo7shx9zAr+pXitKQnBE3JHn=d-6cpQ@mail.gmail.com>
References: <1434731014-19980-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
	<1434731014-19980-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Reply-To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434731014-19980-4-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
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
> This patch adds bindings for the basic microphone detection platform
> data.
>
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
>  drivers/extcon/extcon-arizona.c |   18 ++++++++++++++++++
>  1 files changed, 18 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
> index 57755e8..b364b8b 100644
> --- a/drivers/extcon/extcon-arizona.c
> +++ b/drivers/extcon/extcon-arizona.c
> @@ -1128,6 +1128,24 @@ static int arizona_extcon_device_get_pdata(struct arizona *arizona)
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
> +       device_property_read_u32(arizona->dev, "wlf,micd-dbtime",
> +                                &pdata->micd_dbtime);
> +
> +       device_property_read_u32(arizona->dev, "wlf,micd-timeout",
> +                                &pdata->micd_timeout);
> +
> +       pdata->micd_force_micbias = device_property_read_bool(arizona->dev,
> +                                               "wlf,micd-force-micbias");
> +
>         return 0;
>  }
>
> --
> 1.7.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
