From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH AUTOSEL 5.2 17/42] MIPS: lantiq: update the clock alias'
 for the mainline PCIe PHY driver
Date: Sun, 29 Sep 2019 19:39:49 +0200
Message-ID: <fe9161b3-2402-e5a8-959b-63c807be3e08@hauke-m.de>
References: <20190929173244.8918-1-sashal@kernel.org>
 <20190929173244.8918-17-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="vqoTqJDMAjIg6ueVBxDecZGi6pvZH2A4r"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190929173244.8918-17-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, john@phrozen.org, kishon@ti.com, ralf@linux-mips.org, robh+dt@kernel.org, mark.rutland@arm.com, ms@dev.tdt.de
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vqoTqJDMAjIg6ueVBxDecZGi6pvZH2A4r
Content-Type: multipart/mixed; boundary="tCCip87R52w8X4Q5c7TDn45CxU5mAHeAK";
 protected-headers="v1"
From: Hauke Mehrtens <hauke@hauke-m.de>
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, john@phrozen.org, kishon@ti.com,
 ralf@linux-mips.org, robh+dt@kernel.org, mark.rutland@arm.com, ms@dev.tdt.de
Message-ID: <fe9161b3-2402-e5a8-959b-63c807be3e08@hauke-m.de>
Subject: Re: [PATCH AUTOSEL 5.2 17/42] MIPS: lantiq: update the clock alias'
 for the mainline PCIe PHY driver
References: <20190929173244.8918-1-sashal@kernel.org>
 <20190929173244.8918-17-sashal@kernel.org>
In-Reply-To: <20190929173244.8918-17-sashal@kernel.org>

--tCCip87R52w8X4Q5c7TDn45CxU5mAHeAK
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 9/29/19 7:32 PM, Sasha Levin wrote:
> From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>=20
> [ Upstream commit ed90302be64a53d9031c8ce05428c358b16a5d96 ]
>=20
> The mainline PCIe PHY driver has it's own devicetree node. Update the
> clock alias so the mainline driver finds the clocks.
>=20
> The first PCIe PHY is located at 0x1f106800 and exists on VRX200, ARX30=
0
> and GRX390.
> The second PCIe PHY is located at 0x1f700400 and exists on ARX300 and
> GRX390.
> The third PCIe PHY is located at 0x1f106a00 and exists onl on GRX390.
> Lantiq's board support package (called "UGW") names these registers
> "PDI".
>=20
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>=

> Signed-off-by: Paul Burton <paul.burton@mips.com>
> Cc: linux-mips@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: john@phrozen.org
> Cc: kishon@ti.com
> Cc: ralf@linux-mips.org
> Cc: robh+dt@kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: hauke@hauke-m.de
> Cc: mark.rutland@arm.com
> Cc: ms@dev.tdt.de
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  arch/mips/lantiq/xway/sysctrl.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Hi Sasha,

This change only makes sense with the new upstream PCIe phy driver which
was added to kernel 5.4 [0], older kernel versions do not have this PCIe
PHY driver. I would not backport these changes to older kernel versions.

[0]: https://git.kernel.org/linus/e52a632195bf43d1a91ae699e7536a6ead736aa=
7

Hauke


--tCCip87R52w8X4Q5c7TDn45CxU5mAHeAK--

--vqoTqJDMAjIg6ueVBxDecZGi6pvZH2A4r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEyz0/uAcd+JwXmwtD8bdnhZyy68cFAl2Q7GUACgkQ8bdnhZyy
68cvowgAll6A19TIk6q/0VGvrhPBHP0XaBlVjuzvZjgKHGmrmViFb8fesc2v6i6r
KqJ3y9WX2Y2nhxNXQYTC16moUp2uDFASAWZNfQScUg01hIuLKe04CDqHGPWv3rc3
qHYNxUR9nMZojXormiaRIt0t3zGQ5LXSMSb+6hN9Bils2o8aAduI8qPJX09wecg8
dpRj70JZyRyZvESXaCzfJEB8DNNGJhx31m7gz0IKTEM9oKp4AUvKxeoAUw1Kgli4
KDHjfCY5KyYXVaF6sUbprBmULWtOICj5Vr9mJ+EB7uI5vkT90QmtlZ1koEIKd6SN
hogxu60ae+dR7jJaEFPp087Y3ne5Yg==
=jZKA
-----END PGP SIGNATURE-----

--vqoTqJDMAjIg6ueVBxDecZGi6pvZH2A4r--
