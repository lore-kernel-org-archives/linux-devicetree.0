From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] devicetree: Document the max31760 device binding.
Date: Mon, 10 Apr 2017 10:42:49 -0500
Message-ID: <20170410154249.r77b6vf3ctzn4kua@rob-hp-laptop>
References: <20170404192034.158901-1-john@jmuir.com>
 <20170404192034.158901-3-john@jmuir.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170404192034.158901-3-john-eXjPKP/gKhgAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Muir <john-eXjPKP/gKhgAvxtiuMwx3w@public.gmane.org>
Cc: Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mark Segal <segal-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 04, 2017 at 12:20:34PM -0700, John Muir wrote:
> Signed-off-by: John Muir <john-eXjPKP/gKhgAvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/hwmon/max31760.txt         | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/max31760.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/max31760.txt b/Documentation/devicetree/bindings/hwmon/max31760.txt
> new file mode 100644
> index 000000000000..43787a77c322
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/max31760.txt
> @@ -0,0 +1,58 @@
> +MAX31760 fan controller
> +-----------------------
> +
> +This device supports I2C only. Many properties of this device are configurable
> +thorugh the hwmon interface. See also Documentation/hwmon/max31760.

I really think we need to describe the fans as separate nodes and 
preferably with a common binding. This is the second fan controller 
binding recently[1].

Features of the "hwmon interface" are not relevant to the binding. 
Bindings describe h/w.

> +
> +Required node properties:
> +- compatible : "maxim,max31760"
> +- reg : The I2C address of the device. This is 0x50 - 0x57 depending on the
> +	hardware configuration.
> +
> +Optional node properties:
> +- maxim,fan1-enabled		- 1 to enable, 0 to disable. Default: 1.
> +- maxim,fan2-enabled		- 1 to enable, 0 to disable. Default: 1.
> +- maxim,fan1-label		- String: Hwmon fan1_label.
> +- maxim,fan2-label		- String: Hwmon fan2_label.

Perhaps 2 fan sub nodes. reg for fan number, status for enabled, and 
label for label.

> +- maxim,fan-fail-full-only	- Set to 1 to assert a fan failure only when the
> +				  PWM is at 100%. Default: 0.

Make this a boolean.

> +- maxim,fan-rd-signal		- Set to 1 if fan(s) provide a rotation
> +				  detection (RD) signal, or 0 if the fan
> +				  generates square-wave pulses. Default: 0.

Make this a boolean.

> +- maxim,fan-rd-polarity		- 0: RD is low when the fan is running.
> +				  1: RD is high when the fan is running.
> +				  Only relevant when fan-rd-signal is 1.
> +				  Default: 0.
> +- maxim,fan-signal-enabled	- Set to 1 if externally driving FF/FS low
> +				  should force PWM output to 100%. Default: 0.
> +- maxim,fan-spin-up-enabled     - For fan startup: Set to 1 to set the PWM to
> +				  100% until tach is detected or two seconds
> +				  have passed before reducing to the target
> +				  value. Default: 0.
> +- maxim,pwm-polarity		- 0: 100% PWM is when PWM is high.
> +				  1: 100% PWM is when PWM is low.
> +				  Default: 0.
> +- maxim,pwm-pulse-stretch-enabled
> +				- 1 to enable PWM pulse stretching, 0 to
> +				  disable. Default: 0.
> +- maxim,pwm-zero-fan-can-fail	- 0: Fan failure detection disabled when PWM is
> +				     ramping to 0%.
> +				  1: Fan failure detection enabled for all PWM
> +				     values.
> +				  Default: 0.

All these can be boolean...

> +- maxim,temp1-label		- String: Hwmon temp1_label.
> +- maxim,temp2-label		- String: Hwmon temp2_label.
> +- maxim,temp2-ideality		- Set ideality factor for the remote temperature
> +				  sensor. Integer with range 0 to 63,
> +				  representing a multiplication factor of 0.9844
> +				  to 1.0489. Default: 24 (1.0080).

No maxim,temp1-ideality? Not sure what to do with these, but perhaps 
also as sub-nodes. Surely we have some bindings already for devices with 
multiple temp sensors. Don't invent something custom here.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
