From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] gpio: sx150x: Update OF configuration
Date: Mon, 20 Jun 2016 10:57:44 -0500
Message-ID: <20160620155744.GA1419@rob-hp-laptop>
References: <1466157063-10955-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1466157063-10955-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 17, 2016 at 11:51:03AM +0200, Neil Armstrong wrote:
> In case of OF probing, the driver fails to initialize :
> - gpio_chip.base must be -1
> - irq_summary must be either -1 or valid
> - There is no way to use the other configurations
> 
> Add OF parsing function to complete the HW configuration, make
> OF configuration dynamic instead of static with #defines and
> update the DT bindings.
> 
> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/gpio/gpio-sx150x.txt       | 17 ++++++
>  drivers/gpio/gpio-sx150x.c                         | 65 +++++++++++++++++++---
>  2 files changed, 75 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt b/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
> index c809acb..d2b5bb3 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
> @@ -22,6 +22,17 @@ Required properties:
>  
>  - interrupt-controller: Marks the device as a interrupt controller.
>  
> +Optional Properties:
> +- oscio-is-gpo: Boolean, Indicated the oscio pin can be used as additional
> +		output gpo port.
> +

> +- pull-up-ports: Array of port numbers which must have pull-up enabled.
> +- pull-down-ports: Array of port numbers which must have pull-down enabled.
> +- open-drain-ports: Array of port numbers which must be configured as open-drain,
> +			Push-Pull mode is default.
> +- polarity-invert-ports: Array of port numbers whih port polarity must be inverted.

Seems like these should be done in a common way.

If not, they all need a vendor prefix.

> +- probe-reset: Boolean, Indicates the expander must be resetted.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
