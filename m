Return-Path: <SRS0=+CEJ=NT=verge.net.au=horms@kernel.org>
Date: Thu, 8 Nov 2018 11:36:30 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] dt-bindings: thermal: rcar-gen3-thermal: All variants
 use 3 interrupts
Message-ID: <20181108103629.scczdgn3rw2jtxvk@verge.net.au>
References: <20181107133500.12865-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181107133500.12865-1-geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
