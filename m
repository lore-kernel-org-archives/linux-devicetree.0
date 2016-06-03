From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] usb: ohci-at91: Forcibly suspend ports while USB
 suspend
Date: Thu, 2 Jun 2016 20:54:09 -0500
Message-ID: <20160603015409.GA18051@rob-hp-laptop>
References: <1464755400-6825-1-git-send-email-wenyou.yang@atmel.com>
 <1464755400-6825-2-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1464755400-6825-2-git-send-email-wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 01, 2016 at 12:29:59PM +0800, Wenyou Yang wrote:
> In order to the save power consumption, as a workaround, suspend
> forcibly the USB PORTA/B/C via set the SUSPEND_A/B/C bits of OHCI
> Interrupt Configuration Register in the SFRs while OHCI USB suspend.
> 
> This suspend operation must be done before the USB clock is disabled,
> resume after the USB clock is enabled.
> 
> Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
> 
> Changes in v2:
>  - Add compatible to support forcibly suspend the ports.
>  - Add soc/at91/at91_sfr.h to accommodate the defines.
>  - Add error checking for .sfr_regmap.
>  - Remove unnecessary regmap_read() statement.
> 
>  .../devicetree/bindings/usb/atmel-usb.txt          |  5 +-
>  drivers/usb/host/ohci-at91.c                       | 80 +++++++++++++++++++++-
>  include/soc/at91/at91_sfr.h                        | 29 ++++++++
>  3 files changed, 111 insertions(+), 3 deletions(-)
>  create mode 100644 include/soc/at91/at91_sfr.h
> 
> diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
> index 5883b73..3e3e58a 100644
> --- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
> +++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
> @@ -3,8 +3,9 @@ Atmel SOC USB controllers
>  OHCI
>  
>  Required properties:
> - - compatible: Should be "atmel,at91rm9200-ohci" for USB controllers
> -   used in host mode.
> + - compatible: Should be one of the following
> +	       "atmel,at91rm9200-ohci" for USB controllers used in host mode.
> +	       "atmel,sama5d2-ohci" for SAMA5D2 which can force to suspend.

That may be why you need this now, but that is irrelevant to having a 
chip specific compatible string.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
