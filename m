From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: Add brcm,bcm63xx-regulator device tree
 binding
Date: Thu, 3 Dec 2015 15:05:28 +0000
Message-ID: <20151203150528.GG5727@sirena.org.uk>
References: <565A18DD.60108@simon.arlott.org.uk>
 <20151130121043.GX1929@sirena.org.uk>
 <565CB1CF.5040306@simon.arlott.org.uk>
 <20151201221615.GY1929@sirena.org.uk>
 <b7ecdc8ebcdf9582620c22b0e8a4a96d24ba67c1@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <20151202125325.GI1929@sirena.org.uk>
 <565F53FC.5080309@simon.arlott.org.uk>
 <20151203000631.GM1929@sirena.org.uk>
 <565FF9E9.1090503@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="APlYHCtpeOhspHkB"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <565FF9E9.1090503-qdVf85lJwsCyrPCCpiK2c/XRex20P6io@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--APlYHCtpeOhspHkB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 03, 2015 at 08:14:33AM +0000, Simon Arlott wrote:
> On 03/12/15 00:06, Mark Brown wrote:

> > this it should know at least something about how to control the device
> > from the compatible string.  If you're making a generic driver it should
> > not make reference to specific devices.

> Will you accept a generic driver for a simple enable regulator device on
> a regmap? What should its compatible string be?

Perhaps.  I really don't like putting the entire driver into DT, it's
not a pattern I want to encourage.

> > There could be one if it would help, but we do normally manage to do
> > this without - look at how other regulator drivers work.

> Several of them have a fixed list of supported regulator names in the

Yes, that's the way this is handled.

> driver. The regulator names for this device are meaningless to the
> driver because all of the regulators look the same. They don't have a
> known or controllable voltage and can only be turned on or off.

Nonsense.  The names are useful to identify which supply is being
referred to.  Having voltage control is irrelevant to identifying
regulators.

> Any table mapping regulator names to bits in the register would be
> different for each SoC making the list of regulator names in the device
> tree redundant. If they're not listed in the device tree then I can't
> use them as a phandle for other devices.

The list of regulator nodes in device tree is not redundant, it is as
you say used to connect things together.  The question is where to put
the control data for those regulators (in this case the enable time and
the switch).

--APlYHCtpeOhspHkB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWYFo3AAoJECTWi3JdVIfQijIH/1n755cm/y74LcXgNmrb0Ga7
XQkNKOrJHeCcJsPSEYqZOL2mLVHwGE7Hq7Is67lAvMG11FfTEYDNvMEqfvUuLA/h
NUjloATTroeViGDZVs3N+NfU2ybZnsReyr51EnDTpenFJUid9+16Iyd0U5QCaAEp
OWf+FaMz0/sP4Jqe7HJYmZrrjhbQT6XzVqtq4eVY/fK7wvGW3D5yfUVcRN7oSi72
hwi5sPAFPVFmZvvJxIhdUzx09qDpENLJ6xQfAAAvNRr3KcYMAPCLt+XpgNiHEF6G
9+r69hJJNUAoWnXw6PBye4Of55+8T1AWHoF3Xtxnipn/WE3b2WDYVZGA2cJ6BNY=
=Z69S
-----END PGP SIGNATURE-----

--APlYHCtpeOhspHkB--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
