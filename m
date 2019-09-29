From: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH V3 7/8] ARM: dts: Add minimal Raspberry Pi 4 support
Date: Sun, 29 Sep 2019 12:25:19 +0100
Message-ID: <b75876e1b3c46297142c052e1c6ea0a2@www.loen.fr>
References: <1569672435-19823-1-git-send-email-wahrenst@gmx.net>
 <1569672435-19823-8-git-send-email-wahrenst@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1569672435-19823-8-git-send-email-wahrenst@gmx.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2019-09-28 13:07, Stefan Wahren wrote:
> This adds minimal support for the new Raspberry Pi 4 without the
> fancy stuff like GENET, PCIe, xHCI, 40 bit DMA and V3D. The RPi 4 is
> available in 3 different variants (1, 2 and 4 GB RAM), so leave the 
> memory
> size to zero and let the bootloader take care of it. The DWC2 is 
> still
> usable as peripheral via the USB-C port.
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

[...]

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
> +		always-on;

I already commented on this. The A72 not entering a deep enough sleep 
state to
lose its comparator seems dubious at best. The right way to do this is 
to have
a global timer, which you said the platform has.

Please drop this.

         M.
-- 
Jazz is not dead. It just smells funny...
