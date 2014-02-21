From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH RFC] usb: gadget: Add xilinx axi usb2 device support
Date: Fri, 21 Feb 2014 07:38:16 +0100
Message-ID: <5306F458.9010706@monstr.eu>
References: <774153d4-d33f-4bb4-813b-582762bc3af9@TX2EHSMHS021.ehs.local> <20140220182257.GF23217@saruman.home>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="Oqx0dPQ6Ek1O2VkS9NggUWs20Qa7cBUuj"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140220182257.GF23217-HgARHv6XitL9zxVx7UNMDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Oqx0dPQ6Ek1O2VkS9NggUWs20Qa7cBUuj
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

>> + * Copyright (C) 2010 - 2014 Xilinx, Inc.
>> + *
>> + * Some parts of this driver code is based on the driver for at91-ser=
ies
>> + * USB peripheral controller (at91_udc.c).
>> + *
>> + * This program is free software; you can redistribute it
>> + * and/or modify it under the terms of the GNU General Public
>> + * License as published by the Free Software Foundation;
>> + * either version 2 of the License, or (at your option) any
>> + * later version.
>=20
> are you sure you want to allow people ot use GPL v3 on this driver ?

The license is the same as is in at91_udc.c driver.
=46rom my understanding if this driver is based on that one we
have to follow license from it.
And this is problem in general with all licenses in the kernel
which use this fragment.
I don't think we can change it to be just GPLv2.
Please correct me if I am wrong.

BTW: u-boot started to use SPDX-License-Identifier
which will be nice to start to use.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--Oqx0dPQ6Ek1O2VkS9NggUWs20Qa7cBUuj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlMG9FgACgkQykllyylKDCElSwCfa6Xi7L+AFzYxGfNPH+eQYMTs
2AQAnjZoDi/eyZ71fksfsfQURIrulpG3
=j2AP
-----END PGP SIGNATURE-----

--Oqx0dPQ6Ek1O2VkS9NggUWs20Qa7cBUuj--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
