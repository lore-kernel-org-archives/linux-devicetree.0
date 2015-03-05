From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v2] ARM64: Add new Xilinx ZynqMP SoC
Date: Thu, 5 Mar 2015 15:03:22 +0100
Message-ID: <20150305150322.19e378d9@free-electrons.com>
References: <cd616fa25dafee38f98e3b207e74450c5403f440.1425563597.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cd616fa25dafee38f98e3b207e74450c5403f440.1425563597.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robherring2@gmail.com>, devicetree@vger.kernel.org, Zach Pfeffer <zachp@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@linaro.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Robert Richter <rrichter@cavium.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Eddie Huang <eddie.huang@mediatek.com>, =?UTF-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

Dear Michal Simek,

On Thu,  5 Mar 2015 14:53:34 +0100, Michal Simek wrote:

> +	pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <0 143 4>,
> +			     <0 144 4>,
> +			     <0 145 4>,
> +			     <0 146 4>;

Any reason not to use

#include <dt-bindings/interrupt-controller/arm-gic.h>
#include <dt-bindings/interrupt-controller/irq.h>

in order to write the more descriptive:

		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;

And ditto for all other interrupts properties?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
