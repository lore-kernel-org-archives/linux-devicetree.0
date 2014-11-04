From: Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/3] usb: phy: device-tree documentation for gpio-vbus
Date: Tue, 4 Nov 2014 09:20:55 +0100
Message-ID: <CA+gwMcco4-aOHd4tQRFkUts+C9G5+ymxEhGXYB_FaeuBLQSBrw@mail.gmail.com>
References: <1414951910-16075-1-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414951910-16075-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Robert,

On Sun, Nov 2, 2014 at 7:11 PM, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org> wrote:
> Add documentation for device-tree binding of the generic gpio-vbus phy
> controller.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  .../devicetree/bindings/phy/gpio-vbus.txt          | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/gpio-vbus.txt
>
> diff --git a/Documentation/devicetree/bindings/phy/gpio-vbus.txt b/Documentation/devicetree/bindings/phy/gpio-vbus.txt
> new file mode 100644
> index 0000000..ffcfd35
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/gpio-vbus.txt
> @@ -0,0 +1,23 @@
> +GPIO VBus phy
> +=============
> +
> +gpio-vbus is a phy controller supporting VBus detection and pullup activation on
> +GPIOs.

Maybe duplicate the comment from the driver here how his is about
B peripheral only devices

> +Required properties:
> +- compatible : should be "generic,phy-gpio-vbus"

I'm not sure about the compatible value. I have not seen the "generic,"
vendor prefix, and all the other generic gpio-something bindings don't
use any prefix: "gpio-gate-clock", "gpio-leds", "gpio-beeper",
"pps-gpio", etc.

> +- #phy-cells : from the generic PHY bindings, must be 1.
> +- gpios      : set of 2 gpio properties (see gpio.txt for gpio properties format)
> +               first gpio is required, it's the VBus sensing input gpio
> +              second gpio is optional, it's the D+ pullup controlling output
> +              gpio
> +
> +Optional properties:
> +- wakeup     : boolean, if true the VBus gpio will wakeup the platform

The vbus_draw regulator should be part of this binding, I think.

> +Example:
> +       usb2phy : gpio-vbus@13 {
> +               compatible = "generic,phy-gpio-vbus";
> +               gpios = <&gpio 13 GPIO_ACTIVE_LOW>;
> +               wakeup;

This on the other hand might be too generic.
I'd like to see just wakeup used here, but the other bindings prefix
"linux," (or "gpio-key,").

regards
Philipp
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
