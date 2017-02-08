From: Eric Anholt <eric@anholt.net>
Subject: Re: [RESENT PATCH] ARM: bcm2835: Add devicetree for the Raspberry Pi 3, for arm (32)
Date: Wed, 08 Feb 2017 14:40:56 -0800
Message-ID: <87y3xgs3uv.fsf@eliezer.anholt.net>
References: <1484845444-4617-1-git-send-email-kraxel@redhat.com> <87fukcgsqp.fsf@eliezer.anholt.net> <878tpqki0k.fsf@eliezer.anholt.net> <1485944672.1076.50.camel@redhat.com> <1485951653.1076.54.camel@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1485951653.1076.54.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: linux-rpi-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Gerd Hoffmann <kraxel@redhat.com> writes:

>> > I think just having links from
>> > arch/arm64/boot/dts/broadcom/bcm2837*.dts* to arch/arm/boot/dts/ would
>> > be the solution, then this Makefile could just reference
>> > bcm2837-rpi-3-b.dtb.
>>=20
>> I suspect it is not that easy, last time I tried it didn't work.
>> Will try again though.
>
> Yep, dtbs_install fails:
>
> [ ... ]
>   INSTALL arch/arm/boot/dts/bcm2835-rpi-b-plus.dtb
>   INSTALL arch/arm/boot/dts/bcm2835-rpi-a-plus.dtb
>   INSTALL arch/arm/boot/dts/bcm2836-rpi-2-b.dtb
>   INSTALL=20
> cp: missing destination file operand after '/boot/dtbs/4.10.0-rc5+'
> Try 'cp --help' for more information.
> /root/linux/scripts/Makefile.dtbinst:41: recipe for target
> 'bcm2837-rpi-3-b.dts' failed
> make[3]: *** [bcm2837-rpi-3-b.dts] Error 1
> arch/arm/Makefile:348: recipe for target 'dtbs_install' failed
> make[2]: *** [dtbs_install] Error 2
> Makefile:150: recipe for target 'sub-make' failed
> make[1]: *** [sub-make] Error 2
> Makefile:24: recipe for target '__sub-make' failed
> make: *** [__sub-make] Error 2

Huh, I didn't see this when I tried it.  I just sent out that version of
the patch.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlibnngACgkQtdYpNtH8
nug3QQ/+OApQ0gC3Db76U/KsAfDTHsyVqQQizjed6CM1j13X+WHyo+jXhS4ypIj6
jdZjAQlO188A+4svDeW00ZOvsYElTLwiDh1gqUfCBsVayKk6m//HLAegTUAuZkdX
XenO5ySu+xGX8Tv/uxqUFceR2eVrtr8I99KfpHcG5oqc8QK7/TfFlPeH3+uz9U5D
7CUE7GSZRlRpZ8JKCnP8BVk4cI+pz422kuKJfaEQUnVoQKqP+PRV/hYZfWLbrrHl
4Xg7C/6e2XzxoDisxq+V2sllCfcBHYtamvfmHp+cF/R5567vIeRsRFQEzgNes0Wq
3ddI8flEJfbCVKculm1UxecWZyauVAZndRxMyr4rfV3J0Epf5b4UPNWa5d8XX2/t
UeVICFH50Bv0l0B/7WS+82VFho3hqUmbqdQTHC96SkzMe85VTm8/I4UlbEoH/94Z
ksj4AxTwQOEW3SByQd3XGQhqZDpRSK9/pTsxszxNro6Vs/XACiEisNyepHhv6Boo
Fh5tuj3JKYiZosioPm36jNQ0sOWaMqG4z1h810qCchWDvKwv6PiMNM067UJJedhA
PZWG+nRdDkzG5a3BWBp/TTIcKH/qR8RZj8KDXaTAfcNo3oEHNkeIWCeGXbwCaD0b
P2qTyoetr5uAoH/L5kdMcOZcCiojEyPqsFdkITB9jVGJ1MfDKdA=
=CyM9
-----END PGP SIGNATURE-----
--=-=-=--
