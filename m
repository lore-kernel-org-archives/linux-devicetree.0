From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 07/12] ARM: imx: depend MXC debug board on 3DS machines
Date: Tue, 30 Dec 2014 13:42:29 +0300
Message-ID: <54A28195.4070102@cogentembedded.com>
References: <1419895935-22966-1-git-send-email-stefan@agner.ch> <1419895935-22966-8-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1419895935-22966-8-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>, shawn.guo@linaro.org, kernel@pengutronix.de, linux@arm.linux.org.uk, u.kleine-koenig@pengutronix.de, jason@lakedaemon.net, olof@lixom.net, arnd@arndb.de, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, marc.zyngier@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

On 12/30/2014 2:32 AM, Stefan Agner wrote:

> Depend the MXC debug board on machines which actually support it.

> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> This configuration appeared lonely when I enabled ARCH_MULTI_V7M.
> Afaik, the selection of it only makes sense with one of the supported
> boards...

>   arch/arm/mach-imx/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index 3c5859e..96c8eb8 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -21,6 +21,7 @@ config MXC_AVIC
>
>   config MXC_DEBUG_BOARD
>   	bool "Enable MXC debug board(for 3-stack)"
> +	depends on CONFIG_MACH_MX27_3DS || CONFIG_MACH_MX31_3DS || CONFIG_MACH_MX35_3DS

    CONFIG_ prefixes are not needed in Kconfig.

[...]

WBR, Sergei
