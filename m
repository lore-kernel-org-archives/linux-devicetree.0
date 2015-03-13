From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v3 05/12] clocksource: add dependencies for Vybrid pit
 clocksource
Date: Fri, 13 Mar 2015 11:25:29 +0100
Message-ID: <5502BB19.1020509@linaro.org>
References: <1426203380-7155-1-git-send-email-stefan@agner.ch> <1426203380-7155-6-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426203380-7155-6-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>, shawn.guo@linaro.org, kernel@pengutronix.de, linux@arm.linux.org.uk, u.kleine-koenig@pengutronix.de, jason@lakedaemon.net, olof@lixom.net, arnd@arndb.de, tglx@linutronix.de, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, marc.zyngier@arm.com, mcoquelin.stm32@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/13/2015 12:36 AM, Stefan Agner wrote:
> Add the minimal dependencies required to use the Vybrid PIT
> clocksource driver. Those are not part of the SoC dependencies.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

> ---
>   drivers/clocksource/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfi=
g
> index 1c2506f..350e742 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -164,6 +164,8 @@ config FSL_FTM_TIMER
>
>   config VF_PIT_TIMER
>   	bool
> +	select CLKSRC_MMIO
> +	select CLKSRC_OF
>   	help
>   	  Support for Period Interrupt Timer on Freescale Vybrid Family So=
Cs.
>
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
