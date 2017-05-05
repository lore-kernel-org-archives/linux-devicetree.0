From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/5] mailbox: Make startup and shutdown ops optional
Date: Fri, 5 May 2017 16:03:31 +0530
Message-ID: <CABb+yY12=OksvgMeo+fT+R8m=_Lv+39EQwW0VGsnKuHRBM-5uw@mail.gmail.com>
References: <20170504200539.27027-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170504200539.27027-1-bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, May 5, 2017 at 1:35 AM, Bjorn Andersson
<bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Some mailbox hardware doesn't have to perform any additional operations
> on startup of shutdown, so make these optional.
>
Thanks, makes sense.

> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index 4671f8a12872..c88de953394a 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -137,6 +137,20 @@ static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
>         return HRTIMER_NORESTART;
>  }
>
> +static int mbox_startup(struct mbox_chan *chan)
> +{
> +       if (chan->mbox->ops->startup)
> +               return chan->mbox->ops->startup(chan);
> +
> +       return 0;
> +}
> +
> +static void mbox_shutdown(struct mbox_chan *chan)
> +{
> +       if (chan->mbox->ops->shutdown)
> +               chan->mbox->ops->shutdown(chan);
> +}
> +
These functions are going to be called from exactly one place. So
maybe we simply do the check before startup/shutdown calls?

thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
