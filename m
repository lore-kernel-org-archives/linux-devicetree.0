From: "Langer, Thomas" <thomas.langer@intel.com>
Subject: RE: [PATCH v2] clk: Provide dummy of_clk_get_from_provider() for
 compile-testing
Date: Fri, 28 Apr 2017 14:55:48 +0000
Message-ID: <0DAF21CFE1B20740AE23D6AF6E54843F1E8AF019@IRSMSX101.ger.corp.intel.com>
References: <1493384933-31297-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1493384933-31297-1-git-send-email-geert+renesas@glider.be>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, John Crispin <john@phrozen.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: devicetree-owner@vger.kernel.org [mailto:devicetree-
> owner@vger.kernel.org] On Behalf Of Geert Uytterhoeven
> Sent: Friday, April 28, 2017 3:09 PM
> To: Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> <sboyd@codeaurora.org>; Russell King <linux@armlinux.org.uk>; Rob Herring
> <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>; John Crispin
> <john@phrozen.org>; Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-clk@vger.kernel.org; devicetree@vger.kernel.org; linux-
> mips@linux-mips.org; linux-kernel@vger.kernel.org; Geert Uytterhoeven
> <geert+renesas@glider.be>
> Subject: [PATCH v2] clk: Provide dummy of_clk_get_from_provider() for
> compile-testing
> 
> When CONFIG_ON=n, dummies are provided for of_clk_get() and
> of_clk_get_by_name(), but not for of_clk_get_from_provider().
> 
> Provide a dummy for the latter, to improve the ability to do
> compile-testing.  This requires removing the existing dummy in the
> Lantiq clock code.
> 
> Fixes: 766e6a4ec602d0c1 ("clk: add DT clock binding support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Regarding the Lantiq part:
Acked-by: Thomas Langer <thomas.langer@intel.com>

> ---
> v2:
>   - Remove conflicting dummy in Lantiq clock code (reported by 0day).
> ---
>  arch/mips/lantiq/clk.c | 5 -----
>  include/linux/clk.h    | 4 ++++
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/mips/lantiq/clk.c b/arch/mips/lantiq/clk.c
> index 149f0513c4f5d0d4..a263d1b751ffe48d 100644
> --- a/arch/mips/lantiq/clk.c
> +++ b/arch/mips/lantiq/clk.c
> @@ -160,11 +160,6 @@ void clk_deactivate(struct clk *clk)
>  }
>  EXPORT_SYMBOL(clk_deactivate);
> 
> -struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
> -{
> -	return NULL;
> -}
> -
>  static inline u32 get_counter_resolution(void)
>  {
>  	u32 res;
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index e9d36b3e49de5b1b..3ed97abb5cbb7f94 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -539,6 +539,10 @@ static inline struct clk *of_clk_get_by_name(struct
> device_node *np,
>  {
>  	return ERR_PTR(-ENOENT);
>  }
> +static inline struct clk *of_clk_get_from_provider(struct of_phandle_args
> *clkspec)
> +{
> +	return ERR_PTR(-ENOENT);
> +}
>  #endif
> 
>  #endif
> --
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
