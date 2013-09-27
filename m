From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [dtc PATCH V2] Warn on node name unit-address presence/absence
 mismatch
Date: Fri, 27 Sep 2013 15:17:18 +1000
Message-ID: <20130927051718.GE2716@voom.fritz.box>
References: <1379613263-32080-1-git-send-email-swarren@wwwdotorg.org>
 <3D2FE31C-A6BB-4F70-9B3B-C55012CB56B3@codeaurora.org>
 <5244BF7A.4000100@wwwdotorg.org>
 <1380245438.28561.86.camel@pasglop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2qXFWqzzG3v1+95a"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1380245438.28561.86.camel@pasglop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rohit Vaswani <rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--2qXFWqzzG3v1+95a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2013 at 11:30:38AM +1000, Benjamin Herrenschmidt wrote:
> On Thu, 2013-09-26 at 17:12 -0600, Stephen Warren wrote:
> > Well, ePAPR seems pretty specific that unit address and reg are
> > related,
> > but says nothing about ranges in the section on node naming, nor about
> > node naming in the section about ranges.
> >=20
> > I'd claim that the existing PPC trees are nonconforming, and should be
> > fixed too:-)
>=20
> This is tricky, we should probably fix ePAPR here.
>=20
> If you have a "soc" bus covering a given range of addresses which it
> forwards to its children devices but doesn't have per-se its own
> registers in that area, then it wouldn't have a "reg" property. I would
> thus argue that in the absence of a "reg" property, if a "ranges" one is
> present, the "parent address" entry in there is an acceptable substitute
> for the "reg" property as far as unit addresses are concerned.

So, that's been accepted practice in fdt world for a while; I think
ePAPR already permits that, in fact.

> Also don't forget that in real OFW land, the unit address is something
> that's somewhat bus specific ... for example, PCI uses "dev,fn" rather
> than the full 96-bit number of the "reg" entry :-)
>=20
> Another option which would more strictly conform to ePAPR and in fact to
> of1275 would be to require such bus nodes to have a "reg" property with
> the address value set to the beginning of the range and the size value
> set to 0 :-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2qXFWqzzG3v1+95a
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJSRRTdAAoJEGw4ysog2bOS4V8P/3sQ8pCeV10i7RR0u4wEBg7j
I9r5EVVegLN6svDp97tCrUu9B4DECDchwk4zXjwU4YJ7cnBFVP4dQqzkhfyFTwG6
9RlzlJV/ewDf9Qpj78jHSUmsAanKR+YmrrfoXa6sDDdvX0wyQW5rmU230c5f4ZBO
ud/LtpTN01tZct12bccgDLSB+XkmxkYgMgwejuPmi7zz/uTc+VcIrOomFG8YJx+6
EhTaYcCezu1JicvL67zhiuqhrPJe6llbvcGZwqd3t4CDrNhEHuSYMAKm4xr4dhjC
6ooWgVpR1rSgCjmzSIXYl7FE2he6s9yk3VIKUW8CH+nlWlPbMK0cyJzlIRjs8Scp
GJXtH1eMIxO7BAWhtWLI22kUN6cPElnBYUVWYEDYec5msuiASQ3htnsIIk1JI+nW
O5a0jtA4dydPjnFPbtbHeZ4UuRtEnoyR5Ov7dUzPmwr7UC/HKyApHUVP5my/Xa9f
+h9atkqHFR9/mDLf9RuRzrhdmEOxc38J05YItDWOPLMPjsYwJKM7D0ShY1AXuoXg
wqz1Ffs8HW3zdNhF7eklafVVovOGUuUAsMyH1fyiqO18WgnURB/n7Fdnak2l6LHn
cGgc5vxhiVC0SF76UDI0nMhqByh5HMGQL/XhI5QrlnbHPYYNHQwXpPHkKurjy/Y4
daM0QMXluNwICjVp86Ib
=lTKI
-----END PGP SIGNATURE-----

--2qXFWqzzG3v1+95a--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
