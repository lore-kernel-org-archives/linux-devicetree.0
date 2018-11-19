Return-Path: <SRS0=d78s=N6=verge.net.au=horms@kernel.org>
Date: Mon, 19 Nov 2018 11:42:44 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] dt-bindings: can: rcar_can: document r8a77990 support
Message-ID: <20181119104243.csnkooxolkple2ln@verge.net.au>
References: <20181118173056.4591-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181118173056.4591-1-marek.vasut+renesas@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sun, Nov 18, 2018 at 06:30:56PM +0100, Marek Vasut wrote:
> Document the support for rcar_can on R8A77990 SoC devices.
> Add R8A77990 to the list of SoCs which require the "assigned-clocks"
> and "assigned-clock-rates" properties.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Eugeniu Rosca <erosca@de.adit-jv.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/net/can/rcar_can.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
