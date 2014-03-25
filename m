From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 15/20] ARM: ux500: Add a vmmc regulator through DT for the
 poped eMMC for href
Date: Tue, 25 Mar 2014 22:45:01 +0100
Message-ID: <CACRpkdbFFqQdWXOHyV8qmxnd0z2CKK9gZFS0ys5YLm2dES7bgQ@mail.gmail.com>
References: <1395404057-27835-1-git-send-email-ulf.hansson@linaro.org>
	<1395404057-27835-16-git-send-email-ulf.hansson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395404057-27835-16-git-send-email-ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 21, 2014 at 1:14 PM, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> Add a node in DT for the proper regulator which means we can move away
> from the mmci platform data which currently holds the corresponding OCR
> mask.
>
> The mmci driver can then calculate the OCR mask based on the voltages
> supported by the regulator, instead of relying on the platform data.
>
> Signed-off-by: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/ste-href.dtsi |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/ste-href.dtsi b/arch/arm/boot/dts/ste-href.dtsi
> index be34beb..bf449de 100644
> --- a/arch/arm/boot/dts/ste-href.dtsi
> +++ b/arch/arm/boot/dts/ste-href.dtsi
> @@ -155,6 +155,7 @@
>                         bus-width = <8>;
>                         cap-mmc-highspeed;
>                         non-removable;
> +                       vmmc-supply = <&db8500_vsmps2_reg>;

Don't you need a similar oneliner to ste-snowball.dts?
That board is not including this file...

Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
