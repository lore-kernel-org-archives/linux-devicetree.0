From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v3 3/4] ARM: digicolor: add minimal device tree
 description
Date: Tue, 27 Jan 2015 15:01:41 -0800
Message-ID: <20150127230141.GA11263@quad.lixom.net>
References: <cover.1421219953.git.baruch@tkos.co.il>
 <474d0849bb30ab4ec323fa4c1bc67b30b31d3884.1421219953.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <474d0849bb30ab4ec323fa4c1bc67b30b31d3884.1421219953.git.baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Jan 14, 2015 at 10:40:32AM +0200, Baruch Siach wrote:
> cx92755.dtsi describes CX92755 on chip peripherals. conexant_equinox.dts
> describes the Equinox evaluation board for the CX92755 SoC.
> 
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile             |   1 +
>  arch/arm/boot/dts/conexant_equinox.dts |  74 +++++++++++++++++++++++
>  arch/arm/boot/dts/cx92755.dtsi         | 107 +++++++++++++++++++++++++++++++++
>  3 files changed, 182 insertions(+)
>  create mode 100644 arch/arm/boot/dts/conexant_equinox.dts
>  create mode 100644 arch/arm/boot/dts/cx92755.dtsi
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 91bd5bd62857..fbeb65eaddda 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -75,6 +75,7 @@ dtb-$(CONFIG_ARCH_BRCMSTB) += \
>  	bcm7445-bcm97445svmb.dtb
>  dtb-$(CONFIG_ARCH_DAVINCI) += da850-enbw-cmc.dtb \
>  	da850-evm.dtb
> +dtb-$(CONFIG_ARCH_DIGICOLOR) += conexant_equinox.dtb
>  dtb-$(CONFIG_ARCH_EFM32) += efm32gg-dk3750.dtb
>  dtb-$(CONFIG_ARCH_EXYNOS) += exynos3250-monk.dtb \
>  	exynos3250-rinato.dtb \
> diff --git a/arch/arm/boot/dts/conexant_equinox.dts b/arch/arm/boot/dts/conexant_equinox.dts
> new file mode 100644
> index 000000000000..f33bf5635d47
> --- /dev/null
> +++ b/arch/arm/boot/dts/conexant_equinox.dts

To segment the namespace a bit, we ask that you prefix your dts files with the
platform. What would be a suitable prefix here? conexant? digicolor?


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
