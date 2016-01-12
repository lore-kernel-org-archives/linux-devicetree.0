From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] dtc: create tool to diff device trees
Date: Tue, 12 Jan 2016 15:31:53 +1100
Message-ID: <20160112043153.GS22925@voom.redhat.com>
References: <568EB672.6060300@gmail.com>
 <20160111023742.GA22925@voom.redhat.com>
 <56936041.2080104@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4AfY4lbNVy6SI0IG"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56936041.2080104-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--4AfY4lbNVy6SI0IG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 10, 2016 at 11:56:49PM -0800, Frank Rowand wrote:
> On 1/10/2016 6:37 PM, David Gibson wrote:
> > On Thu, Jan 07, 2016 at 11:03:14AM -0800, Frank Rowand wrote:
> >> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> >>
> >> Create script to diff device trees.
> >>
> >> The device tree can be in any of the forms recognized by the dtc compi=
ler:
> >>   - source
> >>   - binary blob
> >>   - file system tree (from /proc/devicetree)
> >>
> >> If the device tree is a source file, then it is pre-processed in the
> >> same way as it would be when built in the linux kernel source tree
> >> before diffing.
> >>
> >> Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> >> ---
> >>
> >> Tools to develop and debug device tree are somewhat inadequate.  This =
is a
> >> small step in improving the situation.
> >>
> >> Rationale for and examples of using the script are provided in slides
> >> 1 - 78 of the elce 2015 presentation "Solving Device Tree Issues",
> >> which can be found at:
> >>
> >>    http://elinux.org/images/0/04/Dt_debugging_elce_2015_151006_0421.pdf
> >>
> >> (The script was named dtdiff instead of dtx_diff in the presentation.)
> >>
> >> Changes in v2:
> >>   - Remove dt-bindings from list of includes in cpp_flags
> >>   - Remove arch_dtc_flags, which were generated from the arch specific
> >>     dts makefile
> >>   - Reformat to 8 character tabs
> >>   - compile_to_dts(): added back missing return for binary blob
> >>
> >>
> >>  scripts/dtc/dtx_diff |  343 +++++++++++++++++++++++++++++++++++++++++=
++++++++++
> >>  1 file changed, 343 insertions(+)
> >>
> >> Index: b/scripts/dtc/dtx_diff
> >=20
> > I think this is probably the wrong directory to put this in.  Because
> > it preprocesses in the style of the kernel, this script belongs in the
> > kernel tree, not the upstream dtc tree.  However, basically everything
> > else in this directory is imported directly from upstream dtc.
> >=20
> > Putting this kernel-specific file in here will probably make updates
> > to newer upstream dtc versions more complicated.
>=20
> I agree with the concern (and had the same concern when I made the choice=
).
>=20
> One thing that makes me more comfortable with the location is that the fi=
les
> in the directory are updated with scripts/dtc/update-dtc-source.sh, which
> explicitly lists which files it copies into the Linux tree.  But even with
> that, I still admit to some discomfort with the location.
>=20
> Without getting too deeply into bike shedding, does anyone have a better
> location?  And keep in mind that there are several more tools coming in
> the pipeline that would likely end up in the same location.

Hm, yeah, that's a good point.  There isn't an obvious better
candidate directory.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4AfY4lbNVy6SI0IG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWlIG5AAoJEGw4ysog2bOStusQAMSIK9QMRsqLymJHQLdNSc6k
TY3rZx6v2jNOuhBgA/fiEaQp1TwE9TpH1cyHxG4rKgZtKCe6qvgZvkJ8BQjZ0TJc
IVcGCp57+aizvM6CGMrATgnZWaA3aBbSn0oK3IYuYIkNaiK9kEZdNK1a8ECicqNC
lXO4N0+Dk34Ucp2BZsi1otaNukyV8Vg+LFR98WReQi3YmL9Vfob3rtx1Tv8sS/vz
55pdICf0aHqyG2b2VE1SPqzKNTRHDq+ELeH2cOwLaQ45LlyevrdwnJKmHzTJhUhp
Yz757fwU2dnCNhp50UmvQ2dlkIriDcBeMP8k/UdmuIKjHDlTuTA5WEs5bMcwbPHg
TrRaAnRBJB606Y2Uv/OfqnUWmbplbRHR2sTCzs5msZjd6+AzWKAdBKccnljSS065
vFQOiOXpQpUKAo7m17x2N4SKocRfTtiOdlU7mw2bRSOYyBUH7mU/2ZPc+vmgen3K
pcKXYMHMgy1rVDAbrAApqyasv5jBm+jTPKzVlm5lXTig2iaOLl5NXhgKotDRCxtZ
PojH5c5Dtw5rm1rGioIoz3l9Ne9hEVDv7ld+a6H6YakZ115CmvMR9I+IE4AoQFRO
2lH6HWFKBnISImQxaW31BgyYa565B7Uz02APS/abj0BKb2vi4AukPDDC6y7r0aPO
F9eq7TB4Xn0auqNbvXDj
=0C/3
-----END PGP SIGNATURE-----

--4AfY4lbNVy6SI0IG--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
