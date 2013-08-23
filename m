From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 4/6] DT: MIPS: ralink: add RT2880 dts files
Date: Fri, 23 Aug 2013 22:34:13 +0400
Message-ID: <5217AB25.3050106@cogentembedded.com>
References: <1365843026-11015-1-git-send-email-blogic@openwrt.org> <1365843026-11015-4-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1365843026-11015-4-git-send-email-blogic@openwrt.org>
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

On 04/13/2013 12:50 PM, John Crispin wrote:

> Add a dtsi file for RT2880 SoC and a sample dts file.

    You forgot to mention Kconfig entry...

> Signed-off-by: John Crispin <blogic@openwrt.org>
[...]

> diff --git a/arch/mips/ralink/dts/Makefile b/arch/mips/ralink/dts/Makefile
> index 1a69fb3..f635a01 100644
> --- a/arch/mips/ralink/dts/Makefile
> +++ b/arch/mips/ralink/dts/Makefile
> @@ -1 +1,2 @@
> +obj-$(CONFIG_DTB_RT2880_EVAL) := rt2880_eval.dtb.o
>   obj-$(CONFIG_DTB_RT305X_EVAL) := rt3052_eval.dtb.o
> diff --git a/arch/mips/ralink/dts/rt2880.dtsi b/arch/mips/ralink/dts/rt2880.dtsi
> new file mode 100644
> index 0000000..182afde
> --- /dev/null
> +++ b/arch/mips/ralink/dts/rt2880.dtsi
> @@ -0,0 +1,58 @@
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "ralink,rt2880-soc";
> +
> +	cpus {
> +		cpu@0 {
> +			compatible = "mips,mips4KEc";
> +		};
> +	};
> +
> +	cpuintc: cpuintc@0 {

    According to ePAPR spec [1], the node name should be "interrupt-controller".

> +		#address-cells = <0>;
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +		compatible = "mti,cpu-interrupt-controller";

    So, it's "mips" or "mti"?

> +	};
> +
> +	palmbus@300000 {
> +		compatible = "palmbus";
> +		reg = <0x300000 0x200000>;
> +                ranges = <0x0 0x300000 0x1FFFFF>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		sysc@0 {

    Perhaps "system-controller" to be in the same vein with other correct 
naming I'm saying about?

> +			compatible = "ralink,rt2880-sysc";
> +			reg = <0x0 0x100>;
> +		};
> +
> +		intc: intc@200 {

    According to ePAPR spec [1], the node name should be "interrupt-controller".

> +			compatible = "ralink,rt2880-intc";
> +			reg = <0x200 0x100>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			interrupt-parent = <&cpuintc>;
> +			interrupts = <2>;
> +		};
> +
> +		memc@300 {

    According to ePAPR spec [1], the node name should be "memory-controller".

> +			compatible = "ralink,rt2880-memc";
> +			reg = <0x300 0x100>;
> +		};
> +
> +		uartlite@c00 {

    According to ePAPR spec [1], the node name should be "serial".

[...]
> diff --git a/arch/mips/ralink/dts/rt2880_eval.dts b/arch/mips/ralink/dts/rt2880_eval.dts
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
[...]
> +	cfi@1f000000 {

    According to ePAPR spec [1], the node name should be "flash".

[1] http://www.power.org/resources/downloads/Power_ePAPR_APPROVED_v1.0.pdf

WBR, Sergei
