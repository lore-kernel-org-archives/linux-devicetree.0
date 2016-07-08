From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/5] arm64: dts: add QorIQ LS1046A SoC support
Date: Fri, 08 Jul 2016 14:00:12 +0200
Message-ID: <1984740.gmAYAJ1bIT@wuerfel>
References: <1467972944-12293-1-git-send-email-shh.xie@gmail.com> <1467972944-12293-2-git-send-email-shh.xie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467972944-12293-2-git-send-email-shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Mingkai Hu <Mingkai.Hu-3arQi8VN3Tc@public.gmane.org>, Mihai Bantea <mihai.bantea-3arQi8VN3Tc@public.gmane.org>, Gong Qianyu <Qianyu.Gong-3arQi8VN3Tc@public.gmane.org>, Minghuan Lian <Minghuan.Lian-3arQi8VN3Tc@public.gmane.org>, Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>, Shaohui Xie <Shaohui.Xie-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday, July 8, 2016 6:15:40 PM CEST shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0 0x80000000>;
> +		      /* DRAM space 1, size: 2GiB DRAM */
> +	};

The memory size is usually in the .dts file, unless this is on-chip
eDRAM.
> +		clockgen: clocking@1ee1000 {
> +			compatible = "fsl,ls1046a-clockgen";

> +		scfg: scfg@1570000 {
> +			compatible = "fsl,ls1046a-scfg", "syscon";
 
> +		dcfg: dcfg@1ee0000 {
> +			compatible = "fsl,ls1046a-dcfg", "syscon";

None of the fsl,ls1046a-* devices seem to have any binding documentation.

> +		wdog0: wdog@2ad0000 {

watchdog@2ad0000

> +		usb0: usb3@2f00000 {

usb@2f00000

> +		pcie@3400000 {
> +			compatible = "fsl,ls1046a-pcie", "snps,dw-pcie";
> +			reg = <0x00 0x03400000 0x0 0x00100000   /* controller registers */
> +			       0x40 0x00000000 0x0 0x00002000>; /* configuration space */
> +			reg-names = "regs", "config";
> +			interrupts = <0 118 0x4>, /* controller interrupt */
> +				     <0 117 0x4>; /* PME interrupt */
> +			interrupt-names = "intr", "pme";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			device_type = "pci";
> +			num-lanes = <4>;
> +			bus-range = <0x0 0xff>;
> +			ranges = <0x81000000 0x0 0x00000000 0x40 0x00010000 0x0 0x00010000   /* downstream I/O */
> +				  0x82000000 0x0 0x40000000 0x40 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */

No prefetchable memory area?

> +			msi-parent = <&msi>;

You seem to have a gic-400, could you use that as the MSI sink instead?

> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 7>;
> +			interrupt-map = <0000 0 0 1 &gic 0 110 0x4>,
> +					<0000 0 0 2 &gic 0 110 0x4>,
> +					<0000 0 0 3 &gic 0 110 0x4>,
> +					<0000 0 0 4 &gic 0 110 0x4>;
> +		};
>

If the four interrupts are all the same, why do you have separate entries?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
