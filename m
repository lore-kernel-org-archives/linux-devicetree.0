From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [RFCv3 4/4] ARM: zynq: Select ARCH_HAS_RESET_CONTROLLER
Date: Fri, 31 Jul 2015 10:09:29 +0200
Message-ID: <55BB2D39.6000004@xilinx.com>
References: <1438305237-18497-1-git-send-email-moritz.fischer@ettus.com>
 <1438305237-18497-5-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438305237-18497-5-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>, p.zabel@pengutronix.de
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/31/2015 03:13 AM, Moritz Fischer wrote:
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  arch/arm/mach-zynq/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-zynq/Kconfig b/arch/arm/mach-zynq/Kconfig
> index 78e5e00..77d7df7 100644
> --- a/arch/arm/mach-zynq/Kconfig
> +++ b/arch/arm/mach-zynq/Kconfig
> @@ -1,5 +1,6 @@
>  config ARCH_ZYNQ
>  	bool "Xilinx Zynq ARM Cortex A9 Platform" if ARCH_MULTI_V7
> +	select ARCH_HAS_RESET_CONTROLLER
>  	select ARCH_SUPPORTS_BIG_ENDIAN
>  	select ARM_AMBA
>  	select ARM_GIC
> 

Reviewed-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
