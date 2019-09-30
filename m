From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC 2/2] dt-bindings: power: Convert Samsung Exynos Power
 Domain bindings to json-schema
Date: Mon, 30 Sep 2019 09:06:00 -0500
Message-ID: <20190930140600.GA18975@bogus>
References: <20190908152813.20646-1-krzk@kernel.org>
 <20190908152813.20646-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190908152813.20646-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 08, 2019 at 05:28:13PM +0200, Krzysztof Kozlowski wrote:
> Convert Samsung Exynos Soc Power Domain bindings to DT schema format using
> json-schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/power/pd-samsung.txt  | 45 ------------
>  .../devicetree/bindings/power/pd-samsung.yaml | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/power/pd-samsung.txt
>  create mode 100644 Documentation/devicetree/bindings/power/pd-samsung.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/pd-samsung.txt b/Documentation/devicetree/bindings/power/pd-samsung.txt
> deleted file mode 100644
> index 92ef355e8f64..000000000000
> --- a/Documentation/devicetree/bindings/power/pd-samsung.txt
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -* Samsung Exynos Power Domains
> -
> -Exynos processors include support for multiple power domains which are used
> -to gate power to one or more peripherals on the processor.
> -
> -Required Properties:
> -- compatible: should be one of the following.
> -    * samsung,exynos4210-pd - for exynos4210 type power domain.
> -    * samsung,exynos5433-pd - for exynos5433 type power domain.
> -- reg: physical base address of the controller and length of memory mapped
> -    region.
> -- #power-domain-cells: number of cells in power domain specifier;
> -    must be 0.
> -
> -Optional Properties:
> -- label: Human readable string with domain name. Will be visible in userspace
> -	to let user to distinguish between multiple domains in SoC.
> -- power-domains: phandle pointing to the parent power domain, for more details
> -		 see Documentation/devicetree/bindings/power/power_domain.txt
> -
> -Deprecated Properties:
> -- clocks
> -- clock-names
> -
> -Node of a device using power domains must have a power-domains property
> -defined with a phandle to respective power domain.
> -
> -Example:
> -
> -	lcd0: power-domain-lcd0 {
> -		compatible = "samsung,exynos4210-pd";
> -		reg = <0x10023C00 0x10>;
> -		#power-domain-cells = <0>;
> -		label = "LCD0";
> -	};
> -
> -	mfc_pd: power-domain@10044060 {
> -		compatible = "samsung,exynos4210-pd";
> -		reg = <0x10044060 0x20>;
> -		#power-domain-cells = <0>;
> -		label = "MFC";
> -	};
> -
> -See Documentation/devicetree/bindings/power/power_domain.txt for description
> -of consumer-side bindings.
> diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Documentation/devicetree/bindings/power/pd-samsung.yaml
> new file mode 100644
> index 000000000000..0fc012734a79
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/pd-samsung.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos SoC Power Domains
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +
> +description: |+
> +  Exynos processors include support for multiple power domains which are used
> +  to gate power to one or more peripherals on the processor.
> +
> +allOf:
> +  - $ref: power-domain.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynos4210-pd
> +      - samsung,exynos5433-pd
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    deprecated: true
> +    maxItems: 1
> +
> +  clock-names:
> +    deprecated: true
> +    maxItems: 1
> +
> +  label:
> +    $ref: /schemas/types.yaml#/definitions/string

label already has a type.

Is there a defined set of values?

> +    description:
> +      Human readable string with domain name. Will be visible in userspace
> +      to let user to distinguish between multiple domains in SoC.
> +
> +  "#power-domain-cells":
> +    const: 0
> +
> +  power-domains:
> +    $ref: /schemas/types.yaml#/definitions/phandle

Already has a type.

maxItems: 1

> +    description:
> +      Phandle pointing to the parent power domain, for more details
> +      see power-domain-consumers.yaml.

Unless there's something specific about this device to say, drop this.

> +
> +required:
> +  - compatible
> +  - "#power-domain-cells"
> +  - reg
> +
> +examples:
> +  - |
> +    lcd0: power-domain-lcd0 {
> +      compatible = "samsung,exynos4210-pd";
> +      reg = <0x10023C00 0x10>;
> +      #power-domain-cells = <0>;
> +      label = "LCD0";
> +    };
> +
> +    mfc_pd: power-domain@10044060 {
> +      compatible = "samsung,exynos4210-pd";
> +      reg = <0x10044060 0x20>;
> +      #power-domain-cells = <0>;
> +      label = "MFC";
> +    };
> -- 
> 2.17.1
> 
