From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] regulator: dt-bindings: Fix building error for dt_binding_check
Date: Wed, 18 Sep 2019 09:27:53 -0500
Message-ID: <CAL_JsqJwsLkQGjjoS_RvBXjSq4irrVPEpwrwTv7wL732YHM4dg@mail.gmail.com>
References: <1568815340-30401-1-git-send-email-pragnesh.patel@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568815340-30401-1-git-send-email-pragnesh.patel@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pragnesh Patel <pragnesh.patel@sifive.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 18, 2019 at 9:02 AM Pragnesh Patel
<pragnesh.patel@sifive.com> wrote:
>

The subject could be more specific rather than being one that applies
to any dt_binding_check breakage in regulators.

> Compatible property is not of type 'string' so replace enum
> with items.
>
> Signed-off-by: Pragnesh Patel <pragnesh.patel@sifive.com>
> ---
>  Documentation/devicetree/bindings/regulator/fixed-regulator.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
> index a78150c..8d4a7b2 100644
> --- a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
> @@ -29,7 +29,7 @@ if:
>
>  properties:
>    compatible:
> -    enum:
> +    items:
>        - const: regulator-fixed
>        - const: regulator-fixed-clock

This means you expect: compatible = "regulator-fixed", "regulator-fixed-clock";

Did you actually run 'dt_binding_check' because it should fail on the example?

I gave you exact change to make. Just remove 'const: ' on each entry.

Rob
