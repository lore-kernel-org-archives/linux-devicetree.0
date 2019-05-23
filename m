From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 6/8] dt-bindings: net: stmmac: Convert the binding to a
 schemas
Date: Thu, 23 May 2019 14:45:46 +0200
Message-ID: <20190523124546.6agw7fu5qteag3ol@flea>
References: <74d98cc3c744d53710c841381efd41cf5f15e656.1558605170.git-series.maxime.ripard@bootlin.com>
 <ba1a5d8ad34a8c9ab99f504c04fbe65bde42081b.1558605170.git-series.maxime.ripard@bootlin.com>
 <78EB27739596EE489E55E81C33FEC33A0B92B864@DE02WEMBXB.internal.synopsys.com>
 <20190523110715.ckyzpec3quxr26cp@flea>
 <78EB27739596EE489E55E81C33FEC33A0B92BA5B@DE02WEMBXB.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6479707374587605372=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <78EB27739596EE489E55E81C33FEC33A0B92BA5B@DE02WEMBXB.internal.synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, Antoine =?utf-8?Q?T=C3=A9nart?= <antoine.tenart@bootlin.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============6479707374587605372==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tf5grxv2ddxyomh6"
Content-Disposition: inline


--tf5grxv2ddxyomh6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 23, 2019 at 11:25:09AM +0000, Jose Abreu wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
> Date: Thu, May 23, 2019 at 12:07:15
>
> > You can then run make dtbs_check, and those YAML files will be used to
> > validate that any devicetree using those properties are doing it
> > properly. That implies having the right node names, properties, types,
> > ranges of values when relevant, and so on.
>
> Thanks but how can one that's developing know which bindings it shall use?

I'm not quite sure what you mean here. Are you talking about which
file to use, or which property are required, or something else?

> Is this not parsed/prettified and displayed in some kind of webpage ?

Not at the moment, but it's one of the things that are made much
easier by using a formal data format.

> Just that now that the TXT is gone its kind of "strange" to look at YAML
> instead of plain text and develop/use the bindings.

Well, it's kind of the point though. Free-form text was impossible to
parse in a generic way, and you couldn't build any generic tools upon
it. YAML provides that.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--tf5grxv2ddxyomh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOaV+gAKCRDj7w1vZxhR
xbIiAQDiQ/YoNNi0GkGaqteHf9TnQ2HqpEptDspMMmoMtI/iUQD9GIkc5JePBFh2
kcr5Fwff9irX+EB/TCiw12tiyLODug8=
=9C+d
-----END PGP SIGNATURE-----

--tf5grxv2ddxyomh6--


--===============6479707374587605372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6479707374587605372==--
