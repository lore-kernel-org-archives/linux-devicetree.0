From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/7] gnss: add new GNSS subsystem
Date: Wed, 25 Apr 2018 08:51:46 +0200
Message-ID: <20180425065146.GH4615@localhost>
References: <20180424163458.11947-1-johan@kernel.org>
 <20180425062659.GA5352@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180425062659.GA5352@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 25, 2018 at 08:26:59AM +0200, Pavel Machek wrote:
> Hi!
> 
> > This series adds a new subsystem for GNSS receivers (e.g. GPS
> > receivers).
> > 
> > While GNSS receivers are typically accessed using a UART interface they
> > often also support other I/O interfaces such as I2C, SPI and USB, while
> > yet other devices use iomem or even some form of remote-processor
> > messaging (rpmsg).
> >     
> > The new GNSS subsystem abstracts the underlying interface and provides a
> > new "gnss" class type, which exposes a character-device interface (e.g.
> > /dev/gnss0) to user space. This allows GNSS receivers to have a
> > representation in the Linux device model, something which is important
> > not least for power management purposes and which also allows for easy
> > detection and (eventually) identification of GNSS devices.
> 
> Actually... no, what you done is not GNSS subsystem. It is generic
> subsystem for a link + some controls, typically for power.
> 
> Yes, that setup is common for GPS receivers, but it is there also for
> modems (droid 4: usb + gpios) and bluetooth dongles (n900: serial +
> gpios).

Those would be handled by other subsystems.

The idea here is that eventually there may be more GNSS specific bits
added, such as 1PPS support that I already mentioned. If someone is
crazy enough to put a location service in the kernel with a more
high-level interface (an in-kernel gpsd) they can try, but I'm more and
more convinced that needs to remain in user space.

I did also already mentioned however, that some hybrid approach may be
doable, such as handling port setup over NMEA/UBX/SiRF from within the
kernel.

Johan
