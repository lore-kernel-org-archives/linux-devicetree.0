From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] pinctrl: sunxi: Add support for interrupt
 debouncing
Date: Mon, 14 Nov 2016 11:19:32 -0600
Message-ID: <20161114171932.qvs2xiklh4h3vsss@rob-hp-laptop>
References: <cover.61acad25a6fb233e39141b52acd217415281bd73.1478636546.git-series.maxime.ripard@free-electrons.com>
 <7dbb47b16d83b843705aa05d4a5f1f7dfdc4e9a3.1478636546.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7dbb47b16d83b843705aa05d4a5f1f7dfdc4e9a3.1478636546.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 08, 2016 at 09:24:00PM +0100, Maxime Ripard wrote:
> The pin controller found in the Allwinner SoCs has support for interrupts
> debouncing.
> 
> However, this is not done per-pin, preventing us from using the generic
> pinconf binding for that, but per irq bank, which, depending on the SoC,
> ranges from one to five.
> 
> Introduce a device-wide property to deal with this using a microsecond
> resolution. We can re-use the per-pin input-debounce property for that, so
> let's do it!
> 
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt | 14 ++++++++++++-

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/pinctrl/sunxi/pinctrl-sunxi.c                                 | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h                                 |  7 ++++++-
>  3 files changed, 102 insertions(+), 0 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
