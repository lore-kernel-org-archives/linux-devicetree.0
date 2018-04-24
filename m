From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 0/7] gnss: add new GNSS subsystem
Date: Tue, 24 Apr 2018 21:44:08 +0200
Message-ID: <8F4FAF5B-AAA9-4D46-A022-99B96C74ABFA@goldelico.com>
References: <20180424163458.11947-1-johan@kernel.org> <31CF06C6-D6ED-4930-8D81-12256A518059@goldelico.com> <20180424175050.GG4615@localhost>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180424175050.GG4615@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


> Am 24.04.2018 um 19:50 schrieb Johan Hovold <johan@kernel.org>:
> 
> On Tue, Apr 24, 2018 at 07:40:00PM +0200, H. Nikolaus Schaller wrote:
>> Hi Johan,
>> 
>>> Am 24.04.2018 um 18:34 schrieb Johan Hovold <johan@kernel.org>:
> 
>>> As proof-of-concept I have implemented drivers for receivers based on
>>> two common GNSS chipsets (SiRFstar and u-blox), but due to lack of
>>> hardware these have so far only been tested using mockup devices and a
>>> USB-serial-based GPS device (using out-of-tree code). [ Let me know if
>>> you've got any evalutation kits to spare. ]
>> 
>> Ok, those drivers look nice on first glance.
>> 
>> BTW: I have refactored our w2sg00x4 driver into a gps-core (still creating
>> a /dev/GPS0) and a driver using a common API.
>> 
>> With that it should almost fit by coping some lines from your serdev based
>> device drivers.
> 
> I think it should be done the other way round (if I understand you
> correctly), that is, by adding support for configurations were WAKEUP is
> left not connected to the sirf driver instead.

Hm. Yes, the w2sg00x4 is a Sirf based chip.

> I had that use-case in mind when implementing

s/implementing/reinventing/

> the driver, and some ideas of how it should be
> done, but did not get around to actually implement it yet.

What do you need ideas for? We have that function working and
submitted year after year, but it was always rejected for API
reasons.

You could have simply reused what we have proposed [1] and just
adapt it to the new API instead of writing a new driver (which
is missing some features for us).

"proof-of-concept" is misleading if you expect this to become
*the* Sirf driver and we are just invited to add some features
to that. Making our own work and proposals completely obsolete.

What I find really strange and foul play is that we are in the
review process and then comes a hidden counter-proposal by the
reviewer.

Well, this is FOSS...

BR,
Nikolaus

[1]: https://patchwork.ozlabs.org/cover/843392/
