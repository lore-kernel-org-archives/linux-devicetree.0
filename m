From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 0/3] dtc: Dynamic DT support
Date: Wed, 4 Mar 2015 21:18:56 +1100
Message-ID: <20150304101856.GD18072@voom.fritz.box>
References: <1425063346-14554-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gE7i1rD7pdK0Ng3j"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425063346-14554-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--gE7i1rD7pdK0Ng3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2015 at 08:55:43PM +0200, Pantelis Antoniou wrote:
> Enable the generation of symbol & fixup information for
> use with dynamic DT loading.

This still needs a lot of work before it's close to ready.  I'm mildly
dubious about the basic premise, but more importantly there are
serious flaws in the current implementation.  More details coming once
I have a chance.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gE7i1rD7pdK0Ng3j
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU9twQAAoJEGw4ysog2bOSo0QQAIiClHuk7OH9hj2Q3hsNALNT
aMdGofAgW9iR/H8KiiQBe3xU2kk+eLpdESnghL5owSB6LsSP4BPm1Qfqns9/MNzu
63HrlT4xEY8+L7eZKHSUkgzIxzsPBJmqrqGO+FJcoIUxLtasY8fS113stzIqsv4d
LMytNXSGXsSE6LQ69Y3CRULUzXXIR/mhDhoMyisJSaCgYelcCQ97Fx1uF4J4CA1Q
6NuFxI3M5XBrUp8tZA+0l9kZbP1CoK1NK9rIOAqNeLUAAHXf27PvLwWZpFZAODyu
CPnfI0Yg6ZGoph/pbdRTc1EjKxPlgNhyz5cpQqSRziAfOqrrTOL+hHS8dBdIgpeN
uh5OP3sM5fOHWtFJNkLanM/1uHVAcLbRqgipZz5GlgvAELgzi7HY2ClehEARejr2
EAo3vNL9yI4i+X6CaoXZwJGhw1lgXQBniMWGk7VUqmcyd7q150RuhUkMsGvHDAOZ
7cPifONeEd62uNd5Pxxuw2dI2Ur8uMltLcATDovPnG9o92YNZ3SK1mEgpBadpYM/
U0UbTdrgVVnG2ODCZvhnC+heSNHpSdLBu/ZLiCAdprk3+W5sMrUYCmBTin5SeuUO
2Oihal4GCHQbNMzj40neE5RMcQ7yMvdcj4I5B5KZwMSlQWH2LfQS7ueoQnDd+TGj
jTmzE3kfPQJpr5EgUXa0
=+szL
-----END PGP SIGNATURE-----

--gE7i1rD7pdK0Ng3j--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
