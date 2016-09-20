From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2] lm87: Allow channel data to be set from dts file.
Date: Tue, 20 Sep 2016 02:55:42 -0700
Message-ID: <d3258440-db4e-a4c2-cca1-9683d0da63a8@roeck-us.net>
References: <20160920052240.10242-1-mahoda.ratnayaka@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160920052240.10242-1-mahoda.ratnayaka-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mahoda Ratnayaka <mahoda.ratnayaka-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/19/2016 10:22 PM, Mahoda Ratnayaka wrote:
> Currently there is no method for setting the channel
> value from the DTS file. When, the driver uses a dts
> file to initialize the driver platform_data is not set.
> As a the result channel variable may not be set correctly.
>
> Without the channel variable set correctly, some of the
> sensors will not be initialized correctly. For example
> temp3 sensor sysfs entries.
>
> This adds the required functionality to set the channel
> variable from the DTS file. This is done via reading the
> reading a property named "channel" from the lm87 driver.
>
> Signed-off-by: Mahoda Ratnayaka <mahoda.ratnayaka-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
> ---
>
> Notes:
>      changes since v1:
>      Removed unncessary variables channel and np.
>      Update the code as per review comments.
>
>  Documentation/devicetree/bindings/hwmon/lm87.txt | 9 +++++++++
>  drivers/hwmon/lm87.c                             | 7 ++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/hwmon/lm87.txt b/Documentation/devicetree/bindings/hwmon/lm87.txt
> index fefcb48..1906e08 100644
> --- a/Documentation/devicetree/bindings/hwmon/lm87.txt
> +++ b/Documentation/devicetree/bindings/hwmon/lm87.txt
> @@ -6,9 +6,18 @@ Required properties:
>
>  - reg: I2C address
>
> +optional properties:
> +- channels: Value for the channel mode register.
> +            This allows configuration of pins with
> +            selectable uses on the LM87 device (e.g.
> +            choosing between voltage and temperature
> +            inputs).
> +            See hwmon/lm87 for further information

Rob is the ultimate person to comment here, but I think the property description
by itself should be complete and technically independent of the implementation.
Documentation/hwmon/lm87 describes the implementation, so an (incomplete)
reference to it seems inappropriate.

> +
>  Example:
>
>  lm87@2e {
>  	compatible = "ti,lm87";
>  	reg = <0x2e>;
> +	channels=<0x4>;
>  };

Please move those property descriptions into the first patch. It is confusing
to have two patches touching the properties, and the first patch as it is right now
is really useless.

> diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
> index a5e2958..358c1d4 100644
> --- a/drivers/hwmon/lm87.c
> +++ b/drivers/hwmon/lm87.c
> @@ -858,8 +858,13 @@ static void lm87_remove_files(struct i2c_client *client)
>  static void lm87_init_client(struct i2c_client *client)
>  {
>  	struct lm87_data *data = i2c_get_clientdata(client);
> +	u8 val = 0;
>
> -	if (dev_get_platdata(&client->dev)) {
> +	if (!of_property_read_u8(client->dev.of_node, "channels", &val)) {

This ignores property value errors (-ENODATA, -EOVERFLOW).
Is this what you want ?

> +		data->channel = val;
> +		lm87_write_value(client,
> +				 LM87_REG_CHANNEL_MODE, data->channel);
> +	} else if (dev_get_platdata(&client->dev)) {
>  		data->channel = *(u8 *)dev_get_platdata(&client->dev);
>  		lm87_write_value(client,
>  				 LM87_REG_CHANNEL_MODE, data->channel);
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
