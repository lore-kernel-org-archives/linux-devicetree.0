From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH 2/2] gpio: mcp32s08: add support for mcp23018
Date: Thu, 5 Oct 2017 14:56:56 +0800
Message-ID: <de082b41-5bdc-d48b-41bf-da4ea0cadee0@electromag.com.au>
References: <1507166615-4530-1-git-send-email-preid@electromag.com.au>
 <1507166615-4530-3-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1507166615-4530-3-git-send-email-preid@electromag.com.au>
Content-Language: en-AU
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 5/10/2017 09:23, Phil Reid wrote:
> This adds the required definitions for the mcp23018 which is the i2c
> variant of the mcp23s18.
> 
> Signed-off-by: Phil Reid <preid@electromag.com.au>
> ---
>   drivers/gpio/gpio-mcp23s08.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)

I've just noticed that this needs to be rebased as mcp23s08 driver has moved.
Other that the new location the patch is the same so far.
I have a couple of queries regarding the driver in another email, will wait for that first..



> 
> diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
> index 2a57d024..92751e5 100644
> --- a/drivers/gpio/gpio-mcp23s08.c
> +++ b/drivers/gpio/gpio-mcp23s08.c
> @@ -33,6 +33,7 @@
>   #define MCP_TYPE_008	2
>   #define MCP_TYPE_017	3
>   #define MCP_TYPE_S18    4
> +#define MCP_TYPE_018    5
>   
>   /* Registers are all 8 bits wide.
>    *
> @@ -595,6 +596,13 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
>   		mcp->chip.ngpio = 16;
>   		mcp->chip.label = "mcp23017";
>   		break;
> +
> +	case MCP_TYPE_018:
> +		mcp->regmap = devm_regmap_init_i2c(data, &mcp23x17_regmap);
> +		mcp->reg_shift = 1;
> +		mcp->chip.ngpio = 16;
> +		mcp->chip.label = "mcp23018";
> +		break;
>   #endif /* CONFIG_I2C */
>   
>   	default:
> @@ -640,7 +648,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
>   		if (mirror)
>   			status |= IOCON_MIRROR | (IOCON_MIRROR << 8);
>   
> -		if (type == MCP_TYPE_S18)
> +		if (type == MCP_TYPE_S18 || type == MCP_TYPE_018)
>   			status |= IOCON_INTCC | (IOCON_INTCC << 8);
>   
>   		ret = mcp_write(mcp, MCP_IOCON, status);
> @@ -729,6 +737,10 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
>   		.compatible = "microchip,mcp23017",
>   		.data = (void *) MCP_TYPE_017,
>   	},
> +	{
> +		.compatible = "microchip,mcp23018",
> +		.data = (void *) MCP_TYPE_018,
> +	},
>   /* NOTE: The use of the mcp prefix is deprecated and will be removed. */
>   	{
>   		.compatible = "mcp,mcp23008",
> @@ -812,6 +824,7 @@ static int mcp230xx_remove(struct i2c_client *client)
>   static const struct i2c_device_id mcp230xx_id[] = {
>   	{ "mcp23008", MCP_TYPE_008 },
>   	{ "mcp23017", MCP_TYPE_017 },
> +	{ "mcp23018", MCP_TYPE_018 },
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(i2c, mcp230xx_id);
> 


-- 
Regards
Phil Reid
