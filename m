From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/2] devicetree: hwmon: Add bindings documentation for
 HIH6130
Date: Thu, 3 Jan 2019 20:26:36 -0800
Message-ID: <20190104042636.GA22831@roeck-us.net>
References: <20181227151349.29753-1-andreas@kemnade.info>
 <20181227151349.29753-3-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181227151349.29753-3-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 27, 2018 at 04:13:49PM +0100, Andreas Kemnade wrote:
> Add bindings documentation for HIH6130 driver.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/hwmon/hih6130.txt | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/hih6130.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/hih6130.txt b/Documentation/devicetree/bindings/hwmon/hih6130.txt
> new file mode 100644
> index 000000000000..2c43837af4c2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/hih6130.txt
> @@ -0,0 +1,12 @@
> +Honeywell Humidicon HIH-6130 humidity/temperature sensor
> +--------------------------------------------------------
> +
> +Requires node properties:
> +- compatible : "honeywell,hi6130"
> +- reg : the I2C address of the device. This is 0x27.
> +
> +Example:
> +	hih6130@27 {
> +		compatible = "honeywell,hih6130";
> +		reg = <0x27>;
> +	};
