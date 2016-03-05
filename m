From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] iio: dac: Add support for the AD5592R/AD5593R
 ADCs/DACs
Date: Fri, 4 Mar 2016 22:29:52 -0600
Message-ID: <20160305042952.GA13525@rob-hp-laptop>
References: <1457009883-4017-1-git-send-email-michael.hennerich@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457009883-4017-1-git-send-email-michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 03, 2016 at 01:58:03PM +0100, michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org wrote:
> From: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
> 
> This patch adds support for the AD5592R (spi) and AD5593R (i2c)
> ADC/DAC devices.
> 
> Signed-off-by: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>

[...]

> +AD5592R Example:
> +
> +	#include <dt-bindings/iio/adi,ad5592r.h>
> +
> +	vref: regulator-vref {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vref-ad559x";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	ad5592r@0 {
> +		#size-cells = <0>;
> +		#address-cells = <1>;
> +		compatible = "adi,ad5592r";
> +		reg = <0>;
> +		spi-max-frequency = <1000000>;
> +		spi-cpol;
> +
> +		vref-supply = <&vref>; /* optional */
> +		reset-gpios = <&gpio0 86 0>;  /* optional */
> +
> +		channel@0 {
> +			reg = <0>;
> +			mode = <CH_MODE_DAC>;

You are missing the vendor prefixes thoughout.
