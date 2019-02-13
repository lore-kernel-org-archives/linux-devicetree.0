Return-Path: <robherring2@gmail.com>
Date: Wed, 13 Feb 2019 16:23:26 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: i2c: I2C binding for Mellanox
 BlueField SoC
Message-ID: <20190213222326.GA23442@bogus>
References: <cover.1548866223.git.kblaiech@mellanox.com>
 <cf04b305725aacf0a52b3529131e510b1fd6565a.1548866223.git.kblaiech@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf04b305725aacf0a52b3529131e510b1fd6565a.1548866223.git.kblaiech@mellanox.com>
To: Khalil Blaiech <kblaiech@mellanox.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, David Woods <dwoods@mellanox.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, arm-soc <arm@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jan 30, 2019 at 01:01:32PM -0500, Khalil Blaiech wrote:
> Added device tree bindings documentation for Mellanox BlueField
> I2C SMBus controller.
> 
> Reviewed-by: David Woods <dwoods@mellanox.com>
> Signed-off-by: Khalil Blaiech <kblaiech@mellanox.com>
> ---
>  .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
> new file mode 100644
> index 0000000..db20b23
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
> @@ -0,0 +1,71 @@
> +Device tree configuration for the Mellanox I2C SMBus on BlueField SoCs
> +
> +Required Properties:
> +- reg :		address offset and length of the device registers. The
> +		registers consists of a set of dedicated and shared
> +		resources:
> +
> +			1: Smbus block registers.
> +			2: Cause master registers.
> +			3: Cause slave registers.
> +

> +		The BlueField SoCs includes three I2C bus controllers;
> +		the set of resources <address length> must be defined
> +		as follow:
> +
> +		BlueField 1:
> +
> +			* i2c bus 0:
> +		    	<0x02804000 0x800>	/* Smbus[0]        */
> +		    	<0x02801200 0x020>	/* Cause Master[0] */
> +		    	<0x02801260 0x020>	/* Cause Slave[0]  */
> +
> +			* i2c bus 1:
> +		    	<0x02804800 0x800>	/* Smbus[1]        */
> +		    	<0x02801220 0x020>	/* Cause Master[1] */
> +		    	<0x02801280 0x020>	/* Cause Slave[1]  */
> +
> +			* i2c bus 2:
> +		    	<0x02805000 0x800>	/* Smbus[2]        */
> +		    	<0x02801240 0x020>	/* Cause Master[2] */
> +		    	<0x028012a0 0x020>	/* Cause Slave[2]  */
> +
> +		BlueField 2:
> +
> +			* i2c bus 0:
> +		    	<0x02804000 0x800>	/* Smbus[0]        */
> +		    	<0x02801400 0x020>	/* Cause Master[0] */
> +		    	<0x02801540 0x020>	/* Cause Slave[0]  */
> +
> +			* i2c bus 1:
> +		    	<0x02804800 0x800>	/* Smbus[1]        */
> +		    	<0x02801420 0x020>	/* Cause Master[1] */
> +		    	<0x02801560 0x020>	/* Cause Slave[1]  */
> +
> +			* i2c bus 2:
> +		    	<0x02805000 0x800>	/* Smbus[2]        */
> +		    	<0x02801440 0x020>	/* Cause Master[2] */
> +		    	<0x02801580 0x020>	/* Cause Slave[2]  */

You can remove all these addresses from the binding. The important part 
is just that it is 3 entries and what each entry is.

> +
> +- compatible : 	should be "mellanox,i2c-mlxbf1" or "mellanox,i2c-mlxbf2".

Usually we put this first.

> +- interrupts : 	interrupt number.

Some space before tab here.

> +
> +Optional Properties:
> +- clock-frequency :	bus frequency used to configure timing registers;
> +			allowed values are 100000, 400000 and 1000000;
> +			those are expressed in Hz.

What's the default if not present?

> +
> +Example:
> +
> +aliases {
> +	i2c0 = &i2c_0
> +};

Don't need to show aliases in examples.

> +
> +i2c_0: i2c {

i2c@2804000

> +	compatible = "mellanox,i2c-mlxbf1";
> +	reg = <0x02804000 0x800>,
> +	      <0x02801200 0x020>,
> +	      <0x02801260 0x020>;
> +	interrupts = <57>;
> +	clock-frequency = <100000>;
> +};
> -- 
> 2.1.2
> 
