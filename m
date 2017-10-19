From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH v2 3/7] gpio: mcp23s08: add support for mcp23018
Date: Thu, 19 Oct 2017 15:00:35 +0800
Message-ID: <b749e94a-94e4-0087-aea2-99183b25b5ef@electromag.com.au>
References: <1507266491-73971-1-git-send-email-preid@electromag.com.au>
 <1507266491-73971-4-git-send-email-preid@electromag.com.au>
 <20171008211821.vege3ytdu5bnu35p@earth>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171008211821.vege3ytdu5bnu35p@earth>
Content-Language: en-AU
Sender: linux-gpio-owner@vger.kernel.org
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, poeschel@lemonage.de, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

G'day Linus,

did this one in the series get applied?
or did you have a problem with it and want it rebased with the other 3 patches needing work.

haven't seen any of them on devel branch git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git


On 9/10/2017 05:18, Sebastian Reichel wrote:
> Hi,
> 
> On Fri, Oct 06, 2017 at 01:08:07PM +0800, Phil Reid wrote:
>> This adds the required definitions for the mcp23018 which is the i2c
>> variant of the mcp23s18.
>>
>> Signed-off-by: Phil Reid <preid@electromag.com.au>
>> ---
> 
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> 
> -- Sebastian
> 
>>   drivers/pinctrl/pinctrl-mcp23s08.c | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
>> index 3e40d42..8d356df 100644
>> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
>> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
>> @@ -25,6 +25,7 @@
>>   #define MCP_TYPE_008	2
>>   #define MCP_TYPE_017	3
>>   #define MCP_TYPE_S18    4
>> +#define MCP_TYPE_018    5
>>   
>>   #define MCP_MAX_DEV_PER_CS	8
>>   
>> @@ -837,6 +838,13 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
>>   		mcp->chip.ngpio = 16;
>>   		mcp->chip.label = "mcp23017";
>>   		break;
>> +
>> +	case MCP_TYPE_018:
>> +		mcp->regmap = devm_regmap_init_i2c(data, &mcp23x17_regmap);
>> +		mcp->reg_shift = 1;
>> +		mcp->chip.ngpio = 16;
>> +		mcp->chip.label = "mcp23018";
>> +		break;
>>   #endif /* CONFIG_I2C */
>>   
>>   	default:
>> @@ -883,7 +891,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
>>   		if (mirror)
>>   			status |= IOCON_MIRROR | (IOCON_MIRROR << 8);
>>   
>> -		if (type == MCP_TYPE_S18)
>> +		if (type == MCP_TYPE_S18 || type == MCP_TYPE_018)
>>   			status |= IOCON_INTCC | (IOCON_INTCC << 8);
>>   
>>   		ret = mcp_write(mcp, MCP_IOCON, status);
>> @@ -964,6 +972,10 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
>>   		.compatible = "microchip,mcp23017",
>>   		.data = (void *) MCP_TYPE_017,
>>   	},
>> +	{
>> +		.compatible = "microchip,mcp23018",
>> +		.data = (void *) MCP_TYPE_018,
>> +	},
>>   /* NOTE: The use of the mcp prefix is deprecated and will be removed. */
>>   	{
>>   		.compatible = "mcp,mcp23008",
>> @@ -1013,6 +1025,7 @@ static int mcp230xx_probe(struct i2c_client *client,
>>   static const struct i2c_device_id mcp230xx_id[] = {
>>   	{ "mcp23008", MCP_TYPE_008 },
>>   	{ "mcp23017", MCP_TYPE_017 },
>> +	{ "mcp23018", MCP_TYPE_018 },
>>   	{ },
>>   };
>>   MODULE_DEVICE_TABLE(i2c, mcp230xx_id);
>> -- 
>> 1.8.3.1
>>


-- 
Regards
Phil Reid

ElectroMagnetic Imaging Technology Pty Ltd
Development of Geophysical Instrumentation & Software
www.electromag.com.au

3 The Avenue, Midland WA 6056, AUSTRALIA
Ph: +61 8 9250 8100
Fax: +61 8 9250 7100
Email: preid@electromag.com.au
