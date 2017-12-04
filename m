From: Javier Martinez Canillas <javierm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] iio: accel: bmc150: Add OF device ID table
Date: Mon, 4 Dec 2017 11:24:40 +0100
Message-ID: <337e54d5-7248-9eb2-e0c0-3a8b5443723d@redhat.com>
References: <20171201111058.13483-1-javierm@redhat.com>
 <313108f3-2815-b030-4fa6-614efc31a8a9@redhat.com>
 <20171204092259.00006250@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171204092259.00006250-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <Jonathan.Cameron-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Jonathan,

On 12/04/2017 10:44 AM, Jonathan Cameron wrote:
> On Mon, 4 Dec 2017 09:29:38 +0100
> Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> 
>> Hi,
>>
>> On 01-12-17 12:10, Javier Martinez Canillas wrote:
>>> The driver doesn't have a struct of_device_id table but supported devices
>>> are registered via Device Trees. This is working on the assumption that a
>>> I2C device registered via OF will always match a legacy I2C device ID and
>>> that the MODALIAS reported will always be of the form i2c:<device>.
>>>
>>> But this could change in the future so the correct approach is to have an
>>> OF device ID table if the devices are registered via OF.
>>>
>>> The I2C device ID table entries have the .driver_data field set, but they
>>> are not used in the driver so weren't set in the OF device table entries.
>>>
>>> Signed-off-by: Javier Martinez Canillas <javierm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>
>>>   drivers/iio/accel/bmc150-accel-i2c.c | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/iio/accel/bmc150-accel-i2c.c b/drivers/iio/accel/bmc150-accel-i2c.c
>>> index f85014fbaa12..8ffc308d5fd0 100644
>>> --- a/drivers/iio/accel/bmc150-accel-i2c.c
>>> +++ b/drivers/iio/accel/bmc150-accel-i2c.c
>>> @@ -81,9 +81,21 @@ static const struct i2c_device_id bmc150_accel_id[] = {
>>>   
>>>   MODULE_DEVICE_TABLE(i2c, bmc150_accel_id);
>>>   
>>> +static const struct of_device_id bmc150_accel_of_match[] = {
>>> +	{ .compatible = "bosch,bmc150_accel" },
>>> +	{ .compatible = "bosch,bmi055_accel" },  
>>
>> These look a bit weird, there is no reason to mirror the i2c_device_ids
> 
> There has been a steady move for a long time to add these IDs with the plan
> that we would stop automatically matching against the manufacturer free
> i2c IDs. Mostly on the basis that was a hack that brought a lot

Matching using OF IDs have been working for some time (since v4.10 AFAICT)
after the following commit:

da10c06a044b ("i2c: Make I2C ID tables non-mandatory for DT'ed devices").

The only remaining problem is with module auto-loading.

> of effectively unreviewed device tree bindings. As I understand it the
> eventual plan is to be able to get rid of that old path entirely...
> +CC Wolfram to see what his view is on this.
>

I don't think we can get rid of the old path entirely since are valid use cases
for it. For example when the I2C devices are registered with the i2c_new_device
interface where the bus and address are declared in a struct i2c_board_info (ie:
old platforms that still use board files or devices with an embedded I2C chip).

What I think though is that drivers should only be required to define the device
table for the firmware interface used to instantiate them. For example, a driver
for a device that's DT-only should only have an OF device ID table just like a
driver for an ACPI-only device only requires to have an ACPI ID table.

Conversely, a driver for a device that's only instantiated using platform data
should only have an I2C device ID table.

If a driver supports both DT and legacy platforms, then it's OK to have both ID
tables defined. What is not correct is to require OF-only drivers to have an I2C
device ID table just as a workaround to have their modules auto-loading working.

Best regards,
-- 
Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat
