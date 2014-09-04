From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv4 1/2] regulator: of: Add support for parsing
 regulator_state for suspend state
Date: Thu, 4 Sep 2014 23:49:48 +0100
Message-ID: <20140904224948.GX29327@sirena.org.uk>
References: <1408343223-4043-1-git-send-email-cw00.choi@samsung.com>
 <1408343223-4043-2-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YYdWNcbn0Z2BHBmW"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1408343223-4043-2-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--YYdWNcbn0Z2BHBmW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 18, 2014 at 03:27:02PM +0900, Chanwoo Choi wrote:

> +		suspend_uV = of_get_property(suspend_np, "regulator-volt",
> +						NULL);
> +		if (suspend_uV) {
> +			suspend_state->uV = be32_to_cpu(*suspend_uV);
> +
> +			if (suspend_state->uV < constraints->min_uV)
> +				suspend_state->uV = constraints->min_uV;
> +			if (suspend_state->uV > constraints->max_uV)
> +				suspend_state->uV = constraints->max_uV;
> +		}

A few things here.  One is that this will fail if we don't have a
voltage range specified at runtime.  It is possible that the user needs
to override the voltage in suspend mode but not at runtime.  Perhaps we
want to make them specify the runtime voltage anyway but if we do then
the binding needs to say that this is mandatory even if it's just
restating the hardware default.

It's also not clear to me that the suspend voltage needs to be in the
range that we can vary at runtime, especially if we're not giving
permission for runtime variation.  From that point of view we should
probably just not check, but if we are going to check we should print a
warning that we're doing it so people know that what they set in the DT
isn't being followed.

--YYdWNcbn0Z2BHBmW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUCOyJAAoJELSic+t+oim9BC4P/1wdmDEPWmYTrg9qwl6vV3MH
Ep9eoTOzzKQlJmwXTe9nSwh+NCllfwJdLg/v9Bv3wrtms+VmhzyeIEdKsY/dbh10
5ip+TyNZF9DhdZLVR7Z/Tw026u3qKcGJ13AcqS/rrJ6VpIBPpvzEsxV7gsvtGvfN
W1DLfe5nwbTCvPB+oIA5UE0o69frQ/8z727dE3wkK6EXyh8bwS6kHtlmAacok6p4
aWnOPtXClkgwCZyS0P//qIAusEGfPv5J1lC+FXJ5cecsqhMVNUd1rMa6Db+Zbu77
/Pgouf+Of2KLkTOnGvC3jaubuksWqmJXNwV8bD6J19RtP2SVC4KnK8pOdbq5Reh4
imisNMHgpxpGilm17FbyDsr3Su6QthHdFcleG2w4Ug0BzoQ72BXzRmYGa4lLP8zr
qhxPJqvrIthWOCbKrsbZtkfkukWWM1y05DpfFckFjKzQPjgwkTssl0pl/AoK3K0A
ois6QAR2iSjocHWfRRuBZsJ3ARrOSbv9GY1trcbvt9L8z93aCHMSYo8PmocGAYoD
9nLUTAm4VjNml8fm8YFSV0Qr+KHon05/ZjzmwFe0u6l25g15d+HGINQM/olMrCwY
/ZyeGAcCR/Cf4rb6jCa7GiqxxOIFWqDag9Yy56nwL0jqfceSWA5Vr9p3O8Zc9uwd
jXpHBpyohrzOyJ96ZxA8
=p5/s
-----END PGP SIGNATURE-----

--YYdWNcbn0Z2BHBmW--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
