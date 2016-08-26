From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC] drm: implement generic firmware eviction
Date: Fri, 26 Aug 2016 15:27:28 +0200
Message-ID: <20160826132728.GC30441@lukather>
References: <20160826000056.12806-1-dh.herrmann@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160826000056.12806-1-dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 26, 2016 at 02:00:56AM +0200, David Herrmann wrote:
> Also: Does any platform make use the of 'display:' entry in 'simple-frame=
buffer'
> DT nodes? If yes, how do I get access to it? And why don't vc4/sun4i make=
 use of
> it, rather than falling back to remove_conflicting_framebuffers()?

For the sun4i part, I'd say because I wasn't aware of it :)

A better argument would be that most of our device tree don't have it
at the moment, and we might boot on older device trees. So we need a
fallback solution anyway.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXwEPAAAoJEBx+YmzsjxAgdEMP/3+ljSzboBBFYFj4F7Qo8piu
yLyeZC8Tp8ZePhfUrw6fkktUmosEaEdEVWAPI4UBjp/cRMloQYJ5NJBxZnC4mBvW
KGMqcEcxD2dOxApqSyqGLSSvIGT0NyJx/3UzfakAf0NUU8846ywCSj70ycRwrFPh
wEaUNt0dUu7zgKmT1CYxAC+hwTXdWrkRlvFfQxJkkuvHkhZxjZRrI/VvaoWNRj8K
9VOl+mVkbIVQvGqGJCF7wzv8W9noH4WPOZdURkdnCzRvbrghA7i+UI8QPv+TAhc6
xfnjBFjQD8bKzN3pLSTxzXBUco+/5W+QiaCVGTHk0Y++iDTNzzoOciuJnrL1i7+9
GfXSs6uMV5YEiPms4VEPZ2plNEZD/7o9j+AYBR77jq2jpOSGkCDInRq8QvIb3i5D
WH1Z/jLX5DHL1boN8u/37VJwmJcW4MGto3J6qqBo6m3ir1RDkKG3FBBEAQGB/UFE
m+pwrDqG9tDuk0hUVaXFCl9t77fLSraKc5Qg+T0BClbiUhqEJI/o1YT5T8CNcT5T
mZrNgl5l/GVr7hTrBDS5Xg4ocyedHsRQ34bqnBN5r0l6DWMuSeC6foNh9bPV7I2a
5jmFlEUnq4TkImjdKGk+zyVCHGqHehUuZ1lYml+aDzE/xzoZqINqHV3dhTECGgYW
CwXSm7b58lZvCMmro/iy
=5C7o
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
