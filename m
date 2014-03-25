From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 04/20] mmc: mmci: Move signal directions bits into DT
 include file
Date: Tue, 25 Mar 2014 22:22:45 +0100
Message-ID: <CACRpkdZSr380FVHkx3uOMFKxKYsExoL-1WYhxVpirFMVc+T3Yw@mail.gmail.com>
References: <1395404057-27835-1-git-send-email-ulf.hansson@linaro.org>
	<1395404057-27835-5-git-send-email-ulf.hansson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395404057-27835-5-git-send-email-ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 21, 2014 at 1:14 PM, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> These bits is currently used from platform data, but will be needed
> from DT as well, so let's make them available.
>
> Signed-off-by: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
(...)
> +#define MCI_ST_DATA31DIREN     (1 << 5)
> +#define MCI_ST_FBCLKEN         (1 << 7)
> +#define MCI_ST_DATA74DIREN     (1 << 8)

Isn't MCI_ST_FBCLKEN = feedback clock enable and nothing
to do with directions really?

Or can you convince me ...

Maybe we should just have single strings for these
things in the binding instead, like:

@@ -118,6 +119,10 @@
                        bus-width = <4>;
                        mmc-cap-sd-highspeed;
                        mmc-cap-mmc-highspeed;
+                       st,signal-direction-data2;
+                       st,signal-direction-cmd;
+                       st,signal-direction-data0;
+                       st,feedback-clock-enable;
                        vmmc-supply = <&ab8500_ldo_aux3_reg>;
                        vqmmc-supply = <&vmmci>;
                        pinctrl-names = "default", "sleep";

And for FBCLKEN is that really something that should
be configured... in the device tree after all?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
