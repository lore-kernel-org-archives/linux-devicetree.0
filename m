From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v3] dtb: Create a common home for cross-architecture dtsi
 files.
Date: Fri, 31 Jul 2015 15:54:32 +0100
Message-ID: <20150731145431.GL20890@e106497-lin.cambridge.arm.com>
References: <1438353109-373-1-git-send-email-ian.campbell@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438353109-373-1-git-send-email-ian.campbell@citrix.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Ian Campbell <ian.campbell@citrix.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Sudeep Holla <Sudeep.Holla@arm.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Kristina Martsenko <Kristina.Martsenko@arm.com>, Kevin Hilman <khilman@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 31, 2015 at 03:31:49PM +0100, Ian Campbell wrote:
> Commit 9ccd608070b6 "arm64: dts: add device tree for ARM SMM-A53x2 on
> LogicTile Express 20MG" added a new dts file to arch/arm64 which
> included "../../../../arm/boot/dts/vexpress-v2m-rs1.dtsi", i.e. a
> .dtsi supplied by arch/arm.
>=20
> Unfortunately this causes some issues for the split device tree
> repository[0], since things get moved around there. In that context
> the new .dts ends up at src/arm64/arm/vexpress-v2f-1xv7-ca53x2.dts
> while the include is at src/arm/vexpress-v2m-rs1.dtsi.
>=20
> The sharing of the .dtsi is legitimate since the baseboard is the sam=
e
> for various vexpress systems whatever processor they use.
>=20
> Rather than using ../../ tricks to pickup .dtsi files from another
> arch this patch creates a new directory include/dt-dtsi as a
> home for such cross-arch .dtsi files, arranges for it to be in the
> include path when the .dts files are processed by cpp and switches th=
e
> .dts files to use cpp #include instead of /include/. The dtsi file
> itself is moved into a vendor subdir in this case "arm" (the vendor,
> not the ARCH=3D).
>=20
> [0] https://git.kernel.org/cgit/linux/kernel/git/devicetree/devicetre=
e-rebasing.git/
>=20
> Signed-off-by: Ian Campbell <ian.campbell@citrix.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Kumar Gala <galak@codeaurora.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Kristina Martsenko <kristina.martsenko@arm.com>
> Cc: Kevin Hilman <khilman@linaro.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kbuild@vger.kernel.org
> ---
> v2: Move to include/dt-dtsi and introduce a per-vendor subdirectory.
>=20
> v3: Move to kernel/dts.
>     Include new directory in DTC include path as well as cpp path, an=
d
>     therefore switch back to /include/.
>     Update MAINTAINERS

=46or the arch/arm changes:

Acked-by: Liviu Dudau <Liviu.Dudau@arm.com>

> ---
>  Documentation/devicetree/bindings/arm/vexpress.txt          | 2 +-
>  MAINTAINERS                                                 | 1 +
>  arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts                 | 2 +-
>  arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts                  | 2 +-
>  arch/arm/boot/dts/vexpress-v2p-ca5s.dts                     | 2 +-
>  arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts        | 2 +-
>  {arch/arm/boot/dts =3D> kernel/dts/arm}/vexpress-v2m-rs1.dtsi | 0
>  scripts/Makefile.lib                                        | 3 ++-
>  8 files changed, 8 insertions(+), 6 deletions(-)
>  rename {arch/arm/boot/dts =3D> kernel/dts/arm}/vexpress-v2m-rs1.dtsi=
 (100%)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/vexpress.txt b/Doc=
