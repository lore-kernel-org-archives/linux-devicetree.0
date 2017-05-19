From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] dt-bindings: rcar-dmac: Document missing error interrupt
Date: Fri, 19 May 2017 11:05:02 +0200
Message-ID: <20170519090502.GA26864@bigcity.dyn.berto.se>
References: <1495178867-817-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1495178867-817-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Vinod Koul <vinod.koul@intel.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Geert,

On 2017-05-19 09:27:47 +0200, Geert Uytterhoeven wrote:
> The documentation for the "interrupt-names" property only mentions the
> per-channel interrupts, while the error interrupt has always been
> mandatory, too.
> 
> Fixes: 10f5c8438475909a ("dmaengine: rcar-dmac: Add device tree bindings
> documentation")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> index 3316a9c2e638b98c..79a204d50234f287 100644
> --- a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> +++ b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> @@ -30,8 +30,9 @@ Required Properties:
>  
>  - interrupts: interrupt specifiers for the DMAC, one for each entry in
>    interrupt-names.
> -- interrupt-names: one entry per channel, named "ch%u", where %u is the
> -  channel number ranging from zero to the number of channels minus one.
> +- interrupt-names: one entry for the error interrupt, named "error", plus one
> +  entry per channel, named "ch%u", where %u is the channel number ranging from
> +  zero to the number of channels minus one.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

>  
>  - clock-names: "fck" for the functional clock
>  - clocks: a list of phandle + clock-specifier pairs, one for each entry
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
