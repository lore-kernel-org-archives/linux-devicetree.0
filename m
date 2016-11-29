From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: drm/bridge: adv7511: Add regulator
 bindings
Date: Tue, 29 Nov 2016 11:01:25 +0000
Message-ID: <20161129110125.sksjxfy56ofzyxw3@sirena.org.uk>
References: <1474622430-6704-1-git-send-email-architt@codeaurora.org>
 <2390919.s2CzTWN1li@avalon>
 <b779c014-fc20-1fbc-dea9-cb90dbde5b71@codeaurora.org>
 <3929994.7YhJtsl9c3@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fdcknrxhzbrgaso3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3929994.7YhJtsl9c3@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--fdcknrxhzbrgaso3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2016 at 11:11:03AM +0200, Laurent Pinchart wrote:
> On Tuesday 29 Nov 2016 13:41:33 Archit Taneja wrote:

> > I thought we couldn't add mandatory properties once the device is alrea=
dy
> > present in DT for one or more platforms.

> You can, as long as you treat them as optional in the driver to retain=20
> backward compatibility. The DT bindings should document the properties=20
> expected from a new platform (older versions of the bindings will always =
be=20
> available in the git history).

The device probably never worked without power...  note that the kernel
will substitute in dummy regulators for anything that isn't explicitly
mapped so it won't actually break anything.

> > Say, if we do make it mandatory for future additions, we would need to =
have
> > DT property for the supplies for the new platforms. If the regulators on
> > these boards are fixed supplies, they would be need to be modeled
> > using "regulator-fixed", possibly without any input supply. Is that
> > what you're suggesting?

> That's the idea, yes. Clock maintainers have a similar opinion regarding =
the=20
> clock bindings, where a clock that is not optional at the hardware level=
=20
> should be specified in DT even if it's always present.

> Mark, any opinion ?

It's best practice to always describe the power.  The kernel will cope
if people don't but it's not unknown for drivers to discover a reason
for wanting information about their power and hard to retrofit that if
it's not been in there from the get go.

Please note that if you're going to CC me into a graphics thread there's
a good chance I will miss it, I get copied on quite a lot of graphics
related mail that's not really relevant so I often skip it.  Changing
the subject line would help with that.

--fdcknrxhzbrgaso3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJYPWABAAoJECTWi3JdVIfQcTMH/Ao8AthR+NJVKimYTO6m42NI
KFGwMc8tsFig+KYHJi3iBhrBY0zB9H3B7BY2VovY/Epz28jrIkCEClafZqZzKha0
dGnuTY2n0VfS7t8FLUimV/AajQ3oT0iCc7PeH7L1VXGTh9otgpZHmTO3wsbbGoD6
w7CNxULa7xN/5FhrGDRN20RbcHzPh+k9IW73frDdVaz7o6HqFehIvW7LtbC6cKDc
AugA1Di4pCplE8zHW9x7sVGM+1AJdWnKYkQElU9Ccus67l9RMFCaOHRzUW2RSjoc
NesibPlYqQhIjN3t0zoIZGZtxUD0CIzAQkwUJs3MphP1xYtkg000TOIOfMlDG7I=
=K9VT
-----END PGP SIGNATURE-----

--fdcknrxhzbrgaso3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
