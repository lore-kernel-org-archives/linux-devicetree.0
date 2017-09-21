From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5] iio: dac: ds4422/ds4424 dac driver
Date: Thu, 21 Sep 2017 18:26:59 -0500
Message-ID: <20170921232659.yfvdkynzlqeetuau@rob-hp-laptop>
References: <DM5PR11MB18650DDCB6E1D4D2EA0C327AFD600@DM5PR11MB1865.namprd11.prod.outlook.com>
 <20170919072341.10249-1-Ismail.Kose@maximintegrated.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170919072341.10249-1-Ismail.Kose-zxKO94PEStzToO697jQleEEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ismail Kose <Ismail.Kose-zxKO94PEStzToO697jQleEEOCMrvLtNR@public.gmane.org>
Cc: "Ismail H. Kose" <ihkose-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Maxime Roussin-Belanger <maxime.roussinbelanger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jean-Francois Dagenais <jeff.dagenais-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 19, 2017 at 12:23:32AM -0700, Ismail Kose wrote:
> From: "Ismail H. Kose" <ihkose-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> This patch provides an iio device driver for DS4422/DS4424 chips that support
> two/four channel 7-bit Sink/Source Current DAC.
> 
> Signed-off-by: Ismail Kose <Ismail.Kose-zxKO94PEStzToO697jQleEEOCMrvLtNR@public.gmane.org>
> ---
> v5:
> 	* Removed unused variable
> v4:
> 	* Removed unnecessary code and space optimization
> 	* Alphabetic order in Kcobfig and Makefile
> v3:
> 	* Removed iio-map and platform file support
> 	* Removed ds4424.h file
> 	* Fixed ADC value read bug
> 	* Removed confused comments
> 	* Added device tree binding file
> 	* Fixed bugs in probe and read function
> 
> v2:
> 	* Fixed coding style and removed unncessary code
> 	* Removed min/max rfs, ifs-scale, etc values from device tree
> 	* Removed unused code, definitions and some comments
> 	* Removed regulator control and made standard structure
> 	* Removed data processing and channel scale
> 	* Removed device tree binding file
> 
>  .../devicetree/bindings/iio/dac/ds4424.txt         |  20 ++

It's preferred to split bindings to separate patch.

>  drivers/iio/dac/Kconfig                            |   9 +
>  drivers/iio/dac/Makefile                           |   1 +
>  drivers/iio/dac/ds4424.c                           | 394 +++++++++++++++++++++
>  4 files changed, 424 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/dac/ds4424.txt
>  create mode 100644 drivers/iio/dac/ds4424.c
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/ds4424.txt b/Documentation/devicetree/bindings/iio/dac/ds4424.txt
> new file mode 100644
> index 000000000000..840b11e1d813
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/ds4424.txt
> @@ -0,0 +1,20 @@
> +Maxim Integrated DS4422/DS4424 7-bit Sink/Source Current DAC Device Driver
> +
> +Datasheet publicly available at:
> +https://datasheets.maximintegrated.com/en/ds/DS4422-DS4424.pdf
> +
> +Required properties:
> +	- compatible: Must be "maxim,ds4422" or "maxim,ds4424"

One compatible per line please.

> +	- reg: Should contain the DAC I2C address
> +	- maxim,rfs-resistors-ohms: Should contain reference resistor

...reference resistor ohms

> +
> +Optional properties:
> +	- vcc-supply: Power supply is optional. If not defined, driver will ignore it.
> +
> +Example:
> +	ds4224@10 {
> +		compatible = "maxim,ds4424";
> +		reg = <0x10>; /* When A0, A1 pins are ground */
> +		vcc-supply = "dac_vcc_3v3";

This is not how the regulator binding works.

> +		maxim,rfs-resistors-ohms = <400 800 1000 1600>;

The description needs to explain this is 4 values.

> +	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
