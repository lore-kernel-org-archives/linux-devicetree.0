From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 24/34] dt-bindings: arm: Convert Rockchip board/soc
 bindings to json-schema
Date: Tue, 4 Dec 2018 09:04:00 -0600
Message-ID: <CAL_JsqLwSg=CWQYzvfCq9WVexU5donsF6ugib2ONNN3vvjzZXw@mail.gmail.com>
References: <20181203213223.16986-1-robh@kernel.org> <20181203213223.16986-25-robh@kernel.org>
 <3170130.k0DT9deCHj@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3170130.k0DT9deCHj@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: "heiko@sntech.de" <heiko@sntech.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, ARM-SoC Maintainers <arm@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 4, 2018 at 8:16 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Am Montag, 3. Dezember 2018, 22:32:13 CET schrieb Rob Herring:
> > Convert Rockchip SoC bindings to DT schema format using json-schema.
> >
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Heiko Stuebner <heiko@sntech.de>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-rockchip@lists.infradead.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> > diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > new file mode 100644
> > index 000000000000..3d30ec9adcd3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > @@ -0,0 +1,251 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/rockchip.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rockchip platforms device tree bindings
> > +
> > +maintainers:
> > +  - Beniamino Galvani <b.galvani@gmail.com>
>
> # scripts/get_maintainer.pl -f Documentation/devicetree/bindings/arm/rockchip.txt
>
> doesn't list Beniamino at all and he hasn't been active on Rockchip stuff
> for a number of years, so I'm not really sure where this mention as
> maintainer comes from.

git history. get_maintainers.pl had too many cases where I ended up as
the maintainer.

I'll drop him.

> > +  - Heiko Stuebner <heiko@sntech.de>
> > +
> > +properties:
> > +  $nodename:
> > +    const: '/'
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - amarula,vyasa-rk3288
> > +              - asus,rk3288-tinker
> > +              - asus,rk3288-tinker-s
> > +              - radxa,rock2-square
> > +              - chipspark,popmetal-rk3288
> > +              - netxeon,r89
> > +              - firefly,firefly-rk3288
> > +              - firefly,firefly-rk3288-beta
> > +              - firefly,firefly-rk3288-reload
> > +              - mqmaker,miqi
> > +              - rockchip,rk3288-fennec
> > +          - const: rockchip,rk3288
>
> [...]
>
> > +      - items:
> > +          - enum:
> > +              - firefly,firefly-rk3399
> > +              - firefly,roc-rk3399-pc
> > +              - pine64,rockpro64
> > +              - rockchip,rk3399-evb
> > +              - rockchip,rk3399-sapphire
> > +              - rockchip,rk3399-sapphire-excavator
> > +              - tsd,rk3399-q7-haikou
> > +              - vamrs,ficus
> > +              - vamrs,rock960 # 96boards RK3399 Rock960 (ROCK960 Consumer Edition)
> > +          - const: rockchip,rk3399
>
>
> as said before, loosing the description of the boards that get thrown
> into one listing really decreases the usability a lot.

Sorry, I thought I addressed these previous comments.

> Best example is maybe the rk3399 rock960, where the consumer-edition
> board is actually named "ficus" and the description actually brings the
> connection to the product-name.
>
> So here it may increase the machine-readability but definitly descreases
> the human readability of the file itself.
>
> I guess just using the format that all the Google-boards got for all boards
> would just be easiest, so for example the rock960 also would just become:
>
>       - description: 96boards RK3399 Ficus (ROCK960 Enterprise Edition)
>         items:
>           - const: vamrs,ficus
>           - const: rockchip,rk3399
>
>       - description: 96boards RK3399 Ficus (ROCK960 Consumer Edition)
>         items:
>           - const: vamrs,rock960
>           - const: rockchip,rk3399

Sure, you can do this if you like. I prefer the other way as it is a
one line change to add a board. The SoC maintainers can pick whatever
they like. You could split into a file per SoC too if you wanted.

> Looking at other socs, this is likely similar there. Like on Mediatek
> all the MT67xx eval boards loose the mapping to the
> socs marketing name "Helio Foobar" when the description is gone,
> which could've been helpful for people reading the binding.

Generally when we had just 'hello,foobar' with 'Hello Foobar' I
dropped the comment as I didn't think it added much.

Rob
