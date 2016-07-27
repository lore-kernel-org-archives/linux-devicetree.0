From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] hwmon: (ltc4151) Add devicetree binding for ltc4151
Date: Wed, 27 Jul 2016 09:48:59 -0500
Message-ID: <20160727144859.GA18846@rob-hp-laptop>
References: <5795A144.2020300@roeck-us.net>
 <20160725115616.GA31557@makrotopia.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160725115616.GA31557-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>, Per =?iso-8859-1?Q?Dal=E9n?= <per.dalen-US8m9dViuwNWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 25, 2016 at 01:56:20PM +0200, Daniel Golle wrote:
> Signed-off-by: Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/hwmon/ltc4151.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ltc4151.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ltc4151.txt b/Documentation/devicetree/bindings/hwmon/ltc4151.txt
> new file mode 100644
> index 0000000..aec69ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ltc4151.txt
> @@ -0,0 +1,18 @@
> +ltc4151 properties

Add a brief description of what the chip does please.

> +
> +Required properties:
> +- compatible: Must be "lltc,ltc4151"
> +- reg: I2C address
> +
> +Optional properties:
> +
> +- shunt-resistor
> +	Shunt resistor value in micro-Ohm

Add a unit suffix (-micro-ohms).

> +
> +Example:
> +
> +ltc4151@6e {
> +	compatible = "lltc,ltc4151";
> +	reg = <0x6e>;
> +	shunt-resistor = <1500>;
> +};
> -- 
> 2.9.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
