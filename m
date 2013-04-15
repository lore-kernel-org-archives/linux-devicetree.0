From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 06/10] fdtdump: add a --scan option
Date: Mon, 15 Apr 2013 15:02:17 +1000
Message-ID: <20130415050217.GJ16400@truffula.fritz.box>
References: <1365618555-5893-1-git-send-email-vapier@gentoo.org>
 <1365618555-5893-7-git-send-email-vapier@gentoo.org>
 <20130411041130.GB8165@truffula.fritz.box>
 <201304111844.21667.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3225292770232397292=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201304111844.21667.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
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
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============3225292770232397292==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ELVYuRnMxQ5nnKRy"
Content-Disposition: inline


--ELVYuRnMxQ5nnKRy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2013 at 06:44:20PM -0400, Mike Frysinger wrote:
> On Thursday 11 April 2013 00:11:30 David Gibson wrote:
> > On Wed, Apr 10, 2013 at 02:29:11PM -0400, Mike Frysinger wrote:
> > > Often times, fdts get embedded in other larger files.  Rather than fo=
rce
> > > people to `dd` the blob out themselves, make the fdtdump file smarter.
> > >=20
> > > It can now scan the blob looking for the fdt magic.  Once locate, it =
does
> > > a little validation on the main struct to make sure we didn't hit ran=
dom
> > > binary data.
> >=20
> > Hrm.  I have mixed feelings about this.  The scanning functionality is
> > certainly useful.  But on the other hand, fdtdump is not supposed to
> > be a general use tool.  It's basically a debugging aid: a quick and
> > dirty independent implementation of a dtb dump, for checking that dtc
> > is producing sane output.  The preferred way to dump dtbs "for real"
> > is to use dtc -I dtb -O dts
> >=20
> > I think the way I'd prefer to see this functionality would be to add a
> > new input format to dtc which is a little wrapper around the dtb input
> > format which does the scan.
>=20
> that seems reasonable, but really my use case was: scan a big blob, find =
the=20
> dtb embedded in there, then both decode and dump the offsets.  this was s=
o i=20
> could easily hack said big blob with a hexeditor and tweak a few
> keys.

Yeah, so when I got to your debug patch, I already started changing my
mind here.

> adding a new input format would satisfy the first part (locating the dtb)=
, and=20
> the fact that dtc already supports "-O dtb" is good as it'd allow me to r=
un it=20
> through fdtdump after the fact.  i can probably even chain them in a pipe=
line.
>=20
> i'd still want the --debug option in fdtdump, but it sounds like that wou=
ldn't=20
> be against your desired goal for this utility ?
>=20
> if that sounds good to you, i can rework things so that dtc gets a new "s=
can"=20
> input format (guessing i don't need to name it "scan-dtb").  then we both=
=20
> should be happy.

Actually, you've convinced me.  So for now, just go back to your
original approach and address the other more specific comments and
that should be fine.  When I made that suggestion I hadn't realised
what you were using this for.  Now that I have, I think it fits into
fdtdump as intended.

> on a related note, is there a reason these tools malloc & read in the who=
le=20
> file into memory instead of just doing mmap() when possible ?

Some combination of simplicity and portability.  I've never really
thought about it much..

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ELVYuRnMxQ5nnKRy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFridkACgkQaILKxv3ab8bfjwCbBIbdwri6F4cM85E+RtsFo0OY
Ab4An0uzB8Vx/SbCX2Ssja1/ZfltgO23
=eAk8
-----END PGP SIGNATURE-----

--ELVYuRnMxQ5nnKRy--

--===============3225292770232397292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3225292770232397292==--
