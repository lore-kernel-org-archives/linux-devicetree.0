From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 01/11] clk: sunxi-ng: sun8i-a23: Enable PLL-MIPI LDOs when
 ungating it
Date: Mon, 28 Jan 2019 14:41:25 +0530
Message-ID: <CAMty3ZAB99yMQj33XkBV-EXDN7RkapbOTaO0chYwaz=aFYto=w@mail.gmail.com>
References: <20190125032314.20915-1-wens@csie.org> <20190125032314.20915-2-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125032314.20915-2-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 25, 2019 at 8:54 AM Chen-Yu Tsai <wens@csie.org> wrote:
>
> The PLL-MIPI clock is somewhat special as it has its own LDOs which
> need to be turned on for this PLL to actually work and output a clock
> signal.
>
> Add the 2 LDO enable bits to the gate bits.
>
> Fixes: 5690879d93e8 ("clk: sunxi-ng: Add A23 CCU")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-a23.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a23.c b/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
> index a4fa2945f230..4b5f8f4e4ab8 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
> @@ -144,7 +144,7 @@ static SUNXI_CCU_NKM_WITH_GATE_LOCK(pll_mipi_clk, "pll-mipi",
>                                     8, 4,               /* N */
>                                     4, 2,               /* K */
>                                     0, 4,               /* M */
> -                                   BIT(31),            /* gate */
> +                                   BIT(31) | BIT(23) | BIT(22), /* gate */

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
