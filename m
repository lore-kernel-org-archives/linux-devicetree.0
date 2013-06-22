From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 0/5] clk: dt: bindings for mux, divider & gate clocks
Date: Sat, 22 Jun 2013 19:04:41 +0200
Message-ID: <201306221904.41833.heiko@sntech.de>
References: <1371795256-16703-1-git-send-email-mturquette@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371795256-16703-1-git-send-email-mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 21. Juni 2013, 08:14:11 schrieb Mike Turquette:
> This series introduces binding definitions for common register-mapped
> clock multiplexer, divider and gate IP blocks along with the
> corresponding setup functions for matching DT data.  The bindings are
> similar to the struct definitions but please don't hold that against the
> binding: the struct definitions closely model the hardware register
> layout.
> 
> This version fixes bugs and incorporates support for the hiword-mask
> property needed on Hisilicon and Rockchip platforms.
> 
> Tested on OMAP4460 Panda ES.

Now it works like a charm :-), so on a rk3066a based board

Tested-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>


> Mike Turquette (5):
>   clk: divider: replace bitfield width with mask
>   clk: of: helper for determining number of parent clocks
>   clk: dt: binding for basic multiplexer clock
>   clk: dt: binding for basic divider clock
>   clk: dt: binding for basic gate clock
> 
>  .../devicetree/bindings/clock/divider-clock.txt    |  90 +++++++++++++++
>  .../devicetree/bindings/clock/gate-clock.txt       |  36 ++++++
>  .../devicetree/bindings/clock/mux-clock.txt        |  79 +++++++++++++
>  arch/arm/mach-imx/clk-busy.c                       |   2 +-
>  drivers/clk/clk-divider.c                          | 127
> ++++++++++++++++++--- drivers/clk/clk-gate.c                             |
>  43 +++++++
>  drivers/clk/clk-mux.c                              |  65 ++++++++++-
>  drivers/clk/clk.c                                  |   6 +
>  drivers/clk/mxs/clk-div.c                          |   2 +-
>  include/linux/clk-private.h                        |   2 +-
>  include/linux/clk-provider.h                       |  12 +-
>  11 files changed, 441 insertions(+), 23 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/clock/divider-clock.txt create mode
> 100644 Documentation/devicetree/bindings/clock/gate-clock.txt create mode
> 100644 Documentation/devicetree/bindings/clock/mux-clock.txt
