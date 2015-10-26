From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Mon, 26 Oct 2015 09:43:20 +0900
Message-ID: <20151026004320.GU29919@sirena.org.uk>
References: <1443731874-21362-1-git-send-email-afd@ti.com>
 <1443731874-21362-5-git-send-email-afd@ti.com>
 <20151022164724.GZ8232@sirena.org.uk>
 <562A2C2F.1020808@ti.com>
 <20151023231822.GQ29919@sirena.org.uk>
 <562ACCCC.503@ti.com>
 <20151024221457.GS29919@sirena.org.uk>
 <562D3F77.5040205@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1PHmS26pdpOR3Xc0"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <562D3F77.5040205-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--1PHmS26pdpOR3Xc0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2015 at 03:45:43PM -0500, Andrew F. Davis wrote:
> On 10/24/2015 05:14 PM, Mark Brown wrote:

> >Tbe binding document is buggy and doesn't reflect the code, there's no
> >compatible string in the driver.

> Sure there is:

> drivers/mfd/mt6397-core.c:48:
> .of_compatible =3D "mediatek,mt6397-regulator",

This is in the MFD, this is not used in actual systems.

> Then mfd_add_devices uses this to find the regulator node and fill
> in .of_node, then in the regulator driver:

> drivers/regulator/mt6397-regulator.c:48:
> .of_match =3D of_match_ptr(match),

> which uses your helper to match the nodes in the filled in .of_node.

This is in a regulator definition, it is using the regulator framework
support for parsing DT which must be used by modern drivers.  It is not
part of how the Linux driver model device is instantiated, that is done
using the struct platform_driver which is what we are talking about
here.

Please stop this, it is getting very tiresome. =20

> >No, that's not the case - remember, users don't have to write a new
> >driver every time they instantiate a device on a board.  They're going
> >to have to list the in-use regulators one way or another but if we have
> >the extra compatible for regulators they have to bind both the core
> >device (which is going to be required anyway due to the control bus) and
> >the subnode saying that it has regulators (which we knew anyway as soon
> >as we knew we had the core device).

> We don't know what sub-devices the core device has, PMICs are more like
> SoCs on a bus than a regular device, the sub-parts change with every spin=
 and
> we can represent this in DT like we do with SoCs. Else we would have to h=
ave
> a new core binding for every spin. We know what devices are on a particul=
ar
> SoC too, but we still list them and match them in DT so some SoC driver
> doesn't have to.

PMICs are very much smaller than SoCs, and again if you're not able to
usefully represent individual IPs in the DT (as is *clearly* the case
here where you are trying to make one node for the entire collection of
regulators) we're not getting any value.

--1PHmS26pdpOR3Xc0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWLXcnAAoJECTWi3JdVIfQcBoH/0b299D0MG4GogaJbvVqqEji
9gyYzWmwbLcL3faG/cgCXUCTerZmuvr/K6uNXxiKU0QB4idfG+tfjtybIys4htnm
TjUm+PQ1UlhPWyo4RFWOA80ZtQ2Eu3QB0jwOs6AaujibwQLu+ytHg9q0abpfTVDu
QvVjrLF2nXbCHpTSFXLYbdG9sHN/iHNUAkoVogXC9jbu0JKOprwHF8Im+Q9fL1tG
jqmf1yxoG4OR5TC/9VrEojzcdTFWk3rMbVfAY12ox1/MQ0HQkZrgH+w4NPzEmHL0
p9A0JYz8NlVPgXqDHL5NS5b3ZZLvs7yD3de4tOcsgQd/LlRyLYFh0W/LVpnd4MQ=
=HXOE
-----END PGP SIGNATURE-----

--1PHmS26pdpOR3Xc0--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
