From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] dt-bindings: hwmon: Add lm75 documentation
Date: Thu, 31 Jan 2019 10:06:19 -0800
Message-ID: <20190131180619.GA17074@roeck-us.net>
References: <20190129065623.6771-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190129065623.6771-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org

On Tue, Jan 29, 2019 at 12:26:23PM +0530, Jagan Teki wrote:
> Add dt-binding documentation for lm75 hwmon sensor.
> 
> Currently documented for national,lm75 and st,stlm75 and
> rest might add when required.

Why ? The various properties are already implemented in the driver.
I don't see the value documenting only two of them.

I do see though that nxp,lm75, and nxp,lm75a are used but _not_
referenced in the driver.

If we start cleaning that up I think it would make more sense
to clean up everything, not just part of it.

Thanks,
Guenter

> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  Documentation/devicetree/bindings/hwmon/lm75.txt | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/lm75.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/lm75.txt b/Documentation/devicetree/bindings/hwmon/lm75.txt
> new file mode 100644
> index 000000000000..e384a3765f10
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/lm75.txt
> @@ -0,0 +1,15 @@
> +*LM75 hwmon sensor.
> +
> +Required properties:
> +- compatible: one of
> +	"national,lm75"
> +	"st,stlm75"
> +
> +- reg: I2C address
> +
> +Example:
> +
> +sensor@48 {
> +	compatible = "st,stlm75";
> +	reg = <0x48>;
> +};
