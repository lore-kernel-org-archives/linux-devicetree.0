Return-Path: <SRS0=2LiM=NH=gmail.com=groeck7@kernel.org>
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 27 Oct 2018 10:27:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: Add adm127x documentation
Message-ID: <20181027172725.GA24915@roeck-us.net>
References: <20181017222710.254994-1-kunyi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181017222710.254994-1-kunyi@google.com>
To: Kun Yi <kunyi@google.com>
Cc: openbmc@lists.ozlabs.org, Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Oct 17, 2018 at 03:27:09PM -0700, Kun Yi wrote:
> adm127x are hot-swap controllers that allow a circuit board to be removed from
> or inserted into a live backplane. This patch adds the device tree
> bindings documentation.
> 
> Signed-off-by: Kun Yi <kunyi@google.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  .../devicetree/bindings/hwmon/adm1275.txt     | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adm1275.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adm1275.txt b/Documentation/devicetree/bindings/hwmon/adm1275.txt
> new file mode 100644
> index 000000000000..1ecd03f3da4d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adm1275.txt
> @@ -0,0 +1,25 @@
> +adm1275 properties
> +
> +Required properties:
> +- compatible: Must be one of the supported compatible strings:
> +	- "adi,adm1075" for adm1075
> +	- "adi,adm1272" for adm1272
> +	- "adi,adm1275" for adm1275
> +	- "adi,adm1276" for adm1276
> +	- "adi,adm1278" for adm1278
> +	- "adi,adm1293" for adm1293
> +	- "adi,adm1294" for adm1294
> +- reg: I2C address
> +
> +Optional properties:
> +
> +- shunt-resistor-micro-ohms
> +	Shunt resistor value in micro-Ohm
> +
> +Example:
> +
> +adm1272@10 {
> +	compatible = "adi,adm1272";
> +	reg = <0x10>;
> +	shunt-resistor-micro-ohms = <500>;
> +};
