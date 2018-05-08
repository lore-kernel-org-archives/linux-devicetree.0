From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/7] gnss: add new GNSS subsystem
Date: Tue, 8 May 2018 09:01:53 +0200
Message-ID: <20180508070153.GX2285@localhost>
References: <20180424163458.11947-1-johan@kernel.org>
 <20180504132741.brn5jqv5ufjhp7ky@earth.universe>
 <20180507102056.GU2285@localhost>
 <FA27606D-AB12-4D62-8EBD-3CC6F0900AF7@holtmann.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <FA27606D-AB12-4D62-8EBD-3CC6F0900AF7@holtmann.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Johan Hovold <johan@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Pavel Machek <pavel@ucw.cz>, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, May 07, 2018 at 09:06:44PM +0200, Marcel Holtmann wrote:

> >> I have one concern, though. While providing raw data by
> >> default is fine generally, it is a problem with device
> >> auto-discovery. I think there should be some IOCTL from
> >> the start, that can be used to inform userspace about
> >> the raw protocol being used (i.e. "NMEA"). I fear, that
> >> userspace may start to just assume raw = NMEA without
> >> having this (especially since all initial drivers provide
> >> NMEA).
> > 
> > One problem I see here would be that the driver does not necessarily
> > know either what protocol is currently being used. Some devices have
> > boot-pins which can be used to configure the initial protocol used (and
> > this could perhaps be reflected in DT), but this can often later be
> > changed (by user space) and even be made persistent using battery-backed
> > ram or eeproms.
> > 
> > Also note that at least u-blox devices supports having more than one
> > protocol active on the same port...
> 
> as long as userspace can determine that it is GNSS hardware and what
> hardware it is, then you deal with the rest in userspace.

Yeah, I think that will do for now.

Thanks,
Johan
