From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v2 0/3] fpga bridge framework
Date: Thu, 23 Oct 2014 18:57:24 -0500
Message-ID: <alpine.DEB.2.02.1410231856100.22137@atx-linux-37>
References: <1414108267-22058-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1414108267-22058-1-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, mgerlach@opensource.altera.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-Id: devicetree@vger.kernel.org

On Thu, 23 Oct 2014, atull@opensource.altera.com wrote:

> From: Alan Tull <atull@opensource.altera.com>
> 
> Followup to bridge framework that was posted on 2013/10/3
> 
> This is a driver for enabling/disabling the fpga bridges under control
> of a sys entry.  It has a common framework and individual drivers for
> the various bridges.
> 
> This framework uses the reset driver where appropriate.
> 
> Alan
> 

Forgot to mention: This patchset needs Dinh Nguyen's
"reset: add reset_control_status helper function" patches

https://lkml.org/lkml/2014/10/10/256

Alan

> 
> Alan Tull (3):
>   add sysfs document for fpga bridges
>   ARM: dts: socfpga: fpga bridges bindings docs
>   fpga bridge driver
> 
>  Documentation/ABI/testing/sysfs-class-fpga-bridge  |    5 +
>  .../bindings/fpga/altera-fpga2sdram-bridge.txt     |   57 +++++
>  .../bindings/fpga/altera-hps2fpga-bridge.txt       |   53 +++++
>  drivers/misc/Kconfig                               |    3 +-
>  drivers/misc/Makefile                              |    1 +
>  drivers/misc/fpga-bridge/Kconfig                   |   20 ++
>  drivers/misc/fpga-bridge/Makefile                  |    6 +
>  drivers/misc/fpga-bridge/altera-fpga2sdram.c       |  236 ++++++++++++++++++++
>  drivers/misc/fpga-bridge/altera-hps2fpga.c         |  220 ++++++++++++++++++
>  drivers/misc/fpga-bridge/fpga-bridge.c             |  230 +++++++++++++++++++
>  drivers/misc/fpga-bridge/fpga-bridge.h             |   51 +++++
>  11 files changed, 881 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-fpga-bridge
>  create mode 100644 Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge.txt
>  create mode 100644 Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt
>  create mode 100644 drivers/misc/fpga-bridge/Kconfig
>  create mode 100644 drivers/misc/fpga-bridge/Makefile
>  create mode 100644 drivers/misc/fpga-bridge/altera-fpga2sdram.c
>  create mode 100644 drivers/misc/fpga-bridge/altera-hps2fpga.c
>  create mode 100644 drivers/misc/fpga-bridge/fpga-bridge.c
>  create mode 100644 drivers/misc/fpga-bridge/fpga-bridge.h
> 
> -- 
> 1.7.9.5
> 
> 
