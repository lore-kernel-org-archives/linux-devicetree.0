From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/5] arm: zynq: Add support for Xilinx zc770 xm011 dc2
 board
Date: Fri, 2 Mar 2018 12:50:56 -0600
Message-ID: <20180302185056.vkmosisuqnbbskgm@rob-hp-laptop>
References: <cover.1519398009.git.michal.simek@xilinx.com>
 <9156ffe65672c66a7407fe0c71b3c51c5be9c48b.1519398009.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9156ffe65672c66a7407fe0c71b3c51c5be9c48b.1519398009.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, monstr@monstr.eu, Steffen Trumtrar <s.trumtrar@pengutronix.de>, linux-kernel@vger.kernel.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Josh Cartwright <josh.cartwright@ni.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 23, 2018 at 04:00:21PM +0100, Michal Simek wrote:
> zc770 is based board which is extended by FMC/DC cards for SoC
> validation. FMCs/DCs are supposed to cover all SoC configurations.
> FMC/DC contains can, i2c, nand uart, spi and usb.
> 
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
> 
> Changes in v2:
> - Record compatible string to xilinx.txt
> 
>  Documentation/devicetree/bindings/arm/xilinx.txt |  1 +
>  arch/arm/boot/dts/Makefile                       |  1 +
>  arch/arm/boot/dts/zynq-zc770-xm011.dts           | 64 ++++++++++++++++++++++++
>  3 files changed, 66 insertions(+)
>  create mode 100644 arch/arm/boot/dts/zynq-zc770-xm011.dts

Reviewed-by: Rob Herring <robh@kernel.org>
