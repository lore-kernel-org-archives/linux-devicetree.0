From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] TTY: add support for "tty slave" devices.
Date: Fri, 12 Dec 2014 08:02:48 -0500
Message-ID: <548AE778.90205@hurleysoftware.com>
References: <20141211214801.4127.93914.stgit@notabene.brown>	<20141211215943.4127.24792.stgit@notabene.brown>	<548A264D.8070103@hurleysoftware.com> <20141212162352.66be5b5e@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141212162352.66be5b5e-wvvUuzkyo1EYVZTmpyfIwg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/12/2014 12:23 AM, NeilBrown wrote:
> On Thu, 11 Dec 2014 18:18:37 -0500 Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
> wrote:
> 
>> On 12/11/2014 04:59 PM, NeilBrown wrote:
>>> A "tty slave" is a device connected via UART.
>>> It may need a driver to, for example, power the device on
>>> when the tty is opened, and power it off when the tty
>>> is released.
>>>
>>> A "tty slave" is a platform device which is declared as a
>>> child of the uart in device-tree:
>>>
>>> &uart1 {
>>> 	bluetooth {
>>> 		compatible = "tty,regulator";
>>> 		vdd-supply = <&vaux4>;
>>> 	};
>>> };
>>>
>>> runtime power management is used to power-up the device
>>> on tty_open() and  power-down on tty_release().
>>
>> I have a couple of issues with this:
>> 1) why does a child device imply power management and a platform
>>    device? iow, what happens when someone else wants to have a
>>    child device that does something different?
> 
> Why does it imply power management?
>  Because it seems to make obvious sense to turn something on when the tty is
>  open.  If the device has other reason to remain on when the tty is closed,
>  it can arrange for extra references to be taken of course.
>  Is it conceivable that you would want the device to remain off when the
>  tty device is open?  In that case just make it a regular platform device.
> 
> Why a platform device?
>  Things on an i2c bus are i2c devices.  Things on a usb bus are usb devices.
>  Ideally a thing on a uart 'bus' would be a 'uart device', but no such thing
>  exists.  I did contemplate the possibility of creating an explicit "uart" or
>  "tty" bus type, but I could find no value in that.
>  The door is certainly still open to that possibility if a meaning for the
>  idea becomes apparent.  As far as device tree is concerned it is just a
>  child device node.  The fact that it is implemented as a "platform" device
>  could easily be changed later if needed without device tree noticing.
> 
> What could conceivably want to be different?  The only (purely hypothetical)
> concept I can come up with which wouldn't fit is a device with both an UART
> port and a USB port, or similar.  However device tree, and the device model
> in general, just isn't geared towards devices being on multiple buses so
> if that were real it would have much greater implications that just here.
> 
> But maybe I misunderstand...

Yeah, misunderstanding.

This patch is using a very generic abstraction (parent-child device association)
for a really specific purpose (power management for platform devices).
What about PCI, PNP, etc.?

Also, what happens for existing child device associations like bluetooth & serio?
Why not just provide a serial core interface for associating power-managed
child devices?

Which brings up another point: why not do this in the runtime power management;
ie, turn on the slave device when the master device is turned on? Sebastian
recently made the 8250 driver power-managed per access, which would enable
significant power savings over just leaving the slave device on the whole time.

>> 2) why is this tied to the tty core and not the serial core
>>    if this is only for UART?
> 
> Because the knowledge of "the device is being opened" or "the device is being
> closed" seems to exist in the tty core but not in the serial core.

uart_open() = device file is being opened
uart_close() = device file is being released

> The "of_platform_populate()" call could certainly go in serial_core.c, in
> uart_add_one_port() I think.  I did have it there originally.  I moved it for
> a reason that I think is no longer relevant.  As the on/off code is (and I
> think has to be) in tty_io.c, I left all of it there.
> 
> I'm happy to move it to serial_core.c if that is preferred.
> I'll also move the open/close handling if you can point to where it should go.

Yes, please.
The reverse dependency (tty core => of) is undesirable.

Regards,
Peter Hurley

>>> Signed-off-by: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
>>> ---
>>>  .../devicetree/bindings/serial/of-serial.txt       |    4 ++++
>>>  drivers/tty/tty_io.c                               |   22 ++++++++++++++++++++
>>>  2 files changed, 26 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/serial/of-serial.txt b/Documentation/devicetree/bindings/serial/of-serial.txt
>>> index 8c4fd0332028..b59501ee2f21 100644
>>> --- a/Documentation/devicetree/bindings/serial/of-serial.txt
>>> +++ b/Documentation/devicetree/bindings/serial/of-serial.txt
>>> @@ -39,6 +39,10 @@ Optional properties:
>>>    driver is allowed to detect support for the capability even without this
>>>    property.
>>>  
>>> +Optional child node:
>>> +- a platform device listed as a child node will be probed and
>>> +  powered-on whenever the tty is in use (open).
>>> +
>>>  Example:
>>>  
>>>  	uart@80230000 {
>>> diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
>>> index 0508a1d8e4cd..7acdc6f093f4 100644
>>> --- a/drivers/tty/tty_io.c
>>> +++ b/drivers/tty/tty_io.c
>>> @@ -95,6 +95,8 @@
>>>  #include <linux/seq_file.h>
>>>  #include <linux/serial.h>
>>>  #include <linux/ratelimit.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/of_platform.h>
>>>  
>>>  #include <linux/uaccess.h>
>>>  
>>> @@ -1683,6 +1685,17 @@ static int tty_release_checks(struct tty_struct *tty, struct tty_struct *o_tty,
>>>  	return 0;
>>>  }
>>>  
>>> +static int open_child(struct device *dev, void *data)
>>> +{
>>> +	pm_runtime_get_sync(dev);
>>> +	return 0;
>>> +}
>>> +static int release_child(struct device *dev, void *data)
>>> +{
>>> +	pm_runtime_put_autosuspend(dev);
>>> +	return 0;
>>> +}
>>> +
>>>  /**
>>>   *	tty_release		-	vfs callback for close
>>>   *	@inode: inode of tty
>>> @@ -1712,6 +1725,8 @@ int tty_release(struct inode *inode, struct file *filp)
>>>  	long	timeout = 0;
>>>  	int	once = 1;
>>>  
>>> +	if (tty->dev)
>>> +		device_for_each_child(tty->dev, NULL, release_child);
>>>  	if (tty_paranoia_check(tty, inode, __func__))
>>>  		return 0;
>>>  
>>> @@ -2118,6 +2133,8 @@ retry_open:
>>>  		__proc_set_tty(current, tty);
>>>  	spin_unlock_irq(&current->sighand->siglock);
>>>  	tty_unlock(tty);
>>> +	if (tty->dev)
>>> +		device_for_each_child(tty->dev, NULL, open_child);
>>>  	mutex_unlock(&tty_mutex);
>>>  	return 0;
>>>  err_unlock:
>>> @@ -3207,6 +3224,11 @@ struct device *tty_register_device_attr(struct tty_driver *driver,
>>>  	retval = device_register(dev);
>>>  	if (retval)
>>>  		goto error;
>>> +	if (device && device->of_node)
>>> +		/* Children are platform devices and will be
>>> +		 * runtime_pm managed by this tty.
>>> +		 */
>>> +		of_platform_populate(device->of_node, NULL, NULL, dev);
>>>  
>>>  	return dev;


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
