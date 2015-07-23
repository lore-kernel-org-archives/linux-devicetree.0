From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v9 0/7] FPGA Manager Framework and Simple FPGA Bus
Date: Wed, 22 Jul 2015 21:12:18 -0700
Message-ID: <20150723041218.GA6978@kroah.com>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: atull@opensource.altera.com
Cc: jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, kyle.teske@ni.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, broonie@kernel.org, philip@balister.org, Petr Cvek <petr.cvek@tul.cz>, dinguyen@opensource.altera.com, pavel@denx.de, yvanderv@opensource.altera.com, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, galak@codeaurora.org, akpm@linux-foundation.org, davem@davemloft.net, m.chehab@
List-Id: devicetree@vger.kernel.org

On Fri, Jul 17, 2015 at 10:51:10AM -0500, atull@opensource.altera.com wrote:
> From: Alan Tull <atull@opensource.altera.com>
> 
> This patchset adds two chunks plus documentation:
>  * fpga manager core: exports ABI functions that write an image to a FPGA
>  * DT Overlay support: simple-fpga-bus to handle FPGA from a DT overlay
> 
> The core's ABI is minimal to start with: only 6 functions.  This gives a
> common interface for programming various FPGA such that any higher level
> interfaces such as the DT Overlays or anything else that is added can be
> shared and not be manufacturor-specific.
> 
> The DT Overlays support exists for the usage where the FPGA will contain
> some "hardware" that will need drivers.  Where that use model is not
> appealing, the core ABI can be used to add a different use model such as
> using an FPGA as acceleration as has been discussed.
> 
> This patchset gets rid of the sysfs controls that allowed direct
> control of a FPGA from userspace.
> 
> This patchset is under drivers/staging as the interface could change.
> 
> The bindings for the socpfga fpga manager already are upstreamed as
> 1b4e119 Alan Tull : doc: add bindings document for altera fpga manager
> 
> The DT Support is dependent on Pantelis's dtc overlay patches from
> https://github.com/pantoniou/dtc.git
> and his DT overlays configfs interface patches and fixes from
> https://github.com/pantoniou/linux-beagle-track-mainline
> 
> efb0c04 Pantelis Antoniou : gcl: Fix resource linking
> 85e785e Pantelis Antoniou : ARM: DT: Enable symbols when CONFIG_OF_OVERLAY is used
> af0321f Pantelis Antoniou : OF: DT-Overlay configfs interface (v5)
> 4c1c675 Pantelis Antoniou : configfs: Implement binary attributes (v4)
> 
> 
> Alan Tull (7):
>   staging: usage documentation for FPGA manager core
>   staging: usage documentation for simple fpga bus
>   staging: add bindings document for simple fpga bus
>   staging: fpga manager: add sysfs interface document
>   staging: fpga manager core
>   staging: add simple-fpga-bus
>   staging: fpga manager: add driver for socfpga fpga manager
> 
>  drivers/staging/Kconfig                            |    2 +
>  drivers/staging/Makefile                           |    1 +
>  .../Documentation/ABI/sysfs-class-fpga-manager     |   26 +
>  .../Documentation/bindings/simple-fpga-bus.txt     |   61 ++
>  drivers/staging/fpga/Documentation/fpga-mgr.txt    |  117 ++++
>  .../staging/fpga/Documentation/simple-fpga-bus.txt |   48 ++
>  drivers/staging/fpga/Kconfig                       |   31 +
>  drivers/staging/fpga/Makefile                      |   10 +
>  drivers/staging/fpga/fpga-mgr.c                    |  373 ++++++++++++
>  drivers/staging/fpga/simple-fpga-bus.c             |  323 ++++++++++
>  drivers/staging/fpga/socfpga.c                     |  616 ++++++++++++++++++++

All drivers/staging/*/ directories need a TODO file that lists what
needs to be done to it in order to get the code out of staging.  Please
redo the series and add that.

>  include/linux/fpga/fpga-mgr.h                      |  127 ++++

This should be within drivers/staging/ all staging code should be
self-contained.

Why isn't this going into the "real" part of the kernel?  Why staging?

thanks,

greg k-h
