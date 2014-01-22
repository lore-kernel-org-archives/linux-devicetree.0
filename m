From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/3] dtc: Keep type information from DTS
Date: Wed, 22 Jan 2014 15:49:45 +1100
Message-ID: <20140122044945.GF21650@voom.redhat.com>
References: <1386953352-25402-1-git-send-email-t.figa@samsung.com>
 <1386953352-25402-2-git-send-email-t.figa@samsung.com>
 <52AF41A1.3000508@wwwdotorg.org>
 <20140121120606.A2E7CC4054E@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qOrJKOH36bD5yhNe"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140121120606.A2E7CC4054E-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--qOrJKOH36bD5yhNe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2014 at 12:06:06PM +0000, Grant Likely wrote:
> On Mon, 16 Dec 2013 11:08:33 -0700, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org=
> wrote:
> > On 12/13/2013 09:49 AM, Tomasz Figa wrote:
> > > Currently dtc loses information about data types when parsing DTS,
> > > because it flattens all the parsed property data into a flat stream of
> > > bytes. The only saved metadata is for references to other nodes inside
> > > cell arrays. This makes it impossible to do any checks on data types =
on
> > > livetree representation.
> > >=20
> > > This patch makes dtc store type information inside data struct by usi=
ng
> > > marker infrastructure. A new type of marker is introduced that holds
> > > type enum as its ref member. Such markers are then inserted wherever
> > > data of given type starts, so information about type of each property
> > > data section is preserved.
> >=20
> > > diff --git a/dtc-parser.y b/dtc-parser.y
> >=20
> > >  	| propdataprefix DT_REF
> > >  		{
> > > -			$$ =3D data_add_marker($1, REF_PATH, $2);
> > > +			struct data d;
> > > +			d =3D data_add_marker($1, TYPE, (char *)TYPE_STRING);
> > > +			$$ =3D data_add_marker(d, REF_PATH, $2);
> > >  		}
> >=20
> > I guess here, the lexer does give us a string that's the target of the
> > reference, so this is correct. However, I wonder if semantically we
> > shouldn't call this a TYPE_REFERENCE, so we can distinguish between
> > references and regular strings?
> >=20
> > > diff --git a/livetree.c b/livetree.c
> >=20
> > > @@ -530,16 +530,24 @@ cell_t get_node_phandle(struct node *root, stru=
ct node *node)
> > >  	node->phandle =3D phandle;
> > > =20
> > >  	if (!get_property(node, "linux,phandle")
> > > -	    && (phandle_format & PHANDLE_LEGACY))
> > > +	    && (phandle_format & PHANDLE_LEGACY)) {
> > > +		struct data d;
> > > +
> > > +		d =3D data_add_marker(empty_data, TYPE, (char *)TYPE_ARRAY_INT32);
> >=20
> > Similarly here, can we encode as e.g. TYPE_PHANDLE or something like
> > that, so we keep the semantic information?
>=20
> I think both those are reasonable and useful extensions also. On the
> whole I think the patch is the right thing to do. Feel free to add my
> acked by:
>=20
> Acked-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Still a NACK from me, I think this is fundamentally the wrong
approach.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qOrJKOH36bD5yhNe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJS303pAAoJEGw4ysog2bOS99gP/3xeLeceFlY75SC9itHibJak
+CdN2AhOLm87RMJWPPH+tWbECuR3wxeUBZMPgKQd1IBEA9UcPOfNUHb+LrCYD8Yp
vQRYlD4YlulZX/CTSahuqaKCMmfkW/vDi2KSxT1x4IbpUVOgti6plSC21iQUHZwS
6qy/02fPQ/4czA7+MaQVw4N1raxFNrYDJWOanRBx4W0AbXePR2uvw+XvREV8ZzvF
FJxy3t0Fc15W5vkxfYjMcsCKc+4nt8ULNVi4Vu6wKHTWhfa1boqB6AstbHUJzf15
x0YgULcDnQy7vOIA5N+lSv6gP0aIPXr3PqyuGWZ8YMTv/bo+VCj6Q4fATHY3xcqO
uvtlXyOYnxtwevNfC3QOmrV42D/zzCoLloOHMmgZkhHD67tkQIyStHJvxj2cGD/5
diMcqgwsu9E2WmxLbG4mkpHR2t/HN71lvH3g1JJ5bMiHjSvrGYXBTXpzBnvoldAA
rkqNIBtJw1xtqTeAPAafrhwhk0fQW7rS4xBv78bd4/XiddfM/PkBtI1k1qsbDGs0
rPUIim0t0yWBP6hgKB90TM7Dj03vJOno0FS1aADsWxCNdNTYJ0c3VjU2JSMtnOu0
QX7VcY1e3gZzwezVMNwfRvgddic5ZKPCzlu4EU6JUUAcdQdMqoiAE/5Jg9enoexO
2g4Bh/yvFS/n6hyLoR9j
=XquM
-----END PGP SIGNATURE-----

--qOrJKOH36bD5yhNe--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
