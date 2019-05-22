MIME-Version: 1.0
Date: Wed, 22 May 2019 08:15:27 -0500
References: <20190521143518.32416-1-miquel.raynal@bootlin.com>
In-Reply-To: <20190521143518.32416-1-miquel.raynal@bootlin.com>
Message-ID: <CAL_JsqJ=gFK604Wbd0D4NN__L4ZfKDO7+j8OGh_buq06oA6deQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: phy: mvebu-comphy: Update references to
 CP110 nodes
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Grzegorz Jaszczyk <jaz@semihalf.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, May 21, 2019 at 9:35 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> From: Grzegorz Jaszczyk <jaz@semihalf.com>
>
> The CP110 DT nodes references have changed, reflect these changes in
> COMPHY documentation.

This change isn't necessary. The examples are just examples. They
don't have to match anything exactly.

>
> Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/phy/phy-mvebu-comphy.txt          | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/phy-mvebu-comphy.txt b/Documentation/devicetree/bindings/phy/phy-mvebu-comphy.txt
> index cf2cd86db267..af2402c18513 100644
> --- a/Documentation/devicetree/bindings/phy/phy-mvebu-comphy.txt
> +++ b/Documentation/devicetree/bindings/phy/phy-mvebu-comphy.txt
> @@ -35,19 +35,19 @@ Required properties (child nodes):
>
>  Examples:
>
> -       cpm_comphy: phy@120000 {
> +       CP110_LABEL(comphy): phy@120000 {

Also, as we convert bindings to schema, the examples are compiled and
this won't without CP110_LABEL defined.

>                 compatible = "marvell,comphy-cp110";
>                 reg = <0x120000 0x6000>;
> -               marvell,system-controller = <&cpm_syscon0>;
> +               marvell,system-controller = <&CP110_LABEL(syscon0)>;
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> -               cpm_comphy0: phy@0 {
> +               CP110_LABEL(comphy0): phy@0 {
>                         reg = <0>;
>                         #phy-cells = <1>;
>                 };
>
> -               cpm_comphy1: phy@1 {
> +               CP110_LABEL(comphy1): phy@1 {
>                         reg = <1>;
>                         #phy-cells = <1>;
>                 };
> --
> 2.19.1
>
