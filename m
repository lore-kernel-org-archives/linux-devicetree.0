From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/5]  arm: zynq: Add support for Xilinx zc770 xm013
 dc4 board
Date: Fri, 2 Mar 2018 12:53:20 -0600
Message-ID: <20180302185320.bc2qcqkfs5c2oatw@rob-hp-laptop>
References: <cover.1519398009.git.michal.simek@xilinx.com>
 <7e29c4841930c4e4189a167934574fcf987b9f02.1519398009.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7e29c4841930c4e4189a167934574fcf987b9f02.1519398009.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 23, 2018 at 04:00:23PM +0100, Michal Simek wrote:
> zc770 is based board which is extended by FMC/DC cards for SoC
> validation. FMCs/DCs are supposed to cover all SoC configurations.
> FMC/DC contains can, ethernet, i2c, qspi, spi and uart.
> 
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
> 
> Changes in v2:
> - use eeprom as node name instead of at25
> - Record compatible string to xilinx.txt
> 
>  Documentation/devicetree/bindings/arm/xilinx.txt |  1 +
>  arch/arm/boot/dts/Makefile                       |  1 +
>  arch/arm/boot/dts/zynq-zc770-xm013.dts           | 78 ++++++++++++++++++++++++
>  3 files changed, 80 insertions(+)
>  create mode 100644 arch/arm/boot/dts/zynq-zc770-xm013.dts

Reviewed-by: Rob Herring <robh@kernel.org>
