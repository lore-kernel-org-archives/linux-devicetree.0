From: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH RESEND] display: panel: Add KOE tx14d24vm1bpa display
 support (320x240)
Date: Tue, 29 May 2018 17:01:48 +0200
Message-ID: <20180529170148.7a0363f2@jawa>
References: <20180412143715.6828-1-lukma@denx.de>
        <20180509154338.2841-1-lukma@denx.de>
        <20180519130533.2494bceb@jawa>
        <20180528095519.799adadc@jawa>
        <20180529143047.GB22634@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tHq26l+A4cfRq+LLu7/Txwg"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180529143047.GB22634@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--Sig_/tHq26l+A4cfRq+LLu7/Txwg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

> On Mon, May 28, 2018 at 09:55:19AM +0200, Lukasz Majewski wrote:
> > Hi,
> >  =20
> > > Hi Thierry,
> > >  =20
> > > > This commit adds support for KOE's 5.7" display.
> > > >    =20
> > >=20
> > > Thierry, shall I perform some more work on this code, or is it
> > > eligible for applying to your tree? =20
> >=20
> > Gentle ping. If Thierry is overworked - maybe there is a
> > co-maintainer so he/she could apply this patch? =20
>=20
> Please use the proper prefix for the commit subject to increase the
> chances of this being noticed.

Ok. Is there any list of prefixes in the kernel repository, so I could
look for them (like get_prefix.py - similar to get_maintainer script)?

I've used "display: panel" prefix, but I should have used "drm/panel"

>=20
> This is also still missing a Reviewed-by or Acked-by from Rob.

Rob has already reviewed this patch. I will send v2
with Rob's Reviewed-by tag.

>=20
> Thierry




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de

--Sig_/tHq26l+A4cfRq+LLu7/Txwg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlsNa1wACgkQAR8vZIA0
zr2z8wf/TUucokRWD5MrIG/ev5C1iypB/u/gLpKcYCnEvzCysyOFKciaKEeAIyeC
SpnH6nYkSsEcP8pS65QOqaPQVH79MXwqBTP/vBNI14N1H0VUPy+CZOTiSVnkzri2
B1gkDXnoQ3ccLTO0H0RLr1/qbqDQ6LWlNTktV7U8qN7ETMVXx1jiirxIriMMrmJH
yhPMJ+3cb0gXiv2s63ZrOLT9uh9gezcPvFvvhpxwQITEeUzcC9qnaa3/+gDWcaTR
gXv/L/mXucs4FZ/F9NGKvslEmXiNAlCgNFkEd/vX9jKNVmbCK0WLmh5FTxQJxrVx
qiF1HpdB6xUSbQU3anM1jE5QvTPU+w==
=L+33
-----END PGP SIGNATURE-----

--Sig_/tHq26l+A4cfRq+LLu7/Txwg--
