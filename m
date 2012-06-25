From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v7 08/14] USB: Chipidea: add ci13xxx device id management
Date: Mon, 25 Jun 2012 12:17:13 +0200
Message-ID: <4FE83AA9.6030507@pengutronix.de>
References: <1340607391-16380-1-git-send-email-richard.zhao@freescale.com> <1340607391-16380-9-git-send-email-richard.zhao@freescale.com> <4FE833EB.3050503@pengutronix.de> <513f64cb-8eac-4e51-81f7-e3824d96d870@email.android.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig8FE59908BA37A805D1D8E598"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <513f64cb-8eac-4e51-81f7-e3824d96d870-2ueSQiBKiTY7tOexoI0I+QC/G2K4zDHf@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig8FE59908BA37A805D1D8E598
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 06/25/2012 12:03 PM, Richard Zhao wrote:
> Could you use my USB test branch?=20

Same result:

ci_hdrc ci_hdrc.0: remove, state 1
usb usb1: USB disconnect, device number 1
ci_hdrc ci_hdrc.0: USB bus 1 deregistered
Unable to handle kernel NULL pointer dereference at virtual address 00000=
06c
pgd =3D c6ba4000
[0000006c] *pgd=3D46a68831, *pte=3D00000000, *ppte=3D00000000
Internal error: Oops: 17 [#1] PREEMPT ARM
Modules linked in: ci13xxx_imx(-) ci_hdrc imx_usbmisc
CPU: 0    Not tainted  (3.5.0-rc4-00058-g01710ef #85)
PC is at ida_remove+0xa0/0x110
LR is at ida_simple_remove+0x30/0x60
pc : [<c0154294>]    lr : [<c01544f4>]    psr: a0000093
sp : c6b9fed0  ip : 80000000  fp : 0023f008
r10: d9a22647  r9 : c6b9e000  r8 : 08421085
r7 : 00000001  r6 : 0000034b  r5 : bf00de34  r4 : 00000000
r3 : c6a7f0c0  r2 : 001bb89f  r1 : 6b6b6b6b  r0 : 00000068
Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 0005317f  Table: 46ba4000  DAC: 00000015
Process rmmod (pid: 142, stack limit =3D 0xc6b9e270)
Stack: (0xc6b9fed0 to 0xc6ba0000)
fec0:                                     c6b9e000 20000013 6b6b6b6b bf00=
de34
fee0: c6b9e000 c0009408 00000000 c01544f4 c082a3b0 c7865980 bf019634 bf01=
901c
ff00: bf019000 c7865988 bf019634 c018dad8 c018dac4 c018c5e0 bf019634 c786=
5988
ff20: c78659bc c018cdbc c6a86360 bf019688 bf019634 c0e690d0 0023f0b8 c018=
c438
ff40: bf019688 c6b9e000 00000000 c004c56c c75352a8 33316963 5f787878 0078=
6d69
ff60: 0023f008 c00a5088 c7812138 c6a4a388 00000000 c782c908 c6a4a388 c008=
8648
ff80: 00000003 c782c908 c6b9e000 00088730 00002002 00000001 0023f088 beea=
3e5c
ffa0: 00000081 c0009260 00000001 0023f088 0023f0b8 00000800 b6f4c65c beea=
3c00
ffc0: 00000001 0023f088 beea3e5c 00000081 0023f088 00000000 00000800 0023=
f008
ffe0: b6f10bc0 beea3c04 b6f8a5f8 b6f10bcc 60000010 0023f0b8 00000000 0000=
0000
[<c0154294>] (ida_remove+0xa0/0x110) from [<c01544f4>] (ida_simple_remove=
+0x30/0x60)
[<c01544f4>] (ida_simple_remove+0x30/0x60) from [<bf01901c>] (ci13xxx_imx=
_remove+0x1c/0x84 [ci13xxx_imx])
[<bf01901c>] (ci13xxx_imx_remove+0x1c/0x84 [ci13xxx_imx]) from [<c018dad8=
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
---[ end trace 74ff20eb0c5179ff ]---
note: rmmod[142] exited with preempt_count 1
Segmentation fault

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig8FE59908BA37A805D1D8E598
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/oOq0ACgkQjTAFq1RaXHOi0QCfaHHcnOKeuf+quvCBKSJ+W1Pq
H+YAoICUVkvnMjR4fYcrlx67YmJndTjH
=IQgD
-----END PGP SIGNATURE-----

--------------enig8FE59908BA37A805D1D8E598--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
