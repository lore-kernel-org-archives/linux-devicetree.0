Return-Path: <robherring2@gmail.com>
Date: Mon, 15 Oct 2018 11:54:30 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: thermal: rcar: Add device tree support for
 r8a7744
Message-ID: <20181015165430.GA12574@bogus>
References: <1537894864-61987-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1537894864-61987-1-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Sep 25, 2018 at 06:01:04PM +0100, Biju Das wrote:
> Add thermal sensor support for r8a7744 SoC. The Renesas RZ/G1N
> (r8a7744) thermal sensor module is identical to the R-Car Gen2 family.
> 
> No driver change is needed due to the fallback compatible value
> "renesas,rcar-gen2-thermal".
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> ---
>  Documentation/devicetree/bindings/thermal/rcar-thermal.txt | 1 +
>  1 file changed, 1 insertion(+)

Applied.

Rob
