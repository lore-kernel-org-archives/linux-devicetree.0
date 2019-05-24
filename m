From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 6/8] dt-bindings: net: stmmac: Convert the binding to a
 schemas
Date: Fri, 24 May 2019 09:34:55 +0200
Message-ID: <20190524073455.46auhvhwb5no6ebp@flea>
References: <74d98cc3c744d53710c841381efd41cf5f15e656.1558605170.git-series.maxime.ripard@bootlin.com>
 <ba1a5d8ad34a8c9ab99f504c04fbe65bde42081b.1558605170.git-series.maxime.ripard@bootlin.com>
 <9094f39f-0e26-55dd-9b47-9a55089400da@st.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="23ickihnik62sivg"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9094f39f-0e26-55dd-9b47-9a55089400da@st.com>
Sender: netdev-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, Antoine =?utf-8?Q?T=C3=A9nart?= <antoine.tenart@bootlin.com>
List-Id: devicetree@vger.kernel.org


--23ickihnik62sivg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexandre,

On Thu, May 23, 2019 at 05:05:51PM +0200, Alexandre Torgue wrote:
> Hi Maxime
>
> On 5/23/19 11:56 AM, Maxime Ripard wrote:
> > Switch the STMMAC / Synopsys DesignWare MAC controller binding to a YAML
> > schema to enable the DT validation.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
>
> First, thanks a lot for this patch. Just one question:
> We could add ranges for some properties in order to avoid "bad value" for a
> property. If I understand correctly you do it only for snps,dwxgmac,
> snps,dwxgmac-2.10 and st,spear600-gmac. Why not do it for all supported IPs
> ? (Maybe it is something that we could add later)
>

We definitely can do that. It wasn't really obvious to me what the
limits were by reading the previous documentation, but if you can
provide them we can definitely add them.

> > +        snps,tso:
> > +          $ref: /schemas/types.yaml#definitions/flag
> > +          description:
> > +            Enables the TSO feature otherwise it will be managed by
> > +            MAC HW capability register. Only for GMAC4 and newer.
>
> TSO is also available for snps,dwmac-4.00 and snps,dwmac-4.10a

Ack, I'll change it.

Thanks!
Maxime
--23ickihnik62sivg--
