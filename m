From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 3/7] gnss: add generic serial driver
Date: Wed, 25 Apr 2018 12:58:50 +0200
Message-ID: <20180425105850.GQ4615@localhost>
References: <20180424163458.11947-1-johan@kernel.org>
 <20180424163458.11947-4-johan@kernel.org>
 <20180425085749.GC13295@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180425085749.GC13295@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 25, 2018 at 10:57:49AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 24, 2018 at 06:34:54PM +0200, Johan Hovold wrote:
> > Add a generic serial GNSS driver (library) which provides a common
> > implementation for the gnss interface and power management (runtime and
> > system suspend). This allows GNSS drivers for specific chip to be
> > implemented by simply providing a set_power() callback to handle three
> > states: ACTIVE, STANDBY and OFF.
> > 
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> >  drivers/gnss/Kconfig  |   7 +
> >  drivers/gnss/Makefile |   3 +
> >  drivers/gnss/serial.c | 288 ++++++++++++++++++++++++++++++++++++++++++
> >  drivers/gnss/serial.h |  47 +++++++
> >  4 files changed, 345 insertions(+)
> >  create mode 100644 drivers/gnss/serial.c
> >  create mode 100644 drivers/gnss/serial.h
> > 
> > diff --git a/drivers/gnss/Kconfig b/drivers/gnss/Kconfig
> > index 103fcc70992e..f8ee54f99a8d 100644
> > --- a/drivers/gnss/Kconfig
> > +++ b/drivers/gnss/Kconfig
> > @@ -9,3 +9,10 @@ menuconfig GNSS
> >  
> >  	  To compile this driver as a module, choose M here: the module will
> >  	  be called gnss.
> > +
> > +if GNSS
> > +
> > +config GNSS_SERIAL
> > +	tristate
> > +
> 
> Maybe a real help entry?  Or is this only selected from child drivers?
> I haven't gotten that far in the series, sorry...

Correct, it's only selected by child drivers.

Johan
