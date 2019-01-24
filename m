Return-Path: <SRS0=UhH9=QA=verge.net.au=horms@kernel.org>
Date: Thu, 24 Jan 2019 11:03:03 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] dt-bindings: arm: renesas: Document RZ/A2M EVB
Message-ID: <20190124100302.kycgfbu4pgdo74ge@verge.net.au>
References: <20190123143012.119912-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190123143012.119912-1-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Jan 23, 2019 at 09:30:12AM -0500, Chris Brandt wrote:
> Add the RZ/A2M Evaluation board.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * 'enum' is supposed to go under 'items'

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> index 5e9d4864a600..f2ef83d473d6 100644
> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -30,6 +30,8 @@ properties:
>  
>        - description: RZ/A2 (R7S9210)
>          items:
> +          - enum:
> +              - renesas,rza2mevb # RZ/A2M Eval Board (RTK7921053S00000BE)
>            - const: renesas,r7s9210
>  
>        - description: SH-Mobile AG5 (R8A73A00/SH73A0)
> -- 
> 2.16.1
> 
