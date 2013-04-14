From: Gabor Juhos <juhosg@openwrt.org>
Subject: Re: [PATCH 6/6] DT: MIPS: ralink: add MT7620 dts files
Date: Sun, 14 Apr 2013 13:41:33 +0200
Message-ID: <516A95ED.1060801@openwrt.org>
References: <1365843026-11015-1-git-send-email-blogic@openwrt.org> <1365843026-11015-6-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1365843026-11015-6-git-send-email-blogic@openwrt.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: John Crispin <blogic@openwrt.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

2013.04.13. 10:50 keltez=E9ssel, John Crispin =EDrta:
> Add a dtsi file for MT7620 SoC and a sample dts file.
>=20
> Signed-off-by: John Crispin <blogic@openwrt.org>
> ---
>  arch/mips/ralink/Kconfig             |    4 +++
>  arch/mips/ralink/dts/Makefile        |    1 +
>  arch/mips/ralink/dts/mt7620.dtsi     |   58 ++++++++++++++++++++++++=
++++++++++
>  arch/mips/ralink/dts/mt7620_eval.dts |   18 +++++++++++
>  4 files changed, 81 insertions(+)
>  create mode 100644 arch/mips/ralink/dts/mt7620.dtsi
>  create mode 100644 arch/mips/ralink/dts/mt7620_eval.dts
>=20
> diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
> index 493411f..8254502 100644
> --- a/arch/mips/ralink/Kconfig
> +++ b/arch/mips/ralink/Kconfig
> @@ -46,6 +46,10 @@ choice
>  		bool "RT3883 eval kit"
>  		depends on SOC_RT3883
> =20
> +	config DTB_MT7620_EVAL
> +		bool "MT7620 eval kit"

To be precise, this is a MT7620A based evaluation board. Both the confi=
g symbol
and the prompt should reflect that IMO.

> +		depends on SOC_MT7620
> +
>  endchoice
> =20
>  endif
> diff --git a/arch/mips/ralink/dts/Makefile b/arch/mips/ralink/dts/Mak=
efile
> index 040a986..036603a 100644
> --- a/arch/mips/ralink/dts/Makefile
> +++ b/arch/mips/ralink/dts/Makefile
> @@ -1,3 +1,4 @@
>  obj-$(CONFIG_DTB_RT2880_EVAL) :=3D rt2880_eval.dtb.o
>  obj-$(CONFIG_DTB_RT305X_EVAL) :=3D rt3052_eval.dtb.o
>  obj-$(CONFIG_DTB_RT3883_EVAL) :=3D rt3883_eval.dtb.o
> +obj-$(CONFIG_DTB_MT7620_EVAL) :=3D mt7620_eval.dtb.o
> diff --git a/arch/mips/ralink/dts/mt7620.dtsi b/arch/mips/ralink/dts/=
mt7620.dtsi
> new file mode 100644
> index 0000000..5087c57
> --- /dev/null
> +++ b/arch/mips/ralink/dts/mt7620.dtsi
> @@ -0,0 +1,58 @@
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +	compatible =3D "ralink,mtk7620n-soc", "ralink,mt7620-soc";

This does not match with the actual MT7620 code. That uses "ralink,mt76=
20n-soc"
and "ralink,mt7620a-soc" values. Ideally, we should have separate dtsi =
files for
the two SoCs. Additionally, the compatible property of the root node wi=
ll be
overwritten in the board specific dts files so adding that to the dtsi =
file
seems superfluous.

> +
> +	cpus {
> +		cpu@0 {
> +			compatible =3D "mips,mips24KEc";
> +		};
> +	};
> +
> +	cpuintc: cpuintc@0 {
> +		#address-cells =3D <0>;
> +		#interrupt-cells =3D <1>;
> +		interrupt-controller;
> +		compatible =3D "mti,cpu-interrupt-controller";
> +	};
> +
> +	palmbus@10000000 {
> +		compatible =3D "palmbus";
> +		reg =3D <0x10000000 0x200000>;
> +                ranges =3D <0x0 0x10000000 0x1FFFFF>;
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +
> +		sysc@0 {
> +			compatible =3D "ralink,mt7620-sysc", "ralink,mt7620n-sysc";

The 'mt7620-' prefix is a wildcard, either 'mt7620n-' or 'mt7620a-' sho=
uld be
used instead. This applies to the following nodes as well.

> +			reg =3D <0x0 0x100>;
> +		};
> +
> +		intc: intc@200 {
> +			compatible =3D "ralink,mt7620-intc", "ralink,rt2880-intc";
> +			reg =3D <0x200 0x100>;
> +
> +			interrupt-controller;
> +			#interrupt-cells =3D <1>;
> +
> +			interrupt-parent =3D <&cpuintc>;
> +			interrupts =3D <2>;
> +		};
> +
> +		memc@300 {
> +			compatible =3D "ralink,mt7620-memc", "ralink,rt3050-memc";
> +			reg =3D <0x300 0x100>;
> +		};
> +
> +		uartlite@c00 {
> +			compatible =3D "ralink,mt7620-uart", "ralink,rt2880-uart", "ns165=
50a";
> +			reg =3D <0xc00 0x100>;
> +
> +			interrupt-parent =3D <&intc>;
> +			interrupts =3D <12>;
> +
> +			reg-shift =3D <2>;
> +		};
> +	};
> +};
> diff --git a/arch/mips/ralink/dts/mt7620_eval.dts b/arch/mips/ralink/=
dts/mt7620_eval.dts
> new file mode 100644
> index 0000000..72dec59
> --- /dev/null
> +++ b/arch/mips/ralink/dts/mt7620_eval.dts

The DTS file describes an evaluation board with a MT7620A SoC, the file=
 name
should be changed to reflect that. It would help to avoid confusion if =
we want
to add another DTS file for a MT7620N based evaluation board later.

> @@ -0,0 +1,18 @@
> +/dts-v1/;
> +
> +/include/ "mt7620.dtsi"
> +
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +	compatible =3D "ralink,mt7620a-eval-board", "ralink,mt7620a-soc";
> +	model =3D "Ralink MT7620 evaluation board";

s/MT7620/MT7620A/

> +
> +	memory@0 {
> +		reg =3D <0x0 0x4000000>;
> +	};
> +
> +	chosen {
> +		bootargs =3D "console=3DttyS0,57600";
> +	};
> +};
>=20

-Gabor
