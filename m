From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v9 5/7] staging: fpga manager core
Date: Fri, 17 Jul 2015 13:25:03 -0500
Message-ID: <alpine.DEB.2.02.1507171319390.6516@linuxheads99>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com> <1437148277-5405-6-git-send-email-atull@opensource.altera.com> <55A93B01.4080009@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55A93B01.4080009@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, Petr Cvek <petr.cvek@tul.cz>, delic
List-Id: devicetree@vger.kernel.org

On Fri, 17 Jul 2015, Randy Dunlap wrote:

> On 07/17/15 08:51, atull@opensource.altera.com wrote:
> > From: Alan Tull <atull@opensource.altera.com>
> > 
> > ---
> >  drivers/staging/Kconfig         |    2 +
> >  drivers/staging/Makefile        |    1 +
> >  drivers/staging/fpga/Kconfig    |   14 ++
> >  drivers/staging/fpga/Makefile   |    8 +
> >  drivers/staging/fpga/fpga-mgr.c |  373 +++++++++++++++++++++++++++++++++++++++
> >  include/linux/fpga/fpga-mgr.h   |  127 +++++++++++++
> >  6 files changed, 525 insertions(+)
> >  create mode 100644 drivers/staging/fpga/Kconfig
> >  create mode 100644 drivers/staging/fpga/Makefile
> >  create mode 100644 drivers/staging/fpga/fpga-mgr.c
> >  create mode 100644 include/linux/fpga/fpga-mgr.h
> 
> > diff --git a/drivers/staging/fpga/Kconfig b/drivers/staging/fpga/Kconfig
> > new file mode 100644
> > index 0000000..8254ca0
> > --- /dev/null
> > +++ b/drivers/staging/fpga/Kconfig
> > @@ -0,0 +1,14 @@
> > +#
> > +# FPGA framework configuration
> > +#
> > +
> > +menu "FPGA Configuration Support"
> > +
> > +config FPGA
> > +	bool "FPGA Configuration Framework"
> > +	help
> > +	  Say Y here if you want support for configuring FPGAs from the
> > +	  kernel.  The FPGA framework adds a FPGA manager class and FPGA
> > +	  manager drivers.
> > +
> > +endmenu
> 
> Is there some good reason why this is 'bool' instead of 'tristate'?
> I.e., why can't it be built as a loadable module?

Hi Randy,

The simple fpga bus probe function will need probe deferral added for it to
work with that if it gets probed before the fpga manager is loaded.  But I 
think it needed that anyway.  I'll work on it.

Thanks,
Alan


> 
> Thanks.
> 
> -- 
> ~Randy
> 
