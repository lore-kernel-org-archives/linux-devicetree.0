From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v2 6/9] ARM64: meson: enable MESON_IRQ_GPIO in Kconfig
Date: Thu, 20 Oct 2016 17:34:21 +0100
Message-ID: <c480f84f-ffc8-69fd-1dad-30cd2eb3360b@arm.com>
References: <1476890480-8884-1-git-send-email-jbrunet@baylibre.com>
 <1476890480-8884-7-git-send-email-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476890480-8884-7-git-send-email-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On 19/10/16 16:21, Jerome Brunet wrote:
> Add select MESON_IRQ_GPIO in Kconfig for Amlogic's meson SoC family
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index cfbdf02ef566..846479d4492d 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -95,6 +95,7 @@ config ARCH_MESON
>  	select PINCTRL_MESON
>  	select COMMON_CLK_AMLOGIC
>  	select COMMON_CLK_GXBB
> +	select MESON_GPIO_IRQ

MESON_IRQ_GPIO?

>  	help
>  	  This enables support for the Amlogic S905 SoCs.
>  
> 


-- 
Jazz is not dead. It just smells funny...
