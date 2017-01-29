From: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: distance: add dt binding for devantech-srf04
Date: Sun, 29 Jan 2017 10:19:31 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1701291015510.20492@pmeerw.net>
References: <20170128235814.GA4786@andreas>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170128235814.GA4786@andreas>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Klinger <ak-n176/SwNRljddJNmlsFzeA@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 29 Jan 2017, Andreas Klinger wrote:

> This patch adds dt binding for devantech ultrasonic ranger srf04.

comments below
 
> The vendor "devantech" was already added to the vendor list with 
> 	"[PATCH v4 1/3] iio: distance: srf08: add trivial DT binding"
> 
> Signed-off-by: Andreas Klinger <ak-n176/SwNRljddJNmlsFzeA@public.gmane.org>
> ---
>  .../bindings/iio/proximity/devantech-srf04.txt          | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt b/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt
> new file mode 100644
> index 000000000000..4ea29ef3ff89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt
> @@ -0,0 +1,17 @@
> +* Devantech SRF04 ultrasonic range finder
> +  Bit-banging driver
> +
> +Required properties:
> + - compatible:	Should be "devantech,srf04"
> + - trig-gpios:	Definition of the GPIO for the triggering input
> + - echo-gpios:	Definition of the GPIO for the echo

"for the echo"
maybe some more explanation? it sounds somewhat incomplete to me

in the driver you have "failed to get echo-gpiod", maybe it should be gpios there?

> +		needs to be an interrupt input
> +		See Documentation/devicetree/bindings/gpio/gpio.txt
> +
> +Example:
> +srf04@0 {
> +	compatible = "devantech,srf04";
> +	trig-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
> +	echo-gpios = <&gpio2  6 GPIO_ACTIVE_HIGH>;
> +};
> +
> 

-- 

Peter Meerwald-Stadler
+43-664-2444418 (mobile)
