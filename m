From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH v4 10/17] clk: at91: add peripheral clk macros for peripheral
 clk dt bindings
Date: Thu, 17 Oct 2013 18:03:17 +0200
Message-ID: <52600A45.6070508@atmel.com>
References: <1381477081-6041-1-git-send-email-b.brezillon@overkiz.com> <1381485180-13796-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1381485180-13796-1-git-send-email-b.brezillon@overkiz.com>
Sender: linux-doc-owner@vger.kernel.org
To: Boris BREZILLON <b.brezillon@overkiz.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Andrew Victor <linux@maxim.org.za>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Russell King <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Ludovic Desroches <ludovic.desroches@atmel.com>, Josh Wu <josh.wu@atmel.com>, Richard Genoud <richard.genoud@gmail.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/10/2013 11:53, Boris BREZILLON :
> This patch adds the peripheral divisors macros (for sam9x5 compatible IPs)
> which will be used by peripheral clk dt definitions.
>
> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

> ---
>   include/dt-bindings/clk/at91.h |    6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/include/dt-bindings/clk/at91.h b/include/dt-bindings/clk/at91.h
> index 0b4cb99..a3b07ca 100644
> --- a/include/dt-bindings/clk/at91.h
> +++ b/include/dt-bindings/clk/at91.h
> @@ -19,4 +19,10 @@
>   #define AT91_PMC_MOSCRCS	17		/* Main On-Chip RC */
>   #define AT91_PMC_CFDEV		18		/* Clock Failure Detector Event */
>
> +/* sam9x5 peripheral divisors */
> +#define AT91SAM9X5_PERIPH_CLK_DIV1	0
> +#define AT91SAM9X5_PERIPH_CLK_DIV2	1
> +#define AT91SAM9X5_PERIPH_CLK_DIV4	2
> +#define AT91SAM9X5_PERIPH_CLK_DIV8	3
> +
>   #endif
>


-- 
Nicolas Ferre
