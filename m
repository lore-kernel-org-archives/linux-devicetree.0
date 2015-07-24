From: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v9 4/7] staging: fpga manager: add sysfs interface
 document
Date: Fri, 24 Jul 2015 14:43:09 +0200
Message-ID: <20150724124309.GA23493@amd>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
 <1437148277-5405-5-git-send-email-atull@opensource.altera.com>
 <20150724081829.GA16790@amd>
 <alpine.DEB.2.10.1507240726320.2562@atull-730U3E-740U3E>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.10.1507240726320.2562@atull-730U3E-740U3E>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, iws-lulEs6mt1IksTUYHLfqkUA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org, rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, kyle.teske-acOepvfBmUk@public.gmane.org, nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, cesarb-PWySMVKUnqmsTnJN9+BGXg@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Petr Cvek <petr.cvek-qphu/3gb4gc@public.gmane.org>, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri 2015-07-24 07:39:15, atull wrote:
> On Fri, 24 Jul 2015, Pavel Machek wrote:
> 
> Hi Pavel,
> 
> Thanks for your your feedback in cleaning up these docs.
> 
> > Hi!
> > 
> > > +What:		/sys/class/fpga_manager/<fpga>/state
> > > +Date:		July 2015
> > > +KernelVersion:	4.2
> > > +Contact:	Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > > +Description:	Read fpga manager state as a string.
> > 
> > fpga->FPGA.
> 
> Yep
> 
> > 
> > > +		Valid states may vary by manufacturer; superset is:
> > > +		* unknown		= can't determine state
> > > +		* power off		= FPGA power is off
> > > +		* power up		= FPGA reports power is up
> > > +		* reset			= FPGA held in reset state
> > > +		* firmware request	= firmware class request in progress
> > > +		* firmware request error = firmware request failed
> > > +		* write init		= FPGA being prepared for programming
> > > +		* write init error	= Error while preparing FPGA for
> > > +					  programming
> > > +		* write			= FPGA ready to receive image data
> > > +		* write error		= Error while programming
> > > +		* write complete	= Doing post programming steps
> > > +		* write complete error	= Error while doing post programming
> > > +		* operating		= FPGA is programmed and operating
> > 
> 
> If I can make my intent clear, maybe we can figure out what will be most
> useful here.  
> 
> The intent is to provide enough detail that if something goes wrong with
> the FPGA programming (something that the driver can't take care of) then 
> userspace can know that.  Such as if the firmware request fails, that 
> could be due to not being able to find the firmware file.
> 
> > This will need some more details. "firmware request" is hardly a
> > hardware state, does it belong here? 
> 
> This is a superset of FPGA states and fpga manager driver states as the
> fpga manager driver is walking through the steps to get the FPGA into
> a known operating state.  So it's a sequence, though some steps may get
> skipped. If there is an error, then userspace can know what step failed.
> 
> Maybe this should be separated into fpga_state for hardware state and
> fpga_mgr_status (to report what step of progress the fpga manager driver
> is at during programming).  I want this to be useful and still not be 
> device (FPGA) specific.
> 
> > Is power off or on while firmware
> > is being requested? 
> 
> On.  It's a sequence.

Aha. Ok, so maybe noting that states normally go in the sequence (with
exception of various errors) would be enough?

Thanks,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
