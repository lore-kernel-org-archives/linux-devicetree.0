Return-Path: <SRS0=0TFI=GZ=redhat.com=hdegoede@kernel.org>
Subject: Re: [PATCH v2 2/5] usb: typec: fusb302: remove max_snk_* for sink
 config
References: <1521817127-23061-1-git-send-email-jun.li@nxp.com>
 <1521817127-23061-3-git-send-email-jun.li@nxp.com>
 <7c857ffd-419d-bb6d-7330-4ec751f8682a@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8ca89cec-c63d-31dc-431a-8712276a63bf@redhat.com>
Date: Wed, 4 Apr 2018 22:12:47 +0200
MIME-Version: 1.0
In-Reply-To: <7c857ffd-419d-bb6d-7330-4ec751f8682a@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Mats Karrman <mats.dev.list@gmail.com>, Li Jun <jun.li@nxp.com>, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, heikki.krogerus@linux.intel.com
Cc: linux@roeck-us.net, rmfrfs@gmail.com, yueyao.zhu@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Hi,

On 04-04-18 14:06, Mats Karrman wrote:
> Hi Li,
> 
> On 2018-03-23 15:58, Li Jun wrote:
> 
>> Since max_snk_* is to be deprecated, so remove max_snk_* by adding a
>> variable PDO for sink config.
>>
>> Signed-off-by: Li Jun <jun.li@nxp.com>
>> ---
>>   drivers/usb/typec/fusb302/fusb302.c | 51 +++++++++++++++++++++++++++----------
>>   1 file changed, 37 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/usb/typec/fusb302/fusb302.c b/drivers/usb/typec/fusb302/fusb302.c
>> index 7036171..db4d9cd 100644
>> --- a/drivers/usb/typec/fusb302/fusb302.c
>> +++ b/drivers/usb/typec/fusb302/fusb302.c
>> @@ -120,6 +120,7 @@ struct fusb302_chip {
>>       enum typec_cc_polarity cc_polarity;
>>       enum typec_cc_status cc1;
>>       enum typec_cc_status cc2;
>> +    u32 snk_pdo[PDO_MAX_OBJECTS];
>>   #ifdef CONFIG_DEBUG_FS
>>       struct dentry *dentry;
>> @@ -1212,11 +1213,6 @@ static const u32 snk_pdo[] = {
>>   static const struct tcpc_config fusb302_tcpc_config = {
>>       .src_pdo = src_pdo,
>>       .nr_src_pdo = ARRAY_SIZE(src_pdo),
>> -    .snk_pdo = snk_pdo,
>> -    .nr_snk_pdo = ARRAY_SIZE(snk_pdo),
>> -    .max_snk_mv = 5000,
>> -    .max_snk_ma = 3000,
>> -    .max_snk_mw = 15000,
>>       .operating_snk_mw = 2500,
>>       .type = TYPEC_PORT_DRP,
>>       .data = TYPEC_PORT_DRD,
>> @@ -1756,6 +1752,38 @@ static int init_gpio(struct fusb302_chip *chip)
>>       return 0;
>>   }
>> +static int fusb302_composite_snk_pdo_array(struct fusb302_chip *chip)
>> +{
>> +    struct device *dev = chip->dev;
>> +    u32 mv, ma, mw, min_mv;
>> +    unsigned int i;
>> +
>> +    /* Copy the static snk pdo */
>> +    for (i = 0; i < ARRAY_SIZE(snk_pdo); i++)
>> +        chip->snk_pdo[i] = snk_pdo[i];
>> +
>> +    if (device_property_read_u32(dev, "fcs,max-sink-microvolt", &mv) ||
>> +        device_property_read_u32(dev, "fcs,max-sink-microamp", &ma) ||
>> +        device_property_read_u32(dev, "fcs,max-sink-microwatt", &mw))
>> +        return i;
>> +
>> +    mv = mv / 1000;
>> +    ma = ma / 1000;
>> +    mw = mw / 1000;
>> +
>> +    min_mv = 1000 * chip->tcpc_config.operating_snk_mw / ma;
>> +    if (pdo_type(snk_pdo[i-1] == PDO_TYPE_FIXED))
> 
> You've got the parentheses wrong.
> 
> Apart from that I don't like/understand why the PDO's should be fixed.
> Every product should be able to have its own settings, including the first PDO (e.g. it
> might need to specify a higher current and/or set the "Higher Capability" bit).
> 
> I think this would be best solved the same way as in your TCPCI driver patch series [1]
> with a list freely specified by a property.
> 
> [1] https://www.spinics.net/lists/linux-usb/msg167398.html

Hmm, interesting, for the x86 use-case that would require updating
the properties for the fusb302 defined in:

drivers/platform/x86/intel_cht_int33fe.c

In tandem, which is easily doable.

But what about other users of the fusb302 driver? Since this driver
was added before I started using it for some x86 boards, I assume
there are some non x86 users, so we should preserve compatibility
for DTB files which don't define any sink PDOs in their properties,
I guess we could fall to a default fixed 5V sink pdo for those.

Regards,

Hans



> 
>> +        min_mv = max(min_mv, pdo_fixed_voltage(snk_pdo[i-1]));
>> +    else
>> +        min_mv = max(min_mv, pdo_max_voltage(snk_pdo[i-1]));
>> +    ma = min(ma, 1000 * mw / min_mv);
>> +
>> +    /* Insert the new pdo to the end */
>> +    chip->snk_pdo[i] = PDO_VAR(min_mv, mv, ma);
>> +
>> +    return i+1;
>> +}
>> +
>>   static int fusb302_probe(struct i2c_client *client,
>>                const struct i2c_device_id *id)
>>   {
>> @@ -1784,18 +1812,13 @@ static int fusb302_probe(struct i2c_client *client,
>>       chip->tcpc_dev.config = &chip->tcpc_config;
>>       mutex_init(&chip->lock);
>> -    if (!device_property_read_u32(dev, "fcs,max-sink-microvolt", &v))
>> -        chip->tcpc_config.max_snk_mv = v / 1000;
>> -
>> -    if (!device_property_read_u32(dev, "fcs,max-sink-microamp", &v))
>> -        chip->tcpc_config.max_snk_ma = v / 1000;
>> -
>> -    if (!device_property_read_u32(dev, "fcs,max-sink-microwatt", &v))
>> -        chip->tcpc_config.max_snk_mw = v / 1000;
>> -
>>       if (!device_property_read_u32(dev, "fcs,operating-sink-microwatt", &v))
>>           chip->tcpc_config.operating_snk_mw = v / 1000;
>> +    /* Composite sink PDO */
>> +    chip->tcpc_config.nr_snk_pdo = fusb302_composite_snk_pdo_array(chip);
>> +    chip->tcpc_config.snk_pdo = chip->snk_pdo;
>> +
>>       /*
>>        * Devicetree platforms should get extcon via phandle (not yet
>>        * supported). On ACPI platforms, we get the name from a device prop.
>>
