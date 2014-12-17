From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v5 6/6] ARM: socfpga: defconfig: enable fpga manager
Date: Wed, 17 Dec 2014 13:41:53 -0600
Message-ID: <alpine.DEB.2.02.1412171340580.8877@linuxheads99>
References: <1418835289-15752-1-git-send-email-atull@opensource.altera.com> <1418835289-15752-7-git-send-email-atull@opensource.altera.com> <20141217173216.GA24913@kroah.com> <88f9ec210ca64436bfadc050ec4e17bf@BN1BFFO11FD042.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <88f9ec210ca64436bfadc050ec4e17bf@BN1BFFO11FD042.protection.gbl>
Sender: linux-doc-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, delicious.quinoa@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, 17 Dec 2014, Michal Simek wrote:

> On 12/17/2014 06:32 PM, Greg KH wrote:
> > On Wed, Dec 17, 2014 at 10:54:49AM -0600, atull@opensource.altera.com wrote:
> >> From: Alan Tull <atull@opensource.altera.com>
> >>
> >> Enable FPGA manager for Altera socfpga.
> >>
> >> Signed-off-by: Alan Tull <atull@opensource.altera.com>
> >> ---
> >> v5: s/CONFIG_FPGA_MGR_ALTERA/CONFIG_FPGA_MGR_SOCFPGA/
> >> ---
> >>  arch/arm/configs/socfpga_defconfig |    4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
> >> index a2956c3..f1d6a3b 100644
> >> --- a/arch/arm/configs/socfpga_defconfig
> >> +++ b/arch/arm/configs/socfpga_defconfig
> >> @@ -86,6 +86,10 @@ CONFIG_USB_DWC2=y
> >>  CONFIG_USB_DWC2_HOST=y
> >>  CONFIG_MMC=y
> >>  CONFIG_MMC_DW=y
> >> +CONFIG_STAGING=y
> >> +CONFIG_FPGA=y
> >> +CONFIG_FPGA_MGR_SYSFS=y
> >> +CONFIG_FPGA_MGR_SOCFPGA=y
> >>  CONFIG_EXT2_FS=y
> >>  CONFIG_EXT2_FS_XATTR=y
> >>  CONFIG_EXT2_FS_POSIX_ACL=y
> > 
> > Do defconfigs really matter anymore?
> 
> If they want but anyway simply 5/6 and 6/6 shouldn't be the part of this series
> because they should go through arm-soc tree.
> 
> I will look at other patches tmr.
> 
> Monam, Insop: I think you should join this process because gs_fpgaboot
> should be one backend driver of this interface.
> 
> Thanks,
> Michal
> 

OK, we can drop 5/6 and 6/6 from this series.  I'll handle them 
separately.

Alan
