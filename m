From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH V3 7/8] ARM: dts: Add minimal Raspberry Pi 4 support
Date: Sat, 28 Sep 2019 12:58:20 -0700
Message-ID: <77b0a773-912a-aa5b-6eb5-5423c2c07e58@gmail.com>
References: <1569672435-19823-1-git-send-email-wahrenst@gmx.net>
 <1569672435-19823-8-git-send-email-wahrenst@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1569672435-19823-8-git-send-email-wahrenst@gmx.net>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org



On 9/28/2019 5:07 AM, Stefan Wahren wrote:
> This adds minimal support for the new Raspberry Pi 4 without the
> fancy stuff like GENET, PCIe, xHCI, 40 bit DMA and V3D. The RPi 4 is
> available in 3 different variants (1, 2 and 4 GB RAM), so leave the memory
> size to zero and let the bootloader take care of it. The DWC2 is still
> usable as peripheral via the USB-C port.

That comment is useful, and probably belongs where the memory node is
declared, see below.

> 
> Other differences to the Raspberry Pi 3:
> - additional GIC 400 Interrupt controller
> - new thermal IP and HWRNG
> - additional MMC interface (emmc2)
> - additional UART, I2C, SPI and PWM interfaces
> - clock stretching bug in I2C IP has been fixed
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Acked-by: Eric Anholt <eric@anholt.net>
> ---

[snip]

> +/ {
> +	compatible = "raspberrypi,4-model-b", "brcm,bcm2711";
> +	model = "Raspberry Pi 4 Model B";
> +
> +	chosen {
> +		/* 8250 auxiliary UART instead of pl011 */
> +		stdout-path = "serial1:115200n8";
> +	};
> +

Might be worth a comment that the reg property of the memory node is
filed by the boot loader based on the populated amount of DRAM. You can
also go with a shorter format for the size (0)?

> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0 0 0x00000000>;
> +	};
> +

[snip]

> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/bcm2835-pm.h>
> +
> +/ {
> +	compatible = "brcm,bcm2711";
> +
> +	#address-cells = <2>;
> +	#size-cells = <1>;

Trying to see if we may need a #size-cells property value of 2 here, for
the 4GB model, I would assume that we would have to, unless we are fine
with supporting 4GB - 1byte of DRAM?

> +
> +	interrupt-parent = <&gicv2>;
> +
> +	soc {
> +		ranges = <0x7e000000  0x0 0xfe000000  0x01800000>,
> +			 <0x7c000000  0x0 0xfc000000  0x02000000>,
> +			 <0x40000000  0x0 0xff800000  0x00800000>;

Might be nice to get some comments about

> +		/* Emulate a contiguous 30-bit address range for DMA */
> +		dma-ranges = <0xc0000000  0x0 0x00000000  0x3c000000>;
> +
> +		local_intc: local_intc@40000000 {
> +			compatible = "brcm,bcm2836-l1-intc";
> +			reg = <0x40000000 0x100>;
> +		};

This deserves a comment to indicate that this node is the provider for
the enable-method for bringing up secondary cores. And no PSCI, still,
what year is this?

[snip]

> +		rng@7e104000 {
> +			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			/* RNG is incompatible to brcm,bcm2835-rng */

Nit: s/to/with/

[snip]

> +		spi@7e204000 {
> +			reg = <0x7e204000 0x0200>;
> +			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> +		};

Why is this SPI node incomplete, are you just overriding a previously
defined node here?

[snip]

> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
> +					  IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) |
> +					  IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) |
> +					  IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
> +					  IRQ_TYPE_LEVEL_LOW)>;
> +		/* This only applies to the ARMv7 stub */
> +		arm,cpu-registers-not-fw-configured;
> +
> +		/* The ARM cores doesn't enter deep enough states */

Nit: s/doesn't/do not/
-- 
Florian
