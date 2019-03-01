From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/2] clk: meson-g12a: add cpu clock bindings
Date: Fri, 1 Mar 2019 16:26:00 +0100
Message-ID: <CAFBinCCtmykL-ccWd9cporEOmxeUKC-RgrP3wfuSuYoAEjrGWA@mail.gmail.com>
References: <20190301102140.7181-1-narmstrong@baylibre.com> <20190301102140.7181-2-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190301102140.7181-2-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: jbrunet@baylibre.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Neil,

On Fri, Mar 1, 2019 at 11:22 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add Amlogic G12A Family CPU clocks bindings, only export CPU_CLK since
> it should be the only ID used.
is this also true for the CPU post-dividers (APB, ATB, AXI, CPU CLK TRACE)?

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/g12a.h              | 24 +++++++++++++++++++++++-
>  include/dt-bindings/clock/g12a-clkc.h |  1 +
>  2 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
> index f399dfe1401c..4854750df902 100644
> --- a/drivers/clk/meson/g12a.h
> +++ b/drivers/clk/meson/g12a.h
> @@ -166,8 +166,30 @@
>  #define CLKID_MALI_0_DIV                       170
>  #define CLKID_MALI_1_DIV                       173
>  #define CLKID_MPLL_5OM_DIV                     176
> +#define CLKID_PCIE_PLL_DCO                     178
> +#define CLKID_PCIE_PLL_DCO_DIV2                        179
> +#define CLKID_PCIE_PLL_OD                      180
how are these PCIe clock related to the CPU clocks?

> +#define CLKID_SYS_PLL_DIV16_EN                 181
> +#define CLKID_SYS_PLL_DIV16                    182
> +#define CLKID_CPU_CLK_DYN0_SEL                 183
> +#define CLKID_CPU_CLK_DYN0_DIV                 184
> +#define CLKID_CPU_CLK_DYN0                     185
> +#define CLKID_CPU_CLK_DYN1_SEL                 186
> +#define CLKID_CPU_CLK_DYN1_DIV                 187
> +#define CLKID_CPU_CLK_DYN1                     188
> +#define CLKID_CPU_CLK_DYN                      189
> +#define CLKID_CPU_CLK_DIV16_EN                 191
> +#define CLKID_CPU_CLK_DIV16                    192
> +#define CLKID_CPU_CLK_APB_DIV                  193
> +#define CLKID_CPU_CLK_APB                      194
> +#define CLKID_CPU_CLK_ATB_DIV                  195
> +#define CLKID_CPU_CLK_ATB                      196
> +#define CLKID_CPU_CLK_AXI_DIV                  197
> +#define CLKID_CPU_CLK_AXI                      198
> +#define CLKID_CPU_CLK_TRACE_DIV                        299
> +#define CLKID_CPU_CLK_TRACE                    200
>
> -#define NR_CLKS                                        178
> +#define NR_CLKS                                        201
shouldn't all changes to this file (drivers/clk/meson/g12a.h) be part
of the patch which adds the actual clocks so the dt-bindings patch is
independent of the clock driver patches?
in this case the subject should also be updated to "dt-bindings:
clock: g12a: ..."


Regards
Martin
