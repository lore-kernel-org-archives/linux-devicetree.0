From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 0/3] Yet another stab at a fpga framework
Date: Tue, 5 Aug 2014 21:18:46 +0300
Message-ID: <1FF23F53-E94E-44F1-A198-BD49ACB2DCA7@konsulko.com>
References: <1406932118-13885-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406932118-13885-1-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: atull@opensource.altera.com
Cc: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, grant.likely@linaro.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-Id: devicetree@vger.kernel.org

Hi Alan,

On Aug 2, 2014, at 1:28 AM, <atull@opensource.altera.com> wrote:

> From: Alan Tull <atull@opensource.altera.com>
> 
> [resend with fixed email settings]
> 
> The idea of the framework is to provide consistent ways of
> programming raw images into FPGA's.
> 
> Programming from device tree overlays is supported.
> 
> The core (fpga-mgr.c) does not include a userspace interface
> and just exports kernel functions.
> 
> This approach separates the core from the interfaces.
> 
> Each interface can be enabled or disabled in the defconfig.
> In some production contexts, interfaces that might be used
> during development can be disabled.
> 
> The core exports kernel functions to:
>  * write the fpga from a buffer or using the firmware layer
>  * get fpga status
>  * find a particular fpga manager from a device tree phandle
>  * register/unregister lower level fpga drivers.
> 
> The bus allows us to:
>  * program fpga from a device tree overlay using firmware.
>  * automatically reload firmware and reprogram fpga during resume.
> 
> The sysfs interface:
>  * read only, get the name and status of fpga manager.
> 
> I have a configfs interface patch which I haven't included,
> adds configfs as a separate file.
> 
> TODO:
>  * Enable bridges after fpga programming, disable during suspend
> 
> Alan Tull (3):
>  fpga manager framework core
>  fpga bus driver
>  fpga sysfs interface
> 
> drivers/Kconfig          |    2 +
> drivers/Makefile         |    1 +
> drivers/fpga/Kconfig     |   27 +++
> drivers/fpga/Makefile    |   12 ++
> drivers/fpga/bus.c       |  145 ++++++++++++++++
> drivers/fpga/fpga-mgr.c  |  431 ++++++++++++++++++++++++++++++++++++++++++++++
> drivers/fpga/sysfs.c     |   69 ++++++++
> include/linux/fpga-mgr.h |  137 +++++++++++++++
> 8 files changed, 824 insertions(+)
> create mode 100644 drivers/fpga/Kconfig
> create mode 100644 drivers/fpga/Makefile
> create mode 100644 drivers/fpga/bus.c
> create mode 100644 drivers/fpga/fpga-mgr.c
> create mode 100644 drivers/fpga/sysfs.c
> create mode 100644 include/linux/fpga-mgr.h
> 

Looks very sane and useful. Please let me know if you come across any problems
with the overlays code, especially the removal path. 

Regards

-- Pantelis
