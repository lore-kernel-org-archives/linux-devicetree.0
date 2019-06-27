From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v4 03/13] dt-bindings: net: Add a YAML schemas for the
 generic MDIO options
Date: Thu, 27 Jun 2019 17:57:08 +0200
Message-ID: <20190627155708.myxychzngc3trxhc@flea>
References: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
 <e99ff7377a0d3d140cf62200fd9d62c108dac24e.1561649505.git-series.maxime.ripard@bootlin.com>
 <CAL_JsqKQoj6x-8cMxp2PFQLcu93aitGO2wALDYaH2h72cPSyfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fr3al6no3addfpyv"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKQoj6x-8cMxp2PFQLcu93aitGO2wALDYaH2h72cPSyfg@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev <netdev@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, Antoine =?utf-8?Q?T=C3=A9nart?= <antoine.tenart@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org


--fr3al6no3addfpyv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

On Thu, Jun 27, 2019 at 09:48:06AM -0600, Rob Herring wrote:
> On Thu, Jun 27, 2019 at 9:32 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > The MDIO buses have a number of available device tree properties that can
> > be used in their device tree node. Add a YAML schemas for those.
> >
> > Suggested-by: Andrew Lunn <andrew@lunn.ch>
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/net/mdio.txt  | 38 +-------------
> >  Documentation/devicetree/bindings/net/mdio.yaml | 51 ++++++++++++++++++-
> >  2 files changed, 52 insertions(+), 37 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/net/mdio.yaml
>
> Reviewed-by: Rob Herring <robh@kernel.org>
>
> However, some comments for a follow-up...
>
> > diff --git a/Documentation/devicetree/bindings/net/mdio.yaml b/Documentation/devicetree/bindings/net/mdio.yaml
> > new file mode 100644
> > index 000000000000..b8fa8251c4bc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/mdio.yaml
> > @@ -0,0 +1,51 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/mdio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MDIO Bus Generic Binding
> > +
> > +maintainers:
> > +  - Andrew Lunn <andrew@lunn.ch>
> > +  - Florian Fainelli <f.fainelli@gmail.com>
> > +  - Heiner Kallweit <hkallweit1@gmail.com>
> > +
> > +description:
> > +  These are generic properties that can apply to any MDIO bus. Any
> > +  MDIO bus must have a list of child nodes, one per device on the
> > +  bus. These should follow the generic ethernet-phy.yaml document, or
> > +  a device specific binding document.
> > +
> > +properties:
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description:
> > +      The phandle and specifier for the GPIO that controls the RESET
> > +      lines of all PHYs on that MDIO bus.
> > +
> > +  reset-delay-us:
> > +    description:
> > +      RESET pulse width in microseconds. It applies to all PHY devices
> > +      and must therefore be appropriately determined based on all PHY
> > +      requirements (maximum value of all per-PHY RESET pulse widths).
> > +
> > +examples:
> > +  - |
> > +    davinci_mdio: mdio@5c030000 {
>
> Can we enforce nodename to be mdio? That may not work for muxes.
> You'll probably have to implement it and see.

Ok, I'll send a follow-up patch for this.

> > +        compatible = "ti,davinci_mdio";
> > +        reg = <0x5c030000 0x1000>;
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
>
> These 2 should have a schema.

Indeed, I'll do it for that too.

> > +
> > +        reset-gpios = <&gpio2 5 1>;
> > +        reset-delay-us = <2>;
> > +
> > +        ethphy0: ethernet-phy@1 {
> > +            reg = <1>;
>
> Need a child node schema to validate the unit-address and reg property.

This should be already covered by the ethernet-phy.yaml schemas
earlier in this series.

Were you expecting something else?

Maxime
--fr3al6no3addfpyv--
