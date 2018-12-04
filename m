From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 24/34] dt-bindings: arm: Convert Rockchip board/soc bindings to json-schema
Date: Tue, 04 Dec 2018 15:16:27 +0100
Message-ID: <3170130.k0DT9deCHj@phil>
References: <20181203213223.16986-1-robh@kernel.org> <20181203213223.16986-25-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203213223.16986-25-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Montag, 3. Dezember 2018, 22:32:13 CET schrieb Rob Herring:
> Convert Rockchip SoC bindings to DT schema format using json-schema.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>

> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> new file mode 100644
> index 000000000000..3d30ec9adcd3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -0,0 +1,251 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/rockchip.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip platforms device tree bindings
> +
> +maintainers:
> +  - Beniamino Galvani <b.galvani@gmail.com>

# scripts/get_maintainer.pl -f Documentation/devicetree/bindings/arm/rockchip.txt

doesn't list Beniamino at all and he hasn't been active on Rockchip stuff
for a number of years, so I'm not really sure where this mention as
maintainer comes from.


> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - amarula,vyasa-rk3288
> +              - asus,rk3288-tinker
> +              - asus,rk3288-tinker-s
> +              - radxa,rock2-square
> +              - chipspark,popmetal-rk3288
> +              - netxeon,r89
> +              - firefly,firefly-rk3288
> +              - firefly,firefly-rk3288-beta
> +              - firefly,firefly-rk3288-reload
> +              - mqmaker,miqi
> +              - rockchip,rk3288-fennec
> +          - const: rockchip,rk3288

[...]

> +      - items:
> +          - enum:
> +              - firefly,firefly-rk3399
> +              - firefly,roc-rk3399-pc
> +              - pine64,rockpro64
> +              - rockchip,rk3399-evb
> +              - rockchip,rk3399-sapphire
> +              - rockchip,rk3399-sapphire-excavator
> +              - tsd,rk3399-q7-haikou
> +              - vamrs,ficus
> +              - vamrs,rock960 # 96boards RK3399 Rock960 (ROCK960 Consumer Edition)
> +          - const: rockchip,rk3399


as said before, loosing the description of the boards that get thrown 
into one listing really decreases the usability a lot.

Best example is maybe the rk3399 rock960, where the consumer-edition
board is actually named "ficus" and the description actually brings the
connection to the product-name.

So here it may increase the machine-readability but definitly descreases
the human readability of the file itself.

I guess just using the format that all the Google-boards got for all boards
would just be easiest, so for example the rock960 also would just become:

      - description: 96boards RK3399 Ficus (ROCK960 Enterprise Edition)
        items:
          - const: vamrs,ficus
          - const: rockchip,rk3399

      - description: 96boards RK3399 Ficus (ROCK960 Consumer Edition)
        items:
          - const: vamrs,rock960
          - const: rockchip,rk3399


Looking at other socs, this is likely similar there. Like on Mediatek
all the MT67xx eval boards loose the mapping to the
socs marketing name "Helio Foobar" when the description is gone,
which could've been helpful for people reading the binding.


Heiko


> +      - description: Google Bob (Asus Chromebook Flip C101PA)
> +        items:
> +          - const: google,bob-rev13
> +          - const: google,bob-rev12
> +          - const: google,bob-rev11
> +          - const: google,bob-rev10
> +          - const: google,bob-rev9
> +          - const: google,bob-rev8
> +          - const: google,bob-rev7
> +          - const: google,bob-rev6
> +          - const: google,bob-rev5
> +          - const: google,bob-rev4
> +          - const: google,bob
> +          - const: google,gru
> +          - const: rockchip,rk3399
