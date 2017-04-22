From: Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/6] clk: sunxi-ng: Add sun4i/sun7i CCU driver
Date: Sun, 23 Apr 2017 00:46:24 +1000
Message-ID: <CANwerB3CySDKDF0Q5g4h5yaKBEF2S_rmp8ikR2HgGyf+RXzgAQ@mail.gmail.com>
References: <cover.a58841efb571d44013658505f3fa140536a89d1c.1490545262.git-series.plaes@plaes.org>
 <ac8c4dab4f160ec605d52120517774bf1de87c2e.1490545262.git-series.plaes@plaes.org>
Reply-To: net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCVMZKEXYEFBBQOZ5XDQKGQESEHJWGQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <ac8c4dab4f160ec605d52120517774bf1de87c2e.1490545262.git-series.plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Priit,

On 27 March 2017 at 04:20, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org> wrote:
> +static struct ccu_nkmp pll_ve_clk = {
> +       .enable         = BIT(31),
> +       .n              = _SUNXI_CCU_MULT_OFFSET(8, 5, 0),
> +       .k              = _SUNXI_CCU_MULT(4, 2),
> +       .m              = _SUNXI_CCU_DIV(0, 2),
> +       .p              = _SUNXI_CCU_DIV(16, 2),
> +       .common         = {
> +               .reg            = 0x018,
> +               .hw.init        = CLK_HW_INIT("pll-ve",
> +                                             "hosc",
> +                                             &ccu_nkmp_ops,
> +                                             0),
> +       },
> +};

pll-ve is a NKMP clock in A10 but a NK clock in A20.

> +static const char *const hdmi_parents[] = { "pll-video0", "pll-video0-2x",
> +                                           "pll-vide01", "pll-video1-2x" };

"pll-vide01" should be "pll-video1".

Regards,
Jonathan
