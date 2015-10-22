From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/6] clk: sunxi: Add H3 clocks support
Date: Thu, 22 Oct 2015 11:15:39 +1100
Message-ID: <CAGRGNgWyNEOMVxeDFTAp_wJoaXL471spFjBTn+2s7YuKeJf71g@mail.gmail.com>
References: <1445444007-4260-1-git-send-email-jenskuske@gmail.com> <1445444007-4260-3-git-send-email-jenskuske@gmail.com>
Reply-To: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDQIP76OUQLBBP6VUCYQKGQENJ6US7A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1445444007-4260-3-git-send-email-jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jens,

On Thu, Oct 22, 2015 at 3:13 AM, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The H3 clock control unit is similar to the those of other sun8i family
> members like the A23.
>
> It adds a new bus gates clock similar to the simple gates, but with a
> different parent clock for each single gate.
> Some of the gates use the new AHB2 clock as parent, whose clock source
> is muxable between AHB1 and PLL6/2. The documentation isn't totally clear
> about which devices belong to AHB2 now, especially USB EHIC/OHIC, so it
> is mostly based on Allwinner kernel source code.
>
> Signed-off-by: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |   2 +
>  drivers/clk/sunxi/Makefile                        |   1 +
>  drivers/clk/sunxi/clk-bus-gates.c                 | 105 ++++++++++++++++++++++
>  drivers/clk/sunxi/clk-sunxi.c                     |  12 ++-
>  4 files changed, 117 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/clk/sunxi/clk-bus-gates.c
>
> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
> index 7c4aee0..6293c65 100644
> --- a/drivers/clk/sunxi/clk-sunxi.c
> +++ b/drivers/clk/sunxi/clk-sunxi.c

This hunk should be in patch 1:

> @@ -1000,9 +1005,8 @@ static void __init sunxi_divs_clk_setup(struct device_node *node,
>
>                 for (i = 0; i < SUNXI_DIVS_BASE_NAME_MAX_LEN - 1 &&
>                                                 clk_name[i] != '_' &&
> -                                               clk_name[i] != '\0'; i++) {
> +                                               clk_name[i] != '\0'; i++)
>                         base_name[i] = clk_name[i];
> -               }
>
>                 base_name[i] = '\0';
>                 factors.name = base_name;

Thanks,

-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/
