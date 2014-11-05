From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v1 1/3] usb: phy: device-tree documentation for gpio-vbus
Date: Wed, 05 Nov 2014 15:59:21 +0300
Message-ID: <545A1F29.6000706@cogentembedded.com>
References: <1414951910-16075-1-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414951910-16075-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 11/2/2014 9:11 PM, Robert Jarzmik wrote:

> Add documentation for device-tree binding of the generic gpio-vbus phy
> controller.

> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>   .../devicetree/bindings/phy/gpio-vbus.txt          | 23 ++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/phy/gpio-vbus.txt

> diff --git a/Documentation/devicetree/bindings/phy/gpio-vbus.txt b/Documentation/devicetree/bindings/phy/gpio-vbus.txt
> new file mode 100644
> index 0000000..ffcfd35
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/gpio-vbus.txt
> @@ -0,0 +1,23 @@
> +GPIO VBus phy

    It's either VBUS or Vbus.

> +=============
> +
> +gpio-vbus is a phy controller supporting VBus detection and pullup activation on

    s/phy/PHY/.

> +GPIOs.
> +
> +Required properties:
> +- compatible : should be "generic,phy-gpio-vbus"

    "generic," not needed.

> +- #phy-cells : from the generic PHY bindings, must be 1.

    However, you don't specify it in the example. It's also not clear why you 
need 1, not 0.

> +- gpios      : set of 2 gpio properties (see gpio.txt for gpio properties format)
> +               first gpio is required, it's the VBus sensing input gpio
> +	       second gpio is optional, it's the D+ pullup controlling output
> +	       gpio

    s/gpio/GPIO/.

> +
> +Optional properties:
> +- wakeup     : boolean, if true the VBus gpio will wakeup the platform
> +
> +Example:
> +	usb2phy : gpio-vbus@13 {

    Please use the generic node name ("usb-phy") in order to comply with the 
ePAPR standard.

> +		compatible = "generic,phy-gpio-vbus";
> +		gpios = <&gpio 13 GPIO_ACTIVE_LOW>;
> +		wakeup;
> +	};

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
