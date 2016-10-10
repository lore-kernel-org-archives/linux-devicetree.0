From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] clk: renesas: cpg-mssr: add R8A7743 support
Date: Mon, 10 Oct 2016 16:37:43 -0500
Message-ID: <20161010213743.GA12919@rob-hp-laptop>
References: <9246696.7P1aOyyQt4@wasted.cogentembedded.com>
 <2357731.SxJodxn1PJ@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2357731.SxJodxn1PJ-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 07, 2016 at 11:47:49PM +0300, Sergei Shtylyov wrote:
> Add RZ/G1M (R8A7743) Clock  Pulse Generator / Module Standby and Software
> Reset support, using the CPG/MSSR driver core and the common R-Car Gen2
> (and RZ/G) code.
> 
> Based on the proof-of-concept R8A7791 CPG/MSSR patch by Geert Uytterhoeven
> <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> 
> ---
> Changes in version 2:
> - documented the R8A7743 device tree binding;
> - fixed whitespace errors/warnings reported by checkpatch.pl;
> - used  tabs instead of spaces for indentation;
> - fixed the PLL3 column name in the PLL table.
> 
>  Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt |    4 

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/clk/renesas/Kconfig                                  |    1 
>  drivers/clk/renesas/Makefile                                 |    1 
>  drivers/clk/renesas/r8a7743-cpg-mssr.c                       |  268 +++++++++++
>  drivers/clk/renesas/renesas-cpg-mssr.c                       |    6 
>  drivers/clk/renesas/renesas-cpg-mssr.h                       |    1 
>  6 files changed, 280 insertions(+), 1 deletion(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
