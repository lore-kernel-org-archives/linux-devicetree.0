From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v3] gpio: pcf857x: Add OF support
Date: Sun, 25 Aug 2013 10:16:40 +0200
Message-ID: <5219BD68.3010906@gmail.com>
References: <1377390395-4328-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1377390395-4328-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On 08/25/2013 02:26 AM, Laurent Pinchart wrote:
> Add DT bindings for the pcf857x-compatible chips and parse the device
> tree node in the driver.
>
> Signed-off-by: Laurent Pinchart<laurent.pinchart+renesas@ideasonboard.com>
> ---
>   .../devicetree/bindings/gpio/gpio-pcf857x.txt      | 71 ++++++++++++++++++++++
>   drivers/gpio/gpio-pcf857x.c                        | 57 ++++++++++++++---
>   2 files changed, 119 insertions(+), 9 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
>
> Changes since v2
>
> - Replace mention about interrupts software configuration in DT bindings
>    documentation with an explanation of the hardware configuration.
[...]
> @@ -257,14 +280,29 @@ fail:
>   static int pcf857x_probe(struct i2c_client *client,
>   			 const struct i2c_device_id *id)
>   {
> -	struct pcf857x_platform_data	*pdata;
> +	struct pcf857x_platform_data	*pdata = dev_get_platdata(&client->dev);
> +	struct device_node		*np = client->dev.of_node;
>   	struct pcf857x			*gpio;
> +	unsigned int			n_latch = 0;
> +	unsigned int			ngpio;
>   	int				status;
>
> -	pdata = dev_get_platdata(&client->dev);
> -	if (!pdata) {
> +#ifdef CONFIG_OF
> +	if (np) {
> +		const struct of_device_id *of_id;
> +
> +		of_id = of_match_device(pcf857x_of_table,&client->dev);
> +		ngpio = (unsigned int)of_id->data;

It is potentially unsafe, since of_match_device() can return NULL.

> +	} else
> +#endif
> +		ngpio = id->driver_data;


CodingStyle: braces are missing for the second part of the if statement.


How about something along the lines of:

	const struct of_device_id *of_id;

	of_id = of_match_device(of_match_ptr(pcf857x_of_table), &client->dev);
	if (of_id)
		ngpio = (unsigned int)of_id->data;
	else
		ngpio = id->driver_data;

to get rid of the #ifdef ?

But still DT has priority over platform data here.

> +
> +	if (pdata)
> +		n_latch = pdata->n_latch;
> +	else if (IS_ENABLED(CONFIG_OF)&&  np)
> +		of_property_read_u32(np, "pins-initial-state",&n_latch);

And here platform data has priority over DT.

> +	else
>   		dev_dbg(&client->dev, "no platform data\n");
> -	}
>
>   	/* Allocate, initialize, and register this gpio_chip. */
>   	gpio = devm_kzalloc(&client->dev, sizeof(*gpio), GFP_KERNEL);

--
Regards,
Sylwester
