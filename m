From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 3/5] soc: renesas: Enable RZ/A1 IRQC on RZ/A1H
Date: Mon, 29 Apr 2019 14:58:56 +0200
Message-ID: <20190429125856.fjtlme4yqmxvensd@verge.net.au>
References: <20190429093631.10799-1-geert+renesas@glider.be>
 <20190429093631.10799-4-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190429093631.10799-4-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 29, 2019 at 11:36:29AM +0200, Geert Uytterhoeven wrote:
> Auto-enable the RZ/A1 Interrupt Controller when configuring a kernel
> with support for RZ/A1H SoCs.
> 
> This is similar to how interrupt controllers for other Renesas SoCs are
> enabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert,

this is fine by me but other parts of the series need respinning.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


> ---
>  drivers/soc/renesas/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 68bfca6f20ddf8a7..1448b6dbcdb20bae 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -57,6 +57,7 @@ config ARCH_R7S72100
>  	bool "RZ/A1H (R7S72100)"
>  	select PM
>  	select PM_GENERIC_DOMAINS
> +	select RENESAS_RZA1_IRQC
>  	select SYS_SUPPORTS_SH_MTU2
>  	select RENESAS_OSTM
>  
> -- 
> 2.17.1
> 
