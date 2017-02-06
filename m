From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 5/7] dt-bindings: display: Add common rotation property
Date: Mon, 6 Feb 2017 08:10:36 +0100
Message-ID: <20170206071036.GA27607@ulmo.ba.sec>
References: <20170131160319.9695-1-noralf@tronnes.org>
 <20170131160319.9695-6-noralf@tronnes.org>
 <20170201174113.g7sdkhtzvizg5ajv@rob-hp-laptop>
 <30cce12b-b6c6-c651-409e-5574b5f7576e@tronnes.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <30cce12b-b6c6-c651-409e-5574b5f7576e-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2017 at 01:16:45PM +0100, Noralf Tr=C3=B8nnes wrote:
> Thierry, please have a look at this.
> In which direction should we rotate to match how drm rotation works?
>=20
>=20
> Den 01.02.2017 18.41, skrev Rob Herring:
> > On Tue, Jan 31, 2017 at 05:03:17PM +0100, Noralf Tr=C3=B8nnes wrote:
> > > Display panels can be oriented many ways, especially in the embedded
> > > world. The rotation property is a way to describe this orientation.
> > > The counter clockwise direction is chosen because that's what fbdev
> > > and drm use.
> > The h/w mounting is rotated counter clockwise, so the framebuffers'
> > contents are rotated clockwise, right?

Given that this describes the rotation of the panel, I think it should
be described in terms of how the panel is rotated, not how the
framebuffer needs to be rotated. Using counter-clockwise, as described
in this binding seems fine to me.

It would have to be up to fbdev and DRM/KMS to transform that into a
clockwise rotation for the framebuffer, CRTC, plane, ...

Ideally with some sort of helper.

Thierry

> >=20
> > > Signed-off-by: Noralf Tr=C3=B8nnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
> > > ---
> > >   Documentation/devicetree/bindings/display/display.txt | 4 ++++
> > This is panel property, so bindings/display/panel/panel.txt.
> >=20
> > >   1 file changed, 4 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/display/displa=
y.txt
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/display/display.txt b/=
Documentation/devicetree/bindings/display/display.txt
> > > new file mode 100644
> > > index 0000000..e2e6867
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/display.txt
> > > @@ -0,0 +1,4 @@
> > > +Common display properties
> > > +-------------------------
> > > +
> > > +- rotation:	Display rotation in degrees counter clockwise (0,90,180,=
270)
> > > --=20
> > > 2.10.2
> > >=20
> > > --
> > > To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> > > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliYIWoACgkQ3SOs138+
s6FH1hAAgk4CCKNnMjDsscPcl6Lgq21phIn9IaCx8qBYiDq1vQ6SyVTFbwL4tBW8
TsyFtjegSnad9bQTv5hhvGtS56mZcDAZAK5LlBeoPcOAkc91gOxfHRTadSfhnyhQ
ZUMjePWS8jXpsZ5/2QEsbbDwk4BC+esKI+fMmhkQsRtgpZpLflPdsQgBId4Pk++l
SmDDrF6+pw5xDJK3UO2j8r3XidtZbDqUaw+7fFDPeCFdAsmwVbYGt7F/w+7vB9TN
V9qdMlh0/FsgzF9ankaIwkjtp/C/hLOXyHik3BFEbz83GRQDvbijZHcaxSv26vPy
69riS/LtRjSpPpHJlCC6jVRSKi2nEZXs9udmEHA30wvxY92sE7K3zz24ABXkINQW
MzDvGQz1Dzxds9euXG2XsJ4klvW44IJ4+YTWa9b2XV31wOytMo+aKRW2g00wsAw0
AYG/gbCI8kJ8g7V8L7diybguS2C+MUUzCpntp43UwkE0iQPT8lX3Ukjuthy+XzqI
kDAGjm/GnnaDfVr1grD1XQdrCqa0Hrq4d0audORNYOKvIOxc6rJmO1vKiAUSsDcO
ZeW0E0faeNpkX0YJWoWvDu2MstyPFMzYRTakQPFKVqqiguK5inQd/GUZanDlHPMu
zpsWnybZi8QpZHCUFDP2kRPYXRFkF7aKvJMdxKHWVR7gOZZWLdA=
=O6hd
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
