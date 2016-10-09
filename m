From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] Documentation: dtb: lm87: Add hwmon binding
 documentation.
Date: Sat, 8 Oct 2016 20:29:11 -0500
Message-ID: <20161009012911.GQ18158@rob-hp-laptop>
References: <20161004005123.2004-1-mahoda.ratnayaka@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161004005123.2004-1-mahoda.ratnayaka-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mahoda Ratnayaka <mahoda.ratnayaka-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 04, 2016 at 01:51:23PM +1300, Mahoda Ratnayaka wrote:
> This patch adds lm87 hwmon device tree node documentation.
> 
> Signed-off-by: Mahoda Ratnayaka <mahoda.ratnayaka-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
> ---
> 
> Notes:
>     Changes since v1:
>      As suggested include all the changes are moved in
>      to the same patch and the all the optional properties
>      are now defined instead of using a single variable to
>      indicate those properties.
> 
>  Documentation/devicetree/bindings/hwmon/lm87.txt | 29 ++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/lm87.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/lm87.txt b/Documentation/devicetree/bindings/hwmon/lm87.txt
> new file mode 100644
> index 0000000..ac578fff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/lm87.txt
> @@ -0,0 +1,29 @@
> +*LM87 hwmon sensor.
> +
> +Required properties:
> +- compatible: Should be
> +	"ti,lm87"
> +
> +- reg: I2C address
> +
> +optional properties:
> +- has-temp3: This configures pins 18 and 19 to be used as a second
> +             remote temperature sensing channel. By default the pins
> +             are configured as voltage input pins in0 and in5.
> +
> +- has-in6: When set, pin 5 is configured to be used as voltage input
> +           in6. Otherwise the pin is set as FAN1 input.
> +
> +- has-in7: When set, pin 6 is configured to be used as voltage input
> +           in6. Otherwise the pin is set as FAN2 input.

Should be in7 ^^^?

These need vendor prefixes. Or would they apply for multiple vendors of 
LM87?

> +
> +- has-vcc-5v: sets the nominal voltage for internal VCC measurement to 5V.
> +              Default is 3.3V.

This is set to what the supply voltage is? If so, use the regulator 
binding.

> +
> +Example:
> +
> +lm87@2e {
> +	compatible = "ti,lm87";
> +	reg = <0x2e>;
> +	has-temp3;
> +};
> -- 
> 2.10.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
