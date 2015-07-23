From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v9 5/7] staging: fpga manager core
Date: Thu, 23 Jul 2015 11:28:56 -0500
Message-ID: <alpine.DEB.2.02.1507231116270.10088@linuxheads99>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
 <1437148277-5405-6-git-send-email-atull@opensource.altera.com>
 <CAAtXAHdyt+18+xNckxZtm0hYNwwMborFJUE-QR+JmWqzy=8cmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CAAtXAHdyt+18+xNckxZtm0hYNwwMborFJUE-QR+JmWqzy=8cmw@mail.gmail.com>
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
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, hpa@zytor.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, Nicolas Pitre <nico@linaro.org>, iws@ovro.caltech.edu, Michal Simek <michal.simek@xilinx.com>, kyle.teske@ni.com, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Grant Likely <grant.likely@linaro.org>, David Brown <davidb@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, broonie@kernel.org, Philip Balister <philip@balister.org>, Petr Cvek <petr.cvek@tul.cz>, akpm@linux-foundation.org, Michal Simek <monstr@monstr.eu>, Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, balbi@ti.comd
List-Id: devicetree@vger.kernel.org

On Wed, 22 Jul 2015, Moritz Fischer wrote:

Hi Miritz,

> Hi Alan,
> 
> a couple of small things I found while reworking the Zynq version to
> match the v9 patchset:
> 
> On Fri, Jul 17, 2015 at 8:51 AM,  <atull@opensource.altera.com> wrote:
> > From: Alan Tull <atull@opensource.altera.com>
> >
...
> > +       ret = mgr->mops->write_complete(mgr);
> 
> Could we pass in flags here? This way the driver wouldn't have to keep
> track of the flags. For my case it would simplify the partial reconfig
> case.

Yes, that change will be very simple and makes sense to me.

> > +/*
> > + * FPGA Manager flags
> > + * FPGA_MGR_PARTIAL_RECONFIG: do partial reconfiguration if supported
> > + */
> > +#define FPGA_MGR_PARTIAL_RECONFIG (1)
> Could this be BIT(0) instead?

Yes, ha.  That's what it should have been.

> > +
> > +/**
> > + * struct fpga_manager_ops - ops for low level fpga manager drivers
> > + * @state: returns an enum value of the FPGA's state
> > + * @write_init: prepare the FPGA to receive confuration data
> > + * @write: write count bytes of configuration data to the FPGA
> > + * @write_complete: set FPGA to operating state after writing is done
> > + * @fpga_remove: optional: Set FPGA into a specific state during driver remove
> > + *
> > + * fpga_manager_ops are the low level functions implemented by a specific
> > + * fpga manager driver.  The optional ones are tested for NULL before being
> > + * called, so leaving them out is fine.
> > + */
> > +struct fpga_manager_ops {
> > +       enum fpga_mgr_states (*state)(struct fpga_manager *mgr);
> > +       int (*write_init)(struct fpga_manager *mgr, u32 flags,
> > +                         const char *buf, size_t count);
> > +       int (*write)(struct fpga_manager *mgr, const char *buf, size_t count);
> > +       int (*write_complete)(struct fpga_manager *mgr);
> See comment above, having the flags here would be very convenient for
> my usecase.

Yes

> > +       void (*fpga_remove)(struct fpga_manager *mgr);
> > +};
> > +
...
> 
> Overall looks pretty good. I still need to look at the bridge part,
> currently I have the resets and level shifters in the zynq-fpga
> driver,
> but maybe breaking them out makes sense.
> 
> Cheers,
> 
> Moritz
> 

Thanks for the review.  I'll probably send out a v10 next week including your
recommendations.

Alan
