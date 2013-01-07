From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: davinci: da850: add pinctrl driver entries
Date: Mon, 7 Jan 2013 20:35:37 +0530
Message-ID: <50EAE441.4050804@ti.com>
References: <1354876051-25938-1-git-send-email-anilkumar.v@ti.com>
	<1354876051-25938-2-git-send-email-anilkumar.v@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1354876051-25938-2-git-send-email-anilkumar.v-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: "Kumar, Anil" <anilkumar.v-l0cyMroinI0@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, hs-ynQEQJNshbs@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Anil,

On 12/7/2012 3:57 PM, Kumar, Anil wrote:
> For DT, DaVinci platform can use pinctrl-single driver for handling
> padconf registers.
> 
> Enable PINCTRL Kconfig for all DaVinci platform. Add required
> pinctrl DT entries in da850 dts file.
> 
> Test procedure
>  1)Populate DT file with NAND node information.
>  2)Populate board DT file with pinmux information for NAND.
>  3)Boot and confirm NAND is detected by the kernel.
>  4)cat /proc/mtd to show partitions.
> 
> Signed-off-by: Kumar, Anil <anilkumar.v-l0cyMroinI0@public.gmane.org>
> ---
> :000000 100644 0000000... f999d9e... A	Documentation/devicetree/bindings/arm/davinci/pinctrl.txt
> :100644 100644 06e0adf... 54a5405... M	arch/arm/Kconfig
> :100644 100644 37dc5a3... 8cac9d2... M	arch/arm/boot/dts/da850-evm.dts
> :100644 100644 fbada87... 94471bc... M	arch/arm/boot/dts/da850.dtsi
> :100644 100644 f292239... 0892db4... M	arch/arm/configs/da8xx_omapl_defconfig
>  .../devicetree/bindings/arm/davinci/pinctrl.txt    |   29 ++++++++++++++++++++
>  arch/arm/Kconfig                                   |    1 +
>  arch/arm/boot/dts/da850-evm.dts                    |    3 ++
>  arch/arm/boot/dts/da850.dtsi                       |   10 +++++++
>  arch/arm/configs/da8xx_omapl_defconfig             |    1 +
>  5 files changed, 44 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/davinci/pinctrl.txt b/Documentation/devicetree/bindings/arm/davinci/pinctrl.txt
> new file mode 100644
> index 0000000..f999d9e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/davinci/pinctrl.txt
> @@ -0,0 +1,29 @@
> +* Texas Instruments Davinci pinctrl-single
> +
> +This file provides information, what the device node for the
> +davinci pinctrl-single interface contain.
> +
> +Required properties:
> +- compatible: "pinctrl-single";
> +
> +- reg : offset and length of the register set for the mux registers
> +
> +- pinctrl-single,bit-per-mux: mask of allowed pinmux function bits in the
> +  pinmux register
> +
> +- pinctrl-single,register-width: pinmux register access width in bits
> +
> +- pinctrl-single,function-mask:  mask of allowed pinmux function bits in
> +  the pinmux register
> +
> +Example:
> +pmx_core:pinmux@14120 {
> +		compatible = "pinctrl-single";
> +		reg = <0x14120 0x50>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		pinctrl-single,bit-per-mux;
> +		pinctrl-single,register-width = <32>;
> +		pinctrl-single,function-mask = <0xffffffff>;
> +};

These bindings are already documented as part of
Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt. No need to
repeat.

> +~
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 06e0adf..54a5405 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -924,6 +924,7 @@ config ARCH_DAVINCI
>  	select GENERIC_IRQ_CHIP
>  	select HAVE_IDE
>  	select NEED_MACH_GPIO_H
> +	select PINCTRL

No need to force this across DaVinci. You can select only for MACH_DA8XX_DT.

>  	select USE_OF
>  	select ZONE_DMA
>  	help
> diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
> index 37dc5a3..8cac9d2 100644
> --- a/arch/arm/boot/dts/da850-evm.dts
> +++ b/arch/arm/boot/dts/da850-evm.dts
> @@ -15,6 +15,9 @@
>  	model = "DA850/AM1808/OMAP-L138 EVM";
>  
>  	soc {
> +		pmx_core:pinmux@14120 {

'pmx_core:pinmux@1c14120' instead like the way uart is defined?

> +			status = "okay";
> +		};
>  		serial0: serial@1c42000 {
>  			status = "okay";
>  		};
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index fbada87..94471bc 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -29,6 +29,16 @@
>  		#size-cells = <1>;
>  		ranges = <0x0 0x01c00000 0x400000>;
>  
> +		pmx_core:pinmux@14120 {
> +			compatible = "pinctrl-single";
> +			reg = <0x14120 0x50>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			pinctrl-single,bit-per-mux;
> +			pinctrl-single,register-width = <32>;
> +			pinctrl-single,function-mask = <0xffffffff>;
> +			status = "disabled";
> +		};
>  		serial0: serial@1c42000 {
>  			compatible = "ns16550a";
>  			reg = <0x42000 0x100>;
> diff --git a/arch/arm/configs/da8xx_omapl_defconfig b/arch/arm/configs/da8xx_omapl_defconfig
> index f292239..0892db4 100644
> --- a/arch/arm/configs/da8xx_omapl_defconfig
> +++ b/arch/arm/configs/da8xx_omapl_defconfig

I would like the defconfig changes to be separated out into a different
patch.

Thanks,
Sekhar
