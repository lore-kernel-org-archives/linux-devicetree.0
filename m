From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 19/19] ARM: at91: add new compatible strings for pmc
 driver
Date: Tue, 8 Oct 2013 18:29:44 +0200
Message-ID: <525432F8.9060600@atmel.com>
References: <1375937608-3773-1-git-send-email-b.brezillon@overkiz.com> <1375949965-10586-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375949965-10586-1-git-send-email-b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/08/2013 10:19, Boris BREZILLON :
> This patch adds new compatible string for PMC node to prepare the
> transition to common clk.
>
> These compatible string come from pmc driver in clk subsystem and are
> needed to provide new device tree compatibility with old at91 clks
> (device tree using common clks will use the new compatible strings).
>
> Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
> ---
>   arch/arm/mach-at91/clock.c |    6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/mach-at91/clock.c b/arch/arm/mach-at91/clock.c
> index 5f02aea..4d4463a 100644
> --- a/arch/arm/mach-at91/clock.c
> +++ b/arch/arm/mach-at91/clock.c
> @@ -884,6 +884,12 @@ static int __init at91_pmc_init(unsigned long main_clock)
>   #if defined(CONFIG_OF)
>   static struct of_device_id pmc_ids[] = {
>   	{ .compatible = "atmel,at91rm9200-pmc" },
> +	{ .compatible = "atmel,at91sam9260-pmc" },
> +	{ .compatible = "atmel,at91sam9g45-pmc" },
> +	{ .compatible = "atmel,at91sam9n12-pmc" },
> +	{ .compatible = "atmel,at91sam9x5-pmc" },
> +	{ .compatible = "atmel,at91sam9g35-pmc" },

With removal of this compatibility string:

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

> +	{ .compatible = "atmel,sama5d3-pmc" },
>   	{ /*sentinel*/ }
>   };
>
>


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
