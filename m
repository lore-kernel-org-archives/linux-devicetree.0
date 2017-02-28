From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/5] ARM64: dts: Prepare Realtek RTD1295 and Zidoo X9S
Date: Mon, 27 Feb 2017 18:03:27 -0600
Message-ID: <20170228000327.hnenlharcmiqxkpb@rob-hp-laptop>
References: <20170223164553.3715-1-afaerber@suse.de>
 <20170223164553.3715-5-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170223164553.3715-5-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Roc He <hepeng@zidoo.tv>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 23, 2017 at 05:45:51PM +0100, Andreas F=E4rber wrote:
> Add initial device trees for the RTD1295 SoC and the Zidoo X9S TV box.
> =

> The CPUs lack the enable-method property because the vendor device tree
> uses a custom "rtk-spin-table" method and "psci" did not appear to work.
> =

> The UARTs lack the interrupts properties because the vendor device tree
> connects them to a custom interrupt controller. earlycon works without.
> =

> A list of memory reservations is adopted from v1.2.11 vendor device tree:
> 0x02200000 can be used for an initrd, 0x01b00000 is audio-related;
> ion-related 0x02600000, 0x02c00000 and 0x11000000 are left out;
> 0x10000000 is used for sharing the U-Boot environment; others remain
> to be investigated.
> =

> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Andreas F=E4rber <afaerber@suse.de>
> ---
>  v1 -> v2:
>  * Dropped 0x0000000010000000 /memreserve/
>  =

>  arch/arm64/boot/dts/Makefile                      |   1 +
>  arch/arm64/boot/dts/realtek/Makefile              |   5 +
>  arch/arm64/boot/dts/realtek/rtd1295-zidoo-x9s.dts |  78 +++++++++++
>  arch/arm64/boot/dts/realtek/rtd1295.dtsi          | 162 ++++++++++++++++=
++++++
>  4 files changed, 246 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/realtek/Makefile
>  create mode 100644 arch/arm64/boot/dts/realtek/rtd1295-zidoo-x9s.dts
>  create mode 100644 arch/arm64/boot/dts/realtek/rtd1295.dtsi
> =

> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index 080232b..78f7991 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -14,6 +14,7 @@ dts-dirs +=3D marvell
>  dts-dirs +=3D mediatek
>  dts-dirs +=3D nvidia
>  dts-dirs +=3D qcom
> +dts-dirs +=3D realtek
>  dts-dirs +=3D renesas
>  dts-dirs +=3D rockchip
>  dts-dirs +=3D socionext
> diff --git a/arch/arm64/boot/dts/realtek/Makefile b/arch/arm64/boot/dts/r=
ealtek/Makefile
> new file mode 100644
> index 0000000..8521e92
> --- /dev/null
> +++ b/arch/arm64/boot/dts/realtek/Makefile
> @@ -0,0 +1,5 @@
> +dtb-$(CONFIG_ARCH_REALTEK) +=3D rtd1295-zidoo-x9s.dtb
> +
> +always		:=3D $(dtb-y)
> +subdir-y	:=3D $(dts-dirs)
> +clean-files	:=3D *.dtb
> diff --git a/arch/arm64/boot/dts/realtek/rtd1295-zidoo-x9s.dts b/arch/arm=
64/boot/dts/realtek/rtd1295-zidoo-x9s.dts
> new file mode 100644
> index 0000000..53302bb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/realtek/rtd1295-zidoo-x9s.dts
> @@ -0,0 +1,78 @@
> +/*
> + * Copyright (c) 2016-2017 Andreas F=E4rber
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.

You can use SPDX tag here instead.

> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;

Unless you have >4GB regions, you don't really need 2 cells here.

> +		ranges;
> +
> +		tee@10100000 {
> +			reg =3D <0x0 0x10100000 0x0 0xf00000>;
> +			no-map;
> +		};
> +	};


> +	soc {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;

Same here. And use ranges to narrow the address space to what you need.

> +		ranges;
> +
> +		uart0: serial@98007800 {
> +			compatible =3D "snps,dw-apb-uart";
> +			reg =3D <0x0 0x98007800 0x0 0x400>,
> +			      <0x0 0x98007000 0x0 0x100>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clock-frequency =3D <27000000>;
> +			status =3D "disabled";
> +		};
> +
> +		uart1: serial@9801b200 {
> +			compatible =3D "snps,dw-apb-uart";
> +			reg =3D <0x0 0x9801b200 0x0 0x100>,
> +			      <0x0 0x9801b00c 0x0 0x100>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clock-frequency =3D <432000000>;
> +			status =3D "disabled";
> +		};
> +
> +		uart2: serial@9801b400 {
> +			compatible =3D "snps,dw-apb-uart";
> +			reg =3D <0x0 0x9801b400 0x0 0x100>,
> +			      <0x0 0x9801b00c 0x0 0x100>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clock-frequency =3D <432000000>;
> +			status =3D "disabled";
> +		};
> +
> +		gic: interrupt-controller@ff011000 {
> +			compatible =3D "arm,gic-400";
> +			reg =3D <0x0 0xff011000 0x0 0x1000>,
> +			      <0x0 0xff012000 0x0 0x1000>;

You are missing some register ranges and the sizes may be wrong. Check =

the binding doc.

> +			interrupt-controller;
> +			#interrupt-cells =3D <3>;
> +		};
> +	};
> +};
> -- =

> 2.10.2
> =
