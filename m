From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: fixed: use of_property_read_{bool|u32}()
Date: Sun, 1 Jun 2014 13:50:11 +0100
Message-ID: <20140601125011.GI5099@sirena.org.uk>
References: <201405252350.40402.sergei.shtylyov@cogentembedded.com>
 <20140526151958.GU22111@sirena.org.uk>
 <53837AEE.7030400@cogentembedded.com>
 <20140526175648.GG12304@sirena.org.uk>
 <53838184.9070401@cogentembedded.com>
 <CAOMZO5Dg-rU5qFSYJEK9h1PwuN6Y099LVjHWOqSwV0Ro6PxFTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BkEY3RoTgCMsaH6y"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5Dg-rU5qFSYJEK9h1PwuN6Y099LVjHWOqSwV0Ro6PxFTw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--BkEY3RoTgCMsaH6y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 26, 2014 at 03:07:01PM -0300, Fabio Estevam wrote:
> On Mon, May 26, 2014 at 3:01 PM, Sergei Shtylyov

> >    The problem with LKML is that it's always suggested, even for the very
> > minor patches that should not be of interest to the wide public. I'll keep
> > in mind that the regulator patches are discussed on LKML.

> Maybe a linux-regulator list would be helpful?

We really don't have enough traffic for it to be useful I think - it's
not like regulator is unique in this regard, there's plenty of other
subsystems don't have a dedicated list.  The only thing it might help
with is patchwork which is too limited to pick things off of the main
kernel list in any useful fashion.

--BkEY3RoTgCMsaH6y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTiyGAAAoJELSic+t+oim9nMoP/AuvrR8ISGGFInoa+CiYe8rJ
4ZDXzqDDRuAcuSUvbqg6OXxdNcPN1zkp8IQVLMYkIrsyiLykKezhucOkgrgaNfpM
3sP98XaVFnTSH3NIUg1mRGEzotA1RjpyRay0UCxCf6EocdBSuedZBkODUF+hl59z
+xjXwI85W1nqUUPaZFrBdilOeRZXMeFMWLCD9/Ojs9Jk1xjPNqgT7HxDJ36xMObP
yboKz/t7X8MVWVUftzn4l0GDrBmTJ+3BAxga5gQ1o4ZkkckceWww82pGbK73g9nR
6RxxeSK/b8F2BNlSbCrxpUV3rZF8ewhsA1g0FvWkfc2NVXDXpG7/hXmbWc/jCqQE
flYPi9PSeAayjwPjpZHdzaCmpIPKvTJDHG9M0f1MO5Akao/0Aoir4pFm+FSsoJcK
n2pfnBWdfOLoEEZfMXLfJNfV6iDQvBE4LwP2/8tm1hG7DAK4R761Cu1Jd+knacLv
oaM0QVWgX+XG2U4DW53r/5TC/dSCU0lAJ/XnNoU4zmQ+lBjtcbQluutIQY6/fPZm
VbhoITiNvT7VuHbx3aieZu5vOyZ0AzcFLVEQikaWUXMzc1alZbLICJ297gUFqvFw
jtjzI4coJsxlpNH77n93ZwrYsSvzdlW4KQNbhPIzXHI5W4BuEzcddfmBdlUB0dIQ
lDnmRgbaZz+pysVwzaDO
=7RLW
-----END PGP SIGNATURE-----

--BkEY3RoTgCMsaH6y--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
