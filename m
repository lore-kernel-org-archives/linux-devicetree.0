From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/2] uio: add an of_genirq driver
Date: Sun, 14 Jun 2009 21:05:33 +0200
Message-ID: <20090614190533.GA7387@pengutronix.de>
References: <1244765062-14144-1-git-send-email-w.sang@pengutronix.de>
	<1244765062-14144-3-git-send-email-w.sang@pengutronix.de>
	<20090614122136.GD3639@local>
	<20090614171406.GA1010@pengutronix.de>
	<20090614183357.GE3639@local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1593928681=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090614183357.GE3639@local>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: "Hans J. Koch" <hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============1593928681==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Anyway, 0 is a valid IRQ number, so it cannot be used as "no irq".

May I point you to this thread?

http://lkml.org/lkml/2005/11/21/221

(The issue comes up once in a while as some archs still use NO_IRQ, some wi=
th
0 some with -1)

> > 	if (uioinfo->irq =3D=3D NO_IRQ)
> > 		uioinfo->irq =3D UIO_IRQ_NONE;
>=20
> Sorry for my ignorance, but what is NO_IRQ? If I do a
>=20
> grep -r NO_IRQ include/
>=20
> I get nothing.

Try a 'cd arch' before that :)

> Well, you claim it's a false positive. So far, you did not get any respon=
ses,
> AFAICS. I tend to agree with you, but I'd like to avoid patches that don't
> pass checkpatch.pl, whatever the reason. Either the false positive gets
> confirmed and fixed, or you should fix your patch.

Well, I assume that issues regarding checkpatch do not have the highest
priority (especially while the merge-window is open), which is understandab=
le.
Fixing this bug (I take any bets that this is one ;)) might not be so trivi=
al,
as modifying $Attributes can easily have lots of side-effects.

Now, all this does not matter much, as the objections Grant raised are valid
and there might be a totally different outcome to bind devices to UIO. But =
at
least, we have some code to discuss...

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko1Sf0ACgkQD27XaX1/VRswpQCdGQOTi6H0+gDFHCh4zv4gTHiu
JC4Ani63yA5RggVHZtl+yhwY4TdQpdB1
=KDm0
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--

--===============1593928681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============1593928681==--
