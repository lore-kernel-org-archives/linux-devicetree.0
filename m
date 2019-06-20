From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 01/16] dt-bindings: net: Add YAML schemas for the
 generic Ethernet options
Date: Thu, 20 Jun 2019 11:08:57 +0200
Message-ID: <20190620090857.z6gru4cilq6z7e4w@flea>
References: <27aeb33cf5b896900d5d11bd6957eda268014f0c.1560937626.git-series.maxime.ripard@bootlin.com>
 <20190619140314.GC18352@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="52tq5ryctgrkeugj"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190619140314.GC18352@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, Antoine =?utf-8?Q?T=C3=A9nart?= <antoine.tenart@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org


--52tq5ryctgrkeugj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrew,

On Wed, Jun 19, 2019 at 04:03:14PM +0200, Andrew Lunn wrote:
> > +  phy-connection-type:
> > +    description:
> > +      Operation mode of the PHY interface
> > +    enum:
> > +      # There is not a standard bus between the MAC and the PHY,
> > +      # something proprietary is being used to embed the PHY in the
> > +      # MAC.
>
> ...
>
> > +
> > +  phy-mode:
> > +    $ref: "#/properties/phy-connection-type"
> > +    deprecated: true
>
> I don't think phy-mode is actually deprecated. ethernet.txt actually says:
>
> "This is now a de-facto standard property;" and no mentions that is
> should not be used. Looking at actual device trees, phy-mode is by far
> more popular than phy-connection-type.

Looking at the phy-connection-type documentation, I was under this
impression, sorry.

I'll drop it then.

> fwnode_get_phy_mode() first looks for phy-mode and only falls back to
> phy-connection-type if it is not present. The same is true for
> of_get_phy_mode().
>
> > +  fixed-link:
> > +    allOf:
> > +      - if:
> > +          type: array
> > +        then:
> > +          minItems: 1
> > +          maxItems: 1
> > +          items:
> > +            items:
> > +              - minimum: 0
> > +                maximum: 31
> > +                description:
> > +                  Emulated PHY ID, choose any but unique to the all
> > +                  specified fixed-links
> > +
> > +              - enum: [0, 1]
> > +                description:
> > +                  Duplex configuration. 0 for half duplex or 1 for
> > +                  full duplex
> > +
> > +              - enum: [10, 100, 1000]
> > +                description:
> > +                  Link speed in Mbits/sec.
> > +
> > +              - enum: [0, 1]
> > +                description:
> > +                  Pause configuration. 0 for no pause, 1 for pause
> > +
> > +              - enum: [0, 1]
> > +                description:
> > +                  Asymmetric pause configuration. 0 for no asymmetric
> > +                  pause, 1 for asymmetric pause
> > +
>
> This array of 5 values format should be marked as deprecated.

Right, I'll add it.

> > +
> > +      - if:
> > +          type: object
> > +        then:
> > +          properties:
> > +            speed:
> > +              allOf:
> > +                - $ref: /schemas/types.yaml#definitions/uint32
> > +                - enum: [10, 100, 1000]
>
> This recently changed, depending on context. If PHYLINK is being used,
> any speed is allowed. If phylib is used, then only these speeds are
> allowed. And we are starting to see some speeds other than listed
> here.

phylink seems to be described in a separate binding document, maybe we
can adjust that later?

Maxime
--52tq5ryctgrkeugj--
