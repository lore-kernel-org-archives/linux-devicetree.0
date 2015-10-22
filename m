From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator, dt: add dt support for tps6502x regulator
Date: Thu, 22 Oct 2015 13:28:35 +0100
Message-ID: <20151022122835.GE8232@sirena.org.uk>
References: <1445236033-27747-1-git-send-email-hs@denx.de>
 <20151021121925.GC8232@sirena.org.uk>
 <56278AA3.3060109@denx.de>
 <20151021161732.GO32054@sirena.org.uk>
 <56286B65.1010209@denx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WBsA/oQW3eTA3LlM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56286B65.1010209@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Schocher <hs@denx.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
List-Id: devicetree@vger.kernel.org


--WBsA/oQW3eTA3LlM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 22, 2015 at 06:51:49AM +0200, Heiko Schocher wrote:
> Am 21.10.2015 um 18:17 schrieb Mark Brown:

> >>arch/arm/boot/dts/tps65217.dtsi

> >>but, okay, removed.

> >That too is broken and should be removed :(

> Ok, I have a board which uses this regulator ... can you give me a hint,
> how to remove it correctly?

> I would do:

> move from arch/arm/boot/dts/tps65217.dtsi into board dts

> &tps {
> +	compatible = "ti,tps65217";
> 	[...]

> and the reg and "regulator-compatible" into the corresponding
> nodes ...

>                 dcdc1_reg: regulator@0 {
> +                        reg = <0>;
> +                        regulator-compatible = "dcdc1";

Yes, you should just put everything directly into the board DT.

--WBsA/oQW3eTA3LlM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWKNZvAAoJECTWi3JdVIfQj2YH+wQNjL2rjfpSHIodQnodkOoh
kFWZsRkdfdXAdzZaIQ31ZYwbUhDdMhbSMgB5ubR8MCK7XgSB8MLdF5w61eDYBD8V
CkNfnBAxEm4fBT4I7vmgF+58pjJMxkMDdLhF4cUrdjqB6d5PfrPwqU/IQG0LYQTZ
d9r9qEF+2sHAKgdMSh6EYHAsDcLrOzNJJEccBeGDyR+52Ofnm7MxFZ1ze44RZOH0
pnqRArwwZMk8nNDvZl3ElNuiIRXb0OeafRLcBlWP/SUZV2X0I5Pjc9vsU0Cxx7ep
Ca73dtSoCMYBpUpO6KxxzIh7QoV3naJEvkFFMQ1vwtFV62Mcv+P+SIzD/RKGX0E=
=NT1Q
-----END PGP SIGNATURE-----

--WBsA/oQW3eTA3LlM--
