From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: dac: DS4424: add Maxim DS4422/DS4424 DAC driver
 support
Date: Mon, 26 Jun 2017 14:56:39 -0500
Message-ID: <20170626195639.ouc4ohznqc4vkmwj@rob-hp-laptop>
References: <20170623230404.2283-1-Ismail.Kose@maximintegrated.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170623230404.2283-1-Ismail.Kose-zxKO94PEStzToO697jQleEEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ismail Kose <Ismail.Kose-zxKO94PEStzToO697jQleEEOCMrvLtNR@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jeff.dagenais-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, fabrice.gasnier-qxv4g6HH51o@public.gmane.org, gwenhael.goavec-merou-W7CSdorvuhNZroRs9YW3xA@public.gmane.org, peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org, maxime.roussinbelanger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ihkose-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 23, 2017 at 04:04:04PM -0700, Ismail Kose wrote:
> From: "Ismail H. Kose" <ihkose-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Add iio driver for DS4422/DS4424 chips that support two/four channel 7-bit
> Sink/Source Current DAC.
> 
> The driver supports device tree and platfrom files for the configurations.
> 
> Datasheet publicly available at:
> https://datasheets.maximintegrated.com/en/ds/DS4422-DS4424.pdf
> 
> Signed-off-by: Ismail Kose <Ismail.Kose-zxKO94PEStzToO697jQleEEOCMrvLtNR@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/dac/ds4424.txt         |  41 ++

Please make the binding a separate patch.

>  drivers/iio/dac/Kconfig                            |   9 +
>  drivers/iio/dac/Makefile                           |   1 +
>  drivers/iio/dac/ds4424.c                           | 733 +++++++++++++++++++++
>  include/linux/iio/dac/ds4424.h                     |  29 +
>  5 files changed, 813 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/dac/ds4424.txt
>  create mode 100644 drivers/iio/dac/ds4424.c
>  create mode 100644 include/linux/iio/dac/ds4424.h
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/ds4424.txt b/Documentation/devicetree/bindings/iio/dac/ds4424.txt
> new file mode 100644
> index 000000000000..03c1b575a6db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/ds4424.txt
> @@ -0,0 +1,41 @@
> +Maxim Integrated DS4422/DS4424 DAC device driver

Bindings describe h/w not device drivers.

> +
> +Required properties:
> +	- compatible: Must be "maxim,ds4422" or "maxim,ds4424"
> +	- reg: Should contain the DAC I2C address
> +	- min_rfs, max_rfs: In order to get the correct processed data values,

Don't use '_' in property names, and these all need vendor prefixes.

> +		   these resistor values should be changed to the correct values
> +		   that match the user's system resistor values for RFS0 to RFS1.
> +		   Resistance values for rfs_resistor are listed in 100 Ohm units;
> +		   ie, 800 is 80K. Acceptable RFS values are 40K to 160K.

Just use ohms (adding a suffix). Perhaps do a 2 value property with min 
and max values.

> +	- ifs_scale: 61000*100 = 6100000 = 100,000,000 * .976/16
> +	- max_picoamp: Should contain DAC maximum pico amper value.

Add any new units to property-units.txt.

> +	- rfs_resistor: Should contain reference resistor

unit suffix?

> +	- iio map: Should contain IIO Map info

Can't have a space in property names.

> +
> +Optional properties:
> +	- vcc-supply: Power supply us optional. If not defined, driver will ignore it.
> +
> +Example:
> +	ds4224@10 {
> +		compatible = "maxim,ds4424";
> +		reg = <0x10>; /* When A0, A1 pins are ground */
> +		vcc-supply = "dac_vcc_3v3";
> +		max-picoamp = <200000000>; /* 200uA */
> +		ifs-scale = <61000>;
> +		/* In order to get the correct processed data values,
> +		   these resistor values should be changed to the correct values that match the
> +		   user's system resistor values for RFS0 to RFS1.
> +		   Resistance values for rfs_resistor are listed in 100 Ohm units;
> +		   ie, 800 is 80K. Acceptable RFS values are 40K to 160K.
> +		*/
> +		min-rfs = <400>;
> +		max-rfs = <1600>;
> +		rfs-resistors = <400 800 1000 1600>;
> +		dac-iio-map =

Doesn't match above doc.

> +		/*	consumer_dev_name, consumer_channel, adc_channel_label */
> +			"ds4424_dac-consumer-dev_name-1", "ds4424_dac1", "OUT1",
> +			"ds4424_dac-consumer-dev_name-2", "ds4424_dac2", "OUT2",
> +			"ds4424_dac-consumer-dev_name-3", "ds4424_dac3", "OUT3",
> +			"ds4424_dac-consumer-dev_name-4", "ds4424_dac4", "OUT4";
> +	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
