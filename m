From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [U-Boot] [PATCH 1/5] treewide: include libfdt_env.h before fdt.h
Date: Fri, 18 Jan 2013 10:48:02 +1100
Message-ID: <20130117234802.GE26321@truffula.fritz.box>
References: <20130116175904.47ee25bd2596f28796698759@freescale.com>
 <1358382963.18317.17@snotra>
 <20130117115456.71a38e3275230cdbb175bfe4@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1143808748742527754=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130117115456.71a38e3275230cdbb175bfe4-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
To: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============1143808748742527754==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AjmyJqqohANyBN/e"
Content-Disposition: inline


--AjmyJqqohANyBN/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 17, 2013 at 11:54:56AM -0600, Kim Phillips wrote:
> On Wed, 16 Jan 2013 18:36:03 -0600
> Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>=20
> > On 01/16/2013 05:59:04 PM, Kim Phillips wrote:
> > > and, if including libfdt.h which includes libfdt_env.h in
> > > the correct order, don't include fdt.h before libfdt.h.
> > >=20
> > > this is needed to get the fdt type definitions set from
> > > the project environment before fdt.h uses them.
> > >=20
> > > Signed-off-by: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > Cc: Jerry Van Baren <gvb.uboot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >=20
> > Maybe fdt.h should include libfdt_env.h?
> >=20
> > Or just always use libfdt.h as the public header.
>=20
> Was just following along the same lines as the dtc commits 38ad79d3
> "dtc/tests: don't include fdt.h prior to libfdt.h" and 20b866a7
> "dtc/fdtdump: include libfdt_env.h prior to fdt.h", acked by David
> G.  I don't know why some only include fdt.h.
>=20
> devicetree-discuss/David: is there a prescribed way to go here?
> Change all fdt.h includers to just always include libfdt.h instead
> of libfdt_env.h prior to fdt.h?

Yeah, I think just including libfdt.h instead of fdt.h is the way to
go.  The distinction is that fdt.h contains only "passive"
declarations.  That is, defines and structure/type declarations but no
function prorotypes or other code.  In particular that means that it
is strictly about the FDT tree structure only, and not any of the
libfdt specific entry points.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--AjmyJqqohANyBN/e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlD4jbIACgkQaILKxv3ab8aCDgCgj4SrTqDZEXZQwWdiTeGv3ceD
SmoAnRxaTKMzmug1OZ6VfX1Gz3bz1c3Y
=4yCA
-----END PGP SIGNATURE-----

--AjmyJqqohANyBN/e--

--===============1143808748742527754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1143808748742527754==--
