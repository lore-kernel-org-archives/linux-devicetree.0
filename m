From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v3 0/3] FPGA Manager Framework
Date: Tue, 9 Dec 2014 12:40:54 -0600
Message-ID: <alpine.DEB.2.02.1412091239530.10268@linuxheads99>
References: <1418142481-6167-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1418142481-6167-1-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-Id: devicetree@vger.kernel.org

On Tue, 9 Dec 2014, atull@opensource.altera.com wrote:

> From: Alan Tull <atull@opensource.altera.com>
> 
> Improvements in this version:
> 
> Fixed things in the framework that were left over from my original
> version that was a character driver.  In particular, make the
> struct device be present in the fpga_manager struct, not as a
> pointer, so container_of will work.
> 
> Also rewrote the part that handles DT notifications.  Now this
> section takes notifications instead of being another device to
> load/unload.
> 
> Still want to integrate bridge enable/disable with this, but
> that's not done yet.
> 

I have been recommended to move this to drivers/staging.  This
makes sense as there has always been a lot of discussion of the
interface.

Will be submitting that as v4 today.

Alan Tull


> Alan Tull (3):
>   fpga manager: add sysfs interface document
>   fpga manager: framework core
>   fpga manager: device tree overlay support
> 
>  Documentation/ABI/testing/sysfs-class-fpga-manager |   38 ++
>  drivers/Kconfig                                    |    2 +
>  drivers/Makefile                                   |    1 +
>  drivers/fpga/Kconfig                               |   28 +
>  drivers/fpga/Makefile                              |   10 +
>  drivers/fpga/fpga-mgr.c                            |  587 ++++++++++++++++++++
>  include/linux/fpga-mgr.h                           |  107 ++++
>  7 files changed, 773 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-fpga-manager
>  create mode 100644 drivers/fpga/Kconfig
>  create mode 100644 drivers/fpga/Makefile
>  create mode 100644 drivers/fpga/fpga-mgr.c
>  create mode 100644 include/linux/fpga-mgr.h
> 
> -- 
> 1.7.9.5
> 
> 
