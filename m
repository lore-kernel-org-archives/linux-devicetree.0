From: Nathan Sullivan <nathan.sullivan@ni.com>
Subject: Re: [PATCH 2/2] MIPS: NI 169445 board support
Date: Fri, 24 Mar 2017 09:46:40 -0500
Message-ID: <20170324144640.GA2483@nathan3500-linux-VM>
References: <1489508003-25288-1-git-send-email-nathan.sullivan@ni.com>
 <1489508003-25288-3-git-send-email-nathan.sullivan@ni.com>
 <20170323222945.bxz4qa6ydicrh4q6@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <20170323222945.bxz4qa6ydicrh4q6@rob-hp-laptop>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Rob Herring <robh@kernel.org>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 23, 2017 at 05:29:45PM -0500, Rob Herring wrote:
> On Tue, Mar 14, 2017 at 11:13:23AM -0500, Nathan Sullivan wrote:
> > Support the National Instruments 169445 board.
> > 
> > Signed-off-by: Nathan Sullivan <nathan.sullivan@ni.com>
> > ---
> >  Documentation/devicetree/bindings/mips/ni.txt   |   7 ++
> >  MAINTAINERS                                     |   8 ++
> >  arch/mips/boot/dts/Makefile                     |   1 +
> >  arch/mips/boot/dts/ni/169445.dts                | 100 ++++++++++++++++++++++++
> >  arch/mips/boot/dts/ni/Makefile                  |   7 ++
> >  arch/mips/configs/generic/board-ni169445.config |  27 +++++++
> >  arch/mips/generic/Kconfig                       |   6 ++
> >  arch/mips/generic/vmlinux.its.S                 |  25 ++++++
> >  8 files changed, 181 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mips/ni.txt
> >  create mode 100644 arch/mips/boot/dts/ni/169445.dts
> >  create mode 100644 arch/mips/boot/dts/ni/Makefile
> >  create mode 100644 arch/mips/configs/generic/board-ni169445.config
> > 
> > diff --git a/Documentation/devicetree/bindings/mips/ni.txt b/Documentation/devicetree/bindings/mips/ni.txt
> > new file mode 100644
> > index 0000000..722bf2d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mips/ni.txt
> > @@ -0,0 +1,7 @@
> > +National Instruments MIPS platforms
> > +
> > +required root node properties:
> > +	- compatible: must be "ni,169445"
> > +
> > +CPU Nodes
> > +	- compatible: must be "mti,mips14KEc"
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index c265a5f..b72f059 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8887,6 +8887,14 @@ F:	include/linux/sunrpc/
> >  F:	include/uapi/linux/nfs*
> >  F:	include/uapi/linux/sunrpc/
> >  
> > +NI169445 MIPS ARCHITECTURE
> > +M:	Nathan Sullivan <nathan.sullivan@ni.com>
> > +L:	linux-mips@linux-mips.org
> > +S:	Maintained
> > +F:	arch/mips/boot/dts/ni/
> > +F:	arch/mips/configs/generic/board-ni169445.config
> > +F:	Documentation/devicetree/bindings/mips/ni.txt
> > +
> >  NILFS2 FILESYSTEM
> >  M:	Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
> >  L:	linux-nilfs@vger.kernel.org
> > diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
> > index b9db492..27b0f37 100644
> > --- a/arch/mips/boot/dts/Makefile
> > +++ b/arch/mips/boot/dts/Makefile
> > @@ -4,6 +4,7 @@ dts-dirs	+= img
> >  dts-dirs	+= ingenic
> >  dts-dirs	+= lantiq
> >  dts-dirs	+= mti
> > +dts-dirs	+= ni
> >  dts-dirs	+= netlogic
> >  dts-dirs	+= pic32
> >  dts-dirs	+= qca
> > diff --git a/arch/mips/boot/dts/ni/169445.dts b/arch/mips/boot/dts/ni/169445.dts
> > new file mode 100644
> > index 0000000..9746576
> > --- /dev/null
> > +++ b/arch/mips/boot/dts/ni/169445.dts
> > @@ -0,0 +1,100 @@
> > +/dts-v1/;
> > +
> > +/ {
> > +	#address-cells = <1>;
> > +	#size-cells = <1>;
> > +	compatible = "ni,169445";
> > +
> > +	cpus {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		cpu@0 {
> > +			device_type = "cpu";
> > +			compatible = "mti,mips14KEc";
> > +			clocks = <&baseclk>;
> > +			reg = <0>;
> > +		};
> > +	};
> > +
> > +	memory@0 {
> > +		device_type = "memory";
> > +		reg = <0x0 0x10000000>;
> > +	};
> > +
> > +	baseclk: baseclock {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <50000000>;
> > +	};
> > +
> > +	cpu_intc: cpu_intc {
> 
> interrupt-controller {
> 
> > +		#address-cells = <0>;
> > +		compatible = "mti,cpu-interrupt-controller";
> > +		interrupt-controller;
> > +		#interrupt-cells = <1>;
> > +	};
> > +
> > +	ahb@0 {
> 
> ahb@1f300000
> 
> > +		compatible = "simple-bus";
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges = <0x0 0x1f300000 0x80FFF>;
> > +
> > +		gpio1:gpio-controller@1f300010 {
>                       ^ space
> 
> 'gpio' is the standard node name, so
> 
> gpio@...
> 
> > +			compatible = "ni,169445-nand-gpio";
> > +			reg = <0x10 0x4>;
> > +			reg-names = "dat";
> > +			gpio-controller;
> > +			#gpio-cells = <2>;
> > +		};
> > +
> > +		gpio2:gpio-controller@1f300014 {
> 
> ditto
> 
> > +			compatible = "ni,169445-nand-gpio";
> > +			reg = <0x14 0x4>;
> > +			reg-names = "dat";
> > +			gpio-controller;
> > +			#gpio-cells = <2>;
> > +			no-output;
> > +		};
> > +
> > +		nand@1f300000 {
> > +			compatible = "gpio-control-nand";
> > +			nand-on-flash-bbt;
> > +			nand-ecc-mode = "soft_bch";
> > +			nand-ecc-step-size = <512>;
> > +			nand-ecc-strength = <4>;
> > +			reg = <0x0 4>;
> > +			gpios = <&gpio2 0 0>, /* rdy */
> > +				<&gpio1 1 0>, /* nce */
> > +				<&gpio1 2 0>, /* ale */
> > +				<&gpio1 3 0>, /* cle */
> > +				<&gpio1 4 0>; /* nwp */
> > +		};
> > +
> > +		serial@1f380000 {
> > +			compatible = "ns16550a";
> > +			reg = <0x80000 0x1000>;
> > +			interrupt-parent = <&cpu_intc>;
> > +			interrupts = <6>;
> > +			clocks = <&baseclk>;
> > +			reg-shift = <0>;
> > +		};
> > +
> > +		ethernet@1f340000 {
> > +			compatible = "snps,dwmac-4.10a";
> > +			interrupt-parent = <&cpu_intc>;
> > +			interrupts = <5>;
> > +			interrupt-names = "macirq";
> > +			reg = <0x40000 0x2000>;
> > +			clock-names = "stmmaceth", "pclk";
> > +			clocks = <&baseclk>, <&baseclk>;
> > +
> > +			phy-mode = "rgmii";
> > +
> > +			fixed-link {
> > +				speed = <1000>;
> > +				full-duplex;
> > +			};
> > +		};
> > +	};
> > +};
> > diff --git a/arch/mips/boot/dts/ni/Makefile b/arch/mips/boot/dts/ni/Makefile
> > new file mode 100644
> > index 0000000..66cfdff
> > --- /dev/null
> > +++ b/arch/mips/boot/dts/ni/Makefile
> > @@ -0,0 +1,7 @@
> > +dtb-$(CONFIG_FIT_IMAGE_FDT_NI169445)	+= 169445.dtb
> > +
> > +# Force kbuild to make empty built-in.o if necessary
> > +obj-					+= dummy.o
> > +
> > +always					:= $(dtb-y)
> > +clean-files				:= *.dtb *.dtb.S
> > diff --git a/arch/mips/configs/generic/board-ni169445.config b/arch/mips/configs/generic/board-ni169445.config
> > new file mode 100644
> > index 0000000..0bae1f8
> > --- /dev/null
> > +++ b/arch/mips/configs/generic/board-ni169445.config
> > @@ -0,0 +1,27 @@
> > +CONFIG_FIT_IMAGE_FDT_NI169445=y
> > +
> > +CONFIG_SERIAL_8250=y
> > +CONFIG_SERIAL_8250_CONSOLE=y
> > +CONFIG_SERIAL_OF_PLATFORM=y
> > +
> > +CONFIG_GPIOLIB=y
> > +CONFIG_GPIO_SYSFS=y
> > +CONFIG_GPIO_GENERIC_PLATFORM=y
> > +
> > +CONFIG_MTD=y
> > +CONFIG_MTD_BLOCK=y
> > +CONFIG_MTD_CMDLINE_PARTS=y
> > +
> > +CONFIG_MTD_NAND_ECC=y
> > +CONFIG_MTD_NAND_ECC_BCH=y
> > +CONFIG_MTD_NAND=y
> > +CONFIG_MTD_NAND_GPIO=y
> > +CONFIG_MTD_NAND_IDS=y
> > +
> > +CONFIG_MTD_UBI=y
> > +CONFIG_MTD_UBI_BLOCK=y
> > +
> > +CONFIG_NETDEVICES=y
> > +CONFIG_STMMAC_ETH=y
> > +CONFIG_STMMAC_PLATFORM=y
> > +CONFIG_DWMAC_GENERIC=y
> > diff --git a/arch/mips/generic/Kconfig b/arch/mips/generic/Kconfig
> > index a606b3f..fbf0813 100644
> > --- a/arch/mips/generic/Kconfig
> > +++ b/arch/mips/generic/Kconfig
> > @@ -16,4 +16,10 @@ config LEGACY_BOARD_SEAD3
> >  	  Enable this to include support for booting on MIPS SEAD-3 FPGA-based
> >  	  development boards, which boot using a legacy boot protocol.
> >  
> > +config FIT_IMAGE_FDT_NI169445
> > +	bool "Include FDT for NI 169445"
> > +	help
> > +	  Enable this to include the FDT for the 169445 platform from
> > +	  National Instruments in the FIT kernel image.
> > +
> >  endif
> > diff --git a/arch/mips/generic/vmlinux.its.S b/arch/mips/generic/vmlinux.its.S
> > index f67fbf1..de851f7 100644
> > --- a/arch/mips/generic/vmlinux.its.S
> > +++ b/arch/mips/generic/vmlinux.its.S
> > @@ -29,3 +29,28 @@
> >  		};
> >  	};
> >  };
> > +
> > +#ifdef CONFIG_FIT_IMAGE_FDT_NI169445
> > +/ {
> 
> IMO, this shouldn't be in the kernel. Is the kernel supposed to 
> create board specific images for every bootloaders custom format? It 
> doesn't scale.
> 

This is how the linux MIPS tree is doing generic kernels.  Ralf, care to
elaborate?

The format is the same for each board, just with different trees and
configurations. It's a little odd with just one board right now, the
linux-mti tree has a bigger set.

> > +	images {
> > +		fdt@ni169445 {
> > +			description = "NI 169445 device tree";
> > +			data = /incbin/("boot/dts/ni/169445.dtb");
> > +			type = "flat_dt";
> > +			arch = "mips";
> > +			compression = "none";
> > +			hash@0 {
> > +				algo = "sha1";
> > +			};
> > +		};
> > +	};
> > +
> > +	configurations {
> > +		conf@ni169445 {
> > +			description = "NI 169445 Linux Kernel";
> > +			kernel = "kernel@0";
> > +			fdt = "fdt@ni169445";
> > +		};
> > +	};
> > +};
> > +#endif
> > -- 
> > 2.1.4
> > 
