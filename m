From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 07/19] clk: at91: add pll id macros for pll dt bindings
Date: Tue, 8 Oct 2013 12:30:21 +0200
Message-ID: <5253DEBD.7010904@atmel.com>
References: <1375937608-3773-1-git-send-email-b.brezillon@overkiz.com> <1375942160-8881-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375942160-8881-1-git-send-email-b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/08/2013 08:09, Boris BREZILLON :
> This patch adds the PLL id macros which will be used by pll dt definitions.

It is not needed, drop it. Just document the values in the DT biding and 
it will be fine.

>
> Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
> ---
>   include/dt-bindings/clk/at91/common/clk-pll.h |   13 +++++++++++++
>   1 file changed, 13 insertions(+)
>   create mode 100644 include/dt-bindings/clk/at91/common/clk-pll.h
>
> diff --git a/include/dt-bindings/clk/at91/common/clk-pll.h b/include/dt-bindings/clk/at91/common/clk-pll.h
> new file mode 100644
> index 0000000..93ec849
> --- /dev/null
> +++ b/include/dt-bindings/clk/at91/common/clk-pll.h
> @@ -0,0 +1,13 @@
> +/*
> + * This header provides constants for AT91 pll ids.
> + *
> + * The constants defined in this header are being used in dts.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_AT91_PLL_H
> +#define _DT_BINDINGS_CLK_AT91_PLL_H
> +
> +#define AT91_PLLA_CLK		0	/* PLLA clk id */
> +#define AT91_PLLB_CLK		1	/* PLLB clk id */
> +
> +#endif
>


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
