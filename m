From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Tue, 1 Mar 2016 11:23:26 +0900
Message-ID: <20160301022326.GC18327@sirena.org.uk>
References: <1456756829-2277-1-git-send-email-ldewangan@nvidia.com>
 <20160229174751.GQ21240@tuxbot>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y6IdC9+/ilDqdjNX"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160229174751.GQ21240@tuxbot>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--y6IdC9+/ilDqdjNX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 29, 2016 at 09:47:51AM -0800, Bjorn Andersson wrote:
> On Mon 29 Feb 06:40 PST 2016, Laxman Dewangan wrote:

> > It is observed that voltage change in given rail affected by the load
> > and the capacitor in the rail. This may cause the slow ramp in voltage
> > against what PMIC has programmed.

> The regulator-ramp-delay is a variable you can tweak on a board basis,
> so I'm not sure what benefit it gives to be able to add a scaling
> factor to this.

> In my experience your HW engineer will say "you have to wait X ms", not
> "you have to wait 125% of X ms".

> Can you please elaborate on why the original knob isn't sufficient?

Right, this definitely feels like the wrong thing is being specified
here (and also like the PMIC might be going out of spec, possibly as a
result of being overloaded) and that the existing board specific
controls should be used.  It just doesn't correspond to the way people
usually talk about specs for PMICs.

--y6IdC9+/ilDqdjNX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW1P0ZAAoJECTWi3JdVIfQDy4H/jdp+euVrbkwjW7AtGOh5VQC
rxNbG4HCvPVw2uLiqHxjFEB8RvaGvv6hn2GQO4hHwY9KGzJ37hwdZyLPK6ed9UQa
V1FaZuQw3aHLOZ4/H9R4t5bOr9O/WZnxaQ/H6fcnR+QO66n7mvCsy4FbCJUqFTGu
Cp4QcTlaF7TMoYQG29hmIFFu5S1gunxVmpp+HNn0Lw+rnGDOc+oK9AvZey5ruEM+
TzslDB3oyS2/+WrYXUfFuIeB7vGLrt9cGp4fkbZ025TZOPR969K/FJV3yOXIM9Ow
o+K6gev8yvPG0qCp9BLTzySbZ3UPXL50drLSdkmcrpR3nR8oS3Z5e/UW5nZ4JfQ=
=hRcQ
-----END PGP SIGNATURE-----

--y6IdC9+/ilDqdjNX--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
