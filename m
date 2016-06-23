From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/6] regulator: core: Allow simultaneous use of enable op
 and GPIO
Date: Thu, 23 Jun 2016 11:01:04 +0100
Message-ID: <20160623100104.GU28202@sirena.org.uk>
References: <20160622082558.20935-1-acourbot@nvidia.com>
 <20160622082558.20935-2-acourbot@nvidia.com>
 <20160622103432.GJ28202@sirena.org.uk>
 <CAAVeFuK9AV+g0EwTAhr9mFz=ZK5nRR6jnWFhEEsz8+HU7rMKrw@mail.gmail.com>
 <CAAVeFu+9cgt+teWpA3KYwnBU+NAr+RusVd_XavgW1CuPfY2egA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R7Dyui215VKdTDYA"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAVeFu+9cgt+teWpA3KYwnBU+NAr+RusVd_XavgW1CuPfY2egA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--R7Dyui215VKdTDYA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 23, 2016 at 02:29:39PM +0900, Alexandre Courbot wrote:

> There is also another potential problem with not using the enable GPIO
> in the regulator core: said GPIO can not be shared anymore between
> several regulators, as this was handled by the core.

Yeah, but there's more fun there since you'd need to sync up with the
device specific enable as well - it's not clear that such hardware would
make sense TBH.

> That's not a big issue for our use-case but I just wanted to point it
> out. Maybe we need a more global solution for shared GPIOs, but I can
> see a few challenges on the way (e.g. which policy to adopt and how to
> handle conflicts).

Indeed.  I've never seen such hardware though so...

--R7Dyui215VKdTDYA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXa7NfAAoJECTWi3JdVIfQ2eQH/1bzIB5cI1yVrQZ9M4rQvPX8
UyvqDtrooec+/1jxceyA8lJuXVBrfqYtEnpZ1swCzmcbpuFYJZ4jXlVhraoRLXVc
tBQC/kRo+w9FuPh3fRzqr7bMZ5jlPsnhG24wiNS6noZuYsePEg4WSiWiPT1e0umk
VQ/wemmMpsIOXvsgsCn/nNz8OCL7lMZaW220YS1IsXF9u0nZHfHJ/a95zjY7M0Op
ax5cto35URAlMOgYuj9HocO4plb2masjc66bRlqFWZHk+v6tYRd9Qyv1IUPgNVfd
SmE2iTn9ONiC3JsdcTRdqSlsk0mKKu5SMfJtO+9pn8Nbl+RzdFp5csi9Qi1Yats=
=nOtP
-----END PGP SIGNATURE-----

--R7Dyui215VKdTDYA--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
