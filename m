From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] hwmon: (adcxx) add devictree bindings
 documentation
Date: Sat, 17 Nov 2018 08:40:41 -0600
Message-ID: <20181117144040.GA8016@bogus>
References: <20181115135013.30723-1-fe@dev.tdt.de>
 <20181115135013.30723-2-fe@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181115135013.30723-2-fe@dev.tdt.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <fe@dev.tdt.de>
Cc: jdelvare@suse.com, linux@roeck-us.net, mark.rutland@arm.com, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 15, 2018 at 02:50:12PM +0100, Florian Eckert wrote:
> Document the devicetree bindings for the adcxx.
> 
> Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> ---
>  Documentation/devicetree/bindings/hwmon/adcxx.txt | 24 +++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adcxx.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adcxx.txt b/Documentation/devicetree/bindings/hwmon/adcxx.txt
> new file mode 100644
> index 000000000000..a94a5fe21b6d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adcxx.txt
> @@ -0,0 +1,24 @@
> +adcxx properties

Needs a better description of what this h/w is.

ADCs go in iio/adc/

> +
> +Required properties:
> +- compatible: Must be one of the following:
> +	- "national,adcxx1s" for adcxx1s
> +	- "national,adcxx2s" for adcxx2s
> +	- "national,adcxx4s" for adcxx4s
> +	- "national,adcxx8s" for adcxx8s

Don't use wildcards in compatible strings.

> +- reg: SPI address for chip
> +
> +Optional properties:
> +
> +- vref-supply
> +  The external reference in microvolt for this device is set to this value.
> +  If it does not exists the reference will be set to 3300000uV (3.3V).
> +
> +Example:
> +
> +adc@6 {
> +	compatible = "national,adcxx2s";
> +	reg = <6 0>;

? SPI addresses are a single cell.

> +	spi-max-frequency = <1000000>;
> +	vref-supply = <&vref>;
> +};
> -- 
> 2.11.0
> 
