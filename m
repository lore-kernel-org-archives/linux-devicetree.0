From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: pfuze100: add optional pfuze-disable-sw
 binding
Date: Thu, 12 Jul 2018 16:31:21 +0100
Message-ID: <20180712153121.GF10369@sirena.org.uk>
References: <20180712110240.3006-1-m.felsch@pengutronix.de>
 <20180712110240.3006-2-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="m1UC1K4AOz1Ywdkx"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180712110240.3006-2-m.felsch@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, fabio.estevam@nxp.com, Anson.Huang@nxp.com, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--m1UC1K4AOz1Ywdkx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 12, 2018 at 01:02:39PM +0200, Marco Felsch wrote:

> +Optional properties:
> +- pfuze-disable-sw: Disable all unused switch regulators to save power
> +  consumption. Attention, some platforms are using the switch regulators as DDR
> +  ref or supply voltage. Mark these regulators as "regulator-always-on" to skip
> +  disabling these regulators. If not specified, the driver simualtes the
> +  disabling. This means the state of the regulator is set to 'disabled' but the
> +  driver don't disable the regulator.

This is a bit of a confused way of specifying things that depends on the
Linux implementation, and the property sounds like a double negative
too.  I'd say something like "pfuze-support-disable" and then explicitly
say that this is a workaround for backwards compatibility.

I'd also recommend changing the implementation patch to just register a
different version of the desc and ops that just doesn't have the disable
operation so that the framework knows what's going on.  While the
current implementation works now there's the possibility that at some
point in the future we might start relying on the disable actually
having taken effect somehow and will get confused.  There's some
existing drivers that optimize their resume paths if they know power
wasn't removed.

--m1UC1K4AOz1Ywdkx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltHdEgACgkQJNaLcl1U
h9CaAAf/UU9njCozGSkAnCo5ZtAkrPB4iKYggp6MKxZsOBJgAXqMRBdJrWlI58As
aWTfq7UaLaaqOsumRWDt/NeX3Q39bRimIJaN0KXBWdFwUz/+/4x2NDpGAe9FQFPW
S7l4SwVATYbdqQdeJi5QRDgyTJwrjrlTixK4P9LLB8gS49UwIDG/PbKfHIxBrNRG
NPrZfavFaEEy8HZ4E0vmnNEJkrpTnzndsEBOi/mWT3CkaGpVUJRvUjDQgU+8bj1p
VHv1AD0pX+eJdClr7oMdGJhcbUScZrXRD1cKs7zG8gSAAgvTG3muhoWvB1pLYLrt
H7Fmx6YMLkVQ/L9KCPAsErpDhplZgw==
=fT4z
-----END PGP SIGNATURE-----

--m1UC1K4AOz1Ywdkx--
