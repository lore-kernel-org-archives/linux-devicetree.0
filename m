From: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 4/5] w1: add a callback to call slave when a new
 device is connected
Date: Wed, 26 Oct 2016 10:42:28 -0600
Message-ID: <CANLsYkxfnF9-H9mawt3BWTgy5gjf8Qs3O6iSRGiLQ=8vfYACTQ@mail.gmail.com>
References: <20161026145756.21689-1-antoine.tenart@free-electrons.com> <20161026145756.21689-5-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161026145756.21689-5-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 26 October 2016 at 08:57, Antoine Tenart
<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> This patch adds the possibility for slave drivers to register a
> callback, to be called whenever a new device matching the slave ID
> is connected.
>
> Signed-off-by: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/w1/w1.c        | 10 ++++++++++
>  drivers/w1/w1_family.h |  2 ++
>  2 files changed, 12 insertions(+)
>
> diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
> index 80d0cc4e6e7f..7010ffd1ea93 100644
> --- a/drivers/w1/w1.c
> +++ b/drivers/w1/w1.c
> @@ -659,6 +659,16 @@ static int w1_family_notify(unsigned long action, struct w1_slave *sl)
>                                 return err;
>                         }
>                 }
> +               if (fops->callback) {
> +                       err = fops->callback(sl);
> +                       /*
> +                        * Do not return an error as the slave driver correctly
> +                        * probed.
> +                        */

I don't get this part.  What's the point of calling a callback if a
failure is not important - maybe I'm just missing something.

> +                       if (err)
> +                               dev_err(&sl->dev,
> +                                       "callback call failed. err=%d\n", err);
> +               }
>
>                 break;
>         case BUS_NOTIFY_DEL_DEVICE:
> diff --git a/drivers/w1/w1_family.h b/drivers/w1/w1_family.h
> index 10a7a0767187..5e165babc6f3 100644
> --- a/drivers/w1/w1_family.h
> +++ b/drivers/w1/w1_family.h
> @@ -55,11 +55,13 @@ struct w1_slave;
>   * @add_slave: add_slave
>   * @remove_slave: remove_slave
>   * @groups: sysfs group
> + * @callback: called when a new device is discovered
>   */
>  struct w1_family_ops
>  {
>         int  (* add_slave)(struct w1_slave *);
>         void (* remove_slave)(struct w1_slave *);
> +       int  (* callback)(struct w1_slave *);
>         const struct attribute_group **groups;
>  };
>
> --
> 2.10.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
