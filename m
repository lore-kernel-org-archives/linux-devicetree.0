From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/7] clk: meson: clean-up meson clock configuration
Date: Thu, 26 Apr 2018 10:46:01 +0200
Message-ID: <d643c87a-d364-1587-100d-119f8b417f11@baylibre.com>
References: <20180425163304.10852-1-jbrunet@baylibre.com>
 <20180425163304.10852-2-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180425163304.10852-2-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 25/04/2018 18:32, Jerome Brunet wrote:
> Clean the dependencies in meson clock Kconfig.
> CLK_AMLOGIC should actually select CLK_REGMAP_MESON which it uses. Also,
> each platform should select CLK_AMLOGIC, so everything is properly turned
> on when the platform Kconfig enable each configuration flag
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/Kconfig | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index d5cbec522aec..87d69573e172 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -1,7 +1,7 @@
>  config COMMON_CLK_AMLOGIC
>  	bool
> -	depends on OF
>  	depends on ARCH_MESON || COMPILE_TEST
> +	select COMMON_CLK_REGMAP_MESON
>  
>  config COMMON_CLK_REGMAP_MESON
>  	bool
> @@ -9,9 +9,8 @@ config COMMON_CLK_REGMAP_MESON
>  
>  config COMMON_CLK_MESON8B
>  	bool
> -	depends on COMMON_CLK_AMLOGIC
> +	select COMMON_CLK_AMLOGIC
>  	select RESET_CONTROLLER
> -	select COMMON_CLK_REGMAP_MESON
>  	help
>  	  Support for the clock controller on AmLogic S802 (Meson8),
>  	  S805 (Meson8b) and S812 (Meson8m2) devices. Say Y if you
> @@ -19,9 +18,8 @@ config COMMON_CLK_MESON8B
>  
>  config COMMON_CLK_GXBB
>  	bool
> -	depends on COMMON_CLK_AMLOGIC
> +	select COMMON_CLK_AMLOGIC
>  	select RESET_CONTROLLER
> -	select COMMON_CLK_REGMAP_MESON
>  	select MFD_SYSCON
>  	help
>  	  Support for the clock controller on AmLogic S905 devices, aka gxbb.
> @@ -29,9 +27,8 @@ config COMMON_CLK_GXBB
>  
>  config COMMON_CLK_AXG
>  	bool
> -	depends on COMMON_CLK_AMLOGIC
> +	select COMMON_CLK_AMLOGIC
>  	select RESET_CONTROLLER
> -	select COMMON_CLK_REGMAP_MESON
>  	select MFD_SYSCON
>  	help
>  	  Support for the clock controller on AmLogic A113D devices, aka axg.
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
