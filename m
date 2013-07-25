Return-Path: <devicetree-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:57248 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751106Ab3GYEwC (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Thu, 25 Jul 2013 00:52:02 -0400
Date: Thu, 25 Jul 2013 14:42:34 +1000
From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] of: Feed entire flattened device tree into the random
 pool
Message-ID: <20130725044234.GI6806@voom.fritz.box>
References: <20130725125122.78accf44@kryten>
 <20130725031717.GB15673@concordia>
 <20130725143031.16af0a96@kryten>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zgY/UHCnsaNnNXRx"
Content-Disposition: inline
In-Reply-To: <20130725143031.16af0a96@kryten>
Sender: devicetree-owner@vger.kernel.org
To: Anton Blanchard <anton@samba.org>
Cc: Michael Ellerman <michael@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-ID: <devicetree@vger.kernel.org>


--zgY/UHCnsaNnNXRx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2013 at 02:30:31PM +1000, Anton Blanchard wrote:
>=20
> Hi Michael,
>=20
> > But why not put the initcall in drivers/of/fdt.c, that way it's not
> > early but it's still common ?
>=20
> Good idea! How does this look? So long as it happens before
> module_init(rand_initialize) we should be good.

This must be some strange new meaning of the word "random" of which I
was not previously aware.  But I guess it's marginally better than
nothing.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zgY/UHCnsaNnNXRx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iEYEARECAAYFAlHwrLoACgkQaILKxv3ab8YdSACeKo/ceJ1WkLo3FlDg9wN/Ayza
1zQAnAynlR5xJs+CnvhoUuoLeuYkcS2h
=VU3b
-----END PGP SIGNATURE-----

--zgY/UHCnsaNnNXRx--
