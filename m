From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 10/13] openrisc: add simple_smp dts and defconfig for
 simulators
Date: Thu, 31 Aug 2017 11:41:10 +0100
Message-ID: <20170831104110.GD15031@leverpostej>
References: <cover.1504129273.git.shorne@gmail.com>
 <37f0d48de4690694c18be3d32483dafee0730859.1504129273.git.shorne@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <37f0d48de4690694c18be3d32483dafee0730859.1504129273.git.shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Openrisc <openrisc-cunTk1MwBs9a3B2Vnqf2dGD2FQJk+8+b@public.gmane.org>, Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 31, 2017 at 07:03:11AM +0900, Stafford Horne wrote:
> From: Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>
> 
> Simple enough to be compatible with simulation environments,
> such as verilated systems, QEMU and other targets supporting OpenRISC
> SMP.  This also supports our base FPGA SoC's if the cpu frequency is
> upped to 50Mhz.
> 
> Signed-off-by: Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>
> [shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org: Added defconfig]
> Signed-off-by: Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/openrisc/boot/dts/simple_smp.dts      | 58 ++++++++++++++++++++++++++
>  arch/openrisc/configs/simple_smp_defconfig | 66 ++++++++++++++++++++++++++++++
>  2 files changed, 124 insertions(+)
>  create mode 100644 arch/openrisc/boot/dts/simple_smp.dts
>  create mode 100644 arch/openrisc/configs/simple_smp_defconfig
> 
> diff --git a/arch/openrisc/boot/dts/simple_smp.dts b/arch/openrisc/boot/dts/simple_smp.dts
> new file mode 100644
> index 000000000000..47c54101baae
> --- /dev/null
> +++ b/arch/openrisc/boot/dts/simple_smp.dts
> @@ -0,0 +1,58 @@
> +/dts-v1/;
> +/ {
> +	compatible = "opencores,or1ksim";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	interrupt-parent = <&pic>;
> +
> +	chosen {
> +		bootargs = "console=uart,mmio,0x90000000,115200";
> +	};

Any reason this isn't using stdout-path?

> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x00000000 0x02000000>;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		cpu@0 {
> +			compatible = "opencores,or1200-rtlsvn481";
> +			reg = <0>;
> +			clock-frequency = <20000000>;
> +		};
> +		cpu@1 {
> +			compatible = "opencores,or1200-rtlsvn481";
> +			reg = <1>;
> +			clock-frequency = <20000000>;
> +		};
> +	};

No enable-method or similar?

Is your SMP bringup/teardown architected?

> +
> +	ompic: ompic {
> +		compatible = "ompic";

This needs a vendor prefix.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
