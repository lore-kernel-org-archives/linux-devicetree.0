From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH v3 net-next 3/6] dt-bindings: net: Add lantiq,xrx200-net
 DT bindings
Date: Tue, 11 Sep 2018 23:33:29 +0200
Message-ID: <72fed78d-bc75-b88a-faa8-d2032be59d0f@hauke-m.de>
References: <20180909201647.32727-1-hauke@hauke-m.de>
 <20180909201647.32727-4-hauke@hauke-m.de> <20180910125308.GC30395@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oLEE0ykZURaRGF50ipN8ayXlYLC9wULer"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180910125308.GC30395@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, netdev@vger.kernel.org, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oLEE0ykZURaRGF50ipN8ayXlYLC9wULer
Content-Type: multipart/mixed; boundary="pLkFwJQBS6Z446jNBrt5JyTNjHDv7HOdD";
 protected-headers="v1"
From: Hauke Mehrtens <hauke@hauke-m.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, john@phrozen.org,
 linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com,
 devicetree@vger.kernel.org
Message-ID: <72fed78d-bc75-b88a-faa8-d2032be59d0f@hauke-m.de>
Subject: Re: [PATCH v3 net-next 3/6] dt-bindings: net: Add lantiq,xrx200-net
 DT bindings
References: <20180909201647.32727-1-hauke@hauke-m.de>
 <20180909201647.32727-4-hauke@hauke-m.de> <20180910125308.GC30395@lunn.ch>
In-Reply-To: <20180910125308.GC30395@lunn.ch>

--pLkFwJQBS6Z446jNBrt5JyTNjHDv7HOdD
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09/10/2018 02:53 PM, Andrew Lunn wrote:
> On Sun, Sep 09, 2018 at 10:16:44PM +0200, Hauke Mehrtens wrote:
>> This adds the binding for the PMAC core between the CPU and the GSWIP
>> switch found on the xrx200 / VR9 Lantiq / Intel SoC.
>>
>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>> Cc: devicetree@vger.kernel.org
>> ---
>>  .../devicetree/bindings/net/lantiq,xrx200-net.txt   | 21 ++++++++++++=
+++++++++
>>  1 file changed, 21 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/lantiq,xrx20=
0-net.txt
>>
>> diff --git a/Documentation/devicetree/bindings/net/lantiq,xrx200-net.t=
xt b/Documentation/devicetree/bindings/net/lantiq,xrx200-net.txt
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
>> +- compatible	: "lantiq,xrx200-net" for the PMAC of the embedded
>> +		: GSWIP in the xXR200
>> +- reg		: memory range of the PMAC core inside of the GSWIP core
>> +- interrupts	: TX and RX DMA interrupts. Use interrupt-names "tx" for=

>> +		: the TX interrupt and "rx" for the RX interrupt.
>> +
>> +Example:
>> +
>> +eth0: eth@E10B308 {
>> +	#address-cells =3D <1>;
>> +	#size-cells =3D <0>;
>> +	compatible =3D "lantiq,xrx200-net";
>> +	reg =3D <0xE10B308 0x30>;
>=20
> Hi Hauke
>=20
> This binding itself looks fine. I just find this address range a bit
> odd. What are 0xe10b300-0xe10b307 used for? Are all 0x30 bytes used in
> the range? The address range ending at 0xe10b338 seems a bit
> odd. 0xe10b33f would be more typical.
>=20
> I'm asking because it can be messy when you find out you need to
> change the address range, and not break backwards compatibility.
>=20
>      Andrew

Hi Andrew,

Thank you for the question, there were multiple problems with the
register size in this description.
It is a bit more complicated because the PMAC is part of the switch and
does not start at an even address.

It is correct that this starts at 0xE10B308, but the size is 0xCF8.

0xe10b300 is unused and 0xe10B304 is used to enable debug modes.

Hauke


--pLkFwJQBS6Z446jNBrt5JyTNjHDv7HOdD--

--oLEE0ykZURaRGF50ipN8ayXlYLC9wULer
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEyz0/uAcd+JwXmwtD8bdnhZyy68cFAluYNKkACgkQ8bdnhZyy
68fFqQf/ar1w8DpUFeNPTvJ7UATq7XPntradeex7oov4OspvWegtgNT6nBoUKW21
5RQveHc/Jg2EX+45Xfjfzb9+kH/gQjsqHIbcim1/dSVvUkotp++SdhoNZypVlIPP
/HeGsfW65HiquxqvvqDSvbYKGuYatvPcPO/h3dYOysROJlnG1/grQKRc7PrecWgL
i+TP/d07m0xlg7YKBwBW7FriJIqytAPB4srDbGLIJKYKcyFZlmAX3hXPG1hpYRGV
71+J8VSOf+2rFmx345GKi5pWCXaQuPgGMsoVTL6K8+d9gu+mcBFzzL9C63i/MXeI
30go5Qps1UGOMPtb8KwcIPw5+J2Y3w==
=hjwI
-----END PGP SIGNATURE-----

--oLEE0ykZURaRGF50ipN8ayXlYLC9wULer--
