MIME-Version: 1.0
Date: Wed, 23 Jan 2019 07:59:26 -0600
References: <20190123134833.119031-1-chris.brandt@renesas.com>
In-Reply-To: <20190123134833.119031-1-chris.brandt@renesas.com>
Message-ID: <CAL_JsqKuDzL2N_fihJzUEZ9uRK5HWd1ARD7DzZZM7Dy4C8M_BA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: renesas: Document RZ/A2M EVB
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jan 23, 2019 at 7:48 AM Chris Brandt <chris.brandt@renesas.com> wrote:
>
> Add the RZ/A2M Evaluation board.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> index 5e9d4864a600..474eb2647829 100644
> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -29,6 +29,8 @@ properties:
>            - const: renesas,r7s72100
>
>        - description: RZ/A2 (R7S9210)
> +          - enum:
> +              - renesas,rza2mevb # RZ/A2M Eval Board (RTK7921053S00000BE)

Please check your changes with 'dt_binding_check' target. This will
fail. 'description' already has a value, so you can't add a list to
it. And description has to be a string.

>          items:

Move the 2 lines here.

>            - const: renesas,r7s9210
>
> --
> 2.16.1
>
