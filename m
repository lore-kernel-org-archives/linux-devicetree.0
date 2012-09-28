From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH v4 03/16] tegra: fdt: Add pwm binding and node
Date: Fri, 28 Sep 2012 22:08:17 +0200
Message-ID: <20120928200817.GB30777@avionic-0098.mockup.avionic-design.de>
References: <1348793077-10126-1-git-send-email-sjg@chromium.org>
	<1348793077-10126-4-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0339771149=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1348793077-10126-4-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Stephen Warren <swarren@nvidia.com>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org


--===============0339771149==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Content-Disposition: inline


--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 27, 2012 at 05:44:24PM -0700, Simon Glass wrote:
> This binding will apparently soon be in linux-next. Bring it in now
> since we need to do something, and may as well try to target what
> Linux will have.
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> Changes in v3:
> - Add new commit for pwm binding and node
>=20
>  arch/arm/dts/tegra20.dtsi                    |    7 +++++++
>  doc/device-tree-bindings/pwm/tegra20-pwm.txt |   18 ++++++++++++++++++
>  2 files changed, 25 insertions(+), 0 deletions(-)
>  create mode 100644 doc/device-tree-bindings/pwm/tegra20-pwm.txt
>=20
> diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
> index d936b1e..3221bc9 100644
> --- a/arch/arm/dts/tegra20.dtsi
> +++ b/arch/arm/dts/tegra20.dtsi
> @@ -211,4 +211,11 @@
>  		compatible =3D "nvidia,tegra20-nand";
>  		reg =3D <0x70008000 0x100>;
>  	};
> +
> +	pwm: pwm@7000a000 {
> +		compatible =3D "nvidia,tegra20-pwm";
> +		reg =3D <0x7000a000 0x100>;
> +		#pwm-cells =3D <2>;
> +	};
> +
>  };
> diff --git a/doc/device-tree-bindings/pwm/tegra20-pwm.txt b/doc/device-tr=
ee-bindings/pwm/tegra20-pwm.txt
> new file mode 100644
> index 0000000..bbbeedb
> --- /dev/null
> +++ b/doc/device-tree-bindings/pwm/tegra20-pwm.txt
> @@ -0,0 +1,18 @@
> +Tegra SoC PWFM controller
> +
> +Required properties:
> +- compatible: should be one of:
> +  - "nvidia,tegra20-pwm"
> +  - "nvidia,tegra30-pwm"
> +- reg: physical base address and length of the controller's registers
> +- #pwm-cells: On Tegra the number of cells used to specify a PWM is 2. T=
he
> +  first cell specifies the per-chip index of the PWM to use and the seco=
nd
> +  cell is the duty cycle in nanoseconds.

This is a mistake in the Linux kernel documentation. The second cell
specifies the period in nanoseconds, not the duty cycle. I'll fix this
up in the kernel.

Thierry

--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQZgOxAAoJEN0jrNd/PrOhe1AP/1vdcBHoKdkoJbAzRSgmxmNO
ETZwps0L+z/tvdeLnHjEKmsW7wWHIJaH5uH/8vFaNvu8CwvWo7xdiLVvvtB6Q2kT
MCVoo5HH0Wd5g+tN38k0WDUZMtQOvXtcBNhhCx0m2lntN7+PFMXpzl4t8hjSqkY1
XW7MFXBs4caz1MAKMCwqMPYHIFIcHtnVMFVZLTAroICC0keNQ0OFOWVrmBQ9aPJ2
QvHvja4j3lNT+Iw6KWaoXJimr6hAJrzM7pUwQiPqZzhgqDRnTh0XJX7Rzc2/O3IB
jLxnue6uzIjD7Zb0DKC78w1ga3+YHwogwmOkBcLITV3/mkjmp6qHjsGovA/et+xn
UH7m0u3XVbAEdhTKsI9SdaVdufWUrUjGHM2/bQmktMnnyn2YRwY0ELSoC3x1zpQI
hxL9ReND2FJXVGJHcNVuE5lm4FqyZRYAbYiDMTB0gdu8rlDQY2aAYhJ49r3oV5I8
GNxNFeEwbJe5jA2l6vRQnbPKtIOXnXQpom1lgRv1Ucdt/gLGSg+w33Xvp1n8S3ur
AxJfbAsSzY98VaeO6fBX5iycAmkWW5bc86l+61FAB5ZP9CL/+YKUsWv3s395koPs
KAcVSzgauID6qRUjXt6v3iZc0ZQdPeMLkPso4ddLTEw6MJVCuXBqQTaBOujNzV9u
MoG9QdFmu2Sl8rdR6PJp
=oLCK
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--

--===============0339771149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============0339771149==--
