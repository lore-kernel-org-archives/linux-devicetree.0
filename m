From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Sun, 25 Oct 2015 07:14:57 +0900
Message-ID: <20151024221457.GS29919@sirena.org.uk>
References: <1443731874-21362-1-git-send-email-afd@ti.com>
 <1443731874-21362-5-git-send-email-afd@ti.com>
 <20151022164724.GZ8232@sirena.org.uk>
 <562A2C2F.1020808@ti.com>
 <20151023231822.GQ29919@sirena.org.uk>
 <562ACCCC.503@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NAmHCRPXNp23hR9r"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <562ACCCC.503-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--NAmHCRPXNp23hR9r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 23, 2015 at 07:11:56PM -0500, Andrew F. Davis wrote:
> On 10/23/2015 06:18 PM, Mark Brown wrote:

> >mt6397 doesn't do this, it doesn't have a compatible string at all (it's
> >doing what I'm recommending that you do).  The SPMI devices are
> >standalone devices, their parent device is actually functioning as a bus
> >controller here (it's really a microcontroller inside the SoC).  The
> >Palmas is part of how we realised this was a problem.

> mt6397: Documentation/devicetree/bindings/mfd/mt6397.txt
> Doing exactly what I'm doing,

Tbe binding document is buggy and doesn't reflect the code, there's no
compatible string in the driver.

> The Palmas is a great example of why this is a good idea, there are
> so many spins on this common base, and look how we can re-use sub-nodes:

There's no real reuse here, we have to have a table in both the MFD and
regulator listing every variant.  Remember that the only reason the user
is having to type most of those subnodes at all is that we pushed things
into the DT, if someone forgot to include one of the nodes in their
board DT then they won't be able to use the relevant feature even if
it's there.

> >The fact that the SoC DT is not distinct from the board DT is actually
> >one of the problems with the way we're using DT at the minute, it means
> >that DTBs are much less stable than they should be since we can enhance
> >support for SoCs but DTBs need regenerating to take advantage of it.  It
> >would be much better if the boards just referenced the SoC they use and
> >pulled in a separate definition of the SoC (DT overlays will make it
> >much more tractable to implement that if someone has time...).

> I figured this can already be done by keeping the SoC stuff in dtsi files?

That doesn't help with the above issue, include files get processed at
the time the binary is generated.

> Well I have to match the sub-devices on something, it's ether the node name
> or the compatible string, so they might have to get used to typing :)

No, that's not the case - remember, users don't have to write a new
driver every time they instantiate a device on a board.  They're going
to have to list the in-use regulators one way or another but if we have
the extra compatible for regulators they have to bind both the core
device (which is going to be required anyway due to the control bus) and
the subnode saying that it has regulators (which we knew anyway as soon
as we knew we had the core device).

--NAmHCRPXNp23hR9r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWLALhAAoJECTWi3JdVIfQ09sH/3mGN9ky9ogqxLmC15pUDj4b
ipp8GZre6415gU7rqSy7elmqkRKJPSYyZcc55V4W1eCdcOtQ3yciHvS7VhH3StK4
SMhTiM3PCjWfpVpDkL3tly/kq41I34y2Wqa3t2X6tecMJ5NJLTejX24m2gat8TtR
ORKlKIkBvu+EfQLOk6xnOB7TMD8qaG1bdAGOQobuBkLkvbzf1ZYTkhLSphXfHTs7
Ny7VKYe5JHeUci5y6HBkHpEAmOhI+TTDYP8VIK9AMkpky6m1cWK3sRe3OgKzWL49
VjArkIw7uUggMp4igI+CauYPWdrO3JWUkSh37CvQTx9zVmc5MH+SNEEsxN4MtgA=
=Ltje
-----END PGP SIGNATURE-----

--NAmHCRPXNp23hR9r--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
