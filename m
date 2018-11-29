Return-Path: <SRS0=sRnJ=OI=nvidia.com=jonathanh@kernel.org>
Subject: Re: [PATCH] dt-bindings: tegra186-gpio: Add Tegra186 specific prefix
References: <20181123124341.21431-1-thierry.reding@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <07ba710c-719c-f3dc-2d39-8fdbf0e9f643@nvidia.com>
Date: Thu, 29 Nov 2018 13:25:57 +0000
MIME-Version: 1.0
In-Reply-To: <20181123124341.21431-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


On 23/11/2018 12:43, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Subsequent generations of Tegra, such as Tegra194, contain a completely
> different set of GPIOs. In order to clarify that the Tegra186 defines
> are indeed specific to Tegra186, change the prefix from TEGRA_ to
> TEGRA186_.
> 
> Note that for now we need to keep the old definitions in place to avoid
> breaking compilation in file that use this header. Once all users have
> been converted to use the new defines, the old ones can be removed.
> 
> Also note that this is only a naming change and doesn't affect device
> tree ABI.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  include/dt-bindings/gpio/tegra186-gpio.h | 41 ++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/include/dt-bindings/gpio/tegra186-gpio.h b/include/dt-bindings/gpio/tegra186-gpio.h
> index 463ad398fe3e..cabc5712e745 100644
> --- a/include/dt-bindings/gpio/tegra186-gpio.h
> +++ b/include/dt-bindings/gpio/tegra186-gpio.h
> @@ -14,6 +14,34 @@
>  #include <dt-bindings/gpio/gpio.h>
>  
>  /* GPIOs implemented by main GPIO controller */
> +#define TEGRA186_MAIN_GPIO_PORT_A 0
> +#define TEGRA186_MAIN_GPIO_PORT_B 1
> +#define TEGRA186_MAIN_GPIO_PORT_C 2
> +#define TEGRA186_MAIN_GPIO_PORT_D 3
> +#define TEGRA186_MAIN_GPIO_PORT_E 4
> +#define TEGRA186_MAIN_GPIO_PORT_F 5
> +#define TEGRA186_MAIN_GPIO_PORT_G 6
> +#define TEGRA186_MAIN_GPIO_PORT_H 7
> +#define TEGRA186_MAIN_GPIO_PORT_I 8
> +#define TEGRA186_MAIN_GPIO_PORT_J 9
> +#define TEGRA186_MAIN_GPIO_PORT_K 10
> +#define TEGRA186_MAIN_GPIO_PORT_L 11
> +#define TEGRA186_MAIN_GPIO_PORT_M 12
> +#define TEGRA186_MAIN_GPIO_PORT_N 13
> +#define TEGRA186_MAIN_GPIO_PORT_O 14
> +#define TEGRA186_MAIN_GPIO_PORT_P 15
> +#define TEGRA186_MAIN_GPIO_PORT_Q 16
> +#define TEGRA186_MAIN_GPIO_PORT_R 17
> +#define TEGRA186_MAIN_GPIO_PORT_T 18
> +#define TEGRA186_MAIN_GPIO_PORT_X 19
> +#define TEGRA186_MAIN_GPIO_PORT_Y 20
> +#define TEGRA186_MAIN_GPIO_PORT_BB 21
> +#define TEGRA186_MAIN_GPIO_PORT_CC 22
> +
> +#define TEGRA186_MAIN_GPIO(port, offset) \
> +	((TEGRA186_MAIN_GPIO_PORT_##port * 8) + offset)
> +
> +/* need to keep these for backwards-compatibility */
>  #define TEGRA_MAIN_GPIO_PORT_A 0
>  #define TEGRA_MAIN_GPIO_PORT_B 1
>  #define TEGRA_MAIN_GPIO_PORT_C 2
> @@ -42,6 +70,19 @@
>  	((TEGRA_MAIN_GPIO_PORT_##port * 8) + offset)
>  
>  /* GPIOs implemented by AON GPIO controller */
> +#define TEGRA186_AON_GPIO_PORT_S 0
> +#define TEGRA186_AON_GPIO_PORT_U 1
> +#define TEGRA186_AON_GPIO_PORT_V 2
> +#define TEGRA186_AON_GPIO_PORT_W 3
> +#define TEGRA186_AON_GPIO_PORT_Z 4
> +#define TEGRA186_AON_GPIO_PORT_AA 5
> +#define TEGRA186_AON_GPIO_PORT_EE 6
> +#define TEGRA186_AON_GPIO_PORT_FF 7
> +
> +#define TEGRA186_AON_GPIO(port, offset) \
> +	((TEGRA186_AON_GPIO_PORT_##port * 8) + offset)
> +
> +/* need to keep these for backwards-compatibility */
>  #define TEGRA_AON_GPIO_PORT_S 0
>  #define TEGRA_AON_GPIO_PORT_U 1
>  #define TEGRA_AON_GPIO_PORT_V 2

I guess this will make it more consistent with what we have for
Tegra194, so looks fine to me ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
