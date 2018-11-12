Return-Path: <robherring2@gmail.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: thermal: rcar-gen3-thermal: All variants
 use 3 interrupts
Message-ID: <20181112185258.GA24868@bogus>
References: <20181107133500.12865-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181107133500.12865-1-geert+renesas@glider.be>
Date: Mon, 12 Nov 2018 12:53:01 -0600
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Nov 07, 2018 at 02:35:00PM +0100, Geert Uytterhoeven wrote:
> RZ/G2M also has 3 interrupts routed to the TSC, but the list was not
> updated to reflect this.
> 
> Just drop the list, as this is the case for this TSC variant in all
> R-Car Gen3 and RZ/G2 SoCs.
> 
> Fixes: be6af481f3b2d508 ("dt-bindings: thermal: rcar-gen3-thermal: Add r8a774a1 support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/thermal/rcar-gen3-thermal.txt          | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
