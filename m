From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/3] libfdt: Add function to find regions in an FDT
Date: Sat, 23 Mar 2013 00:18:49 +1100
Message-ID: <20130322131849.GH13838@truffula.fritz.box>
References: <1360968578-18443-1-git-send-email-sjg@chromium.org>
 <1360968578-18443-2-git-send-email-sjg@chromium.org>
 <CAPnjgZ2uPRtDZXt1AwtAnp702sEya6OxtDpEy1kUD=Wox=0CfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1743545220219894303=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ2uPRtDZXt1AwtAnp702sEya6OxtDpEy1kUD=Wox=0CfA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============1743545220219894303==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bg2esWel0ueIH/G/"
Content-Disposition: inline


--Bg2esWel0ueIH/G/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2013 at 08:46:12PM -0700, Simon Glass wrote:
> Hi,
>=20
> On Fri, Feb 15, 2013 at 2:49 PM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > Given a set of nodes and properties, find the regions of the device tree
> > which describe those parts.
> >
> > A test is provided which builds a tree while tracking where the regions
> > should be, then calls fdt_first/next_region() to make sure that it agre=
es.
> >
> > Further tests will come as part of fdtgrep.
> >
> > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> I just wondered if there any any comments on this new version?

Ugh, sorry.  I've been tied up.  From the little I've glanced over it,
I'm still having trouble getting a coherent feel for the overall
concept :/

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Bg2esWel0ueIH/G/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFMWjkACgkQaILKxv3ab8YACACfeyBib+Oc3mWD+fBy6WQ73M2Y
4hMAn2+smFTWVHVz7GpL/pDZYR+U1VDD
=zZJf
-----END PGP SIGNATURE-----

--Bg2esWel0ueIH/G/--

--===============1743545220219894303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1743545220219894303==--
