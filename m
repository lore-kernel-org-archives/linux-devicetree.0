From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v6 3/3] mfd: max14577: Add device tree bindings document
Date: Wed, 4 Dec 2013 12:49:29 +0000
Message-ID: <20131204124929.GO29268@sirena.org.uk>
References: <1386153615-25456-1-git-send-email-k.kozlowski@samsung.com>
 <1386153615-25456-4-git-send-email-k.kozlowski@samsung.com>
 <20131204112039.GC907@lee--X1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1bhFRg6vL9BT9osV"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131204112039.GC907@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Anton Vorontsov <anton@enomsg.org>, David Woodhouse <dwmw2@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: devicetree@vger.kernel.org


--1bhFRg6vL9BT9osV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 04, 2013 at 11:20:39AM +0000, Lee Jones wrote:

> > +		regulators {
> > +			compatible = "maxim,max14577-regulator";
> > +
> > +			safeout_reg: safeout@1 {

> The name of the node (not the label:safeout_reg) usually depicts the
> type of device, so 'regulator@0' and 'regulator@1'. However, I'm
> unsure how this works when these nodes are encapsulated by an
> overarching 'regulators' parent node.

> Perhaps Mark can answer this?

The name there is meaningless, the DT convention is as you describe and
applies to any node but equally well it's just a convention and I
struggle to see the value it adds.  Having something that humans find
helpful is just as well.

--1bhFRg6vL9BT9osV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnyTWAAoJELSic+t+oim90z8QAIXR1t+LL4kPST8O7L15eR6o
K5CnpWwl0mEUkcp3fiffCHWnkEjaZKx92jNJ1TWjAZ96bskKZ34dvkK86Aqz1aIZ
skvv+SS3RuqXh1YAQgqadyrWq3rSlylMl+temN/LXdejj20J/Y8dV6rVLyhryt4V
3oroc/UVmplGty2L3MzdS/3vclwCedsk92VpzN1+f9AclPFeFUpSxe9YqpFo6rdX
zR8E/M0OWbne3oWzYgMlS8BUoJhu2RVExgqRwM8oy0L9mwNuz+skiGqVpu8N+sSI
9XsMtWQ0yyqfYmcFo7RPMy7OH8M8A4rTX5qMq87p0AlGdw8LJF28KTO6wh3gY0ok
7m1SRS3fero14RhuO9r1eWuC+6O8qkbkKBOWEOv7dnn1yiAf+BjGRahMysOmhZex
AM3oYTuA/4bEjdlgwbfmsrPYLIDfrUn7pl/pWM70ezAlyN6Iqtb0JAPjN7c0v/sp
rEqEDQShNPKXqeATHq1jSujTwVTloXJ05ka5tQjUQzVsG3YE+BeWV4K7WsJYRe8T
I/A9b8O/BthgqShNVqALGkgGBA/9100CZu/Z0TJ2JIXpKJEyO7NnqXd184WoYxh2
0l8zMy/0klK0pR+zUYNb8XTP0mtDBLZdmbxoDm2kejKHcFWafjphjoPV7uBQd7Z8
VV3nO0pSMw3Puky2B6s4
=NHD+
-----END PGP SIGNATURE-----

--1bhFRg6vL9BT9osV--
