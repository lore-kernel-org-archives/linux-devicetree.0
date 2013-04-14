From: Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 4/6] DT: MIPS: ralink: add RT2880 dts files
Date: Sun, 14 Apr 2013 11:53:05 +0200
Message-ID: <516A7C81.1010902@openwrt.org>
References: <1365843026-11015-1-git-send-email-blogic@openwrt.org>
 <1365843026-11015-4-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365843026-11015-4-git-send-email-blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2013.04.13. 10:50 keltez=E9ssel, John Crispin =EDrta:
> Add a dtsi file for RT2880 SoC and a sample dts file.
> =

> Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> ---
>  arch/mips/ralink/Kconfig             |    4 +++
>  arch/mips/ralink/dts/Makefile        |    1 +
>  arch/mips/ralink/dts/rt2880.dtsi     |   58 ++++++++++++++++++++++++++++=
++++++
>  arch/mips/ralink/dts/rt2880_eval.dts |   48 ++++++++++++++++++++++++++++
>  4 files changed, 111 insertions(+)
>  create mode 100644 arch/mips/ralink/dts/rt2880.dtsi
>  create mode 100644 arch/mips/ralink/dts/rt2880_eval.dts
> =

> diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
> index 86f6c77..2f6fbb8 100644
> --- a/arch/mips/ralink/Kconfig
> +++ b/arch/mips/ralink/Kconfig
> @@ -34,6 +34,10 @@ choice
>  	config DTB_RT_NONE
>  		bool "None"
>  =

> +	config DTB_RT2880_EVAL
> +		bool "RT2880 eval kit"
> +		depends on SOC_RT288X
> +
>  	config DTB_RT305X_EVAL
>  		bool "RT305x eval kit"
>  		depends on SOC_RT305X
> diff --git a/arch/mips/ralink/dts/Makefile b/arch/mips/ralink/dts/Makefile
> index 1a69fb3..f635a01 100644
> --- a/arch/mips/ralink/dts/Makefile
> +++ b/arch/mips/ralink/dts/Makefile
> @@ -1 +1,2 @@
> +obj-$(CONFIG_DTB_RT2880_EVAL) :=3D rt2880_eval.dtb.o
>  obj-$(CONFIG_DTB_RT305X_EVAL) :=3D rt3052_eval.dtb.o
> diff --git a/arch/mips/ralink/dts/rt2880.dtsi b/arch/mips/ralink/dts/rt28=
80.dtsi
> new file mode 100644
> index 0000000..182afde
> --- /dev/null
> +++ b/arch/mips/ralink/dts/rt2880.dtsi
> @@ -0,0 +1,58 @@
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +	compatible =3D "ralink,rt2880-soc";
> +
> +	cpus {
> +		cpu@0 {
> +			compatible =3D "mips,mips4KEc";
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
> +	palmbus@300000 {
> +		compatible =3D "palmbus";
> +		reg =3D <0x300000 0x200000>;
> +                ranges =3D <0x0 0x300000 0x1FFFFF>;
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +
> +		sysc@0 {
> +			compatible =3D "ralink,rt2880-sysc";
> +			reg =3D <0x0 0x100>;
> +		};
> +
> +		intc: intc@200 {
> +			compatible =3D "ralink,rt2880-intc";
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
> +			compatible =3D "ralink,rt2880-memc";
> +			reg =3D <0x300 0x100>;
> +		};
> +
> +		uartlite@c00 {
> +			compatible =3D "ralink,rt2880-uart", "ns16550a";
> +			reg =3D <0xc00 0x100>;
> +
> +			interrupt-parent =3D <&intc>;
> +			interrupts =3D <8>;
> +
> +			reg-shift =3D <2>;
> +		};
> +	};
> +};
> diff --git a/arch/mips/ralink/dts/rt2880_eval.dts b/arch/mips/ralink/dts/=
rt2880_eval.dts
> new file mode 100644
> index 0000000..e967b43
> --- /dev/null
> +++ b/arch/mips/ralink/dts/rt2880_eval.dts
> @@ -0,0 +1,48 @@
> +/dts-v1/;
> +
> +/include/ "rt2880.dtsi"
> +
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;

These -cells properties are superfluous, because the rt2880.dtsi file conta=
ins
these already.

-Gabor
