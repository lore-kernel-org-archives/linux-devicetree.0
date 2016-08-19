From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v3 2/2] ARM64: zynqmp: Add PCIe node
Date: Fri, 19 Aug 2016 12:30:49 +0200
Message-ID: <a0012b9a-4c4f-f292-bb94-982fc53525bd@monstr.eu>
References: <c26e914e5a65f22c2dc19dc2f90b4eb59d51828b.1470750018.git.michal.simek@xilinx.com>
 <5930f26f4b5dd129dce09f0a707817d5cf82fde9.1470750018.git.michal.simek@xilinx.com>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="xc6C6lCvWh2Fmb79muQc9ALRuik63FmUb"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5930f26f4b5dd129dce09f0a707817d5cf82fde9.1470750018.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bharat Kumar Gogada <bharatku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xc6C6lCvWh2Fmb79muQc9ALRuik63FmUb
Content-Type: multipart/mixed; boundary="nrLg82NCbj4VDbCFQGRpbnhvdDNuSf0cn"
From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>,
 linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bharat Kumar Gogada <bharatku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>,
 =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>,
 devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>,
 linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>,
 Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>,
 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Message-ID: <a0012b9a-4c4f-f292-bb94-982fc53525bd-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v3 2/2] ARM64: zynqmp: Add PCIe node
References: <c26e914e5a65f22c2dc19dc2f90b4eb59d51828b.1470750018.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
 <5930f26f4b5dd129dce09f0a707817d5cf82fde9.1470750018.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
In-Reply-To: <5930f26f4b5dd129dce09f0a707817d5cf82fde9.1470750018.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

--nrLg82NCbj4VDbCFQGRpbnhvdDNuSf0cn
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 9.8.2016 15:40, Michal Simek wrote:
> Add PCIe node with prefetchable memory which goes beyond 4GB.
>=20
> Signed-off-by: Bharat Kumar Gogada <bharatku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>=20
> Changes in v3:
> - New patch to show usage of 2/2 on main amba bus
>=20
> Changes in v2: None
>=20
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 39 ++++++++++++++++++++++++++=
++++++++
>  1 file changed, 39 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/d=
ts/xilinx/zynqmp.dtsi
> index d24014765111..fbdd6ab98988 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -193,6 +193,45 @@
>  			#size-cells =3D <0>;
>  		};
> =20
> +		pcie: pcie@fd0e0000 {
> +			compatible =3D "xlnx,nwl-pcie-2.11";
> +			status =3D "disabled";
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +			#interrupt-cells =3D <1>;
> +			msi-controller;
> +			device_type =3D "pci";
> +			interrupt-parent =3D <&gic>;
> +			interrupts =3D <0 118 4>,
> +				    <0 117 4>,
> +				    <0 116 4>,
> +				    <0 115 4>,	/* MSI_1 [63...32] */
> +				    <0 114 4>;	/* MSI_0 [31...0] */
> +			interrupt-names =3D "misc", "dummy", "intx",
> +					  "msi1", "msi0";
> +			msi-parent =3D <&pcie>;
> +			reg =3D <0x0 0xfd0e0000 0x0 0x1000>,
> +			      <0x0 0xfd480000 0x0 0x1000>,
> +			      <0x80 0x00000000 0x0 0x1000000>;
> +			reg-names =3D "breg", "pcireg", "cfg";
> +			ranges =3D <0x02000000 0x00000000 0xe0000000 0x00000000
> +				  0xe0000000 0x00000000 0x10000000
> +				  /* non-prefetchable memory */
> +				  0x43000000 0x00000006 0x00000000 0x00000006
> +				  0x00000000 0x00000002 0x00000000>;
> +				  /* prefetchable memory */
> +			interrupt-map-mask =3D <0x0 0x0 0x0 0x7>;
> +			interrupt-map =3D <0x0 0x0 0x0 0x1 &pcie_intc 0x1>,
> +					<0x0 0x0 0x0 0x2 &pcie_intc 0x2>,
> +					<0x0 0x0 0x0 0x3 &pcie_intc 0x3>,
> +					<0x0 0x0 0x0 0x4 &pcie_intc 0x4>;
> +			pcie_intc: legacy-interrupt-controller {
> +				interrupt-controller;
> +				#address-cells =3D <0>;
> +				#interrupt-cells =3D <1>;
> +			};
> +		};
> +
>  		sata: ahci@fd0c0000 {
>  			compatible =3D "ceva,ahci-1v84";
>  			status =3D "disabled";
>=20

Applied both.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs



--nrLg82NCbj4VDbCFQGRpbnhvdDNuSf0cn--

--xc6C6lCvWh2Fmb79muQc9ALRuik63FmUb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAle239kACgkQykllyylKDCElPQCgikchCyhX5gvcS4+M/F3kDq/M
O0cAni7ob9MmoXdDqsrtpfGdVLqNHm56
=iipH
-----END PGP SIGNATURE-----

--xc6C6lCvWh2Fmb79muQc9ALRuik63FmUb--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
