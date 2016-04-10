From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: GPIO character device next steps
Date: Sun, 10 Apr 2016 16:16:55 +0100
Message-ID: <570A6E67.8000802@kernel.org>
References: <CACRpkdYDjN8R60hhhu4RK9LF2cChOkA98pgvy2TzG9MAT1qGRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYDjN8R60hhhu4RK9LF2cChOkA98pgvy2TzG9MAT1qGRw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lee Campbell <leecam@google.com>, Amit Kucheria <amit.kucheria@linaro.org>, Markus Pargmann <mpa@pengutronix.de>, Michael Welling <mwelling@ieee.org>
List-Id: devicetree@vger.kernel.org

On 08/04/16 19:32, Linus Walleij wrote:
> As you know we froze the GPIO sysfs ABI in kernel v4.6 and
> now we need to complete its replacement with a new mechanism
> using the character device.
Does it actually make sense to replace it?  Or rather extend
it via the chardev. I've not really been following the discussion
though if you've already addressed this.
> 
> We can currently:
> 
> - Enumerate gpiochips - udev/systemd and its siblings
>   will do this automatically from the character devices
>   (a patch for mdev will be needed for BusyBox to enumerate
>   the chips).
> 
> - List its lines with name and consumer strings, that is what
>   "lsgpio" from tools/gpio/lsgpio.c does.
> 
> - Locate the offset of any desired GPIO line from this string
> 
> - Locate the gpiochip in the bus topology using sysfs
>   (as with any device)
> 
> So I need some help, rants, ACKs etc on whatever I come up
> with next, and the next steps are (from the top of my head):
> 
> - Naming GPIO lines from DT files
>   (So you have something reasonable to look for from userspace)
>   What do people think about just using
>   gpio-names = "foo", "bar", "baz"; as suggested by Rob Herring?
Seems sensible to me.
> 
> - Getting a filehandle for one or several GPIOs
>   I would prefer to support getting multiple GPIOs from day one
>   as we know this is going to be a usecase sooner or later.
Absolutely.
>   For example it is not uncommon to bitbang a bus from userspace
>   and then clock and data lines should
> 
> - Give them consumer names from userspace (label who's
>   using this GPIO)
Useful to what?  What is going to read this info? (debugfs?)
> 
> - Setting flags on a line from userspace (such as ACTIVE_LOW
>   or OPEN_DRAIN) so the hardware can act accordingly.
> 
> - Using this filehandle, shake the lines from low to high and vice
>   versa from userspace.
> 
> - Getting a filehandle to listen to input events (interrupts) from a
>   certain GPIO line. Here I am primarily thinking about something
>   akin to IIO's event mechanism using poll() which I like a lot.
We don't support multiple listeners in IIO.  Maybe some combination
of that and evdev which spins off a separate fifo for each listener.
> 
> - Getting the filehandle for events involves selecting trigger type
>   for rising/falling edge events. (I don't see how userspace could
>   possibly support or want to support level IRQs.)
> 
> I am thinking about using filehandles to get a grip on (multiple)
> GPIOs and for events because it has the nice property that we
> know very well when userspace is using the resource, and we can
> free it when the file is closed (which also happens if the application
> crashes or get killed, or at shutdown etc).
> 
> I'm thinking about staying with a single open() on the chardev
> from userspace, but several processes can open handles, then
> we need to use an ioctl() to say what we want from this
> filehandle: whether a handle on a few GPIO lines or a polled
> event.
Perhaps use anonymous file handles for each case.  So the exposed
chardev is simply there for configuration of what others will do.
Then you can have an ioctl to get an anonymous file handle for each of
(with the appropriate description of what it is handling).

* Read multiple inputs
* Write multiple outputs
(for both of these are you distinguishing between cases where you an guarantee
they happen simultaneously and others where they are just close in time? 
Makes a huge difference in some cases obviously - such as reading from a parallel
ADC - or writing to a DAC).

* Events - though that could probably be shared with a read multiple inputs
chardev - or maybe not if it's about different pins...

Re reading above I guess you may already mean this by one file for multiple
things?  
> 
> We want to be mutually exclusive to processes when getting
> pins for output, while making it possible for several clients
> to read the same line or subscribe to events from the same
> line.
Are you thinking one file descriptor for one pin (for events) or
handling more complex registrations?  I can see the infrastructure
for this getting rapidly complex.

Could do it with irq_chips like we do in IIO triggers - so you can
have one irq fire multiple listening devices...

> 
> Your thoughts?
Good luck ;)

I've been thinking about how to handle logic analyzer type
inputs in IIO for a while.  One example is beaglelogic with it's around
100MHz sampling of 8 channels, It might be interesting to use some of
this same gpio infrastructure to play around with the ideas (though probably
not the actual beaglelogic data flows - that will need some large block transfer
tricks) - particularly once you have nice functions to feed sets of gpios
from arbitrary locations out on a read.

Clearly there would be some overlap, but I doubt you'll get into the
complexity of triggered captures etc here or at least not without jumping
to userspace and back again.  Some gpio chips do support this sort of 
sampling, but I suspect they aren't going to be found in many 'normal'
systems. (e.g. an input bank latch on event).

Anyhow, this was really just a request to keep any data handling/merging
infrastructure nicely separated from the front end bit spitting it out of
a chardev as there are/may be other usecases.

Jonathan

> 
> Yours,
> Linus Walleij
> 

