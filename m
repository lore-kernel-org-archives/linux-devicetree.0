From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] clk: add userspace clock consumer
Date: Tue, 23 Feb 2016 15:49:44 -0600
Message-ID: <20160223214944.GA20852@rob-hp-laptop>
References: <1456141719-2543-1-git-send-email-akinobu.mita@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456141719-2543-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 22, 2016 at 08:48:39PM +0900, Akinobu Mita wrote:
> This adds userspace consumer for common clock.
> 
> This driver is inspired from Userspace regulator consumer
> (REGULATOR_USERSPACE_CONSUMER) and it is useful for test purposes and
> some classes of devices that are controlled entirely from user space.

Whether the kernel handles a clock or userspace does should have nothing 
to do with DT. Plus DT does not expose many of the clocks, so any 
debug feature needs to expose all clocks and be independent of DT.

Beyond debug, I don't think we should be exposing clock control to 
userspace.

> 
> Example binding and usages:
> 
> clksqw_userspace_consumer {
> 	compatible = "linux,clock-userspace-consumer";
> 	clocks = <&clksqw>;
> };
> 
> 	# cd /sys/devices/platform/clksqw_userspace_consumer
> 	# echo 8192 > rate
> 	# echo 1 > enable
> 
> This also create new COMMON_CLK_DEBUG option and this userspace clock
> consumer depends on it.
> 
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> ---
> * v2
> - change compatible property to "linux,clock-userspace-consumer"
> - rename sysfs file from 'state' to 'enable'

While it is good this is under a debug option, it also needs to be under 
debugfs, not sysfs.

> - create new COMMON_CLK_DEBUG option
> 
>  .../bindings/clock/clk-userspace-consumer.txt      |  17 +++
>  drivers/clk/Kconfig                                |   9 ++
>  drivers/clk/Kconfig.debug                          |   9 ++
>  drivers/clk/Makefile                               |   1 +
>  drivers/clk/clk-userspace-consumer.c               | 169 +++++++++++++++++++++
>  5 files changed, 205 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/clk-userspace-consumer.txt
>  create mode 100644 drivers/clk/Kconfig.debug
>  create mode 100644 drivers/clk/clk-userspace-consumer.c

