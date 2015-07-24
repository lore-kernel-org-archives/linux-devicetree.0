From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v9 4/7] staging: fpga manager: add sysfs interface document
Date: Fri, 24 Jul 2015 07:39:15 -0500
Message-ID: <alpine.DEB.2.10.1507240726320.2562@atull-730U3E-740U3E>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
 <1437148277-5405-5-git-send-email-atull@opensource.altera.com>
 <20150724081829.GA16790@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20150724081829.GA16790@amd>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Pavel Machek <pavel@denx.de>
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, hpa@zytor.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, michal.simek@xilinx.com, kyle.teske@ni.com, jgunthorpe@obsidianresearch.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, broonie@kernel.org, philip@balister.org, Petr Cvek <petr.cvek@tul.cz>, dinguyen@opensource.altera.com, monstr@monstr.eu, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, galak@codeaurora.org, akpm@linux-foundation.org, davem@davemloft.net, m.chehab@samsung.com
List-Id: devicetree@vger.kernel.org

On Fri, 24 Jul 2015, Pavel Machek wrote:

Hi Pavel,

Thanks for your your feedback in cleaning up these docs.

> Hi!
> 
> > +What:		/sys/class/fpga_manager/<fpga>/state
> > +Date:		July 2015
> > +KernelVersion:	4.2
> > +Contact:	Alan Tull <atull@opensource.altera.com>
> > +Description:	Read fpga manager state as a string.
> 
> fpga->FPGA.

Yep

> 
> > +		Valid states may vary by manufacturer; superset is:
> > +		* unknown		= can't determine state
> > +		* power off		= FPGA power is off
> > +		* power up		= FPGA reports power is up
> > +		* reset			= FPGA held in reset state
> > +		* firmware request	= firmware class request in progress
> > +		* firmware request error = firmware request failed
> > +		* write init		= FPGA being prepared for programming
> > +		* write init error	= Error while preparing FPGA for
> > +					  programming
> > +		* write			= FPGA ready to receive image data
> > +		* write error		= Error while programming
> > +		* write complete	= Doing post programming steps
> > +		* write complete error	= Error while doing post programming
> > +		* operating		= FPGA is programmed and operating
> 

If I can make my intent clear, maybe we can figure out what will be most
useful here.  

The intent is to provide enough detail that if something goes wrong with
the FPGA programming (something that the driver can't take care of) then 
userspace can know that.  Such as if the firmware request fails, that 
could be due to not being able to find the firmware file.

> This will need some more details. "firmware request" is hardly a
> hardware state, does it belong here? 

This is a superset of FPGA states and fpga manager driver states as the
fpga manager driver is walking through the steps to get the FPGA into
a known operating state.  So it's a sequence, though some steps may get
skipped. If there is an error, then userspace can know what step failed.

Maybe this should be separated into fpga_state for hardware state and
fpga_mgr_status (to report what step of progress the fpga manager driver
is at during programming).  I want this to be useful and still not be 
device (FPGA) specific.

> Is power off or on while firmware
> is being requested? 

On.  It's a sequence.

> How does the fpga get into power up phase?
> Normally, you'd only power it on to do something more with it...?
> 
> 									Pavel



> 
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
> 
