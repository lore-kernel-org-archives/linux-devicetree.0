From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv10 4/4] dt: mailbox: add generic bindings
Date: Fri, 1 Aug 2014 19:43:14 +0100
Message-ID: <20140801184314.GM30458@sirena.org.uk>
References: <1406896194-4667-1-git-send-email-jaswinder.singh@linaro.org>
 <1406896365-4971-1-git-send-email-jaswinder.singh@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="11IAkegDWp8TRrA/"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1406896365-4971-1-git-send-email-jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org, lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, loic.pallardy-qxv4g6HH51o@public.gmane.org, s-anna-l0cyMroinI0@public.gmane.org, ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bjorn-UYDU3/A3LUY@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mollie.wu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


--11IAkegDWp8TRrA/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 01, 2014 at 06:02:45PM +0530, Jassi Brar wrote:

> +Optional property:
> +- mbox-names: List of identifier strings for each mailbox channel
> +		required by the client. The use of this property
> +		is discouraged in favor of using index in list of
> +		'mboxes' while requesting a mailbox.

Can I suggest that if we do want to avoid strings for some reason (it's
not obvious to me why) then we include a recommendation to provide
defines in a header file in order to improve legibility.  That's pretty
minor, though.

Reviewed-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

--11IAkegDWp8TRrA/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT29+/AAoJELSic+t+oim9Z0gQAJRm9uoGH3PxJ/IPZhHouqJQ
sC6tl9efWmMQg2WLo/ZYGJoiRjwV2tfvpznyex11zYHMtVJU1rj5nKxd0IGVA+ux
qA5gH2h+hJF8SkoYqcu4IuTyCvv0arBx3fly+0XyH0kH306gI38JapCX7eGrK+Mo
fjdub/UXSc79anNC34qLcB8V/s6VoIJYiM/IPoLgShdjyM+ZRQBvhNZ65RUmPv+l
uqiFvgIHztXFjGTfXbqvoZ0ZPgWBoDEIELrmeXIzynCTBuUxFHUOeQwBCvdHlztd
fj1VT5qTu6l13Sv2lDEU7oWVjrPUF1Kk44Kxk/NJHoW+NSSD6AJexdxj3ae8SHLK
9DoiAbPxB948ylihypZcMEDWElvVMGr/rJKK1losETK4GOywOGo4TsWZEGt49zkv
NYY8B6SMbWAKSL2MN+bdh9ZFhQUyRb+NWZVLDQSMVGmBm9Vo4tXx2eEro461JgB/
YeNH45+s2Z46s23/ffwKGb9/2as6ZaXyBbyJbHqkK6gv6Np3N2+u5GFTmq39HRqK
JA3Dsd8/wjLSYBkVhfawAZWIzwNxhLXyO0CRgG0AOuhhdImZnN3q4UIweWMnILWE
DuF50NOEgFK9/NLR0xHHQAUTLfzAmbsVYJzeNdQmrqjyhXIMV8mPHyC725f+/tin
nUvhiv/NIDoWCAYdONkq
=00ie
-----END PGP SIGNATURE-----

--11IAkegDWp8TRrA/--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
