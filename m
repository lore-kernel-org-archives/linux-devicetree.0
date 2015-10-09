From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v4 3/6] arm64: berlin: add the pinctrl dependency for
 Marvell Berlin SoCs
Date: Fri, 9 Oct 2015 11:05:15 +0200
Message-ID: <20151009090515.GC2842@kwain>
References: <1444378629-3057-1-git-send-email-jszhang@marvell.com>
 <1444378629-3057-4-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444378629-3057-4-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>
Cc: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org, antoine.tenart@free-electrons.com, catalin.marinas@arm.com, will.deacon@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 09, 2015 at 04:17:06PM +0800, Jisheng Zhang wrote:
> This is to add the pinctrl dependency for Marvell Berlin SoCs.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@marvell.com>

Acked-by: Antoine Tenart <antoine.tenart@free-electrons.com>

> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platfo=
rms
> index c6e2c75..3d17ee2 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -9,6 +9,7 @@ config ARCH_BERLIN
>  	bool "Marvell Berlin SoC Family"
>  	select ARCH_REQUIRE_GPIOLIB
>  	select DW_APB_ICTL
> +	select PINCTRL
>  	help
>  	  This enables support for Marvell Berlin SoC Family
> =20
> --=20
> 2.6.1
>=20

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
