From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v7 08/14] USB: Chipidea: add ci13xxx device id management
Date: Mon, 25 Jun 2012 11:48:27 +0200
Message-ID: <4FE833EB.3050503@pengutronix.de>
References: <1340607391-16380-1-git-send-email-richard.zhao@freescale.com> <1340607391-16380-9-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig7629959483ED871D3B52B3E5"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1340607391-16380-9-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig7629959483ED871D3B52B3E5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 06/25/2012 08:56 AM, Richard Zhao wrote:
> We use ida_simple_get and ida_simple_remove to manage the ids.
>=20
> Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Reviewed-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

Removing the "ci13xxx_imx" module doesn't work as expected:

ci_hdrc ci_hdrc.0: remove, state 1
usb usb1: USB disconnect, device number 1
ci_hdrc ci_hdrc.0: USB bus 1 deregistered
Unable to handle kernel NULL pointer dereference at virtual address 00000=
06c
pgd =3D c6bb8000
[0000006c] *pgd=3D46a7e831, *pte=3D00000000, *ppte=3D00000000
Internal error: Oops: 17 [#1] PREEMPT ARM
Modules linked in: ci13xxx_imx(-) ci_hdrc
CPU: 0    Not tainted  (3.5.0-rc4-00055-g35d73a8-dirty #80)
PC is at ida_remove+0xa0/0x110
LR is at ida_simple_remove+0x30/0x60
pc : [<c0154294>]    lr : [<c01544f4>]    psr: a0000093
sp : c6be3ed0  ip : 80000000  fp : 0092f008
r10: d9a22647  r9 : c6be2000  r8 : 08421085
r7 : 00000001  r6 : 0000034b  r5 : bf00a3a8  r4 : 00000000
r3 : c087d6b0  r2 : 001bb89f  r1 : 6b6b6b6b  r0 : 00000068
Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 0005317f  Table: 46bb8000  DAC: 00000015
Process rmmod (pid: 136, stack limit =3D 0xc6be2270)
Stack: (0xc6be3ed0 to 0xc6be4000)
3ec0:                                     c6be2000 20000013 6b6b6b6b bf00=
a3a8
3ee0: c6be2000 c0009408 00000000 c01544f4 c6ad5430 c7865980 bf01562c bf01=
501c
3f00: bf015000 c7865988 bf01562c c018dad8 c018dac4 c018c5e0 bf01562c c786=
5988
3f20: c78659bc c018cdbc c6b78040 bf015680 bf01562c c0e670d0 0092f0b8 c018=
c438
3f40: bf015680 c6be2000 00000000 c004c56c c74ca308 33316963 5f787878 0078=
6d69
3f60: 0092f008 c00a5088 c7812138 c6b5b388 00000000 c6b79860 c6b5b388 c008=
8648
3f80: 00000003 c6b79860 c6be2000 00088730 00002002 00000001 0092f088 be82=
fe5c
3fa0: 00000081 c0009260 00000001 0092f088 0092f0b8 00000800 b6eb865c be82=
fc00
3fc0: 00000001 0092f088 be82fe5c 00000081 0092f088 00000000 00000800 0092=
f008
3fe0: b6e7cbc0 be82fc04 b6ef65f8 b6e7cbcc 60000010 0092f0b8 00000000 0000=
0000
[<c0154294>] (ida_remove+0xa0/0x110) from [<c01544f4>] (ida_simple_remove=
+0x30/0x60)
[<c01544f4>] (ida_simple_remove+0x30/0x60) from [<bf01501c>] (ci13xxx_imx=
_remove+0x1c/0x84 [ci13xxx_imx])
[<bf01501c>] (ci13xxx_imx_remove+0x1c/0x84 [ci13xxx_imx]) from [<c018dad8=
>] (platform_drv_remove+0x14/0x18)
[<c018dad8>] (platform_drv_remove+0x14/0x18) from [<c018c5e0>] (__device_=
release_driver+0x58/0xa8)
[<c018c5e0>] (__device_release_driver+0x58/0xa8) from [<c018cdbc>] (drive=
r_detach+0xcc/0xd8)
[<c018cdbc>] (driver_detach+0xcc/0xd8) from [<c018c438>] (bus_remove_driv=
er+0x7c/0xc0)
[<c018c438>] (bus_remove_driver+0x7c/0xc0) from [<c004c56c>] (sys_delete_=
module+0x180/0x23c)
[<c004c56c>] (sys_delete_module+0x180/0x23c) from [<c0009260>] (ret_fast_=
syscall+0x0/0x2c)
Code: e0416286 e5904004 e1a002c6 e0840100 (e5908004)
---[ end trace 7d882a2086a6a3d8 ]---
note: rmmod[136] exited with preempt_count 1

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig7629959483ED871D3B52B3E5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/oM+sACgkQjTAFq1RaXHPrWwCghPU9C6mgdCn0JGXIDdoosuGz
sbcAnjzKSBmfO+orbuEn7KoqCvZVRF+l
=3V8D
-----END PGP SIGNATURE-----

--------------enig7629959483ED871D3B52B3E5--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
