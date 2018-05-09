Return-Path: <SRS0=ZGhC=H4=baylibre.com=khilman@kernel.org>
From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 3/6] ARM: meson: add support for the Meson8m2 SoCs
References: <20180506092119.467-1-martin.blumenstingl@googlemail.com>
	<20180506092119.467-4-martin.blumenstingl@googlemail.com>
Date: Wed, 09 May 2018 15:32:18 -0700
In-Reply-To: <20180506092119.467-4-martin.blumenstingl@googlemail.com> (Martin
	Blumenstingl's message of "Sun, 6 May 2018 11:21:16 +0200")
Message-ID: <7hy3gsxxxp.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, carlo@caione.org, robh+dt@kernel.org, mark.rutland@arm.com, balbes-150@yandex.ru
List-ID: <devicetree@vger.kernel.org>

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Add a new Kconfig entry as well as the newly introduced compatible
> string for the Meson8m2 SoC.
> The Kconfig entry selects the same drivers as Meson8b because Meson8m2
> SoC is mostly compatible with Meson8 (both share the same pinctrl
> driver, so they also share the same GPIO IRQ settings. also the same
> Meson6 timer is used on Meson8m2).
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm/mach-meson/Kconfig | 7 +++++++
>  arch/arm/mach-meson/meson.c | 1 +
>  2 files changed, 8 insertions(+)
>
> diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
> index d90f61e6254f..44a489889bc1 100644
> --- a/arch/arm/mach-meson/Kconfig
> +++ b/arch/arm/mach-meson/Kconfig
> @@ -32,4 +32,11 @@ config MACH_MESON8B
>  	select COMMON_CLK_MESON8B
>  	select MESON_IRQ_GPIO
>  
> +config MACH_MESON8M2
> +	bool "Amlogic Meson8m2 SoCs support"
> +	default ARCH_MESON
> +	select MESON6_TIMER
> +	select COMMON_CLK_MESON8B
> +	select MESON_IRQ_GPIO

I'd prefer to stop the proliferation of identical Kconfigs which are
only used to select which DTB files to compile.

Instead, can you drop this new Kconfig as well as MACH_MESON8, and just
make all the meson8* DTBs build based on MACH_MESON8?

I think it better to have fewer Kconfigs. The only cost is building a
couple extra DTBs.

Thanks,

Kevin

>  endif
> diff --git a/arch/arm/mach-meson/meson.c b/arch/arm/mach-meson/meson.c
> index 4e2357178625..c8d99df32f9b 100644
> --- a/arch/arm/mach-meson/meson.c
> +++ b/arch/arm/mach-meson/meson.c
> @@ -20,6 +20,7 @@ static const char * const meson_common_board_compat[] = {
>  	"amlogic,meson6",
>  	"amlogic,meson8",
>  	"amlogic,meson8b",
> +	"amlogic,meson8m2",
>  	NULL,
>  };
