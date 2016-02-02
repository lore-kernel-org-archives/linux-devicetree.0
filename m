From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: ad5755: add support for dt bindings
Date: Tue, 2 Feb 2016 16:57:55 +0100
Message-ID: <56B0D203.3050905@prevas.dk>
References: <1454416574-6645-1-git-send-email-sean.nyekjaer@prevas.dk>
 <56B0CC2C.6020809@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B0CC2C.6020809-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 2016-02-02 16:33, Lars-Peter Clausen wrote:
> On 02/02/2016 01:36 PM, Sean Nyekjaer wrote:
>> Still missing a way to provide default modes and settings
>> for the driver from dt, but I see this as a start.
>>
>> Signed-off-by: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
> Hi,
>
> Thanks for the patch.
:-)
>
>> ---
>>   drivers/iio/dac/ad5755.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/iio/dac/ad5755.c b/drivers/iio/dac/ad5755.c
>> index bfb350a..e1b6e78 100644
>> --- a/drivers/iio/dac/ad5755.c
>> +++ b/drivers/iio/dac/ad5755.c
>> @@ -607,6 +607,16 @@ static const struct spi_device_id ad5755_id[] = {
>>   };
>>   MODULE_DEVICE_TABLE(spi, ad5755_id);
>>   
>> +static const struct of_device_id ad5755_of_match[] = {
>> +	{ .compatible = "adi,ad5755" },
>> +	{ .compatible = "adi,ad5755-1" },
>> +	{ .compatible = "adi,ad5757" },
>> +	{ .compatible = "adi,ad5735" },
>> +	{ .compatible = "adi,ad5737" },
> This needs to set the ID for the device type, so that the driver gets
> instantiated for the correct devicetype. And in the probe function check if
> the driver was probed via DT (by checking spi->dev.of_node) and if it does
> get the ID from the of_device_id rather the spi_device_id.
I was planning on doing that.
And I was experimenting with providing modes and settings for every 
channel from the dt.
Is the DAC the only output devices in IIO?

I will send an proposal tomorrow :-) And thereby (maybe) pave the way 
for the runtime mode switching

Should we drop the platform data support and only rely on dt?
>
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, ad5755_of_match);
>> +
>>   static struct spi_driver ad5755_driver = {
>>   	.driver = {
>>   		.name = "ad5755",
>>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
