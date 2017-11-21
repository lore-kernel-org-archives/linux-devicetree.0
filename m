From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Subject: Re: [patches] Re: [PATCH] dt-bindings: Add a RISC-V SBI firmware node
Date: Tue, 21 Nov 2017 21:08:32 +0100
Message-ID: <20171121200832.d55khzcufo2owcff@latitude>
References: <20171120214520.dcaqvyncojwefmgt@rob-hp-laptop>
 <mhng-dadf76d9-0823-4fc8-9177-1772629573b6@palmer-si-x1c4>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jxk2dm2esywmhxor"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <mhng-dadf76d9-0823-4fc8-9177-1772629573b6@palmer-si-x1c4>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-q3qR2WxjNRFS9aJRtSZj7A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--jxk2dm2esywmhxor
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2017 at 09:37:02AM -0800, Palmer Dabbelt wrote:
[...]
> This isn't really a big deal to me, as I'm only interested in RISC-V
> systems, but there's been some pushback on the concept of an SBI so it
> seemed like a simple way to allow people to build non-SBI (and there for =
not
> really RISC-V) systems.

For those reading along: I suggested the /firmware/sbi node to Palmer,
because I'm interested in such "not really RISC-V" systems, (because it
makes the firmware's job easier to not implement the SBI =E2=80=94 speaking=
 with
my coreboot hat, here.)

> One option that wouldn't require a device tree node
> would be to have Linux boot in machine mode [...] and then provide its
> own SBI implementation.

I think this can work.


Thanks,
Jonathan Neusch=C3=A4fer

--jxk2dm2esywmhxor
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJaFIe4AAoJEAgwRJqO81/b/noQAIqnZWAj8xFpxgrjAFj7IBlY
0k+FfCHXD4ghcN+ilWKNMHTXnnI2U1cKI5a4j3Frf8kg70LR8kr9Jhfa9BzCqqrp
4PniNDlsYV1XI4F3A0dYRiSvztTeFFubsorJ7CJFKkwD8CMOFkJ6sc9UOpqdXbdL
BDFicq9XUm+3g4fCisrjbMQeI+loABQlmT5/zEi8Vsslk4Jguls0JgH0U0xbJdW6
Ts239LfV9RY+xfNUl0i3dpbFDZl7fgcetIyULbMAi/KJi7bL+xNpnUQ0JHmSkNJK
kxGWTueGoOvXRboBdVhu1tb61SS+RsTHuvTu79C9xd0xnq0W6j1lTYI2lJYeRw9U
+5XR2aFI6ZlE7lqUoeuyPZVdRoukvx5CAOE35oP/LwudnSLH3xE3uQM2XTPcY+Qf
5MifYUEBCMMMmDXNW1/KA7iuenN3W1X53WzEOJXCA2mhjW9VDvHBg2lxDqi12I+5
tUnRdv4AgQPyjLgncebRY2KLmNy7QBwhZdJrieB+nAaOmyK9QAEV4nyv72rSV0pn
NFFYZgYqSaAu/pJnohEpv//9PpkrHAH3ewhbjlTAjH1a5akOnCzkn/tTIY3Ws/+J
tDht2dTxvit2pyoe2l11AX7WD1KwlJtqT1W5i6AT5B3nnT17+BBAj1y286OdcmQK
tsjS8RCoXzqfDLnCmiYr
=t51q
-----END PGP SIGNATURE-----

--jxk2dm2esywmhxor--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
