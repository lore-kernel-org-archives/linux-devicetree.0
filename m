From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v5 4/4] ARM: configs: stm32: Add MDMA support in STM32
 defconfig
Date: Mon, 16 Oct 2017 18:31:08 +0200
Message-ID: <579b83f8-d2bb-b926-2365-92b11a09f6cf@st.com>
References: <1506613003-28376-1-git-send-email-pierre-yves.mordret@st.com>
 <1506613003-28376-5-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1506613003-28376-5-git-send-email-pierre-yves.mordret@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Dan Williams <dan.j.williams@intel.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, Herbert Xu <herbert@gondor.apana.org.au>, Fabien DESSENNE <fabien.dessenne@st.com>, Amelie Delaunay <amelie.delaunay@st.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

hi

On 09/28/2017 05:36 PM, Pierre-Yves MORDRET wrote:
> This patch adds MDMA support in STM32 defconfig file
> 
> Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
> ---
>   Version history:
>      v5:
>      v4:
>      v3:
>          * None
>      v2:
>          * Add MDMA support in STM32 defconfig
> ---
> ---
>   arch/arm/configs/stm32_defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
> index 90e5c46..dd8919b 100644
> --- a/arch/arm/configs/stm32_defconfig
> +++ b/arch/arm/configs/stm32_defconfig
> @@ -67,6 +67,7 @@ CONFIG_RTC_CLASS=y
>   CONFIG_RTC_DRV_STM32=y
>   CONFIG_DMADEVICES=y
>   CONFIG_STM32_DMA=y
> +CONFIG_STM32_MDMA=y
>   CONFIG_IIO=y
>   CONFIG_STM32_ADC_CORE=y
>   CONFIG_STM32_ADC=y
> 
Applied on stm32-defconfig-for-v4.15.

Thanks
Alex
