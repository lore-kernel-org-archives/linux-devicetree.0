From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 5/6] media: sun4i: Add H3 deinterlace driver
Date: Fri, 13 Sep 2019 11:11:47 +0200
Message-ID: <20190913091147.42nsldzxwzfjoiak@localhost.localdomain>
References: <20190912175132.411-1-jernej.skrabec@siol.net>
 <20190912175132.411-6-jernej.skrabec@siol.net>
 <20190912202647.wfcjur7yxhlelvd6@localhost.localdomain>
 <4613446.95M5L3lKvs@jernej-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="42vjgwlldb7pcwy6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4613446.95M5L3lKvs@jernej-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, hverkuil@xs4all.nl, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--42vjgwlldb7pcwy6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 12, 2019 at 10:43:28PM +0200, Jernej =C5=A0krabec wrote:
> Dne =C4=8Detrtek, 12. september 2019 ob 22:26:47 CEST je Maxime Ripard na=
pisal(a):
> > > +	clk_set_rate(dev->mod_clk, 300000000);

I just realized I missed this too. If you really need the rate to be
fixed, and if the controller cannot operate properly at any other
frequency, you probably want to use clk_set_rate_exclusive there.

Maxime
--42vjgwlldb7pcwy6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXXtdUwAKCRDj7w1vZxhR
xZY3AQDJluLkTUto07z1kgxJ+9CJnbEOdksi1vAG8DSbW/o52wEAyBtJ8MHD4t8T
GgYWgCtcAKeCFH1IT/6EICEM21kyTQw=
=aoHD
-----END PGP SIGNATURE-----

--42vjgwlldb7pcwy6--