umentation/devicetree/bindings/arm/vexpress.txt
> index 39844cd..b6031d9 100644
> --- a/Documentation/devicetree/bindings/arm/vexpress.txt
> +++ b/Documentation/devicetree/bindings/arm/vexpress.txt
> @@ -223,7 +223,7 @@ Example of a VE tile description (simplified)
>  		/* Active high IRQ 0 is connected to GIC's SPI0 */
>  		interrupt-map =3D <0 0 0 &gic 0 0 4>;
> =20
> -		/include/ "vexpress-v2m-rs1.dtsi"
> +		/include/ "arm/vexpress-v2m-rs1.dtsi"
>  	};
>  };
> =20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a226416..1941078 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7537,6 +7537,7 @@ S:	Maintained
>  F:	Documentation/devicetree/
>  F:	arch/*/boot/dts/
>  F:	include/dt-bindings/
> +F:	kernel/dts/
> =20
>  OPEN FIRMWARE AND DEVICE TREE OVERLAYS
>  M:	Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> diff --git a/arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts b/arch/arm/b=
oot/dts/vexpress-v2p-ca15-tc1.dts
> index 9420053..b144092 100644
> --- a/arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts
> +++ b/arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts
> @@ -278,6 +278,6 @@
>  				<0 0 41 &gic 0 41 4>,
>  				<0 0 42 &gic 0 42 4>;
> =20
> -		/include/ "vexpress-v2m-rs1.dtsi"
> +		/include/ "arm/vexpress-v2m-rs1.dtsi"
>  	};
>  };
> diff --git a/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts b/arch/arm/bo=
ot/dts/vexpress-v2p-ca15_a7.dts
> index 17f63f7..350f402 100644
> --- a/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts
> +++ b/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts
> @@ -636,6 +636,6 @@
>  				<0 0 41 &gic 0 41 4>,
>  				<0 0 42 &gic 0 42 4>;
> =20
> -		/include/ "vexpress-v2m-rs1.dtsi"
> +		/include/ "arm/vexpress-v2m-rs1.dtsi"
>  	};
>  };
> diff --git a/arch/arm/boot/dts/vexpress-v2p-ca5s.dts b/arch/arm/boot/=
dts/vexpress-v2p-ca5s.dts
> index d2709b7..585ced0 100644
> --- a/arch/arm/boot/dts/vexpress-v2p-ca5s.dts
> +++ b/arch/arm/boot/dts/vexpress-v2p-ca5s.dts
> @@ -248,6 +248,6 @@
>  				<0 0 41 &gic 0 41 4>,
>  				<0 0 42 &gic 0 42 4>;
> =20
> -		/include/ "vexpress-v2m-rs1.dtsi"
> +		/include/ "arm/vexpress-v2m-rs1.dtsi"
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts b/a=
rch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
> index 5b1d018..c044804 100644
> --- a/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
> +++ b/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
> @@ -186,6 +186,6 @@
>  				<0 0 41 &gic GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
>  				<0 0 42 &gic GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> =20
> -		/include/ "../../../../arm/boot/dts/vexpress-v2m-rs1.dtsi"
> +		/include/ "arm/vexpress-v2m-rs1.dtsi"
>  	};
>  };
> diff --git a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi b/kernel/dts/arm=
/vexpress-v2m-rs1.dtsi
> similarity index 100%
> rename from arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
> rename to kernel/dts/arm/vexpress-v2m-rs1.dtsi
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 79e8661..b4d9fb6 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -163,6 +163,7 @@ dtc_cpp_flags  =3D -Wp,-MD,$(depfile).pre.tmp -no=
stdinc                    \
>  		 -I$(srctree)/arch/$(SRCARCH)/boot/dts                   \
>  		 -I$(srctree)/arch/$(SRCARCH)/boot/dts/include           \
>  		 -I$(srctree)/drivers/of/testcase-data                   \
> +		 -I$(srctree)/kernel/dts                                 \
>  		 -undef -D__DTS__
> =20
>  # Finds the multi-part object the current object will be linked into
> @@ -285,7 +286,7 @@ quiet_cmd_dtc =3D DTC     $@
>  cmd_dtc =3D mkdir -p $(dir ${dtc-tmp}) ; \
>  	$(CPP) $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
>  	$(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 \
> -		-i $(dir $<) $(DTC_FLAGS) \
> +		-i $(dir $<) -i $(srctree)/kernel/dts $(DTC_FLAGS) \
>  		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
>  	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
> =20
> --=20
> 2.1.4
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
