From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7,3/3] MIPS: dts: jz4780/ci20: Add NEMC, BCH and NAND
 device tree nodes
Date: Fri, 16 Oct 2015 11:31:12 +0100
Message-ID: <20151016103112.GB29285@jhogan-linux.le.imgtec.org>
References: <1444148837-10770-1-git-send-email-harvey.hunt@imgtec.com>
 <1444148837-10770-4-git-send-email-harvey.hunt@imgtec.com>
 <20151015084727.GG14475@jhogan-linux.le.imgtec.org>
 <CAOFt0_D5mO-7_cnpvm_MwvsZNv1yCFynbeA3dSw=H5hVyQbgTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOFt0_D5mO-7_cnpvm_MwvsZNv1yCFynbeA3dSw=H5hVyQbgTA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Smith <alex-oucj9GSTHrKwpo/f3jThPQ@public.gmane.org>
Cc: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alex Smith <alex.smith-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--98e8jtXdkpgskNou
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Fri, Oct 16, 2015 at 11:11:29AM +0100, Alex Smith wrote:
> Hi James,
>=20
> On 15 October 2015 at 09:47, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
> >> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/=
ingenic/ci20.dts
> >> index 9fcb9e7..453f1d3 100644
> >> --- a/arch/mips/boot/dts/ingenic/ci20.dts
> >> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
> >> @@ -42,3 +42,57 @@
> >>  &uart4 {
> >>       status =3D "okay";
> >>  };
> >> +
> >> +&nemc {
> >> +     status =3D "okay";
> >> +
> >> +     nand: nand@1 {
> >> +             compatible =3D "ingenic,jz4780-nand";
> >
> > Isn't the NAND a micron part? This doesn't seem right. Is the device
> > driver and binding already accepted upstream with that compatible
> > string?
>=20
> This is the compatible string for the JZ4780 NAND driver, this patch
> is part of the series adding that. Detection of the NAND part is
> handled by the MTD subsystem.

Right (didn't spot that it was part of a series).

The node appears to describe the NAND interface itself, i.e. a part of
the SoC, so should be in the SoC dtsi file, with overrides in the board
file if necessary for it to work with a particular NAND part
(potentially utilising status=3D"disabled"). Would you agree?

Cheers
James

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWINHwAAoJEGwLaZPeOHZ6sx4QAIaMMqM4IJbFIcTiKRT8vdMr
r89sxi5SsS6VdUDZI2IlAnQYnB6rrDjZ53Wag3PbA3G9PZFA16wOQDSVCyLiyPHL
ss/4bl2D3cIabC9I9f5vjMQcSl0/AVD/VPDXSG3yP7XNv8Jh1cMkvIXIyI7mguIc
kaJs0mlSTStWIOGuRf98vxqv1sVuxM7vnEu59SOfM90xYYsHSoAiKuAjUpVBZHcj
0zWifGpbwBmUIjeA2znbbJifvrKUzybxywQaRlKmYC4cpxIEsrQWVj01OLB2nZv9
wbXBQq3xzl79LHex/180IBzqzrpVZmt5ewHZLNv1zFH82WPMFJCON6JwgI7qL5g2
6EnXX93WVC+kLfBv8gKFqumNnZgtQCjGgM5wMzmsofhFOOdk3ymusaubVFLd0KdR
vcgsdiq59zthDTLEZjYHQa0zE1CANNvmz89WeMUjI/58qPbE0RwXoh7VJgaZlouP
KICMH0MKTSvaSiuKobaS/ngz5W21z5LgLmDfna73Ia+wMgFcxd0svTfhv6fA+WWg
bobnxtujCkFXTrlQHBiRnLLNrRx1hSjuH2azLlyW9MAHRLbbfZ+x6nTUOPghZtbR
KTOOjHKvT0yD036ZQomRS98ubfAZWbj4YoQ/tYCuBik+nvZeAh92BRA/Oa75A7bu
eEmfb7HtPycmATK4/6Ip
=6LZP
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
