From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/2] arm64: meson: enable g12a clock controller
Date: Fri, 08 Feb 2019 09:34:17 -0800
Message-ID: <7hlg2qfali.fsf@baylibre.com>
References: <20190208101405.25699-1-jbrunet@baylibre.com> <20190208101405.25699-2-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208101405.25699-2-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Enable the g12a clock controller for ARCH_MESON
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/Kconfig.platforms | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 819e74ae9224..d0e0bd4af05d 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -114,9 +114,11 @@ config ARCH_MESON
>  	select PINCTRL_MESON
>  	select COMMON_CLK_GXBB
>  	select COMMON_CLK_AXG
> +	select COMMON_CLK_G12A
>  	select MESON_IRQ_GPIO
>  	help
> -	  This enables support for the Amlogic S905 SoCs.
> +	  This enables support for the arm64 based Amlogic SoCs
> +	  such as the s905, S905X/D, S912, A113X/D or S905X/D2

Queued for v5.1.

nit: s/s905/S905/ to match the others.  I'll fix that up when applying
to my v5.1/soc branch.

Kevin
