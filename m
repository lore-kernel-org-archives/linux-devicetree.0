From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH v2 net-next 1/7] MIPS: lantiq: dma: add dev pointer
Date: Sat, 1 Sep 2018 23:39:19 +0200
Message-ID: <6674a5ca-2a9f-b2cf-6127-2dea5ca24ab0@hauke-m.de>
References: <20180901114535.9070-1-hauke@hauke-m.de>
 <20180901114535.9070-2-hauke@hauke-m.de> <20180901145700.GB6305@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zOP7tekKMbgpzXwmhcQfTj6fEro8tYYzg"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180901145700.GB6305@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, netdev@vger.kernel.org, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zOP7tekKMbgpzXwmhcQfTj6fEro8tYYzg
Content-Type: multipart/mixed; boundary="CuGYdUUF7vWPK2zLFeTtD5sxGtjZoh4oL";
 protected-headers="v1"
From: Hauke Mehrtens <hauke@hauke-m.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, john@phrozen.org,
 linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com,
 devicetree@vger.kernel.org
Message-ID: <6674a5ca-2a9f-b2cf-6127-2dea5ca24ab0@hauke-m.de>
Subject: Re: [PATCH v2 net-next 1/7] MIPS: lantiq: dma: add dev pointer
References: <20180901114535.9070-1-hauke@hauke-m.de>
 <20180901114535.9070-2-hauke@hauke-m.de> <20180901145700.GB6305@lunn.ch>
In-Reply-To: <20180901145700.GB6305@lunn.ch>

--CuGYdUUF7vWPK2zLFeTtD5sxGtjZoh4oL
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09/01/2018 04:57 PM, Andrew Lunn wrote:
> On Sat, Sep 01, 2018 at 01:45:29PM +0200, Hauke Mehrtens wrote:
>> dma_zalloc_coherent() now crashes if no dev pointer is given.
>> Add a dev pointer to the ltq_dma_channel structure and fill it in the
>> driver using it.
>>
>> This fixes a bug introduced in kernel 4.19.
>=20
> Hi Hauke
>=20
> Should this be added to stable so that it appears in 4.19-rcX?  If so,
> please send it to net, not net-next.

Hi Andrew,

Thanks for the review.

Yes this should go into 4.19-rcX.
The "lantiq: Add Lantiq / Intel VRX200 Ethernet driver" patch has a
compile dependency on this patch. Should I send "MIPS: lantiq: dma: add
dev pointer" separately or just mark it as 4.19-rcX in this series?

Hauke


--CuGYdUUF7vWPK2zLFeTtD5sxGtjZoh4oL--

--zOP7tekKMbgpzXwmhcQfTj6fEro8tYYzg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEyz0/uAcd+JwXmwtD8bdnhZyy68cFAluLBw0ACgkQ8bdnhZyy
68dDpQf+ILeIYYmNQiT+eoWWtFnpX3wsYcBxP8UEbx9Z471N+tv/XAqxZebmtPk3
pZbqxHYiZYvumqKdqVd3ot9jMagXC7WuQH23o1LgjzGhVsl1UWlPzp0rIdGySK+4
q0tsr4PsyDw0NqeIUDLs2x0rIsFxbkMX7/isGtEQPOmqgLIJ026DFNkfPfDI75nn
7cAJvrueeep7xOClrQFKyKEtRJO+rriJAiONFyNq9LLez9UVkNQCQCje5u8z4Sfc
YCkT7oIM4Or2qqK2Wv2UJOKd9o6J4g3TF5HI6V80YI8+Gq0e82XTBzIDrm5EW0k8
bxM/f4tTVP3Pfq+QCNZaZwVvIPQmYQ==
=O/+f
-----END PGP SIGNATURE-----

--zOP7tekKMbgpzXwmhcQfTj6fEro8tYYzg--
