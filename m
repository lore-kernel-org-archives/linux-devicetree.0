From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/2 v6] of: add helper to parse display timings
Date: Thu, 11 Oct 2012 21:31:18 +0200
Message-ID: <20121011193118.GA27599@avionic-0098.mockup.avionic-design.de>
References: <1349373560-11128-1-git-send-email-s.trumtrar@pengutronix.de>
 <1349373560-11128-2-git-send-email-s.trumtrar@pengutronix.de>
 <1349680065.3227.25.camel@deskari>
 <20121008074921.GB20800@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4867836362692305609=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121008074921.GB20800-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============4867836362692305609==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 08, 2012 at 09:49:21AM +0200, Steffen Trumtrar wrote:
> On Mon, Oct 08, 2012 at 10:07:45AM +0300, Tomi Valkeinen wrote:
> > On Thu, 2012-10-04 at 19:59 +0200, Steffen Trumtrar wrote:
[...]
> > > +
> > > +	disp->num_timings =3D 0;
> > > +
> > > +	for_each_child_of_node(timings_np, entry) {
> > > +		disp->num_timings++;
> > > +	}
> >=20
> > No need for { }
> >=20
>=20
> Okay.

Or you could just use of_get_child_count().

Thierry

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQdx6GAAoJEN0jrNd/PrOhrvYP/0QzXJteJs+u3JzLMmCOLyW9
cYuAOeDplrkE/87S7CUU7S0wxPiUAm48Mx7LjG9h2P0cHgFeDRgCFfkwQgSlDTqx
2UiCCyVrfiZjCio63UmlVr0l7+1/sh4BR4mzbi1bRBNFujPLg+1Jq/gLX9yC1yA+
g8qvC3ztLffObsCzDGZRIFffThMrsEQYNohUxcu+oOSI0Mmnc2s18eZFEDLQdvCE
RCTTFv+EcBWgIJ7mPBesuPlT2pMdOiIMfwUOmFhowwQQcpZII+5OPgoe+Xnth3Re
e5af9863zCuq4SceFCkth2MVey2uNLUusN13kxhdeyUKTAATs+7NiiP6qa3hgxuh
Vpq3bxRINB/9ORIU64MOi4+tuRMLMKri2aXgZXePVA5+e5ebBp2Kh4Zr8rxZQbBf
t+dZXMsGwsNHZO2A3T9UdrgzAvAqfdazLzsj6Qw6OSHlbYl0eCUbif+qhoxDf2rI
rHfYaRGgb/2uGX76OzizCcQduFstqQv8ILvGTXCxIIT6Q54bAJ4gsOx4/jRSElg7
9nrUJ08F/7tn0H+zxKRRhRiVT9rWF5EQysojkmtOl0p2Iw1DRpafzHVBTGuJa0Kd
owTVjNyaEITJqlGwrqgHaJD+YETTqUB0GeCN9CY+3MriPcwOCX/jB3IlC8FJH7BY
o4Zgh+VdzXtRq0BUqE2g
=lkat
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--

--===============4867836362692305609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4867836362692305609==--
