From: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Add STM32429i-EVAL board support
Date: Wed, 22 Jul 2015 19:02:03 +0200
Message-ID: <55AFCC8B.4090209@gmail.com>
References: <1436693957-30855-1-git-send-email-mcoquelin.stm32@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436693957-30855-1-git-send-email-mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kamil Lulko <rev13-5tc4TXWwyLM@public.gmane.org>, afaerber-l3A5Bk7waGM@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 07/12/2015 11:39 AM, Maxime Coquelin wrote:
> Main features of STM32429i-EVAL evaluation kit are:
>   - STM32F429 Cortex-M4 MCU @180MHz
>     * 2MB internal Flash
>     * 256KB internal RAM
>   - 32MB SDRAM
>   - 16MB NOR Flash
>   - 2MB SRAM
>   - 4.3" TFT LCD with resistive touchscreen
>   - SDCard connector (SDIO compatible)
>   - 1x USB 2.0 OTG + 1x USB 1.1 OTG
>   - Ethernet
>
> Signed-off-by: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   arch/arm/boot/dts/Makefile           |  4 +-
>   arch/arm/boot/dts/stm32429i-eval.dts | 75 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 78 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm/boot/dts/stm32429i-eval.dts
>
>
Applied to next/dt-for-v4.3.

Best regards,
Maxime
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
