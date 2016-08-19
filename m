From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM64: zynqmp: Correct the watchdog timer interrupt
 number
Date: Fri, 19 Aug 2016 12:31:24 +0200
Message-ID: <9a5d718d-3626-ec41-e508-6d9ac982a8f1@monstr.eu>
References: <73e2ff39077d4593e92a1b484fbb586afcddb4bf.1470749892.git.michal.simek@xilinx.com>
 <1d73c4f687ebab2f5f2c48f9174055f08bdd40dd.1470749892.git.michal.simek@xilinx.com>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="KSWvHER09Bmfphr4Et2I43Usxo3BeO35i"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1d73c4f687ebab2f5f2c48f9174055f08bdd40dd.1470749892.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bharat Kumar Gogada <bharatku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KSWvHER09Bmfphr4Et2I43Usxo3BeO35i
Content-Type: multipart/mixed; boundary="03EDaQfcuLNhXVcCX36i3PlhXgpOTA1gK"
From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>,
 linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>,
 =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>,
 Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 Bharat Kumar Gogada <bharatku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>,
 Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>,
 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Message-ID: <9a5d718d-3626-ec41-e508-6d9ac982a8f1-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM64: zynqmp: Correct the watchdog timer interrupt
 number
References: <73e2ff39077d4593e92a1b484fbb586afcddb4bf.1470749892.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
 <1d73c4f687ebab2f5f2c48f9174055f08bdd40dd.1470749892.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
In-Reply-To: <1d73c4f687ebab2f5f2c48f9174055f08bdd40dd.1470749892.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

--03EDaQfcuLNhXVcCX36i3PlhXgpOTA1gK
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 9.8.2016 15:38, Michal Simek wrote:
> From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>=20
> Corrected the watchdog timer interrupt number.
> Origin value was for CSUPMU watchdog.
>=20
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>=20
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/d=
ts/xilinx/zynqmp.dtsi
> index 8ed4f42e781b..3bae4b2675d9 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -369,7 +369,7 @@
>  			compatible =3D "cdns,wdt-r1p2";
>  			status =3D "disabled";
>  			interrupt-parent =3D <&gic>;
> -			interrupts =3D <0 52 1>;
> +			interrupts =3D <0 113 1>;
>  			reg =3D <0x0 0xfd4d0000 0x0 0x1000>;
>  			timeout-sec =3D <10>;
>  		};
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



--03EDaQfcuLNhXVcCX36i3PlhXgpOTA1gK--

--KSWvHER09Bmfphr4Et2I43Usxo3BeO35i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAle23/wACgkQykllyylKDCGXyACfcLXVrPFsMqDGHAiS/9Q5dsgo
84YAmwYpKTdIbpybNT89y+pRJgBiggK8
=Wc40
-----END PGP SIGNATURE-----

--KSWvHER09Bmfphr4Et2I43Usxo3BeO35i--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
