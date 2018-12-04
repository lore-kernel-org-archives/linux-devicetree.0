From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v2 11/34] dt-bindings: arm: Convert Alpine board/soc
 bindings to json-schema
Date: Tue, 4 Dec 2018 08:53:02 +0100
Message-ID: <20181204075302.GC3173@kwain>
References: <20181203213223.16986-1-robh@kernel.org>
 <20181203213223.16986-12-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181203213223.16986-12-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Mon, Dec 03, 2018 at 03:32:00PM -0600, Rob Herring wrote:
> diff --git a/Documentation/devicetree/bindings/arm/al,alpine.yaml b/Documentation/devicetree/bindings/arm/al,alpine.yaml
> new file mode 100644
> index 000000000000..82e2fafdfece
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/al,alpine.yaml
> @@ -0,0 +1,21 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/al,alpine.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Annapurna Labs Alpine Platform Device Tree Bindings
> +
> +maintainers:
> +  - Tsahee Zidenberg <tsahee@annapurnalabs.com>

Could you add '- Antoine Tenart <antoine.tenart@bootlin.com>' here?

Thanks!
Antoine

> +description: test
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: al,alpine
> +  model:
> +    items:
> +      - const: "Annapurna Labs Alpine Dev Board"
> +
> +...
> -- 
> 2.19.1
> 

-- 
Antoine Ténart, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
