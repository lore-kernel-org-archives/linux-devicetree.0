From: Thor Thayer <tthayer@opensource.altera.com>
Subject: Re: [PATCHv3 1/7] EDAC, altera: Check parent status for Arria10 EDAC
 block
Date: Fri, 17 Jun 2016 11:54:04 -0500
Message-ID: <57642B2C.3090109@opensource.altera.com>
References: <1465852752-11018-1-git-send-email-tthayer@opensource.altera.com>
 <1465852752-11018-2-git-send-email-tthayer@opensource.altera.com>
 <20160617164632.GD3912@pd.tnic>
Reply-To: <tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20160617164632.GD3912@pd.tnic>
Sender: linux-doc-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org



On 06/17/2016 11:46 AM, Borislav Petkov wrote:
> On Mon, Jun 13, 2016 at 04:19:06PM -0500, tthayer@opensource.altera.com wrote:
>> From: Thor Thayer <tthayer@opensource.altera.com>
>>
>> In preparation for the Arria10 ECC modules, check the status
>> of the parent in the device tree to ensure the block is enabled.
>> Skip if no parent phandle is set in the device tree.
>>
>> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
>> ---
>> v2  No change
>> v3  Move check into validate_parent_available().
>> ---
>>   drivers/edac/altera_edac.c |   17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
>> index 6f5d586..926bcaf 100644
>> --- a/drivers/edac/altera_edac.c
>> +++ b/drivers/edac/altera_edac.c
>> @@ -1125,6 +1125,20 @@ static void altr_edac_a10_irq_handler(struct irq_desc *desc)
>>   	chained_irq_exit(chip, desc);
>>   }
>>
>> +static int validate_parent_available(struct device_node *np)
>> +{
>> +	struct device_node *parent;
>> +
>> +	/* Ensure parent device is enabled if parent node exists */
>> +	parent = of_parse_phandle(np, "parent", 0);
>> +	if (parent && !of_device_is_available(parent)) {
>> +		of_node_put(parent);
>> +		return -ENODEV;
>> +	}
>> +	of_node_put(parent);
>> +	return 0;
>> +}
>
> How about this - it is a bit simpler:
>
> static int validate_parent_available(struct device_node *np)
> {
>          struct device_node *parent;
>          int ret = 0;
>
>          /* Ensure parent device is enabled if parent node exists */
>          parent = of_parse_phandle(np, "parent", 0);
>          if (parent && !of_device_is_available(parent))
>                  ret = -ENODEV;
>
>          of_node_put(parent);
>          return ret;
> }
>
> ?
>
Yes. Thanks! I will make the change.
