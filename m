From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v2] ARM: multi_v7_defconfig: enable STM32 SPI
Date: Thu, 20 Sep 2018 17:29:17 +0200
Message-ID: <eb5a90e1-d3d6-fef7-7595-29f3ae38af55@st.com>
References: <1534934989-22292-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1534934989-22292-1-git-send-email-amelie.delaunay@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Amélie

On 08/22/2018 12:49 PM, Amelie Delaunay wrote:
> Enable the STM32 SPI driver, implemented on STM32MP1 SoC.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>   arch/arm/configs/multi_v7_defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index b749d1e..4cdb622 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -417,6 +417,7 @@ CONFIG_SPI_S3C64XX=m
>   CONFIG_SPI_SH_MSIOF=m
>   CONFIG_SPI_SH_HSPI=y
>   CONFIG_SPI_SIRF=y
> +CONFIG_SPI_STM32=m
>   CONFIG_SPI_SUN4I=y
>   CONFIG_SPI_SUN6I=y
>   CONFIG_SPI_TEGRA114=y
> 

Applied on stm32-next.

Thanks.
Alex
