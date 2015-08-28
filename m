From: Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Fri, 28 Aug 2015 11:43:19 -0700
Message-ID: <CAPiN7iXep-rWN5DyU1+Toso9CT7ppuNyEXX6ySU3AnxwBro2_A@mail.gmail.com>
References: <01e601d0e0f9$614450d0$23ccf270$@gmail.com>
	<20150828101227.GD31748@leverpostej>
	<CAPiN7iV6LF6LtatzCQ5H6Nq=WivE+e4Z1OsA5cArkEZKqwPLBQ@mail.gmail.com>
	<20150828180544.GT12027@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150828180544.GT12027-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 28, 2015 at 11:05 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Aug 28, 2015 at 10:24:54AM -0700, Chris Read wrote:
>> On Fri, Aug 28, 2015 at 3:12 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>
>> > So long as the DT describes the HW, the subsystem can then choose to
>> > expose the devices as it wishes, and any policy atop of that can then be
>> > applied in the usual manner (e.g. udev for access control, naming, etc).
>
>> The issue I see is that drivers may want to expose something in one case,
>> but not in another, in a very board-specific way.  For example an I2C GPIO
>> expander has a driver that allows reading and writing the GPIOs that it
>> provides.  In one system the GPIOs control power switches and the DT
>> is used to connect them to regulators, and they are activated as device
>> files are opened.  There is no need to expose any GPIOs to userspace.
>> On another board the GPIOs are attached to a connector that is intended
>> for customization by an end user.  The same driver will want to expose
>> the GPIOs to userspace in one case, but not in another.  Thus I see a
>> need for some kind of board-specific configuration mechanism--without
>> a "board file". It doesn't need to be DT.
>
> What's the issue you see here?  The GPIO subsystem isn't really for
> exposing things to userspace, it's for exposing GPIOs to the rest of the
> kernel.  The DT should just describe how the GPIOs are used and then the
> bindings for whatever the GPIOs are connected to will work out what to
> do with them, including exporting them to userspace if that's how
> they're handled.
There is also the case, as in the connector example above, where the
GPIOs are not connected to anything that has a driver associated with
it.  In those circumstances it seems reasonable to allow a kernel module
to act like the driver which you suggest would normally work out what
to do with the GPIOs, and export them if necessary.  My thought,
however, is that the kernel module would need to be configured with
board-specific data, including whether to expose the GPIOs to userspace.
It also seems like such configuration data might look like DT data.

>> > I don't see this as strictly a policy issue, because it's so
>> board-specific.
>
>> A policy would need to allow for features like GPIOs to be both exposed or
>> to not be exposed, but in a board-specific way.
>
> You're trying to handle this at the wrong level, it's not an issue for
> the GPIOs themselves.
>
>> I see a strong need for board-specific configuration of drivers as they
>> apply
>> to exposure to userspace, but that need does not yet seem well addressed.
>> There are some kernel modules (such as userspace-consumer.c) that are
>> specifically designed to assist with this, but without some way to specify
>> how to hook them up to other devices, they aren't available.
>
> A driver can instantiate a userspace consummer if it finds that useful.

There is a userspace power-regulator consumer driver (found in
drivers/regulator/userspace-consumer.c) that was created to do
just that.  It allows hooking up a userspace controlled consumer
to any regulator allowing control from userspace.  So far so good.

However, as I understand it, any hooks to allow attaching such that
consumer to a regulator would require the use of DT, and a patch
that was intended to provide those DT hooks was declined a year
or so ago.  So as I see it, it can't be used at present--at least without
some kind of board-specific source code to hook it up.  (And we don't
want board-specific source code.)

If a driver writer needs to conditionally expose some kind of control
to userspace based on some board-specific configuration mechanism,
I don't currently see a way to do that.

Thanks for your dialog on this--much appreciated,

Chris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
