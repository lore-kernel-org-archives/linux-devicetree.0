From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [RESEND PATCH v5 01/16] dt-bindings: i2c: eeprom: Document
 vendor to be used and deprecated ones
Date: Mon, 28 Aug 2017 18:02:27 +0200
Message-ID: <20170828160227.awm3bnz23gecwk6j@ninjato>
References: <20170615185418.13980-1-javier@dowhile0.org>
 <20170615185418.13980-2-javier@dowhile0.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3ged2uoxu5omlfmw"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170615185418.13980-2-javier@dowhile0.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Simon Horman <horms@verge.net.au>, Sekhar Nori <nsekhar@ti.com>, David Lechner <david@lechnology.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org


--3ged2uoxu5omlfmw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2017 at 08:54:03PM +0200, Javier Martinez Canillas wrote:
> The at24 driver allows to register I2C EEPROM chips using different vendor
> and devices, but the I2C subsystem does not take the vendor into account
> when matching using the I2C table since it only has device entries.
>=20
> But when matching using an OF table, both the vendor and device has to be
> taken into account so the driver defines only a set of compatible strings
> using the "atmel" vendor as a generic fallback for compatible I2C devices.
>=20
> Document in the Device Tree binding document that this manufacturer should
> be used as the generic fallback. Also document the deprecated vendors.
>=20
> Suggested-by: Wolfram Sang <wsa@the-dreams.de>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
>=20

Applied to for-next, thanks!


--3ged2uoxu5omlfmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmkPpMACgkQFA3kzBSg
KbZJvQ//ezfZ3CRS4wPShzODiYo+w4+VsyAkS2VvWxrsBxgJwM45tFOVBauL2vji
meUADXBVLnrCzLNocxfYQpcPdqhGR++71VRFoZ3OhZf6aNOVGvCf0tK4MVZbmyp5
We+UTdJHRsNzQippw3GkJTnsy4H7a6PVDbrPGdYaTwM2r+BiBOPv0JviFLMBVjyr
9BpOP3CRLtOq5AqvHrmIUr8sskpSfMowGoxqrlj1OHmdNPKgzWDghGIVTQs4fXNx
yKhXp0t0xGGPEMWDhvSZco4xL1t+y2a1Vw22w82bZHlSRwIZF5VlFvUkdTBXHi/f
npHTrnt3Cg7JMAw6i9rqx4qdPrrn3yOan89g2AQ/BoDAJvh8w1Ie5x8DTrHllTJ7
NNWrJO9oFYkN4YibwEBN2u4qyfPtBxmO921one3YUDadV8vheXqvCOFxio8jZkKH
GbSBJTHDV+CY1rzgZHkzJAFUu2SmxgeE317JzQUCOkhwkQc5afH+AxIT7NZDvGNI
cNcV0AiIYOGjBnrd1A7eaf3/SzTXXv7D0Pu/+STXuarHCpjhHNfAZwinkqoqNYB5
H8JMNH6w/6XHqDDRf2LQ87DdzVnmtfY3EFWxLf5mHc6B29WXu7Fb+8b5wY3EFn1a
lyt8B3xvhNsD+T8AYEqdnlWN5kZRQAWrFSPb4ok9WtzIitY9tv8=
=wn4K
-----END PGP SIGNATURE-----

--3ged2uoxu5omlfmw--
