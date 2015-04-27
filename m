From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: sunxi: dts: Add A10 uarts pin muxing options
Date: Mon, 27 Apr 2015 11:52:57 +0200
Message-ID: <20150427095257.GO5627@lukather>
References: <1430043338-28982-1-git-send-email-richard.genoud@gmail.com>
 <20150426161157.GM5627@lukather>
 <CACQ1gAgkhxpHxWSRSQe3WNG7hj+EEyS3Yzsnf7TpHQV35jFhGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/UvyDgxjlFfP/4zZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACQ1gAgkhxpHxWSRSQe3WNG7hj+EEyS3Yzsnf7TpHQV35jFhGw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Genoud <richard.genoud@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--/UvyDgxjlFfP/4zZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2015 at 08:36:02AM +0200, Richard Genoud wrote:
> 2015-04-26 18:11 GMT+02:00 Maxime Ripard <maxime.ripard@free-electrons.co=
m>:
> > Hi Richard,
> >
> > On Sun, Apr 26, 2015 at 12:15:38PM +0200, Richard Genoud wrote:
> >> The A10 has 8 uarts, only uart0 and uart1 where filled.
> >> This patch adds all the missing uarts(2 to 7) pin muxing to the dtsi.
> >>
> >> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
> >
> > It's obviously correct, but I'd rather not add new pinctrl nodes that
> > don't have any users so that it doesn't bloat the DT without any
> > particular reason.
> >
> > Feel free to resubmit this patch if one of these nodes become actually
> > useful.
>=20
> Ok, I'll resend-it with only the uarts accessible via the cubieboard
> A10 expansion headers.

If you're not going to add new users for these nodes either, don't
bother.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--/UvyDgxjlFfP/4zZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVPgb5AAoJEBx+YmzsjxAgTTIQAJ+SPAE34bPuedPhA9T3Zml6
Jvr+NzB86oF4KFMCcPS17eJNBhR7Odh7oZhnxiS64UrceZumsn+9bqDQA/Pi0dZr
+WeugEFAfAVOQCk7MxUmMzsrJwfoJ2V5VPJwdyHwtiQpF6LvEKWEFZYZnnA0GwtM
WCylaKXJEh+O2iC4MHG5MAdsBjsHHD+WhpWlI/xBPOOBBA+DZdm67loxhU86Vuhp
spRGb+TQuiF8Hyo+vX1R4LCKm4TwbkPEu1vUkak0RmlwsEmEPo/+dDzoVsN9JD3j
vKM9fg0dt0X3vrEkx/toSBV5LBdiiuRtUgec/Xg18bJYcRwZNXDOxt9rpH1E3ThC
MniSVUOKVjns701SRL6cKeDqc9Y7kKOliwZY5MRz/7876iF4phePxk1gurerIUg7
BWwY1NXkWcrwuWHVa9yQ+NUPkRjDL9ldIbJQt0O8LjluPUSI4Lk+snnF3vZpqCem
5DDnfsKPPF6YrJKCfmDlgx6mZVqUzN85qje2TSCRxgpyflSdv/23ByPApbwIzpk8
QlIHTLoke8t8n4SXmfsXzV/R9pzoaf77l92XjNTv//kQJKAUYyNHZlQbiDeKbeIJ
lYaDkbPyKAvQhH4QsZuP6oSCk8rBuxfXgRYuCbM5CZOUlVCQOanc30oLA1E3z2sB
s6t9l7CEbQGoyojkBHld
=qPK4
-----END PGP SIGNATURE-----

--/UvyDgxjlFfP/4zZ--
