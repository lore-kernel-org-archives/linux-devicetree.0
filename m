Return-Path: <SRS0=1YNY=QL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay10.mail.gandi.net ([217.70.178.230]:40731 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728216AbfBDPpX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 Feb 2019 10:45:23 -0500
Date: Mon, 4 Feb 2019 16:45:20 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: JSON schema and conditions
Message-ID: <20190204154520.kb5thy27v5sxbqjd@flea>
References: <20190116145909.7x6n47a35xsjknj2@flea>
 <CAL_JsqKOng2g7+3FVx5cU99C-KJpvbJyfRxJCdm1aoCBsK1Rfg@mail.gmail.com>
 <20190117143510.3vmmxh2vc6mlp5i4@flea>
 <CAL_JsqJ43C8Y+QLZkeCg6bWzppLKzpyNxQa9BxfjyKyfBb90Sw@mail.gmail.com>
 <20190129211935.ekxudfpkm44tntgk@flea>
 <CAL_Jsq+iRr7FvDnxXOV+ju7ygd=S10xyHTPzTiyTBS0AxOk6jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="teswtwtq4paq2obm"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+iRr7FvDnxXOV+ju7ygd=S10xyHTPzTiyTBS0AxOk6jw@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--teswtwtq4paq2obm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 29, 2019 at 04:25:52PM -0600, Rob Herring wrote:
> On Tue, Jan 29, 2019 at 3:19 PM Maxime Ripard <maxime.ripard@bootlin.com>=
 wrote:
> > On Fri, Jan 18, 2019 at 11:57:12AM -0600, Rob Herring wrote:
> > > > > Including/inheriting another schema can be done with "allOf: [ {$=
ref:
> > > > > path/to/base/schema} ]". I'm currently using this for providers s=
uch
> > > > > as clock or reset providers and for buses. This works well for
> > > > > inheriting schemas which are collections of properties. See the G=
IC
> > > > > conversions to json-schema I posted for an example. The main issue
> > > > > with this approach that I've found is you have to list all the
> > > > > inherited properties to make them required or if you have
> > > > > 'addtionalProperties: false' (which is desirable IMO).
> > > > >
> > > > > If there's a lot of conditionals, there may not be much left comm=
on to
> > > > > inherit and we may just want to split each compatible into a sepa=
rate
> > > > > doc. I'm also fine with leaving those constraints as comments or
> > > > > description for now. That's no worse than what we have today.
> > > > >
> > > > > Note that so far, all the $ref values pointing to other files get
> > > > > resolved to files in the yaml-bindings repo schemas. I don't thin=
k a
> > > > > ref from the kernel tree to the kernel tree works currently. I ne=
ed to
> > > > > sort that out.
> > > >
> > > > Yeah, I've tried that already, and it indeed looks like it always t=
ry
> > > > to look them up on your github repo (or the local cache), but will =
not
> > > > try to locate it in the kernel tree.
> > >
> > > Actually, this should already kind of work, but only if all schema
> > > files are used. IOW, it doesn't work if you limit the schema files
> > > setting DT_SCHEMA_FILES. A reference to '/schemas/foo/bar.yaml' will
> > > match 'Documentation/devicetree/bindings/foo/bar.yaml'.
> > >
> > > I looked at trying to fix this, but at the point I need to load the
> > > reference I don't have the kernel source path, only the build path.
> > > The easiest fix would be to ignore (or only warn on) unresolved
> > > schemas, so we don't crash at least. Then you'd have to set
> > > DT_SCHEMA_FILES to the inherited schema if you wanted to validate with
> > > that.
> >
> > So I gave it a try with the following patch:
> > http://code.bulix.org/k8yxtm-566934?raw
> >
> > The output is:
> >
> > $DIR/arch/arm/boot/dts/sun4i-a10-cubieboard.dt.yaml: Additional propert=
ies are not allowed ('target-supply', 'clocks' were unexpected)
> > $DIR/arch/arm/boot/dts/sun4i-a10-cubieboard.dt.yaml: compatible: ['allw=
inner,sun4i-a10-ahci'] is not valid under any of the given schemas
> >
> > So it looks like it doesn't pick everything up, but yet if the number
> > of clocks is wrong, it's reported, which looks kind of weird since
> > compatible apparently doesn't match. Do you see any flaw with this?
>=20
> Essentially, each schema file here is evaluated separately not as a
> union of the 2 files. You could just drop 'additionalProperties', but
> then either ahci-platform.yaml should not have compatible defined (you
> could have a 3rd file with that) or it needs *all* the possible
> compatibles. Probably the former would be better.

I'll give it a try then, thanks for the suggestion

> However, if the common one just has reg and interrupts, then there's
> probably not much point in trying to share with
> sun4i-a10-cubieboard.dt.yaml. But I'm assuming there's more
> properties you just haven't put in?

It's pretty much it, but I wanted to have a rather basic example
before trying to go into more complex bindings :)

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--teswtwtq4paq2obm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXFheEAAKCRDj7w1vZxhR
xYjQAQC7XvDmoI6mFYrerEQ/aXgF6i8BtPAnhmqf33tGl0ctNwEAthL/kJvb447g
QVT2+ErjIOUZBE/zzFRpcX5H7sI9xA4=
=KZAM
-----END PGP SIGNATURE-----

--teswtwtq4paq2obm--
