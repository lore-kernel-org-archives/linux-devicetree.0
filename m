From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v3 0/8] gnss: add new GNSS subsystem
Date: Wed, 13 Jun 2018 10:21:23 +0200
Message-ID: <20180613082123.GB30381@localhost>
References: <20180601082259.17563-1-johan@kernel.org>
 <20180601093311.GA31639@amd>
 <20180601094959.GA13775@localhost>
 <20180601102612.GC31639@amd>
 <20180601122217.GB13775@localhost>
 <20180601162645.GA30792@amd>
 <20180604102238.GC13775@localhost>
 <20180605214752.GB28143@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180605214752.GB28143@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Marcel Holtmann <marcel@holtmann.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 05, 2018 at 11:47:52PM +0200, Pavel Machek wrote:
> Hi!
> 
> > > udev solves device discovery pretty well; I don't think that's good
> > > thing to optimize for.
> > 
> > It's about grouping related devices together, devices which share some
> > common functionality. In this case, providing location data from some
> > satellite system. I really don't understand how you can find having a
> > class type named "gnss" for this to be controversial in any way.
> 
> We normally group devices by interface, not by functionality.

And interfaces also tend to reflect functionality.

> > > (And.. I'd really prefer /dev/nmeaX and /dev/sirfX in that situation;
> > > and yes that makes it _even easier_ for location service to find right
> > > devices). 
> > 
> > As I've already explained, you may not know which protocol is currently
> > active when the device start and you typically switch from NMEA to a
> > vendor protocol during runtime (e.g. for configuration or to access raw
> > GNSS data).
> > 
> > Trying to encode the GNSS protocol in the character-device node name is
> > just a bad idea.
> 
> I thought idea was to switch to the "best" protocol in kernel.

I'm afraid it's not that simple; the vendor protocols are not always
supersets of the data and commands provided by the NMEA modes.
Apparently, some data is only available in NMEA mode for SiRF devices,
for example, so we need to provide some flexibility here.

> > > > As mentioned in the cover letter, we may eventually want to add support
> > > > for some kinds of configuration from within the kernel (e.g. protocol
> > > > and line speed changes).
> > > 
> > > I believe we'll eventually want "real" GPS drivers, with common
> > > interface. input was in this situation before...
> > 
> > As we also already discussed, there's nothing preventing you from trying
> > to move gpsd into the kernel later. I doubt this is something we want,
> > and it may turn out not to be feasible for other reasons.
> 
> Well -- I believe we want "gpsd in kernel". If you take /dev/gnss0 and
> drivers/gnss now, where do I put them?

The subsystem would still live under drivers/gnss. If there's ever going
to be an in-kernel gpsd, then maybe /dev/gnss0 could have been used for
it instead (if a character device is even the right interface).

I started off with separating the gnss device itself from the raw
interface (cf. hid) to allow for something like that, but the more I
looked into this the more it seems I was just over-engineering for
something that would never be realised.

Take a look at some of the papers on the gpsd site about GNSS protocols
and the problem of finding a common representation for all the various
devices out there. gpsd itself has already gone through three revisions
of its internal representation over the past decades. This does not seem
like an exercise we want to repeat in the kernel with its rules about
backwards compatibility etc.

So at least for the time being, I'm convinced that a raw gnss interface
is the right one.

> > Ok, so I did read the damn thing along with the overview of the N900 GPS
> > hardware and reverse-engineered protocol (why didn't you point me to
> > those instead?) and I'm still not sure what the point you're trying to
> > make is.
> 
> Umm. Where did you find the hardware overview/protocol overview?

It looks like Sebastian (and others) once put something together here:

	https://wiki.maemo.org/N900_Hardware_GPS
	https://wiki.maemo.org/N900_GPS_Reverse_Engineering

> > The n900 service you link to above, parses phonet data, does some
> > *floating point* calculations and generates NMEA sentences which it
> > feeds to a pseudo terminal whose slave side is opened by gpsd.
> > 
> > That NMEA data could just as easily be fed through a different kernel
> > subsystem, namely gnss instead of tty, where it could be accessed
> > through a common interface (for now, a raw gnss interface, with some
> > associated meta data). [ And from what I can tell, ugnss would also
> > allow you to get rid of some hacks related to finding out when the GNSS
> > is opened and needs to be powered on. ]
> > 
> > So the ugnss interface looks like it will work for N900 just as it will
> > for other phones.
> 
> Not NMEA please. First, NMEA has strange format of latitude/longitude
> -- that's those calculations IIRC. NMEA has other problems, too --
> like not atomically providing speeds and accuracies. Plus it is crazy
> text protoco with CRCs.

Then of course you also have the issue that all of user space would need
to be taught to understand this yet-to-be-conceived generic protocol.

> > > NMEA would not be my first choice, really. I'd propose something very
> > > similar to existing /dev/input/eventX, but with wider data types.
> > 
> > Fine, you pursue that idea if you want then. I can see many problems
> > with trying to so, but the point is, this series doesn't prevent you
> > from doing so.
> 
> > If you think you'll one day be able to parse and repackage the various
> > vendor protocols within the kernel, you can consider the raw gnss
> > interface as an intermediate step (which may continue to exist in
> > parallel just as say hidraw).
> > 
> > As I've already mentioned, I considered naming the device nodes
> > /dev/gnssraw0 partly because it would leave /dev/gnss namespace free for
> > any such future development. I ultimately found that idea to be too
> > implausible for it to be worth the potential confusion arising from the
> > fact that "raw" GNSS data is already has an established meaning.
> > 
> > But in the end, this is just name bike shedding.
> 
> So I agree /dev/gnssraw is not great. But /dev/gnss is even worse. And
> yes, it is "just" a naming, but it will be impossible to fix later.
> 
> /dev/serdev? /dev/gnssproto?

Again, the gnss subsystem is transport agnostic so /dev/serdev is not
an option.

gpsd uses the term "raw" for its raw access to the device protocol.
Probably best to use "gnssraw" in case this needs to be changed at all.

Thanks,
Johan
