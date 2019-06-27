From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v4 0/2] Use NVMEM as reboot-mode write interface
Date: Thu, 27 Jun 2019 20:33:30 +0200
Message-ID: <20190627183330.aole6zumw3l2vyet@earth.universe>
References: <20190515104658.25535-1-nandor.han@vaisala.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oelnsnnwwn2ytluu"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190515104658.25535-1-nandor.han@vaisala.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Han Nandor <nandor.han@vaisala.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--oelnsnnwwn2ytluu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 15, 2019 at 10:47:14AM +0000, Han Nandor wrote:
> Description
> -----------
> Extend the reboot mode driver to use a NVMEM cell as writing interface.
>=20
> Testing
> -------
> The testing is done by configuring DT from a custom board.
> The NVMEM cell is configured in an RTC non-volatile memory.
> Kernel: 4.14.60 (the patchset was rebased on kernel master)
>=20
> DT configurations:
> `
> ...
> reboot-mode-nvmem@0 {
>     compatible =3D "simple-mfd";
>     reboot-mode {
>         compatible =3D "nvmem-reboot-mode";
>         nvmem-cells =3D <&reboot_mode>;
>         nvmem-cell-names =3D "reboot-mode";
>=20
>         mode-test       =3D <0x21969147>;
>     };
> };
> ...
> reboot_mode: nvmem_reboot_mode@0 {
>         reg =3D <0x00 0x4>;
> };
> ...
> `
>=20
> 1. Reboot the system using the command `reboot test`
>=20
> 2. Verify that kernel logs show that reboot was done in mode `test`:
> PASS
> `[  413.957172] reboot: Restarting system with command 'test' `
>=20
> 3. Stop in U-Boot and verify that mode `test` magic value is present
> in RTCs non-volatile memory: PASS
>=20
> Kernel: 5.1.0-rc3
>=20
> 1. Configure `arch/arm/configs/imx_v6_v7_defconfig` to contain=20
> `CONFIG_NVMEM_REBOOT_MODE=3Dy`
> 2. Verify that Kernel compiles successful: PASS
> `
> make ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnu- imx_v6_v7_defconfig zImage
> ...
> CC      drivers/power/reset/nvmem-reboot-mode.o
> ...
> Kernel: arch/arm/boot/zImage is ready
> `
> Changes since v1:
> -----------------
>  - split the documentation on a separate patch
>  - add a missing header
>=20
> Changes since v2:
> ----------------
>  - change the module license to GPL since GPL v2 is deprecated
>=20
> Changes since v3:
> ----------------
>  - documentation updated according to the comments

Thanks, queued. Please fix your git/mail setup, I had to fix the
line endings (\r\n -> \n) to apply this.

-- Sebastian

--oelnsnnwwn2ytluu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl0VC/oACgkQ2O7X88g7
+poTJRAAk2T33ox4H9f695WRdSpVuZjgdJfRsyNVYrMVpd0NwDgt5CfSFtpQ7Lub
c5BDpY/LMnOH6HbcQipgW343roX4QpYhz6kwbbk2XSdfam8uuchgMtNDQqwDFNY3
zQ9PMWNKK0eECbnJqa6E825/KQPrvXHQsu0D5irtD5DtPXBizr43yfhRv2EEACBa
fnMU1XSOVVgvhWk/jpFD+mbfmVGct9YYG40yxj6migvNd9Im9soIXP6bjhQieuue
5heq3SNkCSJzAV0yw0JHHDqQq/6zChB4gqv6B1yQ9mRKY6s3Ejnkug29HCXipuZI
r1RO+U9p56PD36JW43JbECAGyz7zqnb13mcNXFBULDkjgURDOXuOWZVA1Ot2HDq2
qva4h5F/hhYc5D9o/nJ220+D+jxDXu7P9qVg1IUEXweojoWSZEJu62nnEjgVQYnE
r/AIsvZE7z3o8DfgnLpM1vq5rQKasOPN58rJOCB7yC993eIZob8IPl3c/D7llkSj
JIGb4Kg/vP7NtCHES7x87p37RTsih7pCBrfOvPt8369s7BkqRcmLTH8a5vm4TREa
y2jztX0f+n/qaGz1GkCqZ4+s1hOLOjyhX+f6ViFSNQUvkTuy9kgVZDeIn2hCbNA4
qlJI30TEH2cu+Hk8Bxc0vegYjCLtdB+C4l+MmUy+wRDx3SEryiU=
=8+eb
-----END PGP SIGNATURE-----

--oelnsnnwwn2ytluu--
