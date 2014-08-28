From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] rtc: ds1307: add trickle charger device tree binding
Date: Thu, 28 Aug 2014 13:59:15 +0100
Message-ID: <20140828125915.GJ14650@leverpostej>
References: <20140828124237.GA29102@fi-ourus-dhcp00977.emea.nsn-net.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140828124237.GA29102-3P0KQDf13zYjNwtGTSXw41mm0B4v8B71Fo5piaCiEZ7R7s880joybQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matti Vaittinen <matti.vaittinen-OYasijW0DpE@public.gmane.org>
Cc: "a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org" <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org" <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org" <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, "jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org" <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org" <san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org>, "hs-ynQEQJNshbs@public.gmane.org" <hs-ynQEQJNshbs@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Sverdlin Alexander <alexander.sverdlin-OYasijW0DpE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 28, 2014 at 01:42:44PM +0100, Matti Vaittinen wrote:
> Patch adding support for specifying trickle charger setup from device
> tree. Patch is based on linux-next tree.
> 
> 
> Some DS13XX devices have "trickle chargers". Introduce a device tree binding
> for specifying the setup and register values.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen-OYasijW0DpE@public.gmane.org>
> ---
>  .../devicetree/bindings/i2c/trivial-devices.txt    |  1 -
>  .../devicetree/bindings/rtc/dallas,ds1339.txt      | 19 ++++++++++
>  drivers/rtc/rtc-ds1307.c                           | 44 ++++++++++++++++++++--
>  3 files changed, 59 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/dallas,ds1339.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> index 6af570e..e9206a4 100644
> --- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> +++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> @@ -35,7 +35,6 @@ catalyst,24c32		i2c serial eeprom
>  cirrus,cs42l51		Cirrus Logic CS42L51 audio codec
>  dallas,ds1307		64 x 8, Serial, I2C Real-Time Clock
>  dallas,ds1338		I2C RTC with 56-Byte NV RAM
> -dallas,ds1339		I2C Serial Real-Time Clock
>  dallas,ds1340		I2C RTC with Trickle Charger
>  dallas,ds1374		I2C, 32-Bit Binary Counter Watchdog RTC with Trickle Charger and Reset Input/Output
>  dallas,ds1631		High-Precision Digital Thermometer
> diff --git a/Documentation/devicetree/bindings/rtc/dallas,ds1339.txt b/Documentation/devicetree/bindings/rtc/dallas,ds1339.txt
> new file mode 100644
> index 0000000..9faf40e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/dallas,ds1339.txt
> @@ -0,0 +1,19 @@
> +* Dallas DS1339		I2C Serial Real-Time Clock
> +
> +Required properties:
> +- compatible: Should contain "dallas,ds1339".
> +- reg: I2C address for chip
> +
> +Optional properties:
> +- trickle_setup : Used Trickle Charger configuration,
> +        corresponding to 5 lowest bits in trickle charger register.

s/_/-/ in property names please.

What do these bits do? is there any documentation available?

Why do they need to be in the DT?

Why do we not have a higher-level description?

> +- trickle_reg   : Trickle charger register address. Defaults to 0x10 for ds1339.

Is this expected to change? Why does this need to be in the DT?

> +
> +Example:
> +	ds1339: rtc@68 {
> +		compatible = "dallas,ds1339";
> +        trickle_setup= <0x5>;
> +		reg = <0x68>;
> +	};
> +
> +
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index f03d5ba..f9b1244 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -126,9 +126,10 @@ struct chip_desc {
>  	u16			nvram_offset;
>  	u16			nvram_size;
>  	u16			trickle_charger_reg;
> +	u8		  trickle_charger_setup;
>  };
>  
> -static const struct chip_desc chips[last_ds_type] = {
> +static struct chip_desc chips[last_ds_type] = {
>  	[ds_1307] = {
>  		.nvram_offset	= 8,
>  		.nvram_size	= 56,
> @@ -835,13 +836,37 @@ ds1307_nvram_write(struct file *filp, struct kobject *kobj,
>  
>  /*----------------------------------------------------------------------*/
>  
> +static void trickle_charger_of_init(struct chip_desc *chip,
> +			struct device_node *node)
> +{
> +	int plen = 0;
> +	const uint32_t *setup;
> +	const uint32_t *reg;
> +
> +	setup = of_get_property(node, "trickle_setup" , &plen);
> +	if (plen != 4)
> +		goto out;
> +	chip->trickle_charger_setup = (u8)*setup;

This isn't endian-clean, and the casting is unnecessary.

Use the of_property_read_u32 accessor, with a u32 temporary variable.

> +	plen = 0;
> +	reg = of_get_property(node, "trickle_reg" , &plen);
> +	if (plen == 4)
> +		chip->trickle_charger_reg = (u16)*reg;

Likewise.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
