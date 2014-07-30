From: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH 4/4] usb: dwc2: add dr_mode support for dwc2
Date: Wed, 30 Jul 2014 19:05:51 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E0304844C2FA3@US01WEMBX2.internal.synopsys.com>
References: <1406683873-18194-1-git-send-email-kever.yang@rock-chips.com>
 <1406684129-18352-1-git-send-email-kever.yang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406684129-18352-1-git-send-email-kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org" <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "kishon-l0cyMroinI0@public.gmane.org" <kishon-l0cyMroinI0@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> From: Kever Yang [mailto:kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org]
> Sent: Tuesday, July 29, 2014 6:35 PM
> 
> Some devices with A female host port and without use of usb_id pin
> will need this for the otg controller works as device role
> during firmware period and works as host role in rich os.
> 
> Signed-off-by: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  drivers/usb/dwc2/core.c     |   13 +++++++++++++
>  drivers/usb/dwc2/core.h     |    2 ++
>  drivers/usb/dwc2/platform.c |    4 ++++
>  3 files changed, 19 insertions(+)
> 
> diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
> index 27d2c9b..6688951 100644
> --- a/drivers/usb/dwc2/core.c
> +++ b/drivers/usb/dwc2/core.c
> @@ -118,6 +118,7 @@ static int dwc2_core_reset(struct dwc2_hsotg *hsotg)
>  {
>  	u32 greset;
>  	int count = 0;
> +	u32 gusbcfg;
> 
>  	dev_vdbg(hsotg->dev, "%s()\n", __func__);
> 
> @@ -148,6 +149,18 @@ static int dwc2_core_reset(struct dwc2_hsotg *hsotg)
>  		}
>  	} while (greset & GRSTCTL_CSFTRST);
> 
> +	if (hsotg->dr_mode == USB_DR_MODE_HOST) {
> +		gusbcfg = readl(hsotg->regs+GUSBCFG);
> +		gusbcfg &= ~GUSBCFG_FORCEDEVMODE;
> +		gusbcfg |= GUSBCFG_FORCEHOSTMODE;
> +		writel(gusbcfg, hsotg->regs+GUSBCFG);
> +	} else if (hsotg->dr_mode == USB_DR_MODE_PERIPHERAL) {
> +		gusbcfg = readl(hsotg->regs+GUSBCFG);
> +		gusbcfg &= ~GUSBCFG_FORCEHOSTMODE;
> +		gusbcfg |= GUSBCFG_FORCEDEVMODE;
> +		writel(gusbcfg, hsotg->regs+GUSBCFG);
> +	}

Please put spaces around the '+' operator. Did you run these patches
through checkpatch?

> +
>  	/*
>  	 * NOTE: This long sleep is _very_ important, otherwise the core will
>  	 * not stay in host mode after a connector ID change!
> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> index 1efd10c..9fe960b 100644
> --- a/drivers/usb/dwc2/core.h
> +++ b/drivers/usb/dwc2/core.h
> @@ -501,6 +501,7 @@ struct dwc2_hw_params {
>   *                      a_peripheral and b_device=>b_host) this may not match
>   *                      the core, but allows the software to determine
>   *                      transitions
> + * @dr_mode:            requested mode of operation

Please expand this comment, e.g.
"Requested mode of operation (host/peripheral/dual-role)"

-- 
Paul

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
