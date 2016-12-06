From: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH v3 -next 1/2] ARM: sunxi: add support for H2+ SoC
Date: Tue, 6 Dec 2016 13:01:56 +1100
Message-ID: <4c0bd9ab-05c7-bf53-e55a-fc4c108a456f@ozlabs.ru>
References: <20161202150513.34691-1-icenowy@aosc.xyz>
 <20161205091955.zkffyktw5trfocnx@lukather>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3167341528611257346=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161205091955.zkffyktw5trfocnx@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Icenowy Zheng <icenowy@aosc.xyz>
Cc: devicetree@vger.kernel.org, Vishnu Patekar <vishnupatekar0510@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, linux-sunxi@googlegroups.com, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3167341528611257346==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4RngeNA4PtwgxBVrAQqGSnrBS2rcBNOsk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4RngeNA4PtwgxBVrAQqGSnrBS2rcBNOsk
Content-Type: multipart/mixed; boundary="qua7W6ePsLbpA4HrODH14lE2DM4oLwo5g";
 protected-headers="v1"
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Icenowy Zheng <icenowy@aosc.xyz>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Andre Przywara
 <andre.przywara@arm.com>, Hans de Goede <hdegoede@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Vishnu Patekar <vishnupatekar0510@gmail.com>,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sunxi@googlegroups.com
Message-ID: <4c0bd9ab-05c7-bf53-e55a-fc4c108a456f@ozlabs.ru>
Subject: Re: [PATCH v3 -next 1/2] ARM: sunxi: add support for H2+ SoC
References: <20161202150513.34691-1-icenowy@aosc.xyz>
 <20161205091955.zkffyktw5trfocnx@lukather>
In-Reply-To: <20161205091955.zkffyktw5trfocnx@lukather>

--qua7W6ePsLbpA4HrODH14lE2DM4oLwo5g
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: quoted-printable

On 05/12/16 20:19, Maxime Ripard wrote:
> On Fri, Dec 02, 2016 at 11:05:12PM +0800, Icenowy Zheng wrote:
>> Allwinner H2+ is a quad-core Cortex-A7 SoC.
>>
>> It is very like H3, that they share the same SoC ID (0x1680), and H3
>> memory maps as well as drivers works well on the SoC.
>>
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
>=20
> Fixed the alphabetical order in the bindings doc, and applied.

Where is that resulting tree, with these ones and EMAC? Thanks.



--=20
Alexey


--qua7W6ePsLbpA4HrODH14lE2DM4oLwo5g--

--4RngeNA4PtwgxBVrAQqGSnrBS2rcBNOsk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIrBAEBCAAVBQJYRhwUDhxhaWtAb3psYWJzLnJ1AAoJEIYTPdgrwSC59twP/A6L
Ae8IA01UctHTWR5gtDwBknzsaTFnTDJU/SXyCl5MX3HtM1hvnS7wGAheYXdYV2YX
4pnDZHGRfg0z31lfr6Abao8aVmkf3RK9NeVpqtNYlcdsGt+BpJZOO0DEy5jsn8/W
/E2GLIHC2kQfIonjcxfm5mou+6q8G8YFsAmaIt6j+VvCoyFi0sulHlqwt+EUwpY6
VekfwVpP6//EfxTzYt4Fwdr70TdBPFxKiHrP70jWqJjwEhzE8j+GeZn9hkCp2mRv
5+naz2gMWsD0lZtlo6rF1Hbl4igngPR7AEO0/Qk1BMqru5qBRWSQCBid4VabGTHu
AsFwDsnCvSx0YEbK59p5bJGWG0Tqx3pFWlACNRHtNjQO0CEF6rt3UoPnwD15HxdH
iYEkVCxV9s41FZ7aSlIUiquA8mk57cQvtRZscYA5zZYRIBB6GhOP76agn5Uk4tkE
cb8fyiYWQxaxGy7mPIbhNdm0iDdR7iEb8DDdy3+XuyWkuXzv+GAABOTwPOk/013N
nIo5mWTzhA98SHsfteUgP+eWfdSWsR7iKKLl46+mzRSohxuwET2Dgx6pjf3H4Dun
/XxvdF2JqQpNLkYbiyZW61g8t9SGQ107heMJbb0TfucfwewOfZj4x1xTPItwbqX8
IUHuTL+OMrHC3lWtWa4Vrr1PebjFnh5ci4hsM61u
=JkOV
-----END PGP SIGNATURE-----

--4RngeNA4PtwgxBVrAQqGSnrBS2rcBNOsk--


--===============3167341528611257346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3167341528611257346==--
