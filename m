From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 5/8] arm64: zynqmp: Add support for Xilinx zcu106-revA
Date: Wed, 7 Mar 2018 14:32:19 -0600
Message-ID: <20180307203219.popg6fcvnn67zm62@rob-hp-laptop>
References: <cover.1520017397.git.michal.simek@xilinx.com>
 <8a597d5fa5d7ded87bb709acf86b653454e13a8a.1520017397.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8a597d5fa5d7ded87bb709acf86b653454e13a8a.1520017397.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, monstr@monstr.eu, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 02, 2018 at 08:04:31PM +0100, Michal Simek wrote:
> Xilinx zcu106 is a customer board. It is reusing some parts from zcu102.
> 
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
> 
> Changes in v3:
> - remove gpio and usb aliases
> 
> Changes in v2:
> - Remove i2c mw u-boot commands
> - Use i2c-mux instead of i2cswitch
> - Use clock generator without numbers
> - Record compatible string to xilinx.txt
> 
>  Documentation/devicetree/bindings/arm/xilinx.txt  |   3 +
>  arch/arm64/boot/dts/xilinx/Makefile               |   1 +
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts | 522 ++++++++++++++++++++++
>  3 files changed, 526 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts

Reviewed-by: Rob Herring <robh@kernel.org>
