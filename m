From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v8 0/4] FPGA Manager Framework
Date: Sun, 11 Jan 2015 10:08:19 -0600
Message-ID: <alpine.DEB.2.10.1501111004580.2556@shineypoop>
References: <1420575219-27061-1-git-send-email-atull@opensource.altera.com> <20150110181120.GA26067@t400>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20150110181120.GA26067@t400>
Sender: linux-doc-owner@vger.kernel.org
To: Konrad Zapalowicz <bergo.torino@gmail.com>
Cc: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, kyle.teske@ni.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, broonie@kernel.org, philip@balister.org, dinguyen@opensource.altera.com, pavel@denx.de, yvanderv@opensource.altera.com, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, galak@codea
List-Id: devicetree@vger.kernel.org

On Sat, 10 Jan 2015, Konrad Zapalowicz wrote:

> On 01/06, atull@opensource.altera.com wrote:
> > From: Alan Tull <atull@opensource.altera.com>
> 
> Alan, there is something wrong with your email client configuration
> and you need to fix.
> 
> thanks,
> konrad

Hi Konrad,

Can you be more specific?  What problem are you seeing?  Is it a problem 
with the original patch  post or when I reply?  When I a post, I'm using
'git send-email' with sendmail and when I am replying, I am using alpine.

Alan

>  
> > v8 changes the compatible string for SOCFPGA FPGA managers
> > to be more chip specific.
> > 
> > "altr,fpga-mgr" becomes "altr,socfpga-fpga-mgr"
> > 
> > Thanks,
> > Alan
> > 
> > Alan Tull (4):
> >   doc: add bindings document for altera fpga manager
> >   fpga manager: add sysfs interface document
> >   staging: fpga manager: framework core
> >   staging: fpga manager: add driver for socfpga fpga manager
> > 
> >  drivers/staging/Kconfig                            |    2 +
> >  drivers/staging/Makefile                           |    1 +
> >  .../Documentation/ABI/sysfs-class-fpga-manager     |   38 ++
> >  .../bindings/altera-socfpga-fpga-mgr.txt           |   17 +
> >  drivers/staging/fpga/Kconfig                       |   29 +
> >  drivers/staging/fpga/Makefile                      |    9 +
> >  drivers/staging/fpga/fpga-mgr.c                    |  551 ++++++++++++++++
> >  drivers/staging/fpga/socfpga.c                     |  694 ++++++++++++++++++++
> >  include/linux/fpga/fpga-mgr.h                      |  124 ++++
> >  9 files changed, 1465 insertions(+)
> >  create mode 100644 drivers/staging/fpga/Documentation/ABI/sysfs-class-fpga-manager
> >  create mode 100644 drivers/staging/fpga/Documentation/bindings/altera-socfpga-fpga-mgr.txt
> >  create mode 100644 drivers/staging/fpga/Kconfig
> >  create mode 100644 drivers/staging/fpga/Makefile
> >  create mode 100644 drivers/staging/fpga/fpga-mgr.c
> >  create mode 100644 drivers/staging/fpga/socfpga.c
> >  create mode 100644 include/linux/fpga/fpga-mgr.h
> > 
> > -- 
> > 1.7.9.5
> > 
> > _______________________________________________
> > devel mailing list
> > devel@linuxdriverproject.org
> > http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel
> 
