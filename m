From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/7] gnss: add new GNSS subsystem
Date: Wed, 25 Apr 2018 09:24:13 +0200
Message-ID: <20180425072413.GI4615@localhost>
References: <20180424163458.11947-1-johan@kernel.org>
 <20180424201318.GA14390@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180424201318.GA14390@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 24, 2018 at 10:13:19PM +0200, Pavel Machek wrote:
> Hi!
> 
> > This series adds a new subsystem for GNSS receivers (e.g. GPS
> > receivers).
> 
> Actually... I'd just call it GPS subsystem. Yes, GPS is a bit
> misleading, but so is GNSS. We'd like Loran to use similar interface,
> right? We'd like to QZSS to use similar interface, too...
> 
> https://www.pcworld.com/article/205325/japan_launches_its_first_gps_satellite.html
> . QZSS is not _global_ positioning system. Still they call it GPS. I'd
> call it GPS too.

What Marcel said. Never heard of Loran, but apparently it's no longer in
use:

	https://en.wikipedia.org/wiki/Radio_navigation#Satellite_navigation

> (Alternatively, we could have drivers/position and /dev/pos0...)

If you find such a system in use and implement a driver for it, we'll
just let it be the odd bird.

> Looking closer... I'm not sure if it makes sense to push different
> protocols (SiRF, NMEA, ...) through one device. Userland should know
> what protocol to expect... Yes, there will be common code between
> /dev/nmea0 and /dev/sirf0...

That's not how GNSS devices work. It does not seem to be uncommon to
switch to a vendor protocol with a richer feature set and back to NMEA
(e.g. for configuration). Raw GNSS data may also be available over the
vendor protocol, etc. And some devices even support using to protocols
concurrently on one port.

I was going to call the device node /dev/gnssraw0 (cf. hidraw), but
since "raw" GNSS measurement already has a meaning in this space I
decided to drop that suffix. It can all be accessed over /dev/gnss0.

> I don't know. I'd really like to see '/dev/input/event0'-like layer,
> so that userland would not need to know about different protocols. But
> your work solves some problems we have now...

Yeah, and moving gpsd into the kernel is probably never going to happen.
But if it were, we probably wouldn't be using a character device to
access it anyway.

Johan
