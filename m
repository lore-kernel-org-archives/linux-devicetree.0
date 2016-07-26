From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 6/6] libfdt: Add overlay application function
Date: Tue, 26 Jul 2016 08:16:59 +0200
Message-ID: <20160726061659.GT7419@lukather>
References: <20160720142044.27527-1-maxime.ripard@free-electrons.com>
 <20160720142044.27527-7-maxime.ripard@free-electrons.com>
 <20160724142908.GF24621@voom.fritz.box>
 <20160725182041.GN7419@lukather>
 <20160726001859.GF17429@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hLTC+yGFJlatjToQ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160726001859.GF17429-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--hLTC+yGFJlatjToQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2016 at 10:18:59AM +1000, David Gibson wrote:
> > > Again, off-by-one in this test, I think.  Since there are so many
> > > tricky edge cases here, it might be worth making testcases for them.
> >=20
> > What do you want here? That we move the parsing code out of that loop,
> > make it public and put the prototype in libfdt_internal, or that we
> > craft some DT that would outline all the possible issues with that
> > function, and just test the return code of fdt_overlay_apply?
>=20
> I was thinking crafted DTs.  But I've realized that doing usefully is
> pretty tricky, since overruns probably won't cause an immediate
> problem most of the time.  I guess they'd trip errors under valgrind
> at least (as long you make sure there's at least one byte's alignment
> gap until the next tag).

Is that a general comment?

I'm still not quite sure what you expect from me. Do you want to test
just that function, or only the fixup parsing function? Should I run
valgrind, or are you expecting it to be done later?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hLTC+yGFJlatjToQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXlwBbAAoJEBx+YmzsjxAgN9oQAKPPsRWZ+zyApkZlio9Gdd//
VBtZQ6rik8vKdwSYkP8M78q8EQbvvPmHINxlFEUKnfFvG0DDQHiOfjHwRIJWDcZO
DFN59JWS990Y3CvnzkQEurXSg22Ga67S4FXAZQ4nxL8DxtMmFfQ6yEDA5NJUf8Rt
fXaqX5pEA6ORN5vTkA7bqt/l1W35ewk6uuLuwo1CXvlQsqp9mQHuS+X3Ucw9Z7xU
PIx7/TbcJpfEtVOs/HVZuJCC8wQ6O8aR+64/a3skKVRxDu/17k/kAtf40jHgeIMk
NilhX8BFaImGrkPk8Z10vxnz0nLrvjhThxyPqn9k4gBBzYegNpAx/tnfF9SV5rrk
PcPgIbDFtexMMNW/8Q8Z+vimkn6jyB1tdP9uv2ImlTij275sszYf06XmGFdz+aTv
Lt1UEKyl+ZKWhpTRpHQE2QWvxOlcKejp+m0Y0sf4+1H1IyCYLlWb+TnVIaV8wddL
R7OueQoQC2bn7ArJ/c+AmrikiPRPlQ2p/hjiq8DNHlTaCOET4639LEKPT6gPPoK+
Umxc7wWw+E77otspLC43rVy1ZMxiiZO7pt8sOLg0hDBI0ryEL2ZYbcRLio/03QbS
IbIMEVK+PTQMyYz951YEeHVSQR7zGHDncRc1TpbjyHw/AEtiRBviKxoUC6FidfmF
SvV6AfqIU2RLnuejsQEA
=RIxr
-----END PGP SIGNATURE-----

--hLTC+yGFJlatjToQ--
