From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv10 0/4] Common Mailbox Framework
Date: Fri, 1 Aug 2014 19:26:56 +0100
Message-ID: <20140801182656.GJ30458@sirena.org.uk>
References: <1406896194-4667-1-git-send-email-jaswinder.singh@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aRuUY7KzmetiZjaI"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1406896194-4667-1-git-send-email-jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org, lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, loic.pallardy-qxv4g6HH51o@public.gmane.org, s-anna-l0cyMroinI0@public.gmane.org, ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bjorn-UYDU3/A3LUY@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mollie.wu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


--aRuUY7KzmetiZjaI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2014 at 05:59:54PM +0530, Jassi Brar wrote:
> Hello,
>  Here's v10. Not much different from v9. The code and the generic
> bindings looked good enough to relevant gods, but the patchset still
> needs some formal loving in the form of Acked-by's.
>=20
> Changes since v9:
>  o Purely cosmetic changes - added headers and used BIT()=20

Given that this code is now getting very stable can I suggest setting up
a git tree and making sure it's included in -next?  Just send Stephen a
mail with a pointer to the relevant tree and branch and ask him to add it.

I'd say it's probably worth merging at this point though since it's not
been in -next yet and the merge window is likely to open this weekend it
might be a bit much to try to merge it this window.

--aRuUY7KzmetiZjaI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT29vtAAoJELSic+t+oim9dA8P/A+FpIIsTly/rMkM4zGMh/v0
BYIZyAxSl1AcOaXx2W1LnbW46bWFjGn/6bADpa2l0J7VV4ia03dyk8p28YfvFq2v
65tOuNRAiqmqv9+BXVG/w4IMPRj7SpTYG9p6i/vz7GG2GKB/FFe2MaaGYzcWgbr1
TkOeXhinDuyvd4gQsg4f2GJI4djhY0KWnU41R02rMWZwBbVnfJSEqFbwo66XXboO
Uvw1l9WCK56GqJVf6pR4tNSxqD+8fp9dpJXrdyaZ9Ul08atd2xpR4jyUraljSqAG
fTar2Vy474LMh8aDfS8wEPXbf4AuEwq0PzUvBTY1/rJMT8g1kvURiJ3+h2ihKNAN
3EJ+rPEcsCmlB04BP3/Y2BF1HDNM/51uVbekF7xvOaTCK01N8MBfth4D38plm7Hh
IqaVezfrSrgo5cz8/xssii4NFYbZGSKtVs6Z0oIZijME+YtEqQrLuAG2kRNdLzDR
DANb7dtB3U848vn9hQaCJ5HPGYjHfS21O609oSAltwkXdx2xYh77McVn5AcKw5ax
lvAa7wahag7Z40zSnZpFJV0bPD2TDKpZgFnDRWF07m24VGhnPLnY+HXFEG5BISaT
bSOIXfPdsLsXEpmvnxIdl0ToavzW4TfQbeCL5RIPU++fjoOpbgvTMbO3ayAlfT0r
dYZttikv27G4WqMPhNXl
=xtYB
-----END PGP SIGNATURE-----

--aRuUY7KzmetiZjaI--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
