From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: nomadik: implement the Nomadik clocks properly
Date: Wed, 19 Jun 2013 23:38:01 -0700
Message-ID: <20130620063801.9136.80841@quantum>
References: <1370775348-7440-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1370775348-7440-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Linus Walleij (2013-06-09 03:55:47)
> +static void pll_clk_disable(struct clk_hw *hw)
> +{
> +       struct clk_pll *pll = to_pll(hw);
> +       u32 val;
> +
> +       return;

Is the early return intentional? Everything else looks good.

Acked-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> +
> +       spin_lock(&src_lock);
> +       val = readl(src_base + SRC_PLLCR);
> +       if (pll->id == 1) {
> +               if (val & SRC_PLLCR_PLL1OVER) {
> +                       val &= ~SRC_PLLCR_PLL1EN;
> +                       writel(val, src_base + SRC_PLLCR);
> +               }
> +       } else if (pll->id == 2) {
> +               val &= ~SRC_PLLCR_PLL2EN;
> +               writel(val, src_base + SRC_PLLCR);
> +       }
> +       spin_unlock(&src_lock);
> +}
