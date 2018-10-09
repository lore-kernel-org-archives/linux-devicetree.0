From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH 13/36] dt-bindings: arm: Convert PMU binding to
 json-schema
Date: Tue, 9 Oct 2018 12:57:13 +0100
Message-ID: <20181009115713.GE6248@arm.com>
References: <20181005165848.3474-1-robh@kernel.org>
 <20181005165848.3474-14-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181005165848.3474-14-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <glikely@secretlab.ca>, Kumar Gala <kumar.gala@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Tom Rini <trini@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Jonathan Cameron <jic23@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Fri, Oct 05, 2018 at 11:58:25AM -0500, Rob Herring wrote:
> Convert ARM PMU binding to DT schema format using json-schema.
> 
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/pmu.txt | 70 --------------
>  .../devicetree/bindings/arm/pmu.yaml          | 96 +++++++++++++++++++
>  2 files changed, 96 insertions(+), 70 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/pmu.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/pmu.yaml

[...]

> -- interrupts : 1 combined interrupt or 1 per core. If the interrupt is a per-cpu
> -               interrupt (PPI) then 1 interrupt should be specified.

[...]

> +  interrupts:
> +    oneOf:
> +      - maxItems: 1
> +      - minItems: 2
> +        maxItems: 8
> +        description: 1 interrupt per core.
> +
> +  interrupts-extended:
> +    $ref: '#/properties/interrupts'

This seems like a semantic different between the two representations, or am
I missing something here? Specifically, both the introduction of
interrupts-extended and also dropping any mention of using a single per-cpu
interrupt (the single combined case is no longer support by Linux; not sure
if you want to keep it in the binding).

Will
