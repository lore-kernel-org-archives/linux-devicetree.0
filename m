From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/7] gnss: add new GNSS subsystem
Date: Wed, 25 Apr 2018 09:32:43 +0200
Message-ID: <20180425073243.GJ4615@localhost>
References: <20180424163458.11947-1-johan@kernel.org>
 <20180424201318.GA14390@amd>
 <20180424225948.4d6a121c@aktux>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180424225948.4d6a121c@aktux>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Pavel Machek <pavel@ucw.cz>, Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 24, 2018 at 10:59:48PM +0200, Andreas Kemnade wrote:
> On Tue, 24 Apr 2018 22:13:19 +0200
> Pavel Machek <pavel@ucw.cz> wrote:
> 
> > Hi!
> > 
> > > This series adds a new subsystem for GNSS receivers (e.g. GPS
> > > receivers).  
> > 
> > Actually... I'd just call it GPS subsystem. Yes, GPS is a bit
> > misleading, but so is GNSS. We'd like Loran to use similar interface,
> > right? We'd like to QZSS to use similar interface, too...
> > 
> > https://www.pcworld.com/article/205325/japan_launches_its_first_gps_satellite.html
> > . QZSS is not _global_ positioning system. Still they call it GPS. I'd
> > call it GPS too.
> > 
> > (Alternatively, we could have drivers/position and /dev/pos0...)
> > 
> > Looking closer... I'm not sure if it makes sense to push different
> > protocols (SiRF, NMEA, ...) through one device. Userland should know
> > what protocol to expect... Yes, there will be common code between
> > /dev/nmea0 and /dev/sirf0...
> > 
> > I don't know. I'd really like to see '/dev/input/event0'-like layer,
> > so that userland would not need to know about different protocols. But
> > your work solves some problems we have now...
> > 
> I am not really sure what to do here. The question is if we can remove
> nmea parsing from userspace if the kernel does it? There is the
> use-case of having external loggers storing nmea data and userspace
> will access the logger data and needs to have nmea parsing for that
> anyway.
> 
> But for other more exotic stuff, it would be helpful that the user
> space does not need to handle the differences.
> 
> Hmm, maybe userspace could register something like uinput devices for
> having more complex calculation. Maybe triangulating using gsm cell
> reception data. And the uinput-like device would have properties
> attached like accuracy, costs.

There's also seems to be trend towards exposing raw measurements and
experimenting with different Position-Velocity-Time algorithms in user
space.

But in any case, moving gpsd into the kernel is not my aim here.

With a GNSS subsystem in place which would give us device detection and
power management from the start, people can start experimenting with
more features (e.g. device identification, feature flags, or possibly
higher-level protocol interfaces).

Thanks,
Johan
