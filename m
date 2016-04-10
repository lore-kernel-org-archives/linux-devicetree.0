From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
Subject: Re: GPIO character device next steps
Date: Sun, 10 Apr 2016 18:18:54 +0100
Message-ID: <570A8AFE.1060008@jic23.retrosnub.co.uk>
References: <CACRpkdYDjN8R60hhhu4RK9LF2cChOkA98pgvy2TzG9MAT1qGRw@mail.gmail.com>
 <570A6E67.8000802@kernel.org>
 <CACRpkdZ6908HQpwaco6Ffredw0voJJAg-bPj-cxaJOnFj14Geg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZ6908HQpwaco6Ffredw0voJJAg-bPj-cxaJOnFj14Geg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lee Campbell <leecam@google.com>, Amit Kucheria <amit.kucheria@linaro.org>, Markus Pargmann <mpa@pengutronix.de>, Michael Welling <mwelling@ieee.org>
List-Id: devicetree@vger.kernel.org

On 10/04/16 16:53, Linus Walleij wrote:
> On Sun, Apr 10, 2016 at 5:16 PM, Jonathan Cameron <jic23@kernel.org> wrote:
>> On 08/04/16 19:32, Linus Walleij wrote:
>>>
>>> As you know we froze the GPIO sysfs ABI in kernel v4.6 and
>>> now we need to complete its replacement with a new mechanism
>>> using the character device.
>>
>> Does it actually make sense to replace it?  Or rather extend
>> it via the chardev. I've not really been following the discussion
>> though if you've already addressed this.
> 
> We're freezing it. It can be used in parallel for the foreseeable
> future but the chardev is default-enabled in order to make people
> prefer that, the sysfs (/sys/class/gpio) needs to be turned on
> explicitly.
> 
> The sysfs is a sad story because it is completely stateless, i.e.
> we have no clue of knowing if a userspace process is actually
> alive and using a certain GPIO or not, there is nothing that closes
> it down if the consumer dies etc.
Fair enough.
> 
>>> - Give them consumer names from userspace (label who's
>>>   using this GPIO)
>>
>> Useful to what?  What is going to read this info? (debugfs?)
> 
> Also lsgpio, also the kernel can print "I can's use GPIO n just
> right now because a userspace consumer is using it for <string>"
> we just chose the model to name both ends of the
> GPIO line, the producer and the consumer. The producer and
> consumer can both label their end.
> 
> Of course I could just hard-code all userspace consumers as
> the string "userspace" if people prefer that.
> 
>>> - Getting a filehandle to listen to input events (interrupts) from a
>>>   certain GPIO line. Here I am primarily thinking about something
>>>   akin to IIO's event mechanism using poll() which I like a lot.
>>
>> We don't support multiple listeners in IIO.  Maybe some combination
>> of that and evdev which spins off a separate fifo for each listener.
> 
> Yes people were talking about evdev as a good example of
> how to do this. I will have to look into that code, it seems like
> a good idea.
> 
>>> I'm thinking about staying with a single open() on the chardev
>>> from userspace, but several processes can open handles, then
>>> we need to use an ioctl() to say what we want from this
>>> filehandle: whether a handle on a few GPIO lines or a polled
>>> event.
>>
>> Perhaps use anonymous file handles for each case.  So the exposed
>> chardev is simply there for configuration of what others will do.
>> Then you can have an ioctl to get an anonymous file handle for each of
>> (with the appropriate description of what it is handling).
> 
> Sounds about right. Can you point me to a place where anonymous
> file handles are delivered out from the kernel?
Yup, do that in IIO for event chardevs.  See
drivers/iio/industrialio/industrialio-core.c iio_ioctl
> 
>> * Read multiple inputs
>> * Write multiple outputs
>>
>> (for both of these are you distinguishing between cases where you an guarantee
>> they happen simultaneously and others where they are just close in time?
>> Makes a huge difference in some cases obviously - such as reading from a parallel
>> ADC - or writing to a DAC).
> 
> What happens in practice is that if the back-end supports
> the .set_multiple() callback, and it turns out that it can be
> performed by a single register write or so, then it will happen
> simultaneously. Else the kernel will issue individual .set()
> calls.
Would be good to let userspace know if this can be done or not...
Otherwise 'weird' timing bugs are likely to confuse people.
> 
> We have no .get_multiple(). Maybe one day someone will
> implement it :/
> 
>> * Events - though that could probably be shared with a read multiple inputs
>> chardev - or maybe not if it's about different pins...
>>
>> Re reading above I guess you may already mean this by one file for multiple
>> things?
> 
> I guess
> one filehandle for reading n GPIOs
> one filehandle for writing/toggling n GPIOs
> one event filehandler for getting events from one GPIO
> 
> Each which will relase its GPIO[s] at close.
Sounds right.  Though a given userspace consumer may well use a
number of each of those..
> 
>>> We want to be mutually exclusive to processes when getting
>>> pins for output, while making it possible for several clients
>>> to read the same line or subscribe to events from the same
>>> line.
>>
>> Are you thinking one file descriptor for one pin (for events) or
>> handling more complex registrations?  I can see the infrastructure
>> for this getting rapidly complex.
> 
> No just one FD for one GPIO line for events. Else it's
> going to get hopeless.
Certainly fiddlier ;)
> 
>> Could do it with irq_chips like we do in IIO triggers - so you can
>> have one irq fire multiple listening devices...
> 
> TBH I never quite wrapped my head around that forked irqchip
> thing, it scares the living daylights out of me. Its like a virtual irqchip
> and there it looses me.
*laughs*  It's actually much simpler than you'd think.  We'd just ended
up implementing our own logic for handling making an interrupt do a whole
load of different things (registered by different drivers).

