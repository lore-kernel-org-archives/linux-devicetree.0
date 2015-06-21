From: Chanwoo Choi <cwchoi00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 5/7] extcon: arizona: Ensure variables are set for
 headphone detection
Date: Sun, 21 Jun 2015 23:19:20 +0900
Message-ID: <CAGTfZH0U-Pvz37pPn-Cb4baGob2roeHKgzafr3_xNEozzgQLQA@mail.gmail.com>
References: <1434731014-19980-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
	<1434731014-19980-6-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Reply-To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434731014-19980-6-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
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
> The detecting flag really refers to the microphone detection stage and
> as such should be cleared before arizona_identify_headphones is called.
> Also the mic flag should be set before identify headphones is called as
> well.
>
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
>  drivers/extcon/extcon-arizona.c |   11 +++++++----
>  1 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
> index 8f0ef72..4c47eb2 100644
> --- a/drivers/extcon/extcon-arizona.c
> +++ b/drivers/extcon/extcon-arizona.c
> @@ -765,10 +765,11 @@ static void arizona_micd_timeout_work(struct work_struct *work)
>         mutex_lock(&info->lock);
>
>         dev_dbg(info->arizona->dev, "MICD timed out, reporting HP\n");
> -       arizona_identify_headphone(info);
>
>         info->detecting = false;
>
> +       arizona_identify_headphone(info);
> +
>         arizona_stop_mic(info);
>
>         mutex_unlock(&info->lock);
> @@ -834,6 +835,9 @@ static void arizona_micd_detect(struct work_struct *work)
>
>         /* If we got a high impedence we should have a headset, report it. */
>         if (info->detecting && (val & ARIZONA_MICD_LVL_8)) {
> +               info->mic = true;
> +               info->detecting = false;
> +
>                 arizona_identify_headphone(info);
>
>                 ret = extcon_set_cable_state_(info->edev,
> @@ -849,8 +853,6 @@ static void arizona_micd_detect(struct work_struct *work)
>                                 ret);
>                 }
>
> -               info->mic = true;
> -               info->detecting = false;
>                 goto handled;
>         }
>
> @@ -863,10 +865,11 @@ static void arizona_micd_detect(struct work_struct *work)
>         if (info->detecting && (val & MICD_LVL_1_TO_7)) {
>                 if (info->jack_flips >= info->micd_num_modes * 10) {
>                         dev_dbg(arizona->dev, "Detected HP/line\n");
> -                       arizona_identify_headphone(info);
>
>                         info->detecting = false;
>
> +                       arizona_identify_headphone(info);
> +
>                         arizona_stop_mic(info);
>                 } else {
>                         info->micd_mode++;
> --
> 1.7.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
