From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] clk: renesas: cpg-mssr: Add R8A77995 support
Date: Mon, 24 Jul 2017 15:09:15 -0500
Message-ID: <20170724200915.ylyvovphokrqn4e2@rob-hp-laptop>
References: <1500554409-22423-1-git-send-email-geert+renesas@glider.be>
 <1500554409-22423-5-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1500554409-22423-5-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 20, 2017 at 02:40:09PM +0200, Geert Uytterhoeven wrote:
> Add R-Car D3 (R8A77995) Clock Pulse Generator / Module Standby and
> Software Reset support, using the CPG/MSSR driver core and the common
> R-Car Gen3 CPG code.
> 
> Based on the R-Car Series, 3rd Generation Hardware User's Manual, Rev.
> 0.55, Jun. 30, 2017.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
> Notes:
>   - I couldn't verify the parent clocks of all module clocks.
>     For e.g. SYS-DMAC and some multimedia devices, I looked at how
>     related clocks were changed among R-Car H3, M3-W, and D3.
>   - For now, R clock handling is hardwired to internal RCLK.
> ---
>  .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   3 +-

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/clk/renesas/Kconfig                        |   5 +
>  drivers/clk/renesas/Makefile                       |   1 +
>  drivers/clk/renesas/r8a77995-cpg-mssr.c            | 236 +++++++++++++++++++++
>  drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
>  drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
>  6 files changed, 251 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/renesas/r8a77995-cpg-mssr.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
