From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC v2 2/3] iio: bindings: Add TI afe4403 heart monitor documentation
Date: Sat, 08 Nov 2014 11:48:42 +0000
Message-ID: <545E031A.7050302@kernel.org>
References: <1415287106-13491-1-git-send-email-dmurphy@ti.com> <1415287106-13491-2-git-send-email-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415287106-13491-2-git-send-email-dmurphy-l0cyMroinI0@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, k.wrona-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/11/14 15:18, Dan Murphy wrote:
> Add the TI afe4403 heart monitor device tree
> binding documentation.  heart_monitors directory
> created under iio.
> 
> Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
As a device tree binding this MUST go to the device tree list
and maintainers.  Cc'd.

I suspect from my review of the driver that there will be a
whole load more stuff to go in here...

> ---
> 
> v2 - Updated per v1 comments - http://marc.info/?l=linux-iio&m=141331404132215&w=2
> 
>  .../bindings/iio/heart_monitor/ti_afe4403.txt      | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/heart_monitor/ti_afe4403.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/heart_monitor/ti_afe4403.txt b/Documentation/devicetree/bindings/iio/heart_monitor/ti_afe4403.txt
> new file mode 100644
> index 0000000..cf75b5a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/heart_monitor/ti_afe4403.txt
> @@ -0,0 +1,23 @@
> +* Texas Instruments - AFE4403 Heart rate and Pulse Oximeter
> +
> +The device consists of a low-noise receiver channel
> +with an integrated analog-to-digital converter (ADC),
> +an LED transmit section, and diagnostics for sensor and LED fault detection.
> +
> +Required properties:
> +  - compatible: Must contain "ti,afe4403".
> +  - ste-gpio: GPIO for the spi control line
> +  - data-ready-gpio: GPIO interrupt when the afe4403 has data
Does this actually need to be a gpio?  Doesn't look like it from the driver.
As such should be handled as a generic interrupt both here and in the driver.

> +  - led-supply: Chip supply to the device
> +
> +Optional properties:
> +  - reset-gpio: GPIO used to reset the device via HW
> +
> +Example:
> +
> +&heart_rate {
> +	compatible = "ti,afe4403";
> +	ste-gpio = <&gpio1 29 GPIO_ACTIVE_HIGH>;
> +	data-ready-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
> +	led-supply = <&vbat>;
> +};
> 
