From: Richard Leitner <richard.leitner@skidata.com>
Subject: Re: [PATCH v4] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller
 Driver
Date: Wed, 8 Feb 2017 16:17:14 +0100
Message-ID: <96c8a6f9-3b93-8ba0-22b1-502e22dac31c@skidata.com>
References: <1486543976-28006-1-git-send-email-richard.leitner@skidata.com>
 <1486560068.2133.395.camel@linux.intel.com> <20170208135957.GA916@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170208135957.GA916@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, stern@rowland.harvard.edu, dev@g0hl1n.net
List-Id: devicetree@vger.kernel.org

On 02/08/2017 02:59 PM, Greg KH wrote:
> On Wed, Feb 08, 2017 at 03:21:08PM +0200, Andy Shevchenko wrote:
>> On Wed, 2017-02-08 at 09:52 +0100, Richard Leitner wrote:
>>> From: Richard Leitner <dev@g0hl1n.net>
>>
>> If you want to fix the above you have to fix your Git configuration.

My git config is fine, just cherry-picked it from a remote and forgot I
committed it from another computer with another git config ;-)
Will fix that in v5 for sure!

>>
>>
>>> This patch adds a driver for configuration of the Microchip
>>> USB251xB/xBi
>>> USB 2.0 hub controller series with USB 2.0 upstream connectivity,
>>> SMBus
>>> configuration interface and two to four USB 2.0 downstream ports.
>>>
>>> Furthermore add myself as a maintainer for this driver.
>>>
>>> The datasheet can be found at the manufacturers website, see [1]. All
>>> device-tree exposed configuration features have been tested on a i.MX6
>>> platform with a USB2512B hub.
>>
>>> +++ b/drivers/usb/misc/usb251xb.c
>>> @@ -0,0 +1,674 @@
>>
>>> +#include <linux/i2c.h>
>>> +#include <linux/gpio.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of_gpio.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/nls.h>
>>
>> Alphabetical order?
> 
> Ick, no, who cares, really.  It's whatever order the author wants, don't
> be so picky.

Ok :-)
But somehow you're right Andy, alphabetical order seems to look better
here (will do that in v5).

> 
>>> +#define DRIVER_NAME "usb251xb"
>>> +#define DRIVER_DESC "Microchip USB 2.0 Hi-Speed Hub Controller"
>>> +#define DRIVER_VERSION "1.0"
>>
>> Is it my MUA, or all above indentations are broken?
> 
> What do you mean?

Should the strings be aligned, like the following?
#define DRIVER_NAME     "usb251xb"
#define DRIVER_DESC     "Microchip USB .."
#define DRIVER_VERSION	"1.0"

> 
>>> +static inline void set_bit_in_byte(u8 bit, u8 *val)
>>> +{
>>> +	if (bit < 8)
>>> +		*val |= (1 << bit);
>>> +}
>>> +
>>> +static inline void clr_bit_in_byte(u8 bit, u8 *val)
>>> +{
>>> +	if (bit < 8)
>>> +		*val &= ~(1 << bit);
>>> +}
>>
>> Above doesn't make much sense. Why not to use
>>
>> | BIT(bit) 
>>
>> and
>>
>> & ~BIT(bit)
>>
>> in place?
> 
> I thought we already had functions to do this for you.  Don't write new
> ones "by hand" either wya.

Which functions do you mean? I only found set_bit() and clear_bit() from
atomic_ops. But those operate on "unsigned long" variables. From the
documentation:
	Native atomic bit operations are defined to operate
	on objects aligned to the size of an "unsigned long"
	C data type, and are least of that size.

> 
>>> +		/* the first data byte transferred tells the hub how
>>> many data
>>> +		 * bytes will follow (byte count)
>>> +		 */
>>
>> I'm not sure this is good formatted comment for USB subsystem.
> 
> Looks fine to me, why do you think it is incorrect?
> 
>>> +	/* the following parameters are currently not exposed to
>>> devicetree, but
>>> +	 * may be as soon as needed
>>> +	 */
>>
>> Style of multi-line comment.
> 
> Nope, it's fine.
> 
>>> +#else /* CONFIG_OF */
>>> +static int usb251xb_get_ofdata(struct usb251xb *hub,
>>> +			       struct usb251xb_data *data)
>>> +{
>>> +	return 0;
>>> +}
>>> +#endif /* CONFIG_OF */
>>
>> I don't think it's a good idea to have those ugly #ifdef.
> 
> How can it be removed?
> 
>>> +static int usb251xb_probe(struct usb251xb *hub)
>>> +{
>>> +	struct device *dev = hub->dev;
>>> +	struct device_node *np = dev->of_node;
>>> +	const struct of_device_id *of_id =
>>> of_match_device(usb251xb_of_match,
>>> +							   dev);
>>> +	int err;
>>> +
>>
>>> +	dev_info(dev, DRIVER_DESC " " DRIVER_NAME "\n");
>>
>> Useless.
> 
> Agreed.

Ok, I will remove it in v5!

Thanks & regards,
Richard L
