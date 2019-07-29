From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH 5/5] MIPS: dts: lantiq: danube: easy50712: route the
 PCI_INTA IRQ through EBU
Date: Mon, 29 Jul 2019 23:55:21 +0200
Message-ID: <ac4418f3-a77d-f450-f99b-1f789ff6b42d@hauke-m.de>
References: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
 <20190727175315.28834-6-martin.blumenstingl@googlemail.com>
 <86wog2mq6k.wl-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="GhTQbiR8HPIsGB7nOslHAJNUom91Snh2O"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <86wog2mq6k.wl-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, john@phrozen.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GhTQbiR8HPIsGB7nOslHAJNUom91Snh2O
Content-Type: multipart/mixed; boundary="htERSnPkQ3DxdowN4hcOQtazMTOdElH98";
 protected-headers="v1"
From: Hauke Mehrtens <hauke@hauke-m.de>
To: Marc Zyngier <marc.zyngier@arm.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org,
 paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, john@phrozen.org
Message-ID: <ac4418f3-a77d-f450-f99b-1f789ff6b42d@hauke-m.de>
Subject: Re: [PATCH 5/5] MIPS: dts: lantiq: danube: easy50712: route the
 PCI_INTA IRQ through EBU
References: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
 <20190727175315.28834-6-martin.blumenstingl@googlemail.com>
 <86wog2mq6k.wl-marc.zyngier@arm.com>
In-Reply-To: <86wog2mq6k.wl-marc.zyngier@arm.com>

--htERSnPkQ3DxdowN4hcOQtazMTOdElH98
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/28/19 12:03 PM, Marc Zyngier wrote:
> On Sat, 27 Jul 2019 18:53:15 +0100,
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>>
>> EBU provides an interrupt line for the PCI_INTA interrupt. Route
>> easy50712's PCI interrupt to EBU so the interrupt line is configured
>> correctly (using IRQ_TYPE_LEVEL_LOW, this was previously hardcoded in
>> the PCI driver) and ACKed properly.
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com=
>

Acked-by: Hauke Mehrtens <hauke@hauke-m.de>

>> ---
>>  arch/mips/boot/dts/lantiq/easy50712.dts | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/boot/dts/lantiq/easy50712.dts b/arch/mips/boot/=
dts/lantiq/easy50712.dts
>> index 1ce20b7d05cb..33c26b93cfc9 100644
>> --- a/arch/mips/boot/dts/lantiq/easy50712.dts
>> +++ b/arch/mips/boot/dts/lantiq/easy50712.dts
>> @@ -1,6 +1,8 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  /dts-v1/;
>> =20
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +
>>  /include/ "danube.dtsi"
>> =20
>>  / {
>> @@ -105,7 +107,7 @@
>>  			lantiq,bus-clock =3D <33333333>;
>>  			interrupt-map-mask =3D <0xf800 0x0 0x0 0x7>;
>>  			interrupt-map =3D <
>> -				0x7000 0 0 1 &icu0 29 1 // slot 14, irq 29
>> +				0x7000 0 0 1 &ebu0 0 IRQ_TYPE_LEVEL_LOW // slot 14
>>  			>;
>>  			gpios-reset =3D <&gpio 21 0>;
>>  			req-mask =3D <0x1>;		/* GNT1 */
>> --=20
>> 2.22.0
>>
>=20
> Are you OK with breaking compatibility between kernel and DT? It
> usually isn't very nice for users...

I am fine with such changes. I am not aware of any board using this SoC
which ships the kernel and the device tree file as different binaries,
it is always either attached or patched into the kernel and never in the
boot loader.

Hauke


--htERSnPkQ3DxdowN4hcOQtazMTOdElH98--

--GhTQbiR8HPIsGB7nOslHAJNUom91Snh2O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEyz0/uAcd+JwXmwtD8bdnhZyy68cFAl0/a0kACgkQ8bdnhZyy
68e1NggAgRDL6+YwQE+/JLxd/uSBbb2lO/H8N8osnESY6PFBNa31k2aSFiJuFrcQ
/jSKs3U/Af2J7B/ctdWWGh/mEPgKvBFIwZKgynYRDy6NYhRmYN+WZO5Zg2k1mr7C
retwFDYdads6oPDM07v7ERUQDL/s9WlW39PR1m3XSKTmZlb26uf048kV8lGVM25S
MXS7j+xFrZ/1ZbH62iqJ8b1+eoQCV1Rt8QlF9pmeTAHTjoo2Vr1XRWaPciPv+l5o
ULzRhq5qzCdlV8rsG7FPOs/M4cABG3CsfVjMsWS/S/Oh0JGsS3a86s8wRdcBgiS7
R8ZnF93K8jE5gZ2yHG4TexUxyV0PJQ==
=AG2t
-----END PGP SIGNATURE-----

--GhTQbiR8HPIsGB7nOslHAJNUom91Snh2O--
