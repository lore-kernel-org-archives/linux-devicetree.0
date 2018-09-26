Return-Path: <SRS0=Al83=MI=verge.net.au=horms@kernel.org>
Date: Wed, 26 Sep 2018 10:57:43 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] dt-bindings: thermal: rcar: Add device tree support for
 r8a7744
Message-ID: <20180926085743.7xpvdqfx7gnjcf3u@verge.net.au>
References: <1537894864-61987-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1537894864-61987-1-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
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

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
