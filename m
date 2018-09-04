From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH v2 net-next 4/7] dt-bindings: net: Add lantiq,xrx200-net
 DT bindings
Date: Tue, 4 Sep 2018 23:54:10 +0200
Message-ID: <eb19b532-8a22-4bfb-ae03-7b563ab951e1@hauke-m.de>
References: <20180901114535.9070-1-hauke@hauke-m.de>
 <20180901120407.9912-1-hauke@hauke-m.de>
 <5866e89f-ac9a-8c6c-bf53-3b1206171e31@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="e9TLdY9O2j3pVJJBcjK8u3SqrPvLPQd8c"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <5866e89f-ac9a-8c6c-bf53-3b1206171e31@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, davem@davemloft.net
Cc: netdev@vger.kernel.org, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--e9TLdY9O2j3pVJJBcjK8u3SqrPvLPQd8c
Content-Type: multipart/mixed; boundary="3YXgcjdJQutfN8Y4EgutzzpNnpILg0SdY";
 protected-headers="v1"
From: Hauke Mehrtens <hauke@hauke-m.de>
To: Florian Fainelli <f.fainelli@gmail.com>, davem@davemloft.net
Cc: netdev@vger.kernel.org, andrew@lunn.ch,
 vivien.didelot@savoirfairelinux.com, john@phrozen.org,
 linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com,
 devicetree@vger.kernel.org
Message-ID: <eb19b532-8a22-4bfb-ae03-7b563ab951e1@hauke-m.de>
Subject: Re: [PATCH v2 net-next 4/7] dt-bindings: net: Add lantiq,xrx200-net
 DT bindings
References: <20180901114535.9070-1-hauke@hauke-m.de>
 <20180901120407.9912-1-hauke@hauke-m.de>
 <5866e89f-ac9a-8c6c-bf53-3b1206171e31@gmail.com>
In-Reply-To: <5866e89f-ac9a-8c6c-bf53-3b1206171e31@gmail.com>

--3YXgcjdJQutfN8Y4EgutzzpNnpILg0SdY
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09/03/2018 09:46 PM, Florian Fainelli wrote:
>=20
>=20
> On 9/1/2018 5:04 AM, Hauke Mehrtens wrote:
>> This adds the binding for the PMAC core between the CPU and the GSWIP
>> switch found on the xrx200 / VR9 Lantiq / Intel SoC.
>>
>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>> Cc: devicetree@vger.kernel.org
>> ---
>> =C2=A0 .../devicetree/bindings/net/lantiq,xrx200-net.txt=C2=A0=C2=A0 |=
 21
>> +++++++++++++++++++++
>> =C2=A0 1 file changed, 21 insertions(+)
>> =C2=A0 create mode 100644
>> Documentation/devicetree/bindings/net/lantiq,xrx200-net.txt
>>
>> diff --git
>> a/Documentation/devicetree/bindings/net/lantiq,xrx200-net.txt
>> b/Documentation/devicetree/bindings/net/lantiq,xrx200-net.txt
>> new file mode 100644
>> index 000000000000..8a2fe5200cdc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/lantiq,xrx200-net.txt
>> @@ -0,0 +1,21 @@
>> +Lantiq xRX200 GSWIP PMAC Ethernet driver
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Required properties:
>> +
>> +- compatible=C2=A0=C2=A0=C2=A0 : "lantiq,xrx200-net" for the PMAC of =
the embedded
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : GSWIP in the xXR200
>> +- reg=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : memory range of the=
 PMAC core inside of the GSWIP core
>> +- interrupts=C2=A0=C2=A0=C2=A0 : TX and RX DMA interrupts. Use interr=
upt-names "tx" for
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : the TX interrupt and "rx=
" for the RX interrupt.
>=20
> You would likely want to document that the order should be strict, that=

> is TX interrupt first and RX interrupt second, but other than that:
>=20
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Currently this is fetched based on the name like this:
platform_get_irq_byname(pdev, "rx");

I do not care about the order, just interrupt-names must match.

Hauke


--3YXgcjdJQutfN8Y4EgutzzpNnpILg0SdY--

--e9TLdY9O2j3pVJJBcjK8u3SqrPvLPQd8c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEyz0/uAcd+JwXmwtD8bdnhZyy68cFAluO/wIACgkQ8bdnhZyy
68dmhwf+JA1mtQmFE8JwGaL12ZOrgdDekT4TuVKvO10fkvAdRw2c9//XQ+HlYW77
DuznsLhCpHsgZJXnZmdyvRcaLSs/ZhBUpEtqDrOxgWgxCGOPIzTgykFBfxBREuwQ
4VVPstVs10+pPDh/B7UCaIJizuz3XX5qBFdyau9xcDr1MMPx5V+nucT79Dr0nRqF
aMUHA4raeJxTEpDC3gaQkmiY+d0rymGZhVZIH8tNkZU1ASY3suLC9sNGkU8ur7bh
q2XBMEoaGQkH6T55GbJ1xvTCFnhnqTWDBwf/R2SeqfUCJWI2vkg3PM8Hqpi73zOA
xMdlufWLRGoNYUt+DZXA8ICuzHmFQg==
=6GfD
-----END PGP SIGNATURE-----

--e9TLdY9O2j3pVJJBcjK8u3SqrPvLPQd8c--
