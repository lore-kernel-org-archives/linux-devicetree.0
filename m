From: Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Fri, 28 Aug 2015 12:32:16 -0700
Message-ID: <CAPiN7iUahed1uoMaFzVYHrdb-yRFUiej+c9S3GjZ0D2jw2+ygw@mail.gmail.com>
References: <01e601d0e0f9$614450d0$23ccf270$@gmail.com>
	<20150828101227.GD31748@leverpostej>
	<CAPiN7iV6LF6LtatzCQ5H6Nq=WivE+e4Z1OsA5cArkEZKqwPLBQ@mail.gmail.com>
	<20150828180544.GT12027@sirena.org.uk>
	<CAPiN7iXep-rWN5DyU1+Toso9CT7ppuNyEXX6ySU3AnxwBro2_A@mail.gmail.com>
	<20150828185256.GW12027@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150828185256.GW12027-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 28, 2015 at 11:52 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Aug 28, 2015 at 11:43:19AM -0700, Chris Read wrote:

> Please delete unneeded context from your replies, it makes it much
> easier to find any new content you have added.
Thanks.  I'll do better.

> Sure, but that's just a normal driver...  ideally for these sorts of
> connectors there'd also be a way of enumerating anything that is
> connected (but often that's not specified).

So for such a connector, would it be appropriate to have a kernel
module that gets configured using DT data, that is intended to be
an "enumerator" of GPIOs, in that it configures them (sets them to
input/output, gives labels, etc.), and also exposes them to
userspace (if specified in the configuration data)?

>> > A driver can instantiate a userspace consummer if it finds that useful.
>
>> There is a userspace power-regulator consumer driver (found in
>> drivers/regulator/userspace-consumer.c) that was created to do
>> just that.  It allows hooking up a userspace controlled consumer
>> to any regulator allowing control from userspace.  So far so good.
>
> No, you're missing the point.  The point is that that driver can be
> instantiated from another device (one that describes the actual
> hardware) if it is useful to do so.
Perhaps I'm misunderstanding.  Is there already a board-specific
not driver-specific way to have the userspace-consumer get attached
to a regulator?  Can you point me at it?

> I'd be very cautious about general drivers exposing regulators to
> userspace at all...

Certainly most don't.  We have externally powered devices that we
want to power on and off, though, so sometimes it's helpful.

Thanks,

Chris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
