From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] dt/bindings: Add bindings for JC-42.4 compatible
 temperature sensors
Date: Tue, 5 Jul 2016 10:48:11 -0500
Message-ID: <20160705154811.GA3982@rob-hp-laptop>
References: <1467479142-8249-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467479142-8249-1-git-send-email-linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 02, 2016 at 10:05:42AM -0700, Guenter Roeck wrote:
> Provide generic bindings for all Jedec JC-42.4 compatible temperature
> sensor chips.
> 
> Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> ---
> RFC to address:
> - Is "jc-42-4" ok to use for JC-42.4 ?
> - JC42.4 really specifies an SPD EEPROM with included temperature sensor.

That would be at a different address?

>   Is "jedec,jc42-4" appropriate, or should it rather be something like
>   "jedec,jc-42-4-sensor" ?

If yes, then probably the latter. Though I would do "temp" rather than 
"sensor".

Also, "-42.4" is fine.
 
>  Documentation/devicetree/bindings/hwmon/jc42.txt | 42 ++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/jc42.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/jc42.txt b/Documentation/devicetree/bindings/hwmon/jc42.txt
> new file mode 100644
> index 000000000000..2bd604a93430
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/jc42.txt
> @@ -0,0 +1,42 @@
> +Properties for Jedec JC-42.4 compatible temperature sensors
> +
> +Required properties:
> +- compatible: May include a device-specific string consisting of the
> +	      manufacturer and the name of the chip. A list of supported
> +	      chip names follows.
> +	      Must include "jedec,jc-42-4" for any Jedec JC-42.4 compatible
> +	      temperature sensor.
> +
> +	      Supported chip names:
> +		adt7408
> +		at30ts00
> +		at30tse004
> +		cat6095
> +		cat34ts02
> +		max6604
> +		mcp9804
> +		mcp9805
> +		mcp9808
> +		mcp98243
> +		mcp98244
> +		mcp9843
> +		se97
> +		se98
> +		stts2002
> +		stts2004
> +		stts3000
> +		stts424
> +		stts424e
> +		tse2002
> +		tse2004
> +		ts3000
> +		ts3001

These are all vendor independent names?

> +
> +- reg: I2C address
> +
> +Example:
> +
> +temp-sensor@1a {
> +	compatible = "jedec,jc-42-4";
> +	reg = <0x18>;
> +};
> -- 
> 2.5.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
