From: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 3/5] w1: report errors returned by w1_family_notify
Date: Wed, 26 Oct 2016 10:39:16 -0600
Message-ID: <CANLsYkzrDr6EUfVfJp25a7ztiUyxoj9BqSRa6_7RHv+9joMM7w@mail.gmail.com>
References: <20161026145756.21689-1-antoine.tenart@free-electrons.com> <20161026145756.21689-4-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161026145756.21689-4-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 26 October 2016 at 08:57, Antoine Tenart
<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

GKH won't accept an empty commit log.

> Signed-off-by: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/w1/w1.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
> index bb34362e930a..80d0cc4e6e7f 100644
> --- a/drivers/w1/w1.c
> +++ b/drivers/w1/w1.c
> @@ -702,7 +702,9 @@ static int __w1_attach_slave_device(struct w1_slave *sl)
>                         dev_name(&sl->dev), err);
>                 return err;
>         }
> -       w1_family_notify(BUS_NOTIFY_ADD_DEVICE, sl);
> +       err = w1_family_notify(BUS_NOTIFY_ADD_DEVICE, sl);
> +       if (err)
> +               return err;
>
>         dev_set_uevent_suppress(&sl->dev, false);
>         kobject_uevent(&sl->dev.kobj, KOBJ_ADD);
> --
> 2.10.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
