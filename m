From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: All device tree bindings need maintainer ack or just the
 'interesting' ones.
Date: Wed, 18 Sep 2013 16:05:57 +0100
Message-ID: <20130918150557.GY21013@sirena.org.uk>
References: <52345182.1080609@kernel.org>
 <52372F2B.3030504@gmail.com>
 <20130917081003.GU16984@lee--X1>
 <20130917112433.GB26737@e106331-lin.cambridge.arm.com>
 <20130917120730.GW16984@lee--X1>
 <20130917133025.GD26737@e106331-lin.cambridge.arm.com>
 <20130917134841.GX16984@lee--X1>
 <20130918135803.GG26737@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1RuPiyELjUd36Oro"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130918135803.GG26737-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, "benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org" <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--1RuPiyELjUd36Oro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2013 at 02:58:04PM +0100, Mark Rutland wrote:

[Devices matching the Linux internal devices name as a compatible value]

> Judging by a quick and dirty grep [1], as of v3.12-rc1 there are ~930
> suffixes which *may* be accepted with an arbitrary prefix as an I2C
> compatible string, of which ~750 do not appear in
> Documentation/devicetree. For SPI there are just over 400, of which just
> under 400 aren't documented. Both these counts include drivers that may
> never be built for DT platforms, as I've not filtered the results.

Personally I've always viewed this as being an attempt to be liberal in
what we accept with regard to buggy device trees rather than anything
else (and I do push back on DT bindings that don't include setting a
proper match table up).  For all practical purposes it should generally
come up with the right answer.

> We don't appear to have any clashes yet (with "vendor-a,device" and
> "vendor-b,device"), so maybe that's not an issue -- we can add
> of_match_table entries as required to disambiguate, though we have to be
> careful to capture all the prefixes already in use.

There are some chip naming clashes out there - both Wondermedia and
Wolfson use WMxxxx and there are reused numbers for example - but it's
not common and generally bus types will disambiguate).

--1RuPiyELjUd36Oro
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSOcFSAAoJELSic+t+oim9t5MP/RabpJsTf8MrRWn0PR3Wm6+Y
4xiNKAFgGJqgHjFk73P6c9mEOI/+6+zc5lnAk9ZTgB4juQMBO0uXcuvGs1TJyBu3
zJFfyyMp358Tiz6NdpAovRS5i4WqThmh2+d+dm5yuBFDutmkeXmas0BAd19Li0Vu
LLdMwa2m1EumcAWhJzxDfHAEEy+sRzlUvmrdgcxg4jXrwJARVNjGWx0m1s7aH3KP
g9jwG/C5iPTpHXawyD2nIPbniyjxs1kxikMgcjRlCpWmshIyhioIC4nSUVdJudgd
8UOllXoA7MldrVe9vZVPXtuJQPwCW0xJw4Rb3FVmsIFXaPksdlflKxiw6pbySatV
xbYfOlP+Htm0b/XZi/LgLaNpsz8ku5v8L9GBcxpCv0SsfJt6EANrZrwyXKpo3FTW
4nVVgTcOkBQY2Uine+84UjS1tnHEbk4X1zQPEYFEJojKKgRu8bzPsiUYbVQRr5sK
GZj3vmLOLK5kw+l5u+ed+f2NuvMOLTIKYZfIX7xgjBnIAKyv45qE6hRH3oUV87wn
1d330nJK+aKnMk32SArkcjEpYAAvboTppLwulixCPFCzM0q8vgzfmprJMEAyrUxW
+cB9otE7Qbnd9Un2wrOaVRhwD51Ct5JuspUCqL9ykwA+0lI40umCfwdwP4q8ozm+
qK7kyM4OG+16nysWN/bJ
=qH4+
-----END PGP SIGNATURE-----

--1RuPiyELjUd36Oro--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
