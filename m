From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v6 0/4] FPGA Manager Framework
Date: Fri, 19 Dec 2014 15:20:59 +0100
Message-ID: <5901b1791e1c4b09b72cb22c5eca68ca@BL2FFO11FD047.protection.gbl>
References: <1418941748-16111-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1418941748-16111-1-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: atull@opensource.altera.com, gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-Id: devicetree@vger.kernel.org

Hi Greg,

On 12/18/2014 11:29 PM, atull@opensource.altera.com wrote:
> From: Alan Tull <atull@opensource.altera.com>
> 
> Dropping the changes to socfpga DTS and defconfig from this
> patch set.
> 
> Kernel doc fixes and other minor fixes as listed in the patches.
> 
> Alan
> 
> Alan Tull (4):
>   doc: add bindings document for altera fpga manager
>   fpga manager: add sysfs interface document
>   staging: fpga manager: framework core
>   staging: fpga manager: add driver for socfpga fpga manager
> 
>  drivers/staging/Kconfig                            |    2 +
>  drivers/staging/Makefile                           |    1 +
>  .../Documentation/ABI/sysfs-class-fpga-manager     |   38 ++
>  .../Documentation/bindings/altera-fpga-mgr.txt     |   17 +
>  drivers/staging/fpga/Kconfig                       |   29 +
>  drivers/staging/fpga/Makefile                      |    9 +
>  drivers/staging/fpga/fpga-mgr.c                    |  551 ++++++++++++++++
>  drivers/staging/fpga/socfpga.c                     |  694 ++++++++++++++++++++
>  include/linux/fpga/fpga-mgr.h                      |  124 ++++
>  9 files changed, 1465 insertions(+)
>  create mode 100644 drivers/staging/fpga/Documentation/ABI/sysfs-class-fpga-manager
>  create mode 100644 drivers/staging/fpga/Documentation/bindings/altera-fpga-mgr.txt
>  create mode 100644 drivers/staging/fpga/Kconfig
>  create mode 100644 drivers/staging/fpga/Makefile
>  create mode 100644 drivers/staging/fpga/fpga-mgr.c
>  create mode 100644 drivers/staging/fpga/socfpga.c
>  create mode 100644 include/linux/fpga/fpga-mgr.h
> 

I think we have reasonable number of patches which can go to the staging
and we can work on it and extend it. I have xilinx zynq driver in my repository too.
Also I would try to integrate staging/gs_fpgaboot/ because they do just the same
thing. Also char/xilinx_hwicap should be added to this subfolder (and clean a lot).
I am not aware about any other fpga driver in the tree but I didn't grep it
(IRC xillybus targets a little bit different thing). Please let me know if you are
aware about different one.

I was talking to Altera guys at ELCE and conclusion was that will be the best to
maintain future drivers/fpga/ together.
It means if there is no problem with this series. Do you want me to add these
patches to any repository at kernel.org and send you pull request?
Or you just prefer to take these patches directly to staging and we will use
separate repository later?
We will also create fragment to MAINTAINERS file to reflect this.

Thanks,
Michal
