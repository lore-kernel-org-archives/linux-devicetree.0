From: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Sun, 11 Jan 2015 10:29:00 -0600
Message-ID: <alpine.DEB.2.10.1501111009180.2556@shineypoop>
References: <1420575219-27061-1-git-send-email-atull@opensource.altera.com> <1420575219-27061-3-git-send-email-atull@opensource.altera.com> <20150107084819.GA1887@amd> <alpine.DEB.2.02.1501091302370.30067@linuxheads99> <20150109205643.GA5761@amd>
 <4D4EA2D5-68DD-49F7-9E2D-3A0A8F6AF9CA@konsulko.com> <20150110151118.GA16036@amd>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-991411654-1420993764=:2556"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150110151118.GA16036@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, iws-lulEs6mt1IksTUYHLfqkUA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org, rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, kyle.teske-acOepvfBmUk@public.gmane.org, nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, cesarb-PWySMVKUnqmsTnJN9+BGXg@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, Linus Walleij <linus.walleij@lin>
List-Id: devicetree@vger.kernel.org

--8323329-991411654-1420993764=:2556
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT

On Sat, 10 Jan 2015, Pavel Machek wrote:

> On Sat 2015-01-10 10:10:51, Pantelis Antoniou wrote:
> > Hi Pavel,
> > 
> > > On Jan 9, 2015, at 22:56 , Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org> wrote:
> > > 
> > > On Fri 2015-01-09 13:14:24, atull wrote:
> > >> On Wed, 7 Jan 2015, Pavel Machek wrote:
> > >> 
> > >>> On Tue 2015-01-06 14:13:37, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> > >>>> +
> > >>>> +What:		/sys/class/fpga_manager/<fpga>/firmware
> > >>>> +Date:		October 2014
> > >>>> +KernelVersion:	3.18
> > >>>> +Contact:	Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > >>>> +Description:	Name of the FPGA image file to load using firmware
> > >>>> class.
> > >>> 
> > >>> This one is ugly: it unneccessarily passes firmware name through the
> > >>> kernel. Just make interface and code simpler by always passing
> > >>> "socfpga-fpga-image" or something like that.
> > >>> 
> > >>> Thanks,
> > >>> 									Pavel
> > >> 
> > >> Hi Pavel,
> > >> 
> > >> It might be ugly.  It's not unnecessary.  Some uses of FPGAs involve
> > >> switching out the FPGA images dynamically under control of the userspace.
> > > 
> > > Then configure udev to load right firmware for you, or ln -s
> > > image-i-want-now socfpga-fpga-image to select the one to read…?
> > > 
> > 
> > Who said that udev is going to be available in the kind of system this is going to end in?
> 
> Noone.
> 
> > Doing ln -s tricks to load a different image? Really?
> 
> But if you don't have udev, you can do ln -s. It is better than
> open-coding symlink functionality into
> /sys/class/fpga_manager/<fpga>/firmware ... cause that's what this is.
> 
> Actually, clean implementation of "firmware" would be symlink in
> sysfs; but I'd say that would be overdoing it.
> 
> > I say the interface is fine as it is.
> 
> I say it is not.
> 									Pavel

Hi Pavel,

I see that we could do it that way and it would eliminate one of the
sysfs files (../fpga_manager/<fpga>/firmware).  Either way we are assuming
that there are fpga images in the filesystem in the firmware search path,
so I don't see why adding a piece of indirection (symlink) makes things
better.

We want to be able to switch out the FPGA image
under control of userspace.  So we don't want an interface that makes
it more cumbersome or tries to pretend that there's only one image.

Previous uses of the firmware layer has been to use it to load once after
bootup; this is different since some use cases will want to switch out
the FPGA image.  If someone wants there to be only one FPGA image on
the FGPA forever, they will probably not be using this framework; their
FPGA will probably be loaded before Linux boots up.

Alan


> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
> 
--8323329-991411654-1420993764=:2556--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
