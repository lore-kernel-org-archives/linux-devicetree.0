From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: at91: move sama5d3 SoC to common clk
Date: Wed, 9 Oct 2013 15:12:48 +0200
Message-ID: <52555650.4080003@atmel.com>
References: <1375951572-10829-1-git-send-email-b.brezillon@overkiz.com> <1375957794-11559-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375957794-11559-1-git-send-email-b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/08/2013 12:29, Boris BREZILLON :
> This patch removes the selection of AT91_USE_OLD_CLK when selecting sama5d3
> SoC support. This will enable automatically enable COMMON_CLK_AT91 option
> and add support for at91 common clk implementation.
>
> Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>

One big step!

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

> ---
>   arch/arm/mach-at91/Kconfig |    1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
> index 97033f7..b4f7d6f 100644
> --- a/arch/arm/mach-at91/Kconfig
> +++ b/arch/arm/mach-at91/Kconfig
> @@ -86,7 +86,6 @@ config SOC_SAMA5D3
>   	select SOC_SAMA5
>   	select HAVE_FB_ATMEL
>   	select HAVE_AT91_DBGU1
> -	select AT91_USE_OLD_CLK
>   	select HAVE_AT91_UTMI
>   	select HAVE_AT91_SMD
>   	select HAVE_AT91_USB_CLK
>


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
