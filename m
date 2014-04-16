From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] mfd: bcm590xx: add support for second i2c slave
 address space
Date: Wed, 16 Apr 2014 22:31:41 +0100
Message-ID: <20140416213141.GD12304@sirena.org.uk>
References: <1397501428-8857-1-git-send-email-mporter@linaro.org>
 <1397501428-8857-3-git-send-email-mporter@linaro.org>
 <20140416110603.GA19671@lee--X1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LAK3FBfgZ514qYSN"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140416110603.GA19671@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--LAK3FBfgZ514qYSN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 16, 2014 at 12:06:03PM +0100, Lee Jones wrote:

> s/regmap/Regmap

It's consistently written regmap in all the documentation and so on :)

> addmap{0,1} doesn't quite sit right with me.

> REVISIT: Ah, it's address-map, rather than add map. Okay, not as bad
> as I first thought, but still, is there a better naming convention you
> could use?

addrmap or something?

--LAK3FBfgZ514qYSN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTTva6AAoJELSic+t+oim9LLsP/1UtaZD4+crkbY14/E9wjarT
UnLzJHw+wH6iq6KagICOVoi2XkrpRDq14iYWdkZrct7Z7tlUaehHzrpEMwOZndfo
kKVIMwVvdhxtto2yAp0MnmlKloyo7vTj0WzF2VnliAnnbT/db+xXOpEF88X88wtd
6D3OrRRbx2YnRNI+A/whZrcYCBNCWQpPzJxv1VUpEUo3seaDHbAfnzj5+07KhpFM
hFeSPW92R2gOocEpNfKEVJoQJgArmM70nlldD67UaxgNcp33khTNfYdKhhScJp+9
i0pWQwl/IzUlhjKEX7IlQ+99yv+d6p8aJSc6dO8zgcKQwquBvEbdbN5KtlCuTfi+
EnNug7SSTB9BFzuSARqftr9y05cg95h+raIePVt3IiGiEKkzHG5dhZTEDCfDGglm
Yk/5WVgUDin5OIO6/QSTwMhT1pWck7oFbHzdHZhWMDE/VwhBCgnzGJXDShUCHhY0
eLEdxGkW2C5rUKp6dAocHp7w6NxAxJEqNs3yNT4OuIud4+mCy7TYWch+Xdtl0eRD
fYyOL0x93JDyyAgnN+D1VNps95pYrqio8JYQzz3667UYGrAM9HXLZYEd8jAV2si7
j1bdPlGOUybjBk2eGQ+vSFaINcXWW0AOaOXmwjVdSp8cTSKouXtijz6EUlX13/JU
uBa+VOgoolz3VZrRvuqo
=20+M
-----END PGP SIGNATURE-----

--LAK3FBfgZ514qYSN--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
