From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/7] gnss: add new GNSS subsystem
Date: Tue, 24 Apr 2018 19:50:50 +0200
Message-ID: <20180424175050.GG4615@localhost>
References: <20180424163458.11947-1-johan@kernel.org>
 <31CF06C6-D6ED-4930-8D81-12256A518059@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <31CF06C6-D6ED-4930-8D81-12256A518059@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 24, 2018 at 07:40:00PM +0200, H. Nikolaus Schaller wrote:
> Hi Johan,
> 
> > Am 24.04.2018 um 18:34 schrieb Johan Hovold <johan@kernel.org>:

> > As proof-of-concept I have implemented drivers for receivers based on
> > two common GNSS chipsets (SiRFstar and u-blox), but due to lack of
> > hardware these have so far only been tested using mockup devices and a
> > USB-serial-based GPS device (using out-of-tree code). [ Let me know if
> > you've got any evalutation kits to spare. ]
> 
> Ok, those drivers look nice on first glance.
> 
> BTW: I have refactored our w2sg00x4 driver into a gps-core (still creating
> a /dev/GPS0) and a driver using a common API.
> 
> With that it should almost fit by coping some lines from your serdev based
> device drivers.

I think it should be done the other way round (if I understand you
correctly), that is, by adding support for configurations were WAKEUP is
left not connected to the sirf driver instead. I had that use-case in
mind when implementing the driver, and some ideas of how it should be
done, but did not get around to actually implement it yet.

Thanks,
Johan
