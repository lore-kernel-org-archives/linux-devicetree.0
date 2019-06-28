From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v4 03/13] dt-bindings: net: Add a YAML schemas for the
 generic MDIO options
Date: Fri, 28 Jun 2019 15:45:53 +0200
Message-ID: <20190628134553.l445r5idtejwlryl@flea>
References: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
 <e99ff7377a0d3d140cf62200fd9d62c108dac24e.1561649505.git-series.maxime.ripard@bootlin.com>
 <CAL_JsqKQoj6x-8cMxp2PFQLcu93aitGO2wALDYaH2h72cPSyfg@mail.gmail.com>
 <20190627155708.myxychzngc3trxhc@flea>
 <CAL_JsqLhUP62vP=RY8Bn_0X92hFphbk_gLqi4K48us56Gxw7tA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zjmpquddmsmyw3nm"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLhUP62vP=RY8Bn_0X92hFphbk_gLqi4K48us56Gxw7tA@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev <netdev@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, Antoine =?utf-8?Q?T=C3=A9nart?= <antoine.tenart@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org


--zjmpquddmsmyw3nm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 27, 2019 at 10:06:57AM -0600, Rob Herring wrote:
> On Thu, Jun 27, 2019 at 9:57 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > > +
> > > > +        reset-gpios = <&gpio2 5 1>;
> > > > +        reset-delay-us = <2>;
> > > > +
> > > > +        ethphy0: ethernet-phy@1 {
> > > > +            reg = <1>;
> > >
> > > Need a child node schema to validate the unit-address and reg property.
> >
> > This should be already covered by the ethernet-phy.yaml schemas
> > earlier in this series.
>
> Partially, yes.
>
> > Were you expecting something else?
>
> That would not prevent having a child node such as 'foo {};'  or
> 'foo@bad {};'. It would also not check valid nodes named something
> other than 'ethernet-phy'.

Right, but listing the nodes won't either, since we can't enable
additionalProperties in that schema. So any node that wouldn't match
ethernet-phy@.* wouldn't be validated, but wouldn't generate a warning
either.

Maxime
--zjmpquddmsmyw3nm--
