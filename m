From: Antony Pavlov <antonynpavlov@gmail.com>
Subject: Re: [PATCH v3 5/5] riscv: dts: add initial board data for the
 SiFive HiFive Unleashed
Date: Sun, 9 Jun 2019 09:18:19 +0300
Message-ID: <20190609091819.2d1a97c90c0b44aa9120d373@gmail.com>
References: <20190602080500.31700-1-paul.walmsley@sifive.com>
 <20190602080500.31700-6-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190602080500.31700-6-paul.walmsley@sifive.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-riscv@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun,  2 Jun 2019 01:05:00 -0700
Paul Walmsley <paul.walmsley@sifive.com> wrote:

Hi!

> Add initial board data for the SiFive HiFive Unleashed A00.
> =

> Currently the data populated in this DT file describes the board
> DRAM configuration and the external clock sources that supply the
> PRCI.
> =

> This third version incorporates changes based on more comments from
> Rob Herring <robh+dt@kernel.org>.
> =

> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/boot/dts/sifive/Makefile           |  2 +
>  .../boot/dts/sifive/hifive-unleashed-a00.dts  | 67 +++++++++++++++++++
>  2 files changed, 69 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sifive/Makefile
>  create mode 100644 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> =

> diff --git a/arch/riscv/boot/dts/sifive/Makefile b/arch/riscv/boot/dts/si=
five/Makefile
> new file mode 100644
> index 000000000000..baaeef9efdcb
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sifive/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-y +=3D hifive-unleashed-a00.dtb
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/r=
iscv/boot/dts/sifive/hifive-unleashed-a00.dts
> new file mode 100644
> index 000000000000..1de4ea1577d5
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> @@ -0,0 +1,67 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2018-2019 SiFive, Inc */
> +
> +/dts-v1/;
> +
> +#include "fu540-c000.dtsi"

You already have "/dts-v1/;" in the fu540-c000.dtsi file.

You can omit it in the hifive-unleashed-a00.dts file.

> +/* Clock frequency (in Hz) of the PCB crystal for rtcclk */
> +#define RTCCLK_FREQ		1000000
> +
> +/ {
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +	model =3D "SiFive HiFive Unleashed A00";
> +	compatible =3D "sifive,hifive-unleashed-a00", "sifive,fu540-c000";
> +
> +	chosen {
> +	};
> +
> +	cpus {
> +		timebase-frequency =3D <RTCCLK_FREQ>;
> +	};
> +
> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x80000000 0x2 0x00000000>;
> +	};
> +
> +	soc {
> +	};
> +
> +	hfclk: hfclk {
> +		#clock-cells =3D <0>;
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <33333333>;
> +		clock-output-names =3D "hfclk";
> +	};
> +
> +	rtcclk: rtcclk {
> +		#clock-cells =3D <0>;
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <RTCCLK_FREQ>;
> +		clock-output-names =3D "rtcclk";
> +	};
> +};
> +
> +&qspi0 {
> +	flash@0 {
> +		compatible =3D "issi,is25wp256", "jedec,spi-nor";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <50000000>;
> +		m25p,fast-read;
> +		spi-tx-bus-width =3D <4>;
> +		spi-rx-bus-width =3D <4>;
> +	};
> +};
> +
> +&qspi2 {
> +	status =3D "okay";
> +	mmc@0 {
> +		compatible =3D "mmc-spi-slot";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <20000000>;
> +		voltage-ranges =3D <3300 3300>;
> +		disable-wp;
> +	};
> +};
> -- =

> 2.20.1
> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


-- =

Best regards,
=A0 Antony Pavlov
