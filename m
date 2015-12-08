From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] doc: dt-binding: generic onboard USB HUB
Date: Tue, 8 Dec 2015 00:30:59 -0200
Message-ID: <CAOMZO5DfBW3hxp5odbefLQCmkocPy=LypVW5HJWzDkF__WD_sg@mail.gmail.com>
References: <1449538670-7954-1-git-send-email-peter.chen@freescale.com>
	<1449538670-7954-3-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449538670-7954-3-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Patryk Kowalczyk <patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 7, 2015 at 11:37 PM, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> Add dt-binding documentation for generic onboard USB HUB.
>
> Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  .../bindings/usb/generic-onboard-hub.txt           | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/generic-onboard-hub.txt
>
> diff --git a/Documentation/devicetree/bindings/usb/generic-onboard-hub.txt b/Documentation/devicetree/bindings/usb/generic-onboard-hub.txt
> new file mode 100644
> index 0000000..ea92205
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/generic-onboard-hub.txt
> @@ -0,0 +1,28 @@
> +Generic Onboard USB HUB
> +
> +Required properties:
> +- compatible: should be "generic-onboard-hub"
> +
> +Optional properties:
> +- clocks: the input clock for HUB.
> +
> +- clock-names: Should be "external_clk"
> +
> +- hub-reset-gpios: Should specify the GPIO for reset.
> +
> +- hub-reset-active-high: the active reset signal is high, if this property is
> +  not set, the active reset signal is low.
> +
> +- hub-reset-duration-us: the duration for assert reset signal, the time unit
> +  is microsecond.
> +
> +Example:
> +
> +       usb_hub1 {
> +               compatible = "generic-onboard-hub";
> +               clocks = <&clks IMX6QDL_CLK_CKO>;
> +               clock-names = "external_clk";
> +               hub-reset-gpios = <&gpio7 12 0>;
> +               hub-reset-active-high;

I think you could drop the 'hub-reset-active-high' property and do
like this instead:

hub-reset-gpios = <&gpio7 12 GPIO_ACTIVE_HIGH>;

or

hub-reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
