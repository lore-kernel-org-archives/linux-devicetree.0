From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 07/11] dt-bindings: net: stmmac: Convert the binding
 to a schemas
Date: Tue, 11 Jun 2019 13:28:28 +0200
Message-ID: <20190611112828.nstilhcyflpuyt3g@flea>
References: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
 <40b91798a807cc3c232119ec74285325ebb6692a.1560158667.git-series.maxime.ripard@bootlin.com>
 <CAL_JsqJ_Y4nzN+BCKcUu7jBDwtT+6w5FFOR5S1eYtLm-uUjGqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2385164325050844369=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqJ_Y4nzN+BCKcUu7jBDwtT+6w5FFOR5S1eYtLm-uUjGqA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Andrew Lunn <andrew@lunn.ch>, Antoine =?utf-8?Q?T=C3=A9nart?= <antoine.tenart@bootlin.com>, netdev <netdev@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org


--===============2385164325050844369==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qew5pxuoqrxydleq"
Content-Disposition: inline


--qew5pxuoqrxydleq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 10, 2019 at 01:13:25PM -0600, Rob Herring wrote:
> On Mon, Jun 10, 2019 at 3:26 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > +    then:
> > +      properties:
> > +        snps,pbl:
> > +          allOf:
> > +            - $ref: /schemas/types.yaml#definitions/uint32-array
> > +            - enum: [2, 4, 8]
>
> As this is an array, I think this needs to be:
>
> - items:
>     enum: [2, 4, 8]
>
>
> And the next 2, too.

This was actually an error on the types, those properties are not
arrays. I've changed the type, thanks!

maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--qew5pxuoqrxydleq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXP+QXAAKCRDj7w1vZxhR
xV9cAQD5L7HheHjAdvoGBNb7CPTPUZI4imYlYaEM5mHnERlzhQD/UsXNJZh1LLwq
3lzUjzZeUKdRAytJJAPH9N/9JIEjOAA=
=10ZG
-----END PGP SIGNATURE-----

--qew5pxuoqrxydleq--


--===============2385164325050844369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2385164325050844369==--
