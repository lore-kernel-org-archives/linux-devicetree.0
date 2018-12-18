Return-Path: <robherring2@gmail.com>
Date: Tue, 18 Dec 2018 09:53:04 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: I2C binding for Mellanox
 BlueField SoC
Message-ID: <20181218155304.GA31027@bogus>
References: <cover.1543941145.git.kblaiech@mellanox.com>
 <559a79756c9da9a7b188ffa141a2056a83c60de6.1543941145.git.kblaiech@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <559a79756c9da9a7b188ffa141a2056a83c60de6.1543941145.git.kblaiech@mellanox.com>
To: Khalil Blaiech <kblaiech@mellanox.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, David Woods <dwoods@mellanox.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Dec 04, 2018 at 12:40:58PM -0500, Khalil Blaiech wrote:
> Added device tree bindings documentation for Mellanox BlueField
> I2C SMBus controller.
> 
> Reviewed-by: David Woods <dwoods@mellanox.com>
> Signed-off-by: Khalil Blaiech <kblaiech@mellanox.com>
> ---
>  .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
> new file mode 100644
> index 0000000..61a8037
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
> @@ -0,0 +1,67 @@
> +Device tree configuration for the Mellanox I2C SMBus on BlueField SoCs
> +
> +Required Properties:
> +- reg        :	address offset and length of the device registers. The
> +		registers consists of a set of dedicated and shared
> +	       	resources:

mixed tab and spaces.

> +
> +			1: Smbus block registers (dedicated)
> +			2: Cause master registers (dedicated)
> +			3: Cause slave registers (dedicated)
> +			4: Cause coalesce registers (shared)
> +			5: GPIO 0 registers (shared)
> +			6: CorePLL registers (shared)
> +
> +		The BlueField SoCs includes three I2C bus controllers;
> +		the set of resources <address length> must be defined
> +		as follow:
> +
> +		i2c bus 0:
> +		    <0x02804000 0x800>	/* Smbus[0]        */
> +		    <0x02801200 0x020>	/* Cause Master[0] */
> +		    <0x02801260 0x020>	/* Cause Slave[0]  */
> +		    <0x02801300 0x010>	/* Cause Coalesce  */
> +		    <0x02802000 0x100>	/* GPIO 0          */
> +		    <0x02800358 0x008>	/* CorePll         */
> +
> +		i2c bus 1:
> +		    <0x02804800 0x800>	/* Smbus[1]        */
> +		    <0x02801220 0x020>	/* Cause Master[1] */
> +		    <0x02801280 0x020>	/* Cause Slave[1]  */

> +		    <0x02801300 0x010>	/* Cause Coalesce  */
> +		    <0x02802000 0x100>	/* GPIO 0          */
> +		    <0x02800358 0x008>	/* CorePll         */

You should not have overlapping register addresses in DT. These should 
be separate nodes.

Rob
