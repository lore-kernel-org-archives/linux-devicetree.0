From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v4 2/6] pinctrl: berlin: add the berlin4ct pinctrl driver
Date: Fri, 9 Oct 2015 11:03:53 +0200
Message-ID: <20151009090353.GA2842@kwain>
References: <1444378629-3057-1-git-send-email-jszhang@marvell.com>
 <1444378629-3057-3-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444378629-3057-3-git-send-email-jszhang@marvell.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>
Cc: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org, antoine.tenart@free-electrons.com, catalin.marinas@arm.com, will.deacon@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jisheng,

On Fri, Oct 09, 2015 at 04:17:05PM +0800, Jisheng Zhang wrote:
> diff --git a/drivers/pinctrl/berlin/Kconfig b/drivers/pinctrl/berlin/=
Kconfig
> index b18322b..c13f6d2 100644
> --- a/drivers/pinctrl/berlin/Kconfig
> +++ b/drivers/pinctrl/berlin/Kconfig
> @@ -17,4 +17,9 @@ config PINCTRL_BERLIN_BG2Q
>  	bool
>  	select PINCTRL_BERLIN
> =20
> +config PINCTRL_BERLIN_BG4CT
> +	depends on OF && (ARCH_BERLIN || COMPILE_TEST)
> +	bool "Marvell berlin4ct pin controller driver"
> +	select PINCTRL_BERLIN
> +
>  endif

This endif ends the following condition:

	if ARCH_BERLIN
	[...]

So the "depends on ARCH_BERLIN" here can be dropped. Also the
COMPILE_TEST can be moved as it isn't BG4CT specific and all other
Berlin pinctrl drivers would benefit from this.

So we would have something like:

	if (ARCH_BERLIN || COMPILE_TEST)
	[...]
	endif

=46inally you can move the OF dependency to the PINCTRL_BERLIN config a=
s
all Berlin pinctrl drivers depends on it.

Thanks!

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
