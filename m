From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/8] arm64: zynqmp: Add support for Xilinx zcu104-revA
Date: Wed, 7 Mar 2018 14:31:31 -0600
Message-ID: <20180307203131.vubpjgh6jootrkyc@rob-hp-laptop>
References: <cover.1520017397.git.michal.simek@xilinx.com>
 <409e614b762bd6da24bc26364fcf28c805986eaf.1520017397.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <409e614b762bd6da24bc26364fcf28c805986eaf.1520017397.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, monstr@monstr.eu, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 02, 2018 at 08:04:30PM +0100, Michal Simek wrote:
> Xilinx zcu104 is another customer board. It is sort of zcu102 clone
> with some differences.
> 
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
> 
> Changes in v3:
> - Use i2c-mux instead of i2cswitch - was done with zcu106
> - Remove gpio and usb aliases
> 
> Changes in v2:
> - Remove i2c mw u-boot commands
> - Record compatible string to xilinx.txt
> 
>  Documentation/devicetree/bindings/arm/xilinx.txt  |   3 +
>  arch/arm64/boot/dts/xilinx/Makefile               |   1 +
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts | 195 ++++++++++++++++++++++
>  3 files changed, 199 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts

Reviewed-by: Rob Herring <robh@kernel.org>
