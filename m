From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v5 6/6] ARM: socfpga: defconfig: enable fpga manager
Date: Wed, 17 Dec 2014 13:46:42 -0500
Message-ID: <20141217184642.GX967@titan.lakedaemon.net>
References: <1418835289-15752-1-git-send-email-atull@opensource.altera.com>
 <1418835289-15752-7-git-send-email-atull@opensource.altera.com>
 <20141217173216.GA24913@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20141217173216.GA24913@kroah.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, hpa@zytor.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, michal.simek@xilinx.com, kyle.teske@ni.com, jgunthorpe@obsidianresearch.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, pawel.moll@arm.com, iws@ovro.caltech.edu, atull@opensource.altera.com, broonie@kernel.org, philip@balister.org, dinguyen@opensource.altera.com, monstr@monstr.eu, pavel@denx.de, yvanderv@opensource.altera.com, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, galak@codeaurora.org, akpm@linux-foundation.org, davem@davemloft.net, m.chehab@samsung.com
List-Id: devicetree@vger.kernel.org

On Wed, Dec 17, 2014 at 09:32:16AM -0800, Greg KH wrote:
> On Wed, Dec 17, 2014 at 10:54:49AM -0600, atull@opensource.altera.com wrote:
> > From: Alan Tull <atull@opensource.altera.com>
> > 
> > Enable FPGA manager for Altera socfpga.
> > 
> > Signed-off-by: Alan Tull <atull@opensource.altera.com>
> > ---
> > v5: s/CONFIG_FPGA_MGR_ALTERA/CONFIG_FPGA_MGR_SOCFPGA/
> > ---
> >  arch/arm/configs/socfpga_defconfig |    4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
> > index a2956c3..f1d6a3b 100644
> > --- a/arch/arm/configs/socfpga_defconfig
> > +++ b/arch/arm/configs/socfpga_defconfig
> > @@ -86,6 +86,10 @@ CONFIG_USB_DWC2=y
> >  CONFIG_USB_DWC2_HOST=y
> >  CONFIG_MMC=y
> >  CONFIG_MMC_DW=y
> > +CONFIG_STAGING=y
> > +CONFIG_FPGA=y
> > +CONFIG_FPGA_MGR_SYSFS=y
> > +CONFIG_FPGA_MGR_SOCFPGA=y
> >  CONFIG_EXT2_FS=y
> >  CONFIG_EXT2_FS_XATTR=y
> >  CONFIG_EXT2_FS_POSIX_ACL=y
> 
> Do defconfigs really matter anymore?

Very much so.  arm-soc uses them as a standard build test target and
boot target on their bootfarms.  Please see the arm-buildbot mailinglist
at:

  http://lists.linaro.org/mailman/listinfo/kernel-build-reports

And December's results so far:

  http://lists.linaro.org/pipermail/kernel-build-reports/2014-December/thread.html

hth,

Jason.
