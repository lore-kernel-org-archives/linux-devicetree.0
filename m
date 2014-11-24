From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] devicetree: add a binding for a regulator that
 constrains its supply
Date: Mon, 24 Nov 2014 15:15:27 +0000
Message-ID: <20141124151527.GC7712@sirena.org.uk>
References: <1416834123-23139-1-git-send-email-alban.bedel@avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uh9ZiVrAOUUm9fzH"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1416834123-23139-1-git-send-email-alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 24, 2014 at 02:02:00PM +0100, Alban Bedel wrote:

> +Constrained Supply Regulator
> +
> +This binding allow creating a virtual regulator that constrain its
> +supply to provides the requested voltage. This is to allow using
> +simple drivers that don't explicitly request a voltage on boards
> +that have adjustable hardware regulators.
> +
> +Required properties:
> +- compatible : Must be "regulator-constrained-supply".
> +- vin-supply : phandle to the parent supply/regulator node

Reading this description I'm at a loss to explain what this is intended
to achieve - it's obviously not describing hardware which is a rather
large alarm bell and I don't really understand why the constraints
wouldn't be set on the parent regulator.

--uh9ZiVrAOUUm9fzH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUc0uPAAoJECTWi3JdVIfQQZEH/1zCEnN2ttR//WYqwwaJa92Z
IfsafQt4Wn6BZxWaRQ5hajGLL12y/Vv9nqW1oRtE4PfbMDO+SbntYwmbvO1/jcmJ
tegnirXYAiNNPWpz77R8M4ZYzGCje19rqH35gVduDXp20grg03tqYTci2IxEnjjK
b7a4vy/HsAR/orZF8KLf2kV6WuDoxcOPo47+ADOkQVfsDff2ctt1I0Bai98nWVTO
7BSeXocGnbE1M+sduhKD9Bf4SwjbFzpHWQjBOZWGlHXmrAFp+C8zOFjazRbC11JT
yW+aN2Fz+OrEK9Bu2dyodyTGqV+QSNuxDHneM+tHcier2XT7gGircPFc1sLvJA0=
=29wA
-----END PGP SIGNATURE-----

--uh9ZiVrAOUUm9fzH--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
