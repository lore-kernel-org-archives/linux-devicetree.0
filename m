From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH V2 09/15] irqchip: Remove ARM dependency for bcm7120-l2
 and brcmstb-l2
Date: Thu, 30 Oct 2014 14:10:30 +0300
Message-ID: <54521CA6.1000802@cogentembedded.com>
References: <1414635488-14137-1-git-send-email-cernekee@gmail.com> <1414635488-14137-10-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414635488-14137-10-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Cernekee <cernekee@gmail.com>, arnd@arndb.de, f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org, lethal@linux-sh.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On 10/30/2014 5:18 AM, Kevin Cernekee wrote:

> This can compile for MIPS (or anything else) now.

> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>   drivers/irqchip/Kconfig | 1 -
>   1 file changed, 1 deletion(-)

> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index b21f12f..09c79d1 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -50,7 +50,6 @@ config ATMEL_AIC5_IRQ
>
>   config BRCMSTB_L2_IRQ
>   	bool
> -	depends on ARM

    How about the following?

	depends on ARM || MIPS || COMPILE_TEST

[...]

WBR, Sergei
