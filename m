From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 02/11] soc: renesas: rcar-sysc: add R8A7745 support
Date: Mon, 14 Nov 2016 09:54:36 -0600
Message-ID: <20161114155435.ak5mmtlozd7zkko2@rob-hp-laptop>
References: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
 <1834171.PEVAvqbuLx@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1834171.PEVAvqbuLx@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 05, 2016 at 12:46:13AM +0300, Sergei Shtylyov wrote:
> Add support for RZ/G1E (R8A7745) SoC power areas to the R-Car SYSC driver.
> 
> Based on the original (and large) patch by Dmitry Shifrin
> <dmitry.shifrin@cogentembedded.com>.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> ---
> Changes in version 2:
> - added Geert's tag.
> 
>  Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt |    1 

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/soc/renesas/Makefile                                  |    1 
>  drivers/soc/renesas/r8a7745-sysc.c                            |   32 ++++++++++
>  drivers/soc/renesas/rcar-sysc.c                               |    3 
>  drivers/soc/renesas/rcar-sysc.h                               |    1 
>  5 files changed, 38 insertions(+)
