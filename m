From: Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 2/6] clk: sunxi-ng: Add sun4i/sun7i CCU driver
Date: Wed, 2 Aug 2017 17:05:04 +1000
Message-ID: <CANwerB2En3q6XkUDwMo1CpCraCzpNi42WQYuAFb3yACT2j1FYw@mail.gmail.com>
References: <cover.ba2aaaa405a7ec685034e34926b8855fd6c9ab86.1500043741.git-series.plaes@plaes.org>
 <f03e50040dc2d3dc3edd6be071510feeb953161d.1500043741.git-series.plaes@plaes.org>
Reply-To: net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCVMZKEXYEFBBIPTQXGAKGQE5WKXSSY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <f03e50040dc2d3dc3edd6be071510feeb953161d.1500043741.git-series.plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Priit,

On 15 July 2017 at 00:49, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org> wrote:
> Introduce a clock controller driver for sun4i A10 and sun7i A20
> series SoCs.
>
> Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
> ---
>  drivers/clk/sunxi-ng/Kconfig              |   13 +-
>  drivers/clk/sunxi-ng/Makefile             |    1 +-
>  drivers/clk/sunxi-ng/ccu-sun4i-a10.c      | 1454 ++++++++++++++++++++++-
>  drivers/clk/sunxi-ng/ccu-sun4i-a10.h      |   61 +-
>  include/dt-bindings/clock/sun4i-a10-ccu.h |  200 +++-
>  include/dt-bindings/clock/sun7i-a20-ccu.h |   53 +-
>  include/dt-bindings/reset/sun4i-a10-ccu.h |   69 +-
>  7 files changed, 1851 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun4i-a10.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun4i-a10.h
>  create mode 100644 include/dt-bindings/clock/sun4i-a10-ccu.h
>  create mode 100644 include/dt-bindings/clock/sun7i-a20-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun4i-a10-ccu.h

<snip>

> diff --git a/drivers/clk/sunxi-ng/ccu-sun4i-a10.c b/drivers/clk/sunxi-ng/ccu-sun4i-a10.c
> new file mode 100644
> index 0000000..09e97d7
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun4i-a10.c

<snip>

> +static void __init sun4i_ccu_init(struct device_node *node,
> +                                 const struct sunxi_ccu_desc *desc)
> +{
> +       void __iomem *reg;
> +       u32 val;
> +
> +       reg = of_io_request_and_map(node, 0, of_node_full_name(node));
> +       if (IS_ERR(reg)) {
> +               pr_err("%s: Could not map the clock registers\n",
> +                      of_node_full_name(node));
> +               return;
> +       }
> +
> +       /* Force the PLL-Audio-1x divider to 4 */
> +       val = readl(reg + SUN4I_PLL_AUDIO_REG);

> +       val &= ~GENMASK(19, 16);
> +       writel(val | (3 << 16), reg + SUN4I_PLL_AUDIO_REG);

This doesn't work for me on A20 (440 Hz tone outputs at 880 Hz tone)
and I need to use the following instead:
       val &= ~GENMASK(29, 26);
       writel(val | (4 << 26), reg + SUN4I_PLL_AUDIO_REG);

Toggling bits 16-19 doesn't seem to have any effect on the audio for me.

Thanks.

Regards,
Jonathan
