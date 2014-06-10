From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: of: Add support for parsing
 regulator_state for suspend state
Date: Tue, 10 Jun 2014 11:02:32 +0100
Message-ID: <20140610100232.GD5099@sirena.org.uk>
References: <1402309780-8118-1-git-send-email-cw00.choi@samsung.com>
 <1402309780-8118-2-git-send-email-cw00.choi@samsung.com>
 <20140609192133.GD5099@sirena.org.uk>
 <53964A45.3010108@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kEeQdy8Dt6IIuJte"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53964A45.3010108-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--kEeQdy8Dt6IIuJte
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 10, 2014 at 08:59:01AM +0900, Chanwoo Choi wrote:
> On 06/10/2014 04:21 AM, Mark Brown wrote:

> > If we're going to do that we'd need to define what modes mean in the DT
> > binding - currently there's no support for modes at all because it's
> > complicated to come up with sensible and meaningful generic defintions.

> The 'regulator-mode' of this patch means following defined constant variable
> as following in include/linux/regulator/consumer.h:
> #define REGULATOR_MODE_FAST		0x1
> #define REGULATOR_MODE_NORMAL		0x2
> #define REGULATOR_MODE_IDLE		0x4
> #define REGULATOR_MODE_STANDBY		0x8

> If regulator consumer would use this mode('regulator-mode),
> specific regulator driver should implement rdev->desc->ops->set_suspend_mode function
> to control regulator state according to 'regulator-mode' in suspend state.

Sure, but what do those mean?

--kEeQdy8Dt6IIuJte
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTlte1AAoJELSic+t+oim9sY4QAImMhtfX0+Yn1lWOosuRTeZ9
ljUdsjTW/i71LL9qVhxhCuS/aVptstBUh7ZugNYxfbBQtRiWFIxf1t/sndzsuN3j
FnxCofUBkntTFQKlgkmI5a9N8u9WgapfJKUtXYPLlgGGdA0bJ0Ay3/awRJZ6n+TM
7BY4kBiq0C9rr7V8CSn9aLYk0SZODOXyvI+GP+fdgcBDTZA5p/W04JevW1zYPLqV
kG88PvVhktItdLuJtOVzXBD1LSJ/G9Z+LR/HjL6dL1D/kX+6yP1RHu5ZWu9ffNQn
1j9xs9b6TkTpKD3a+Sqv5HNZCa1cNxPBn+WZRFzEVhFH5DPMnNEG5oGOyleZ8Dnu
tRGQVrHjScsZizFprI6YqwIq03hHd6CWd0yyc7BLKV+JRzNEAcdZqQFIGHeCmoCJ
peoRLlGvwqK9R29ooZ6RGB/OejSd2lNiDTTLRyk5tM1SmwiM84SP0JV+edL+0nMg
7zHnoPSkkNv7QtKnxjmfr0Isk20ykgPpQV2bCktJHOHfE7ZwuoGiqcstGUi8yBdz
9KNNrpLcjICwYFS/cC/aGsRYNXuTWB8ZJ55oue5U8fsbHDAm5Izb1lWhgVfDo7Og
PQZeC4n00BW81bAEB39az5SR/oceL33oy9rqAfYsJnpRdO3DhCxC8Ji2Le/r9Nze
cNvpIi/uj2LBD4AtKafp
=A0r0
-----END PGP SIGNATURE-----

--kEeQdy8Dt6IIuJte--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
