From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 7/7] ARM: sunxi: dt: add PRCM clk and
 reset controller subdevices
Date: Thu, 8 May 2014 09:29:34 -0500
Message-ID: <20140508142934.GV7047@lukather>
References: <1399483554-8824-1-git-send-email-boris.brezillon@free-electrons.com>
 <1399483554-8824-8-git-send-email-boris.brezillon@free-electrons.com>
 <20140508031700.GO7047@lukather>
 <CAGb2v664vFwezKVp+C1UYdsUktRhrZDxjsyf9L=kwVHGCUV=HA@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U8v/hV883cEE9JJG"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB7VJV2NQKGQE4XFGJJQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v664vFwezKVp+C1UYdsUktRhrZDxjsyf9L=kwVHGCUV=HA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin <kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dev <dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--U8v/hV883cEE9JJG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2014 at 11:40:59AM +0800, Chen-Yu Tsai wrote:
> >> +                     apb0_gates: apb0_gates_clk {
> >> +                             compatible =3D "allwinner,sun6i-a31-apb0=
-gates-clk";
> >> +                             #clock-cells =3D <1>;
> >> +                             clocks =3D <&apb0>;
> >> +                             clock-output-names =3D "apb0_pio", "apb0=
_ir",
> >> +                                             "apb0_timer01", "apb0_p2=
wi",
> >
> > timer01 ? is this a typo?
>=20
> A23 manual lists the clock gate as "r_timer0_1", so I put the name on the=
 wiki.
> Allwinner sun6i code uses "r_tmr" or just "tmr". I see no problem naming =
this
> clock output as "apb0_timer" though.

Yep, it seems better.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--U8v/hV883cEE9JJG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTa5TOAAoJEBx+YmzsjxAgwU8P/j2X+dDTlbYIgu1VHdkQ7vr9
F7dQkhN7I4ZfqA3VTl62UZcMnDsU04Pz97xps3zzMZM5sEGi88u4DEXhDPsdGuVH
QrqWBKV0pfit5ZY/IU/Y7ZhIvQhn60lezctCYfOwC0gtscZRB9jeaHFp5Vx6n9DE
J0WQJS2/khjHP37qlnBdmFgaqekKVEbFHN21xPQY0xtYhyMaQQ1CZ3h5R/WhbI+Z
eFMMY6KMRHhVybvWdAV73bYfCGeXDfbCKon+zl4Z16bf2ymqWnqB0Rz+4nkK8iKB
BCt7H5Jq80MRQT/0RwMy4EMV8djKolCaVdZL6e48DKcMeKKJUg3XjCRlqrNt73Zk
QaejygSnRlRPiEZPf3nGlyAtXQOZuPERT+2qQefSMs16aF3kQMeBnxHLAQIKrToP
T3D6/tnZRX3heL6C0mZTrgx1jKIqahzl/a1NTTnbmMmYm033SS3XRVe2iElu6uVZ
UOlleb7K0oEnPU2bmoc4odUF1uR+fEcNTnx5TXGdnyNnNnKFM5y/PQPpcbIla11n
rGRLe1Kr4/vH4lUi6IkNdm615o0cuHz7ASxebbhPG1XxmHvuaPOG0gQADO1guh4y
3jLgpqbeRFM1FbLn+i6+vLLGzrb7qAS7bvcpY7Qd68hkpiZfXWv2DcujWNOZ4FaH
+Xsr4+ZZb5M5XO2hYMfY
=7LYo
-----END PGP SIGNATURE-----

--U8v/hV883cEE9JJG--