Arnd Bergman (IIRC) pointed out that the irq chip stuff does it already
so we switched over.  Was hairy in the early days because of stupid
restrictions on how many IRQs platforms would support, but I think that
has mostly gone away now.  Lots of MFD parts use them the same way these
days.
> 
>> I've been thinking about how to handle logic analyzer type
>> inputs in IIO for a while.
> 
> A logic analyzer seems like a pretty extreme case of general
> purpose input, does it not?
Yup - always target the extremes - it's more fun that way ;)
> 
>> One example is beaglelogic with it's around
>> 100MHz sampling of 8 channels, It might be interesting to use some of
>> this same gpio infrastructure to play around with the ideas (though probably
>> not the actual beaglelogic data flows - that will need some large block transfer
>> tricks) - particularly once you have nice functions to feed sets of gpios
>> from arbitrary locations out on a read.
>>
>> Clearly there would be some overlap, but I doubt you'll get into the
>> complexity of triggered captures etc here or at least not without jumping
>> to userspace and back again.  Some gpio chips do support this sort of
>> sampling, but I suspect they aren't going to be found in many 'normal'
>> systems. (e.g. an input bank latch on event).
>>
>> Anyhow, this was really just a request to keep any data handling/merging
>> infrastructure nicely separated from the front end bit spitting it out of
>> a chardev as there are/may be other usecases.
> 
> Hm I'll CC you on the patches when we get there and you can tell
> me what to split out in its own .c/.h file :)
Meh. Can always do it later if it makes sense - only have to get the userspace
right at this stage.
> 
> I can easily see people setting up systems that will use a bunch of
> GPIOs alongside a bunch of sensors or DAC/ADCs so I hope for the
> GPIO and IIO worlds to stay close.
Absolutely. Nothing the odd little bridge driver can't deal with as long
as we can put in the relevant bits to avoid jumping backwards and forwards
from userspace.

Anyhow, the really fun bit is seeing what horrendous userspace hacks
occur because we gave them the means to do crazy things ;)

Jonathan
> 
> Yours,
> Linus Walleij
> 

