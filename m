Return-Path: <SRS0=2j9E=PY=skidata.com=prvs=912a82b5b=Richard.Leitner@kernel.org>
Subject: Re: [PATCH v2 2/2] usb: usb251xb: add usb data lane port swap feature
References: <20190115115018.27143-1-m.felsch@pengutronix.de>
 <20190115115018.27143-2-m.felsch@pengutronix.de>
 <20190115120422.zgrlcauakhsikwyb@pengutronix.de>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <fe1b48c9-76ff-16ce-ce07-dad6d978929f@skidata.com>
Date: Wed, 16 Jan 2019 14:56:15 +0100
MIME-Version: 1.0
In-Reply-To: <20190115120422.zgrlcauakhsikwyb@pengutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Marco Felsch <m.felsch@pengutronix.de>, robh@kernel.org, fancer.lancer@gmail.com
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi,

On 15/01/2019 13:04, Marco Felsch wrote:
> Hi,
> 
> On 19-01-15 12:50, Marco Felsch wrote:
>> The HW can swap the USB differential-pair (D+/D-) for each port
>> separately. So the USB signals can be re-aligned with a misplaced
>> USB connector on the PCB.
>>
>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>> ---
>> Changes:
>> v2:
>>   - rename property s/sw-dx-lanes-ports/swap-dx-lanes
>>   - add commentar for future users
>>
>>   drivers/usb/misc/usb251xb.c | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
>> index a6efb9a72939..ec649046688d 100644
>> --- a/drivers/usb/misc/usb251xb.c
>> +++ b/drivers/usb/misc/usb251xb.c
>> @@ -337,10 +337,12 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
>>   	struct device *dev = hub->dev;
>>   	struct device_node *np = dev->of_node;
>>   	int len, err, i;
>> -	u32 property_u32 = 0;
>> +	u32 port, property_u32 = 0;
>>   	const u32 *cproperty_u32;
>>   	const char *cproperty_char;
>>   	char str[USB251XB_STRING_BUFSIZE / 2];
>> +	struct property *prop;
>> +	const __be32 *p;
>>   
>>   	if (!np) {
>>   		dev_err(dev, "failed to get ofdata\n");
>> @@ -539,6 +541,16 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
>>   			      (wchar_t *)hub->serial,
>>   			      USB251XB_STRING_BUFSIZE);
>>
>> +	/*
>> +	 * The datasheet documents the register as 'Port Swap' but the register
>> +	 * controls the USB DP/DM signal swapping
>> +	 */
> 
> Sorry for the noise, unfortunately I forgot to update the patch..
> Richard can you fix the commentar inline to:
> 
> 8<----------------------------------------------------------------------------
> +       /*
> +        * The datasheet documents the register as 'Port Swap' but in real the
> +        * register controls the USB DP/DM signal swapping for each port.
> +        */
> 8<----------------------------------------------------------------------------

With this applied the patch looks good to me, therefore feel free to add:

Reviewed-by: Richard Leitner <richard.leitner@skidata.com>

Furthermore please send a v3 with this fixed and put Greg-KH 
(gregkh@linuxfoundation.org) on CC as he will merge it into his tree.

regards;Richard.L
