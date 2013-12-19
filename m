From: boris brezillon <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH] gpio: add GPIO hogging mechanism
Date: Thu, 19 Dec 2013 18:13:04 +0100
Message-ID: <52B32920.1030506@overkiz.com>
References: <1387463671-1164-1-git-send-email-b.brezillon@overkiz.com> <1387463671-1164-2-git-send-email-b.brezillon@overkiz.com> <20131219164109.GB27409@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131219164109.GB27409-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jiri Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>, Ben Gamari <bgamari.foss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Greg,

On 19/12/2013 17:41, Greg Kroah-Hartman wrote:
> On Thu, Dec 19, 2013 at 03:34:31PM +0100, Boris BREZILLON wrote:
>> GPIO hogging is a way to request and configure specific GPIO without
>> explicitly requesting it in the device driver.
>>
>> The request and configuration procedure is handled in the core device
>> driver code before the driver probe function is called.
>>
>> It allows specific GPIOs to be configured without any driver specific code.
>>
>> Particularly usefull when a external device is connected to a bus and the
>> bus connections depends on an external switch controlled by a GPIO pin.
>> Or when some GPIOs have to be exported to sysfs without any userspace
>> intervention.
>>
>> Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
>> ---
>>   Documentation/devicetree/bindings/gpio/gpio.txt |   47 ++++++++
>>   drivers/base/Makefile                           |    1 +
>>   drivers/base/dd.c                               |    5 +
>>   drivers/base/gpio.c                             |   59 ++++++++++
> I don't understand what makes GPIO's "special" enough to get included in
> the driver core like this, and called for each and every device that is
> added to the system.


> What's wrong with the generic device callbacks/notifiers we already
> have?  Why does this need to be in the driver core?  And what exactly
> are you doing all of this for in the first place?

Nothing's wrong with the generic device callbacks/notifiers, but in some
cases we don't want a generic driver to handle board specificities.

This is the case for the at91rm9200ek board (see this thread:
https://www.mail-archive.com/devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg06838.html).

Since we are moving all boards to dt, we can't configure each board at
startup, and the rm9200ek board used to set a pin to a specific value 
(this pin
is connected to an external switch which connects MMC signals to the MMC
connector or SPI signals to an SPI device depending on the pin value) in 
order
to enable the MMC0 port or an SPI device.

I first proposed to handle this using a pinctrl pinconf definition (with 
pinctrl
output-high config). As pinctrl are requesting pinconf before calling 
driver probe
function, this was absolutely transparent to the generic driver.
But, as Linus pointed out, this pin is not really related to the SPI or 
MMC device
itself.
This is why Linus suggested the GPIO hog approach.

Anyway, I'm open to any other solution that wouldn't introduce specific
cases in arch specific code or generic drivers.

Best Regards,

Boris
> greg k-h

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
