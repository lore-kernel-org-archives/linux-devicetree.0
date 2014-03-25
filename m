From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 04/20] mmc: mmci: Move signal directions bits into DT
 include file
Date: Wed, 26 Mar 2014 00:05:14 +0100
Message-ID: <CAPDyKFq=PUcFkT901W15KXThzS4cKMJvZToW3JDc3SkXck9VHA@mail.gmail.com>
References: <1395404057-27835-1-git-send-email-ulf.hansson@linaro.org>
	<1395404057-27835-5-git-send-email-ulf.hansson@linaro.org>
	<CACRpkdZSr380FVHkx3uOMFKxKYsExoL-1WYhxVpirFMVc+T3Yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZSr380FVHkx3uOMFKxKYsExoL-1WYhxVpirFMVc+T3Yw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 25 March 2014 22:22, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Mar 21, 2014 at 1:14 PM, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
>> These bits is currently used from platform data, but will be needed
>> from DT as well, so let's make them available.
>>
>> Signed-off-by: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> (...)
>> +#define MCI_ST_DATA31DIREN     (1 << 5)
>> +#define MCI_ST_FBCLKEN         (1 << 7)
>> +#define MCI_ST_DATA74DIREN     (1 << 8)
>
> Isn't MCI_ST_FBCLKEN = feedback clock enable and nothing
> to do with directions really?

You do have a point here, but then we are about to go into the details. :-)

What MCI_ST_FBCLKEN means, is that the internal logic in the primecell
can decide whether to use the signal from clockout pin or the
feebackclock pin, when its latching incoming signals on the data bus.

That said, we for sure need a dt binding for bit as well, since this
is not possible to figure out how pins are routed in runtime.

Also, I do believe it is very closely related to the other sigdir
pins, since it's all about how pins is being routed, even if it's as
you say - in this case a matter of signal directions.

So, I guess we have two options here; Either move the MCI_ST_FBCLKEN
out of the signal-direction binding and invent a separate binding for
it, or just keep them as is.

>
> Or can you convince me ...
>
> Maybe we should just have single strings for these
> things in the binding instead, like:
>
> @@ -118,6 +119,10 @@
>                         bus-width = <4>;
>                         mmc-cap-sd-highspeed;
>                         mmc-cap-mmc-highspeed;
> +                       st,signal-direction-data2;
> +                       st,signal-direction-cmd;
> +                       st,signal-direction-data0;
> +                       st,feedback-clock-enable;
>                         vmmc-supply = <&ab8500_ldo_aux3_reg>;
>                         vqmmc-supply = <&vmmci>;
>                         pinctrl-names = "default", "sleep";

I guess this is an option. To me it just seems a bit silly to have one
separate binding for each single bit, but maybe it becomes clearer?

>
> And for FBCLKEN is that really something that should
> be configured... in the device tree after all?

We need a DT binding, see above.

>
> Yours,
> Linus Walleij

Thanks for reviewing.

Please tell me your ideas on how to proceed, I happy to change to
whatever you like. :-)

Kind regards
Ulf Hansson
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
