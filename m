From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH v9 4/7] staging: fpga manager: add sysfs interface
 document
Date: Fri, 24 Jul 2015 10:18:29 +0200
Message-ID: <20150724081829.GA16790@amd>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
 <1437148277-5405-5-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437148277-5405-5-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: atull@opensource.altera.com
Cc: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, Petr Cvek <petr.cvek@tul.cz>, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvande
List-Id: devicetree@vger.kernel.org

Hi!

> +What:		/sys/class/fpga_manager/<fpga>/state
> +Date:		July 2015
> +KernelVersion:	4.2
> +Contact:	Alan Tull <atull@opensource.altera.com>
> +Description:	Read fpga manager state as a string.

fpga->FPGA.

> +		Valid states may vary by manufacturer; superset is:
> +		* unknown		= can't determine state
> +		* power off		= FPGA power is off
> +		* power up		= FPGA reports power is up
> +		* reset			= FPGA held in reset state
> +		* firmware request	= firmware class request in progress
> +		* firmware request error = firmware request failed
> +		* write init		= FPGA being prepared for programming
> +		* write init error	= Error while preparing FPGA for
> +					  programming
> +		* write			= FPGA ready to receive image data
> +		* write error		= Error while programming
> +		* write complete	= Doing post programming steps
> +		* write complete error	= Error while doing post programming
> +		* operating		= FPGA is programmed and operating

This will need some more details. "firmware request" is hardly a
hardware state, does it belong here? Is power off or on while firmware
is being requested? How does the fpga get into power up phase?
Normally, you'd only power it on to do something more with it...?

									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
