From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 0/7] gnss: add new GNSS subsystem
Date: Thu, 26 Apr 2018 12:10:02 +0200
Message-ID: <7A11E17A-64B7-4B39-87EC-D6A52773850B@goldelico.com>
References: <20180424163458.11947-1-johan@kernel.org> <31CF06C6-D6ED-4930-8D81-12256A518059@goldelico.com> <20180424175050.GG4615@localhost> <8F4FAF5B-AAA9-4D46-A022-99B96C74ABFA@goldelico.com> <20180425081120.GL4615@localhost>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180425081120.GL4615@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Johan,

> Am 25.04.2018 um 10:11 schrieb Johan Hovold <johan@kernel.org>:
>=20
> On Tue, Apr 24, 2018 at 09:44:08PM +0200, H. Nikolaus Schaller wrote:
>=20
>>> Am 24.04.2018 um 19:50 schrieb Johan Hovold <johan@kernel.org>:
>=20
>>> I think it should be done the other way round (if I understand you
>>> correctly), that is, by adding support for configurations were =
WAKEUP is
>>> left not connected to the sirf driver instead.
>>=20
>> Hm. Yes, the w2sg00x4 is a Sirf based chip.
>>=20
>>> I had that use-case in mind when implementing
>>=20
>> s/implementing/reinventing/
>>=20
>>> the driver, and some ideas of how it should be
>>> done, but did not get around to actually implement it yet.
>>=20
>> What do you need ideas for? We have that function working and
>> submitted year after year, but it was always rejected for API
>> reasons.
>>=20
>> You could have simply reused what we have proposed [1] and just
>> adapt it to the new API instead of writing a new driver (which
>> is missing some features for us).
>=20
> Your code was broken or needed to be updated in several ways as I
> pointed out in the thread you refer to.

No, it was not broken (it is in daily use and no practical problems
are known), but surely does not cover some corner-cases (e.g. races).

I said we should focus firstly on the "abstraction level". So I
postponed these code issues from discussion.

In the end you announced to provide a new kernel API which would
make most of the code (all tty stuff) and related problems go away
anyways.

Therefore I simply did wait for this API to come, before fixing the
remaining issues and submitting a new v6.

> It also did not support all those systems that use the same family of
> chips, but which has the WAKEUP signal connected.

That is simply wrong.

It supports them. It just does not make use of the WAKEUP signal, but
uses a different mechanism to detect the power state of the chip.

So our driver is more complete because it gracefully handles a
WAKEUP line (by ignoring it) while yours doesn't handle the opposite
case of a missing WAKEUP.

>=20
>> "proof-of-concept" is misleading if you expect this to become
>> *the* Sirf driver and we are just invited to add some features
>> to that. Making our own work and proposals completely obsolete.
>>=20
>> What I find really strange and foul play is that we are in the
>> review process and then comes a hidden counter-proposal by the
>> reviewer.
>=20
> Dude, in the very same thread you refer to above, after being asked to
> reiterate your proposal to find and appropriate abstraction level you
> reply:
>=20
> 	"Yes, please feel free to write patches that implement it that
> 	way."

When looking back, I understand that as that I suggested to add a =
"proper
abstraction level" (i.e. a gps framework) so that *we* can make use of
it.

I never meant that you should completely replace our driver by an =
incomplete
solution.

>=20
> Now I've done just that for you, and then you whine about that too.

At the end of the thread (which I take as the result of v5 review) you =
said:

"Yeah, I think this is a dead end. We need some kind of gps framework
with drivers that can implement the device specific bits.

I may have some time to look at little closer at it this week."

And I answered and laid down my plans for a v6:

"Ok, that would be fine if we can get that!

For a minimal set of API I think something like this (following hci_dev) =
would suffice:

...

If that would wrap all creation of some /dev/ttyGPS0 (or however it is =
called),
it would fit our needs for a driver and user-space for our system.

And I would be happy to get rid of creating and registering a =
/dev/ttyGPS0
in the w2sg0004 driver.

Then, the driver will not need to be touched if the GPS framework is =
improved
in some far future (e.g. to provide some additional ioctl for getting =
kalman-filtered
position+heading by doing sensor fusion with some iio-based =
accelerometer/gyro).=20

So I am looking forward to some framework for review and integration =
testing."

I think it was clear and understandable what I expected (a new framework =
instead
of creating ttys in the driver) and what I did not (a replacement of our
w2sg0004 proposal with a variant with missing features).

The problem I have with this sort of review process is that I now have =
to
reintegrate the missing pieces of handling the non-WAKEUP case and LNA
control and rfkill into your code.

Instead of stripping down our code and adjusting to your API.

Alternatively I have to wait until you present some code of which you
think it works. Would you also test it? Probably no. Because of lack of =
hardware.
So I have to test your new code in an area where I have well-hung code =
being
in daily use.

And your new code may still be incomplete wrt. what our driver provides =
to users.

I hope that you understand that this is now more work for me in any =
case...

So in the end I will have:
* a new but still incomplete driver that is a regression compared to our =
old driver
* even more testing work in addition 5 years urging for acceptance
* no appreciation because you sign off and author everything

Is this a good deal or a reason to contribute to our common project?

If you want an example how to get rid of volunteers contributing, this =
may
be one...

>=20
> SiRF is a very common chip and I wanted to make sure that the common
> setup with WAKEUP connected was supported from the start. I'll get to
> your configuration in time too.

As said, our driver would also work if the WAKEUP line exists, and is
described in DT, but is broken.

So we will probably stay with our out-of the kernel driver for the time =
being.

BR,
Nikolaus

> [1]: https://patchwork.ozlabs.org/cover/843392/
