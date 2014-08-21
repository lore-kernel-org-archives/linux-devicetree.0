From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 3/3] ARM: zynq: DT: Add Ethernet phys
Date: Thu, 21 Aug 2014 10:41:39 +0200
Message-ID: <5a7b6f57-b6c0-4fb3-af0d-d403277c0207@BN1AFFO11FD045.protection.gbl>
References: <1408550219-19825-1-git-send-email-soren.brinkmann@xilinx.com>
 <1408550219-19825-3-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="fElvA5BxDOSshuQRRn6I8hh453RfkE42V"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1408550219-19825-3-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Soren Brinkmann <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

--fElvA5BxDOSshuQRRn6I8hh453RfkE42V
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 08/20/2014 05:56 PM, Soren Brinkmann wrote:
> Add missing Ethernet phys to Zynq DTs.
>=20
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> ---
>  arch/arm/boot/dts/zynq-zc702.dts | 6 ++++++
>  arch/arm/boot/dts/zynq-zc706.dts | 6 ++++++
>  arch/arm/boot/dts/zynq-zed.dts   | 6 ++++++
>  3 files changed, 18 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-=
zc702.dts
> index 30bcfe20f0bc..fa810505ab8f 100644
> --- a/arch/arm/boot/dts/zynq-zc702.dts
> +++ b/arch/arm/boot/dts/zynq-zc702.dts
> @@ -36,6 +36,12 @@
>  &gem0 {
>  	status =3D "okay";
>  	phy-mode =3D "rgmii-id";
> +	phy-handle =3D <&ethernet_phy>;
> +
> +	ethernet_phy: ethernet-phy@7 {
> +		compatible =3D "marvell,88e1116r", "ethernet-phy-ieee802.3-c22";

c22 is completely unused by the kernel and also c22 is default option any=
way.
Any advantage to have c22 specified here?

Thanks,
Michal


--fElvA5BxDOSshuQRRn6I8hh453RfkE42V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlP1sMMACgkQykllyylKDCF3IACfd/zsWcNWPUnjV+zg+J+/VNur
YFAAn33FvNW/ccOeahyZOOaNyIxENRQl
=OvCF
-----END PGP SIGNATURE-----

--fElvA5BxDOSshuQRRn6I8hh453RfkE42V--
