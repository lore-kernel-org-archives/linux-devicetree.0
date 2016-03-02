From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Wed, 2 Mar 2016 12:38:33 +0900
Message-ID: <20160302033833.GV18327@sirena.org.uk>
References: <1456756829-2277-1-git-send-email-ldewangan@nvidia.com>
 <20160229174751.GQ21240@tuxbot>
 <20160301022326.GC18327@sirena.org.uk>
 <56D5111E.6090606@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Xzmf5to6u68F9h9L"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56D5111E.6090606-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Xzmf5to6u68F9h9L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 01, 2016 at 09:18:46AM +0530, Laxman Dewangan wrote:

> HW team characterize the board and its rail and come up with the following
> data:
> - Configure PMIC to 27mV/us for ramp time.
> - With this measured value of ramp on board is 10mV/us and it is safe to
> assume 5mv/us to consider the board variations.

> So we have now two input from HW team:
> 1. What should be configure in PMIC.
> 2. And for calculation, how much ramp need to be consider.

> For (1), it is 25mV/us and for (2) which 540% (27 *100/5).

> Currently, we can provide the 27mv/us as ramp-delay but do not have option
> for scaling it.

You're not trying to scale the value here, you're trying to replace the
value because the PMIC is incapable of delivering the advertised ramp
rate.  Trying to express this as a multiple of the advertised ramp rate
is just adding complexity.

--Xzmf5to6u68F9h9L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW1mA4AAoJECTWi3JdVIfQ3D4H/jEdX5YUnyEfNU0AWxRh7XAX
9R4H+hULBvJ1XyIpcqCaZHitrvTRQvlErBaHszPL6RPW9sVOMxzquOyj8q0J+MM2
UszR34/Dr0+vvYBTdX25F2MRnDCjsmLKOqvKMQXug1HaQ91x3cVOl8reqta06bMP
9ChV9uqtXJ4Tf30/y3nglkhzMRSSP3HZN4FaTwjanJQLAzj67XXImt4YbuxqYf+V
PrSAU8tA4y4xhArtd1kWI7LsHeX1f0+ILqai8eoq2nfDWi51GIXqqJfIQi/GSVtd
f7ZKfYa1OE6ElrOzYHCNaMcmFa7dpmlVcY5+3qY+CI783QRrOBgiTS0Met4RxwE=
=FbhF
-----END PGP SIGNATURE-----

--Xzmf5to6u68F9h9L--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
