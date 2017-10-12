From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 06/10] ARM: dts: Add Broadcom Hurricane 2 DTS include file
Date: Thu, 12 Oct 2017 11:30:53 -0700
Message-ID: <20171012183053.3143-1-f.fainelli@gmail.com>
References: <20170928231502.27069-1-f.fainelli@gmail.com> <20170928231502.27069-7-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170928231502.27069-7-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 28 Sep 2017 16:14:58 -0700, Florian Fainelli <f.fainelli@gmail.com> wrote:
> Describe the Broadcom Hurricane 2 SoC comprised of a Cortex-A9 CPU
> complex along with standard iProc peripherals:
> 
> * timers
> * SPI controller
> * NAND controller
> * a single AMAC (Ethernet MAC controller)
> * dual PCIe controllers
> 
> The design is largely similar to existing iProc-based SoCs such as
> Northstar Plus.
> 
> Acked-by: Jon Mason <jon.mason@broadcom.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Applied to devicetree/next, thanks!
--
Florian
