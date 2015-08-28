From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Fri, 28 Aug 2015 11:12:28 +0100
Message-ID: <20150828101227.GD31748@leverpostej>
References: <01e601d0e0f9$614450d0$23ccf270$@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <01e601d0e0f9$614450d0$23ccf270$@gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris R <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 27, 2015 at 07:51:26PM +0100, Chris R wrote:
> Hi Mark,

Hi,

I've added the devicetree mailing list and a few maintainers, since this
is a recurring class of query.

> Sorry to write you out-of-the-blue, but I have a question/concern that I
> think has bearing on Linux kernel and device tree future, and your name is
> on some posts regarding DT & userspace.
> 
> In this one, http://www.spinics.net/lists/devicetree/msg43917.html, you
> state that you 'never expect to see "userspace" in a DT binding string', as
> DT is supposed to deal strictly with the interaction of HW components.
> 
> If I understand things correctly (and I'm relatively new to DT having been
> stuck with older kernels), we in the ARM/Linux world are using DT to do
> three things:
>     1.  Specify the hardware interactions
>     2.  Remove the need for board files for each board variant
>     3.  Allow the Linux kernel to plumb drivers together using the
> 'compatible = "<whatever>"' syntax
> My concerns lie in number 2 and number 3, with respect to userspace.
> 
> In my experience (primarily embedded OMAP3, but moving on now) one of the
> various purposes of the board file was to expose things to userspace
> (GPIO's, power supplies, ADC's etc.) so that they could be observed and even
> controlled from userspace.  So, I'm looking for how best to control hardware
> from userspace but without the customized board files I'm familiar with.
> 
> The above cited posting refers to the power regulator driver
> userspace-consumer.c, which is a regulator driver specifically designed to
> allow control of a hardware component from userspace.  I believe that this
> is a useful function to provide, and want to make use of it in my version of
> the kernel.  Is it possible to do so without a board file and without DT?
> If so, can you point me at some help?

I'm not specifically aware of how to achieve this, but this is really
down to the various subsystems to handle, rather than DT.

If you want to control regulators from userspace, then the regulator
subsystem needs to understand and expose regulators, rather than this
being left to arbitrary drivers to expose in arbitrary ways. If drivers
aren't exposing everything that they can, that is a driver issue.
Likewise for GPIOs, ADCs, etc.

So long as the DT describes the HW, the subsystem can then choose to
expose the devices as it wishes, and any policy atop of that can then be
applied in the usual manner (e.g. udev for access control, naming, etc).

The only thing which may need to be in the DT are constraints on those
resources, to make it harder for a user to accidentally destroy their
board by over-volting a device, and so on. The same would apply to ACPI
or any other hardware description provided to the kernel.

> In this stackoverflow posting,
> http://stackoverflow.com/questions/30008189/linux-kernel-regulator-consumer-
> usage-from-userspace, which wanted to control a power supply from userspace,

As far as I can tell from that posting, the regulator was exposed to
userspace, but the subsystem had locked it to some particular state. I
don't understand the precise details behind that, but the best people to
talk to would be the maintainers of the regulator framework (Liam
Girdwood and Mark Brown according to MAINTAINERS).

> the solution they came up with was to create their own driver that exported
> it, and then bind it in with the DT.  That doesn't really solve the
> keeping-userspace-out-of-the-DT issue.  I think it would have been much more
> efficient to have a standardized way to control a regulator from userspace
> (e.g. userspace-consumer.c) and have a standardized way to have the kernel
> bind it to the regulator.  My understanding, though, is that the new
> standard way to get such bindings is with DT.

As above, this has nothing to do with DT. I agree that the subsystems
should expose standard interfaces for the resources they expose, but I
don't think that it makes sense for an external file provided to the
kernel to tell the kernel what and what not to expose to userspace --
that's pure policy and/or implementation details.

> Similarly, I'd like to be able to signal the export of a GPIO to userspace
> (/sys/class/gpio/gpioWXY) without a customized board file.  Since we're
> using DT to specify the hardware in a system, it would be a convenient place
> to specify exporting GPIOs to userspace.

I believe that the GPIO subsystem maintainers (Linus Walleij and
Alexandre Courbot) were trying to make GPIO control from userspace more
consistent (independent of DT) for a while. However I am not all that
familiar with the GPIO subsystem and may have misunderstood some of the
work that's going on there.

> I've searched for ways to expose things to userspace for several days,
> especially GPIOs, but the device tree still looks like an obvious place to
> this naive person.  If there's a good way to do this without DT, I'm happy
> to do so.  I'm also happy to have DT remain purely hardware oriented, but I
> wonder if it would make sense to put an umbrella over DT that included other
> things than DT, such as userspace.
> 
> In summary, I'd like to see ways to specify the exposure of GPIOs, power
> supplies, etc. to userspace, specified using device-tree like bindings.  If
> the device-tree is not the place to do so, then could there be a
> "system-tree" or something like that which would keep the DT formally
> separate, but include it by reference and also add whatever other nodes and
> properties that are necessary to specify things like exposing GPIO's, ADC's
> and power supply controls?  That way we could have userspace-consumer.c
> control the desired regulator, but not have the binding with the DT itself.
> (By the way, it appears to me that the userspace-consumer.c driver is rather
> orphaned without the ability to bind using a DT-like mechanism.  No updates
> are going its way these days.)
> 
> Thanks for your patience and consideration,
> 
> Chris
> 
> P.S. I had another (unrelated) thought about DT.  Since DT is used to link
> HW components together, and HW drivers make queries of the DT to make
> bindings, would it make sense to have some kind of a DT template (i.e. small
> .dtsi file) that corresponds to each driver reside in the directory with
> each driver.  Board device trees would reference these templates, and
> include references to relevant parameters that they specify.  This might
> also help make board DT device instances more uniform between .dts files. 

As far as I can tell, all of this is simply applying a policy atop of
the hardware we have. We already have subsystems and udev for dealing
with that, and we should enhance those if necessary rather than trying
to place this in DT.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
