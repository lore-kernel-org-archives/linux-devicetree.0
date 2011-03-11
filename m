From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH V4 2/5] arm/dt: add very basic dts file for babbage board
Date: Fri, 11 Mar 2011 14:56:56 +0800
Message-ID: <20110311065655.GA2827@S2101-09.ap.freescale.net>
References: <1299733185-2172-1-git-send-email-jason.hui@linaro.org>
	<1299733185-2172-3-git-send-email-jason.hui@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1299733185-2172-3-git-send-email-jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jason,

On Thu, Mar 10, 2011 at 12:59:42PM +0800, Jason Liu wrote:
> Signed-off-by: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Singed-off-by: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/babbage.dts |  122 +++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 122 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/babbage.dts b/arch/arm/boot/dts/babbage.dts
> new file mode 100644
> index 0000000..ab87a1b
> --- /dev/null
> +++ b/arch/arm/boot/dts/babbage.dts
> @@ -0,0 +1,122 @@
> +/*
> + * Copyright 2011 Linaro Ltd.
> + * Copyright 2011 Freescale Semiconductor, Inc.
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +/dts-v1/;
> +
> +/ {
> +	model = "Freescale i.MX51 Babbage";
> +	compatible = "fsl,mx51-babbage";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	#interrupt-cells = <1>;
> +	interrupt-parent = <&tzic>;
> +
> +	memory {
> +		reg = <0x90000000 0x20000000>;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttymxc0,115200n8 debug earlyprintk ip=dhcp";
> +	};
> +
> +	soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "simple-bus";
> +		ranges;
> +
> +		tzic: tz-interrupt-controller {
> +			#address-cells = <0>;
> +			#interrupt-cells = <1>;
> +			interrupt-controller;
> +			reg = <0xe0000000 0x1000>;
> +			compatible = "fsl,imx51-tzic";
> +		};
> +	};
> +
> +	clocks {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		uart0_clk: uart0 {
> +			compatible = "clock";
> +			clock-outputs = "imx-uart.0";
> +		};
> +
> +		uart1_clk: uart1 {
> +			compatible = "clock";
> +			clock-outputs = "imx-uart.1";
> +		};
> +
> +		uart2_clk: uart2 {
> +			compatible = "clock";
> +			clock-outputs = "imx-uart.2";
> +		};
> +
> +		fec_clk: fec {
> +			compatible = "clock";
> +			clock-outputs = "fec.0";
> +		};
> +	};
> +
> +	aips@73f00000 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "simple-bus";
> +		ranges = <0x0 0x73f00000 0x100000>;
> +
> +		imx-uart@bc000 {
> +			compatible = "fsl,imx51-uart";
> +			reg = <0xbc000 0x1000>;
> +			interrupts = <0x1f>;
> +			fsl,has-rts-cts;
> +			uart-clock = <&uart0_clk>, "uart";
> +		};
> +
> +		imx-uart@c0000 {
> +			compatible = "fsl,imx51-uart";
> +			reg = <0xc0000 0x1000>;
> +			interrupts = <0x20>;
> +			fsl,has-rts-cts;
> +			uart-clock = <&uart1_clk>, "uart";
> +		};
> +	};
> +
> +	spba@70000000 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "simple-bus";
> +		ranges = <0x0 0x70000000 0x100000>;
> +
> +		imx-uart@c000 {
> +			compatible = "fsl,imx51-uart";
> +			reg = <0xc000 0x1000>;
> +			interrupts = <0x21>;
> +			fsl,has-rts-cts;
> +			uart-clock = <&uart2_clk>, "uart";
> +		};
> +	};
> +
Moving spba@70000000 section after aips@73f00000 seems a quick fix to
get console=ttymxc0, but not a right fix to me.

I do not find a real example on mx51, but let's make one, saying
there are two instance of one IP block, xyz1 and xyz2, and xyz1 is on
bus spba@70000000) while xyz2 is on bus apis@73f00000.  Your fix is
broken here, as you need to put spba@70000000 after aips@73f00000 for
uart driver, while xyz driver requires spba@70000000 stays before
aips@73f00000. 

Also this quick fix is working for uart, but will not for some others,
for example, eCSPI and SSI, which requires spba@70000000 even behind
aips@83f00000 with your solution.

> +	aips@83f00000 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "simple-bus";
> +		ranges = <0x0 0x83f00000 0x100000>;
> +
> +		fec@ec000 {
> +			compatible = "fsl,imx-fec";
> +			reg = <0xec000 0x1000>;
> +			interrupts = <0x57>;
> +			fec_clk-clock = <&fec_clk>, "fec";
> +		};
> +	};
> +};

-- 
Regards,
Shawn
