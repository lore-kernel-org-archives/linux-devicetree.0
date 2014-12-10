From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v4 3/6] ARM: socfpga: defconfig: enable fpga manager
Date: Wed, 10 Dec 2014 11:17:58 -0600
Message-ID: <alpine.DEB.2.02.1412101117060.25868@linuxheads99>
References: <1418156090-23578-1-git-send-email-atull@opensource.altera.com> <1418156090-23578-4-git-send-email-atull@opensource.altera.com> <cec3b3d65e864b39899f3cbf17a09dc2@BN1BFFO11FD035.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <cec3b3d65e864b39899f3cbf17a09dc2@BN1BFFO11FD035.protection.gbl>
Sender: linux-doc-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yva
List-Id: devicetree@vger.kernel.org

On Wed, 10 Dec 2014, Michal Simek wrote:

> Hi Alan,
> 
> On 12/09/2014 09:14 PM, atull@opensource.altera.com wrote:
> > From: Alan Tull <atull@opensource.altera.com>
> > 
> > Enable FPGA manager for Altera socfpga.
> > 
> > Signed-off-by: Alan Tull <atull@opensource.altera.com>
> > ---
> >  arch/arm/configs/socfpga_defconfig |    4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
> > index a2956c3..2740057 100644
> > --- a/arch/arm/configs/socfpga_defconfig
> > +++ b/arch/arm/configs/socfpga_defconfig
> > @@ -86,6 +86,10 @@ CONFIG_USB_DWC2=y
> >  CONFIG_USB_DWC2_HOST=y
> >  CONFIG_MMC=y
> >  CONFIG_MMC_DW=y
> > +CONFIG_STAGING=y
> > +CONFIG_FPGA=y
> > +CONFIG_FPGA_MGR_SYSFS=y
> > +CONFIG_FPGA_MGR_ALTERA=y
> >  CONFIG_EXT2_FS=y
> >  CONFIG_EXT2_FS_XATTR=y
> >  CONFIG_EXT2_FS_POSIX_ACL=y
> > 
> 
> This should the last patch in this series because you are changing Kconfig
> in 5/6 and 6/6.
> 
> Thanks,
> Michal
> 

OK, I'm fixing this in v5, also taking your other comments.  Thanks for 
the review.

Alan

