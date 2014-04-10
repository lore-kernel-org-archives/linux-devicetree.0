From: Michal Simek <monstr@monstr.eu>
Subject: Re: [RFC PATCH v2] edac: synopsys: Added EDAC support for zynq ddr
 ecc controller
Date: Thu, 10 Apr 2014 08:01:36 +0200
Message-ID: <534633C0.9090905@monstr.eu>
References: <1220b715-6fc2-42ed-8393-b9859fc0deb9@TX2EHSMHS021.ehs.local> <20140408204047.GQ30077@pd.tnic>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="g4EdcpCdE46rNIrv0osdLthcv9fCRFIwB"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140408204047.GQ30077@pd.tnic>
Sender: linux-doc-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, dougthompson@xmission.com, linux-edac@vger.kernel.org, michal.simek@xilinx.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, sorenb@xilinx.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kpc528@gmail.com, kalluripunnaiahchoudary@gmail.com, punnaia@xilinx.com
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--g4EdcpCdE46rNIrv0osdLthcv9fCRFIwB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Borislav and Punnaiah,

some comments below.

>> diff --git a/drivers/edac/synopsys_edac.c b/drivers/edac/synopsys_edac=
=2Ec
>> new file mode 100644
>> index 0000000..7cec331
>> --- /dev/null
>> +++ b/drivers/edac/synopsys_edac.c
>> @@ -0,0 +1,614 @@
>> +/*
>> + * Synopsys DDR ECC Driver
>> + * This driver is based on ppc4xx_edac.c drivers
>> + *
>> + * Copyright (C) 2012 - 2014 Xilinx, Inc.
>=20
> The same question to you: are you going to maintain this driver? If so,=

> please consider adding yourself to the MAINTAINERS file so that people
> reporting issues with it can send you a note.

Just add it to Zynq maintainer fragment as we are doing for non zynq/xili=
nx
drivers.


>> +/**
>> + * struct synopsys_edac_priv - DDR memory controller private instance=
 data
>> + * @baseaddr:		Base address of the DDR controller
>> + * @ce_count:		Correctable Error count
>> + * @ue_count:		Uncorrectable Error count
>> + */
>> +struct synopsys_edac_priv {
>> +	void __iomem *baseaddr;
>> +	u32 ce_count;
>> +	u32 ue_count;
>> +};
>> +
>> +/**
>=20
> Why do we need the kernel-doc annotation for all those static functions=
?

I don't want to fight on this but having documentation help with reading
the code. I also don't think that only non static functions are documente=
d.
I can't see any problem to have kernel-doc for static functions.
At least the is the first time when someone saying that only some functio=
ns
should be documented.


> Also, drop the "synopsys_edac_" prefix of all static functions - that'l=
l
> slim up the code even further.

I don't think this is good to do. When we remove this prefix entirely
it is bigger chance that the same function name will be used by another d=
river.
It is not a problem with linking but the same functions names will be lis=
ted
in System.map which will complicate debugging.
For ARM multiplatform kernel I think that it is almost must to use
vendor prefixes for all platform/driver code.
All drivers can use instead of name_probe just probe but I don't think
this is the right way to go.

The rest was commented by Punnaiah.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--g4EdcpCdE46rNIrv0osdLthcv9fCRFIwB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlNGM9QACgkQykllyylKDCE3EwCgmIonyXVEDnKAP5Td/DcXgel+
jCYAnjz3opSjrPvg5mYRmd15Hl2oUnR6
=iDN5
-----END PGP SIGNATURE-----

--g4EdcpCdE46rNIrv0osdLthcv9fCRFIwB--
