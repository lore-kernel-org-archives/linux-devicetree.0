From: Mark Brown <broonie@kernel.org>
Subject: Re: regulator node names and unit-addresses? (Re: [PATCH v2 1/5]
 ARM: shmobile: kzm9d: Remove spurious regulator base addresses)
Date: Wed, 24 Sep 2014 09:14:55 +0100
Message-ID: <20140924081455.GU4015@sirena.org.uk>
References: <CAMuHMdVC2h4_Q+4BpV5iLbhfviimzrnfZ3+c6dqnegTAxBHw_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WfjJTYUClXDJCnRl"
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVC2h4_Q+4BpV5iLbhfviimzrnfZ3+c6dqnegTAxBHw_g@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Liam Girdwood <lgirdwood@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Magnus Damm <magnus.damm@gmail.com>, Olof Johansson <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--WfjJTYUClXDJCnRl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 24, 2014 at 09:02:23AM +0200, Geert Uytterhoeven wrote:
> On Wed, Sep 24, 2014 at 3:13 AM, Simon Horman <horms@verge.net.au> wrote:

> > What should we call the nodes?

> "regulator0" and "regulator1"?
> "regulator1v8" and "regulator3v3"?

> Documentation/devicetree/bindings/regulator/regulator.txt doesn't mention
> node names or (presence/lack of) unit-adresses, but the examples do have
> unit-addresses.

> Is this another case where we don't follow the "no reg, no unit-address"
> ePAPR rule?

As far as the regulator API is concerned the node name is completly
immaterial and all this stuff is just verbiage we're forced to include.
As far as I can tell the requirement that node names be in the form
"regulator" or whatever is just another thing that wasn't terribly well
thought through in ePAPR, they were trying to do classes I think.

--WfjJTYUClXDJCnRl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUIn15AAoJECTWi3JdVIfQfJsH/RhntmzAaGja31Gu4osVRZtB
KalVs1+41khTjjRDddOKmiZ1hxmarNcCApG99ydsntTvvQ9jWYsv4ilDpsn3Bj70
vy797pvMeza3/2K7iAxUj/n4skfA6jodmd1wwvn6hZ1/NZMUFULsjTd+EsLmWVzC
a4SAYvlN/Dd+Sdwd45eK/EzM8HxCZt47K6kOdrGBpy1SAdy1UkkJ794C9y8nQ+T6
FIpSoVVCD4xJFmv1D5C0AqhZGD6YEAK/mrCiEqhUpkYIVZMsqS94zw/n84NrLQSK
pNGTz+IFl4Z7p/YkE4zeMwHKSTX4DuY8VVbiIXrs+FgvPfastVMFZDrvyTT/iao=
=+XMC
-----END PGP SIGNATURE-----

--WfjJTYUClXDJCnRl--
