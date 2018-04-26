From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/7] gnss: add new GNSS subsystem
Date: Thu, 26 Apr 2018 20:21:36 +0200
Message-ID: <20180426182136.GX4615@localhost>
References: <20180424163458.11947-1-johan@kernel.org>
 <31CF06C6-D6ED-4930-8D81-12256A518059@goldelico.com>
 <20180424175050.GG4615@localhost>
 <8F4FAF5B-AAA9-4D46-A022-99B96C74ABFA@goldelico.com>
 <20180425081120.GL4615@localhost>
 <7A11E17A-64B7-4B39-87EC-D6A52773850B@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7A11E17A-64B7-4B39-87EC-D6A52773850B@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 26, 2018 at 12:10:02PM +0200, H. Nikolaus Schaller wrote:

> > Am 25.04.2018 um 10:11 schrieb Johan Hovold <johan@kernel.org>:
> > 
> > On Tue, Apr 24, 2018 at 09:44:08PM +0200, H. Nikolaus Schaller wrote:
> > 
> >>> Am 24.04.2018 um 19:50 schrieb Johan Hovold <johan@kernel.org>:

> >> You could have simply reused what we have proposed [1] and just
> >> adapt it to the new API instead of writing a new driver (which
> >> is missing some features for us).
> > 
> > Your code was broken or needed to be updated in several ways as I
> > pointed out in the thread you refer to.
> 
> No, it was not broken (it is in daily use and no practical problems
> are known), but surely does not cover some corner-cases (e.g. races).

I'd certainly be sceptical about accepting code into the kernel from
anyone who completely ignores locking and considers concurrency to be a
corner case that he cannot be bothered with.

Sure, out-of-tree code is often sub-par, and that is partly why it
remains out of tree.

> I said we should focus firstly on the "abstraction level". So I
> postponed these code issues from discussion.
> 
> In the end you announced to provide a new kernel API which would
> make most of the code (all tty stuff) and related problems go away
> anyways.
> 
> Therefore I simply did wait for this API to come, before fixing the
> remaining issues and submitting a new v6.

Yes, and that's perfectly reasonable, but I wouldn't want to base my
work on something in that state.

> > It also did not support all those systems that use the same family of
> > chips, but which has the WAKEUP signal connected.
> 
> That is simply wrong.
> 
> It supports them. It just does not make use of the WAKEUP signal, but
> uses a different mechanism to detect the power state of the chip.

Sure, but in a highly inefficient way since without WAKEUP you can
never be certain that the device is in hibernate, but only assume so
after a lengthy (as in seconds) timeout has passed without any I/O.

> So our driver is more complete because it gracefully handles a
> WAKEUP line (by ignoring it) while yours doesn't handle the opposite
> case of a missing WAKEUP.

I never claimed to support your configuration from the start, but I kept
it in mind while implementing the framework in order to facilitate for you.

Heck, besides getting the whole frame work implemented for you --
thereby making this the closest to mainline support for your system that
you've been over the course of the past five years or however long
you've been at it -- there's now also an already integrated generic
sirf driver with all the basics in place (including runtime PM, and not
relying on legacy interfaces) that you can base your work off of.

> >> "proof-of-concept" is misleading if you expect this to become
> >> *the* Sirf driver and we are just invited to add some features
> >> to that. Making our own work and proposals completely obsolete.
> >> 
> >> What I find really strange and foul play is that we are in the
> >> review process and then comes a hidden counter-proposal by the
> >> reviewer.
> > 
> > Dude, in the very same thread you refer to above, after being asked to
> > reiterate your proposal to find and appropriate abstraction level you
> > reply:
> > 
> > 	"Yes, please feel free to write patches that implement it that
> > 	way."
> 
> When looking back, I understand that as that I suggested to add a "proper
> abstraction level" (i.e. a gps framework) so that *we* can make use of
> it.

Yes, you clearly weren't interesting in doing that work yourself.

> I never meant that you should completely replace our driver by an
> incomplete solution.

But surely you didn't expect your work not to require any kind of
integration into a new framework.

> > Now I've done just that for you, and then you whine about that too.
> 
> At the end of the thread (which I take as the result of v5 review) you said:
> 
> "Yeah, I think this is a dead end. We need some kind of gps framework
> with drivers that can implement the device specific bits.
> 
> I may have some time to look at little closer at it this week."
> 
> And I answered and laid down my plans for a v6:
> 
> "Ok, that would be fine if we can get that!
> 
> For a minimal set of API I think something like this (following hci_dev) would suffice:
> 
> ...
> 
> If that would wrap all creation of some /dev/ttyGPS0 (or however it is called),
> it would fit our needs for a driver and user-space for our system.
> 
> And I would be happy to get rid of creating and registering a /dev/ttyGPS0
> in the w2sg0004 driver.
> 
> Then, the driver will not need to be touched if the GPS framework is improved
> in some far future (e.g. to provide some additional ioctl for getting kalman-filtered
> position+heading by doing sensor fusion with some iio-based accelerometer/gyro). 
> 
> So I am looking forward to some framework for review and integration testing."
> 
> I think it was clear and understandable what I expected (a new framework instead
> of creating ttys in the driver) and what I did not (a replacement of our
> w2sg0004 proposal with a variant with missing features).

Sounds like you think you've given me some kind of order that I had to
fulfil. Sorry, but it doesn't work that way.

> The problem I have with this sort of review process is that I now have to
> reintegrate the missing pieces of handling the non-WAKEUP case and LNA
> control and rfkill into your code.

Yes, you're not getting everything for free.

Besides, I have concerns about using rfkill for GNSS (which does not
transmit any radio), and external LNA control is not something that is
a chip feature but rather something that should be handled by the
framework.

So this wouldn't be a simple code dump for you anyway.

> Instead of stripping down our code and adjusting to your API.
> 
> Alternatively I have to wait until you present some code of which you
> think it works. Would you also test it? Probably no. Because of lack
> of hardware.  So I have to test your new code in an area where I have
> well-hung code being in daily use.

Of course I'll test it, but I can't say solving your problems for you
again is at the top of my list, if it ever were.

> And your new code may still be incomplete wrt. what our driver
> provides to users.
> 
> I hope that you understand that this is now more work for me in any
> case...

I fail to see how not having to implement a GNSS framework can be
considered more work for you.

> So in the end I will have:
> * a new but still incomplete driver that is a regression compared to
> our old driver

It's not a regression, the new mainline driver just wouldn't support
your configuration yet.

> * even more testing work in addition 5 years urging for acceptance
> * no appreciation because you sign off and author everything

You'd sign off on your own work (or was it really Neil Brown who
implemented the driver that you've since been adapting?).

There's still room for adding support for sirf configurations without
WAKEUP, generic LNA support, and possibly rfkill.

> Is this a good deal or a reason to contribute to our common project?
> 
> If you want an example how to get rid of volunteers contributing, this may
> be one...

Come on...

> > SiRF is a very common chip and I wanted to make sure that the common
> > setup with WAKEUP connected was supported from the start. I'll get to
> > your configuration in time too.
> 
> As said, our driver would also work if the WAKEUP line exists, and is
> described in DT, but is broken.
> 
> So we will probably stay with our out-of the kernel driver for the
> time being.

Ok.

Johan
