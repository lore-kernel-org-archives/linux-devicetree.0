From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx7d: fix LCDIF clock assignment
Date: Mon, 5 Dec 2016 10:01:24 +0800
Message-ID: <20161205020123.GA2066@dragon>
References: <20161123004204.10851-1-stefan@agner.ch>
 <CAOMZO5AqKupmmKb4biGfmy4v3ZwS-BFjPY=MLd8Rc0ZXL+vQvg@mail.gmail.com>
 <7e4829f484f6c4425fc9d01bea1a094f@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7e4829f484f6c4425fc9d01bea1a094f-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Liu Ying <Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd, Olof,

On Sun, Dec 04, 2016 at 05:26:58PM -0800, Stefan Agner wrote:
> Hi Shawn
> 
> On 2016-11-23 15:02, Fabio Estevam wrote:
> > On Tue, Nov 22, 2016 at 10:42 PM, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> wrote:
> >> The eLCDIF IP of the i.MX 7 SoC knows multiple clocks and lists them
> >> separately:
> >>
> >> Clock      Clock Root              Description
> >> apb_clk    MAIN_AXI_CLK_ROOT       AXI clock
> >> pix_clk    LCDIF_PIXEL_CLK_ROOT    Pixel clock
> >> ipg_clk_s  MAIN_AXI_CLK_ROOT       Peripheral access clock
> >>
> >> All of them are switched by a single gate, which is part of the
> >> IMX7D_LCDIF_PIXEL_ROOT_CLK clock. Hence using that clock also for
> >> the AXI bus clock (clock-name "axi") makes sure the gate gets
> >> enabled when accessing registers.
> >>
> >> There seem to be no separate AXI display clock, and the clock is
> >> optional. Hence remove the dummy clock.
> >>
> >> This fixes kernel freezes when starting the X-Server (which
> >> disables/re-enables the display controller).
> >>
> >> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> > 
> > Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> 
> Since this fixes a kernel freeze, is there a chance to get this still in
> 4.9?

Since we get one more week to the final 4.9, is it possible for you to
send this fix for 4.9 inclusion?  Thanks.

For the patch,

Acked-by: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
