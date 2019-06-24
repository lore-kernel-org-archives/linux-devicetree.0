From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/4] arm64: Enable TIMER_IMX_SYS_CTR for ARCH_MXC
 platforms
Date: Mon, 24 Jun 2019 10:22:01 +0800
Message-ID: <20190624022200.GN3800@dragon>
References: <20190621070720.12395-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190621070720.12395-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com
Cc: catalin.marinas@arm.com, will@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, leonard.crestez@nxp.com, aisheng.dong@nxp.com, ping.bai@nxp.com, daniel.baluta@nxp.com, peng.fan@nxp.com, abel.vesa@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Fri, Jun 21, 2019 at 03:07:17PM +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> ARCH_MXC platforms needs system counter as broadcast timer
> to support cpuidle, enable it by default.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 4778c77..f5e623f 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -173,6 +173,7 @@ config ARCH_MXC
>  	select PM
>  	select PM_GENERIC_DOMAINS
>  	select SOC_BUS
> +	select TIMER_IMX_SYS_CTR

Where is that driver?

Shawn

>  	help
>  	  This enables support for the ARMv8 based SoCs in the
>  	  NXP i.MX family.
> -- 
> 2.7.4
> 
