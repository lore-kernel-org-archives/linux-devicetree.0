From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv4 2/2] dt-bindings: regulator: Add regulator suspend
 state for PM state
Date: Thu, 4 Sep 2014 23:53:03 +0100
Message-ID: <20140904225303.GY29327@sirena.org.uk>
References: <1408343223-4043-1-git-send-email-cw00.choi@samsung.com>
 <1408343223-4043-3-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3/zQ9zHZ+bvXaNu1"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1408343223-4043-3-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--3/zQ9zHZ+bvXaNu1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 18, 2014 at 03:27:03PM +0900, Chanwoo Choi wrote:

> +- regulator-initial-state: initial state for suspend state, cnd set initial
> +  state among following defined suspend states:
> +  <3>: PM_SUSPEND_MEM - Setup regulator according to regulator-state-mem
> +  <4>: PM_SUSPEND_MAX - Setup regulator according to regulator-state-disk

Please add defines for these in include/dt-bindings.  Probably worth
pointing out that if absent the state is the hardware default (same for
most of these.

> +- regulator-state-[mem/disk] node has following common properties:
> +	- regulator-volt: voltage consumers may set in suspend state.

We use -uV rather than -volt in other bits of the bindings.

> +	- regulator-on-in-suspend: regulator should be on in suspend state.
> +	- regulator-off-in-suspend: regulator should be off in suspend state.
> +	If node don't include regulator-[on/off]-in-suspend, can't change
> +	regulator state in suspend mode and only should sustain the regulator
> +	state of normal state.

Probably better to say that the OS will not manage the state here -
otherwise we have to explicitly override any hardware default that's
there which drivers and the core don't do right now.

--3/zQ9zHZ+bvXaNu1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUCO1LAAoJELSic+t+oim9kesP/RxL0PT3dxAqHvcFfGEiNEH1
Y//oOEi769lZ56Zl3M87Ipbjg65cWhsCtGMH4Q5MsqbYR0oReAfRYb5GdP3e1JSV
jrsI95mATlJwkvbe+Ob/GXqdejpLiCPzwp0bNUMD6nFTFnUryqrUlnR4kz78U88t
rE+DN9/0ys4XtDzhSeRlVTF1vYWYekEtZJdyx7etbdXRUUQC3nQqdQ8VpnTGFWU9
JTxdQBh7QOzwOD3ARgHx0CQbN51M8t0zSs6egXwzuTx/aGu8tNFaaRADO/3fKhqJ
CVqoMq6dkhy+LZXenETjm6HAlls3p3j/UqTknrD0sOMVVhOW79AKngB0V+2hl1+E
O6/RJpKWZZAEN3vpH9P95MZwV92iJ056LnL6nVv13rUs92qID9bWyNrN9AxmKeO7
n8ushSmPM57FE9qnktFoeUZInwCfQaZNSLafk5eHeBwAe18H7JfkMsQDHesAL078
2VNeTX079xcWk9EEbNdWRIOCwSTB6xHEOOkoWekWpeD/CvP9hgnALRha82l6DtqS
fN//3G1ByezGUJIvo64jz45Ax9AXEVYtHq2VKyTkeaVyYWiJ0Q0w2Mk/Sgk0k2tZ
zT/+fyDmx0za1jj20eC1B8gYMXsqop9+AyfzYXXyWPV7Z5OmQCzf92UtmDCeA3uB
0RVerig2nblIW09wYY77
=fyzw
-----END PGP SIGNATURE-----

--3/zQ9zHZ+bvXaNu1--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
