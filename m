From: fixed-term.Oleksij.Rempel <fixed-term.Oleksij.Rempel-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 4/4] rtc: rv8803: Be able to set VDETOFF
 and SWOFF via devcie tree
Date: Wed, 29 Jun 2016 06:35:07 +0200
Message-ID: <57734FFB.4000104@de.bosch.com>
References: <1466577742-18824-1-git-send-email-dirk.behme@de.bosch.com>
 <1466577742-18824-5-git-send-email-dirk.behme@de.bosch.com>
 <20160624074407.GJ5809@piout.net>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBAABB7E7ZW5QKGQEBONJN4I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160624074407.GJ5809-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carsten Resch <Carsten.Resch-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 24.06.2016 09:44, Alexandre Belloni wrote:
> On 22/06/2016 at 08:42:22 +0200, Dirk Behme wrote :
>> From: Oleksij Rempel <fixed-term.Oleksij.Rempel-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
>>
>> There might be designs where the power supply circuit is designed
>> in a way that VDETOFF and SWOFF is reuqired to be set. Otherwise the
>> RTC detects a power loss. Add a device tree interface for this.
>>
>> Signed-off-by: Carsten Resch <Carsten.Resch-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Oleksij Rempel <fixed-term.Oleksij.Rempel-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> ---
>>  drivers/rtc/rtc-rv8803.c | 39 +++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>>
>> diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
>> index e122b51..32a5686 100644
>> --- a/drivers/rtc/rtc-rv8803.c
>> +++ b/drivers/rtc/rtc-rv8803.c
>> @@ -50,6 +50,10 @@
>>  #define RV8803_CTRL_TIE			BIT(4)
>>  #define RV8803_CTRL_UIE			BIT(5)
>>  
>> +#define RX8900_BACKUP_CTRL		0x18
>> +#define RX8900_FLAG_SWOFF		BIT(2)
>> +#define RX8900_FLAG_VDETOFF		BIT(3)
>> +
>>  struct rv8803_data {
>>  	struct i2c_client *client;
>>  	struct rtc_device *rtc;
>> @@ -423,6 +427,35 @@ static struct rtc_class_ops rv8803_rtc_ops = {
>>  	.ioctl = rv8803_ioctl,
>>  };
>>  
>> +static int rx8900_trickle_charger_init(struct rv8803_data *rv8803)
>> +{
>> +	struct i2c_client *client = rv8803->client;
>> +	struct device_node *node = client->dev.of_node;
>> +	int err;
>> +	u8 flags;
>> +
>> +	if (!node)
>> +		return 0;
>> +
>> +	if (!of_device_is_compatible(node, "epson,rx8900"))
>> +		return 0;
>> +
> 
> Can you use the i2c_device_id instead of of_device_is_compatible to
> avoid matching on yet another string?

Sure, ... is it possible that device tree defines rx8900 but i2c will
detect rv8803?
I assume it is potential source of errors. What would be better way to
handle it?

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
