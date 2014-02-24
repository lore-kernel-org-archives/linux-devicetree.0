From: Wim Van Sebroeck <wim@iguana.be>
Subject: Re: [PATCH v3 0/11] Xilinx watchdog changes
Date: Mon, 24 Feb 2014 21:01:58 +0100
Message-ID: <20140224200158.GN20712@spo001.leaseweb.com>
References: <cover.1392212059.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1392212059.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

Hi Michal,

> Hi,
> 
> This series contains changes for Xilinx watchdog.
> The whole code series have been reviewed by Guenter
> and device-tree binding was acked by Arnd.
> 
> I have also pushed this v3 to git repo
> for easier pulling here:
> git://git.monstr.eu/linux-2.6-microblaze.git watchdog
> 
> Thanks,
> Michal
> 
> Changes in v3:
> - Remove one if checking and use variable directly
> 
> Changes in v2:
> - Fix enable_once logic
> - Change patch subject
> - New patch in this series
> 
> Michal Simek (11):
>   watchdog: xilinx: Convert driver to the watchdog framework
>   watchdog: xilinx: Move control_status_reg to functions
>   watchdog: xilinx: Simplify probe and remove functions
>   watchdog: xilinx: Move no_timeout to probe function
>   watchdog: xilinx: Allocate private structure per device
>   watchdog: xilinx: Fix all printk messages
>   watchdog: xilinx: Use of_property_read_u32
>   watchdog: xilinx: Use correct comment indentation
>   watchdog: xilinx: Add missing binding
>   watchdog: xilinx: Enable this driver for Zynq
>   watchdog: xilinx: Remove no_timeout variable
> 
>  .../devicetree/bindings/watchdog/of-xilinx-wdt.txt |  23 ++
>  drivers/watchdog/Kconfig                           |  21 +-
>  drivers/watchdog/of_xilinx_wdt.c                   | 389 ++++++---------------
>  3 files changed, 148 insertions(+), 285 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/of-xilinx-wdt.txt
> 
> --
> 1.8.2.3
> 

This patch series has been added to linux-watchdog-next.

Kind regards,
Wim.
