From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v10 3/8] add fpga manager core
Date: Fri, 14 Aug 2015 10:46:58 -0500
Message-ID: <alpine.DEB.2.02.1508141026280.661@linuxheads99>
References: <1439487452-23977-1-git-send-email-atull@opensource.altera.com>
 <1439487452-23977-5-git-send-email-atull@opensource.altera.com>
 <CAAtXAHc=+nzcDQ-=-gkj=BfpjCeMu-nu5yW6bZPhB3w1=_Ek7g@mail.gmail.com>
 <alpine.DEB.2.02.1508140925560.1866@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <alpine.DEB.2.02.1508140925560.1866@linuxheads99>
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
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, hpa@zytor.com, yvanderv@altera.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, Nicolas Pitre <nico@linaro.org>, ijc+devicetree@hellion.org.uk, Michal Simek <michal.simek@xilinx.com>, kyle.teske@ni.com, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Grant Likely <grant.likely@linaro.org>, David Brown <davidb@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, Kumar Gala <galak@codeaurora.org>, broonie@kernel.org, Philip Balister <philip@balister.org>, Petr Cvek <petr.cvek@tul.cz>, dinguyen@opensource.altera.com, Michal Simek <monstr@monstr.eu>, Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.ke
List-Id: devicetree@vger.kernel.org

On Fri, 14 Aug 2015, atull wrote:

> On Fri, 14 Aug 2015, Moritz Fischer wrote:
> 
> > Hi Alan,
> > 
> > I've updated my Zynq driver (it can be found in an older version
> > against your v8 in the Xilinx tree, too)
> > 
> > https://github.com/mfischer/linux/tree/alan-fpga-mgr-v10
> 
> Since we are both already using this and have been for a while now, I hope it
> can go up into the mainstream instead of continuing to exist only in Altera
> and Xilinx's git trees.
> 

Hi Moritz,

I fetched your git tree and took a look at your low level driver.

I had a some feedback.  write_complete() is a blocking call, waiting for the
FPGA to go into operating state and timing out (ETIMEDOUT) if necessary.  The
fpga-mgr.c framework is assuming that when write_complete exits with status 0,
that means that the FPGA is in operating state.  That's why it's proper for us
to add "mgr->state = FPGA_MGR_STATE_OPERATING" after write_complete returns
success as you noted.  My suggestion is that your write_complete() should check
status in this way.  Whatever error codes it returns will get propagated.

Also, I'm wondering how the simple-fpga-bus stuff looks to you now that you've
had it for a little while.

Thank,
Alan
