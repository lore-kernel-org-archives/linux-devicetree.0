From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 2/2] ARM: bcm2835: Add devicetree for the Raspberry Pi 3.
Date: Fri, 4 Mar 2016 18:41:36 +0000
Message-ID: <20160304184136.GB5033@leverpostej>
References: <1457116769-8567-1-git-send-email-eric@anholt.net>
 <1457116769-8567-2-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1457116769-8567-2-git-send-email-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 04, 2016 at 10:39:29AM -0800, Eric Anholt wrote:
> For now this doesn't support the new hardware present on the Pi 3 (BT,
> wifi, GPIO expander).  Since the GPIO expander isn't supported, we
> also don't have the LEDs like the other board files do.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---
>  arch/arm/boot/dts/Makefile            |  3 +-
>  arch/arm/boot/dts/bcm2837-rpi-3-b.dts | 22 ++++++++++++
>  arch/arm/boot/dts/bcm2837.dtsi        | 68 +++++++++++++++++++++++++++++++++++
>  3 files changed, 92 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/bcm2837-rpi-3-b.dts
>  create mode 100644 arch/arm/boot/dts/bcm2837.dtsi

> +	timer {
> +		compatible = "arm,armv7-timer";
> +		interrupt-parent = <&local_intc>;
> +		interrupts = <0>, // PHYS_SECURE_PPI
> +			     <1>, // PHYS_NONSECURE_PPI
> +			     <3>, // VIRT_PPI
> +			     <2>; // HYP_PPI
> +		always-on;
> +	};

Are the CPUs in an always-on power domain? Or is it jsut that the kernel
doesn't perform power management of CPUs?

The always-on proeprty is only intended for the former.

Mark.
