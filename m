From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v9 7/7] staging: fpga manager: add driver for socfpga
 fpga manager
Date: Fri, 17 Jul 2015 16:42:16 -0500
Message-ID: <alpine.DEB.2.02.1507171626510.17004@linuxheads99>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
 <1437148277-5405-8-git-send-email-atull@opensource.altera.com>
 <CAAtXAHcgmKeEfbANG8cA5M0bfZn+y0YP7DOCHD8Rx8xC8A1HaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CAAtXAHcgmKeEfbANG8cA5M0bfZn+y0YP7DOCHD8Rx8xC8A1HaQ@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, hpa@zytor.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, iws@ovro.caltech.edu, Michal Simek <michal.simek@xilinx.com>, kyle.teske@ni.com, jgunthorpe@obsidianresearch.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, broonie@kernel.org, Philip Balister <philip@balister.org>, Petr Cvek <petr.cvek@tul.cz>, akpm@linux-foundation.org, Michal Simek <monstr@monstr.eu>, Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, balbi@ti.com, davem@davemloft.net, robh+dt@kernel.org, rob@landley.net, pavel@denx.de, dinguyen@opensource.altera.
List-Id: devicetree@vger.kernel.org

On Fri, 17 Jul 2015, Moritz Fischer wrote:

Hi Moritz,

> Alan,
> 
> it looks pretty good so far. I have worked with Michal and developed a
> Zynq equivalent against your last
> patchset which can be found in the Xilinx tree now.
> 
> I just briefly glanced the changes below just two nits that caught my eye.
> I'll take a closer look while trying to update the zynq-fpga driver to
> work with your changes.
> 
...
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/pm.h>
> As you removed the suspend / resume part, do you still need this?
> > +#include <linux/string.h>

Yep, I can take out this include.

> > +
> > +/*
> > + * Prepare the FPGA to receive the configuration data.
> > + */
> > +static int socfpga_fpga_ops_configure_init(struct fpga_manager *mgr, u32 flags,
> > +                                          const char *buf, size_t count)
> Is there a reason buf and count need to be passed here?
> > +{
> > +       struct socfpga_fpga_priv *priv = mgr->priv;
> > +       int ret;

Its to allow .write_init to look at the image header if it needs to.
Not every FPGA manager is going to need buf and count.  This one doesn't
(cyclone5).  Your .write_init can ignore them if you don't need them.

But Arria10 does (that's a separate driver that I didn't include in this
patchset). In that case I need to parse the image header to know whether
the bitstream is compressed, etc. to know how to configure the FPGA
manager registers before the FPGA can receive image data.

Thanks for reviewing!

Alan

> >
> > _______________________________________________
> > devel mailing list
> > devel@linuxdriverproject.org
> > http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel
> 
> Overall good job, and thanks for pushing this!
> 
> Cheers,
> 
> Moritz
> 
