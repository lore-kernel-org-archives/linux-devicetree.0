From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM64: zynqmp: Use 64bit size cell format
Date: Thu, 11 Feb 2016 10:13:53 -0600
Message-ID: <CAL_JsqK0=LaXqJyr_rGKCzGgt5kFy79-4ARocTGpKved3JU-Ug@mail.gmail.com>
References: <2f160e012080d5d6de11238ade239bb0bb224f64.1455193571.git.michal.simek@xilinx.com>
 <36fb9c4c9b2019b854e84dc0a9a01252a6de2337.1455193571.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <36fb9c4c9b2019b854e84dc0a9a01252a6de2337.1455193571.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Suneel Garapati <suneel.garapati-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Shubhrajyoti Datta <shubhraj-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 11, 2016 at 6:26 AM, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> Use 64bit size cell format instead of 32bit for memory
> description. Change 64bit sizes also for all others IPs.

Why? As is, this change is completely pointless because nothing needs
a >4GB size. Do you have peripherals with >4GB size?

> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>
>  arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts |  2 +-
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi      | 63 ++++++++++++++---------------
>  2 files changed, 32 insertions(+), 33 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
> index acb0527fdc4a..358089687a69 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
> @@ -29,7 +29,7 @@
>
>         memory {
>                 device_type = "memory";
> -               reg = <0x0 0x0 0x40000000>;
> +               reg = <0x0 0x0 0x0 0x40000000>;
>         };
>  };
>
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> index e595f22e7e4b..ef8fe8e6c868 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -14,7 +14,7 @@
>  / {
>         compatible = "xlnx,zynqmp";
>         #address-cells = <2>;
> -       #size-cells = <1>;
> +       #size-cells = <2>;
>
>         cpus {
>                 #address-cells = <1>;
> @@ -74,16 +74,15 @@
>         amba_apu {
>                 compatible = "simple-bus";
>                 #address-cells = <2>;
> -               #size-cells = <1>;
> +               #size-cells = <2>;
>                 ranges;
> -
>                 gic: interrupt-controller@f9010000 {
>                         compatible = "arm,gic-400", "arm,cortex-a15-gic";
>                         #interrupt-cells = <3>;
> -                       reg = <0x0 0xf9010000 0x10000>,
> -                             <0x0 0xf902f000 0x2000>,
> -                             <0x0 0xf9040000 0x20000>,
> -                             <0x0 0xf906f000 0x2000>;
> +                       reg = <0x0 0xf9010000 0x0 0x10000>,
> +                             <0x0 0xf902f000 0x0 0x2000>,
> +                             <0x0 0xf9040000 0x0 0x20000>,
> +                             <0x0 0xf906f000 0x0 0x2000>;
>                         interrupt-controller;
>                         interrupt-parent = <&gic>;
>                         interrupts = <1 9 0xf04>;
> @@ -93,14 +92,14 @@
>         amba: amba {
>                 compatible = "simple-bus";
>                 #address-cells = <2>;
> -               #size-cells = <1>;
> +               #size-cells = <2>;
>                 ranges;
>
>                 can0: can@ff060000 {
>                         compatible = "xlnx,zynq-can-1.0";
>                         status = "disabled";
>                         clock-names = "can_clk", "pclk";
> -                       reg = <0x0 0xff060000 0x1000>;
> +                       reg = <0x0 0xff060000 0x0 0x1000>;
>                         interrupts = <0 23 4>;
>                         interrupt-parent = <&gic>;
>                         tx-fifo-depth = <0x40>;
> @@ -111,7 +110,7 @@
>                         compatible = "xlnx,zynq-can-1.0";
>                         status = "disabled";
>                         clock-names = "can_clk", "pclk";
> -                       reg = <0x0 0xff070000 0x1000>;
> +                       reg = <0x0 0xff070000 0x0 0x1000>;
>                         interrupts = <0 24 4>;
>                         interrupt-parent = <&gic>;
>                         tx-fifo-depth = <0x40>;
> @@ -123,7 +122,7 @@
>                         status = "disabled";
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 57 4>, <0 57 4>;
> -                       reg = <0x0 0xff0b0000 0x1000>;
> +                       reg = <0x0 0xff0b0000 0x0 0x1000>;
>                         clock-names = "pclk", "hclk", "tx_clk";
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> @@ -134,7 +133,7 @@
>                         status = "disabled";
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 59 4>, <0 59 4>;
> -                       reg = <0x0 0xff0c0000 0x1000>;
> +                       reg = <0x0 0xff0c0000 0x0 0x1000>;
>                         clock-names = "pclk", "hclk", "tx_clk";
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> @@ -145,7 +144,7 @@
>                         status = "disabled";
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 61 4>, <0 61 4>;
> -                       reg = <0x0 0xff0d0000 0x1000>;
> +                       reg = <0x0 0xff0d0000 0x0 0x1000>;
>                         clock-names = "pclk", "hclk", "tx_clk";
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> @@ -156,7 +155,7 @@
>                         status = "disabled";
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 63 4>, <0 63 4>;
> -                       reg = <0x0 0xff0e0000 0x1000>;
> +                       reg = <0x0 0xff0e0000 0x0 0x1000>;
>                         clock-names = "pclk", "hclk", "tx_clk";
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> @@ -170,7 +169,7 @@
>                         interrupts = <0 16 4>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
> -                       reg = <0x0 0xff0a0000 0x1000>;
> +                       reg = <0x0 0xff0a0000 0x0 0x1000>;
>                 };
>
>                 i2c0: i2c@ff020000 {
> @@ -178,7 +177,7 @@
>                         status = "disabled";
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 17 4>;
> -                       reg = <0x0 0xff020000 0x1000>;
> +                       reg = <0x0 0xff020000 0x0 0x1000>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                 };
> @@ -188,7 +187,7 @@
>                         status = "disabled";
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 18 4>;
> -                       reg = <0x0 0xff030000 0x1000>;
> +                       reg = <0x0 0xff030000 0x0 0x1000>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                 };
> @@ -196,7 +195,7 @@
>                 sata: ahci@fd0c0000 {
>                         compatible = "ceva,ahci-1v84";
>                         status = "disabled";
> -                       reg = <0x0 0xfd0c0000 0x2000>;
> +                       reg = <0x0 0xfd0c0000 0x0 0x2000>;
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 133 4>;
>                 };
> @@ -206,7 +205,7 @@
>                         status = "disabled";
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 48 4>;
> -                       reg = <0x0 0xff160000 0x1000>;
> +                       reg = <0x0 0xff160000 0x0 0x1000>;
>                         clock-names = "clk_xin", "clk_ahb";
>                 };
>
> @@ -215,13 +214,13 @@
>                         status = "disabled";
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 49 4>;
> -                       reg = <0x0 0xff170000 0x1000>;
> +                       reg = <0x0 0xff170000 0x0 0x1000>;
>                         clock-names = "clk_xin", "clk_ahb";
>                 };
>
>                 smmu: smmu@fd800000 {
>                         compatible = "arm,mmu-500";
> -                       reg = <0x0 0xfd800000 0x20000>;
> +                       reg = <0x0 0xfd800000 0x0 0x20000>;
>                         #global-interrupts = <1>;
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 157 4>,
> @@ -236,7 +235,7 @@
>                         status = "disabled";
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 19 4>;
> -                       reg = <0x0 0xff040000 0x1000>;
> +                       reg = <0x0 0xff040000 0x0 0x1000>;
>                         clock-names = "ref_clk", "pclk";
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> @@ -247,7 +246,7 @@
>                         status = "disabled";
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 20 4>;
> -                       reg = <0x0 0xff050000 0x1000>;
> +                       reg = <0x0 0xff050000 0x0 0x1000>;
>                         clock-names = "ref_clk", "pclk";
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> @@ -258,7 +257,7 @@
>                         status = "disabled";
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 36 4>, <0 37 4>, <0 38 4>;
> -                       reg = <0x0 0xff110000 0x1000>;
> +                       reg = <0x0 0xff110000 0x0 0x1000>;
>                         timer-width = <32>;
>                 };
>
> @@ -267,7 +266,7 @@
>                         status = "disabled";
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 39 4>, <0 40 4>, <0 41 4>;
> -                       reg = <0x0 0xff120000 0x1000>;
> +                       reg = <0x0 0xff120000 0x0 0x1000>;
>                         timer-width = <32>;
>                 };
>
> @@ -276,7 +275,7 @@
>                         status = "disabled";
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 42 4>, <0 43 4>, <0 44 4>;
> -                       reg = <0x0 0xff130000 0x1000>;
> +                       reg = <0x0 0xff130000 0x0 0x1000>;
>                         timer-width = <32>;
>                 };
>
> @@ -285,7 +284,7 @@
>                         status = "disabled";
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 45 4>, <0 46 4>, <0 47 4>;
> -                       reg = <0x0 0xff140000 0x1000>;
> +                       reg = <0x0 0xff140000 0x0 0x1000>;
>                         timer-width = <32>;
>                 };
>
> @@ -294,7 +293,7 @@
>                         status = "disabled";
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 21 4>;
> -                       reg = <0x0 0xff000000 0x1000>;
> +                       reg = <0x0 0xff000000 0x0 0x1000>;
>                         clock-names = "uart_clk", "pclk";
>                 };
>
> @@ -303,7 +302,7 @@
>                         status = "disabled";
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 22 4>;
> -                       reg = <0x0 0xff010000 0x1000>;
> +                       reg = <0x0 0xff010000 0x0 0x1000>;
>                         clock-names = "uart_clk", "pclk";
>                 };
>
> @@ -312,7 +311,7 @@
>                         status = "disabled";
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 65 4>;
> -                       reg = <0x0 0xfe200000 0x40000>;
> +                       reg = <0x0 0xfe200000 0x0 0x40000>;
>                         clock-names = "clk_xin", "clk_ahb";
>                 };
>
> @@ -321,7 +320,7 @@
>                         status = "disabled";
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 70 4>;
> -                       reg = <0x0 0xfe300000 0x40000>;
> +                       reg = <0x0 0xfe300000 0x0 0x40000>;
>                         clock-names = "clk_xin", "clk_ahb";
>                 };
>
> @@ -330,7 +329,7 @@
>                         status = "disabled";
>                         interrupt-parent = <&gic>;
>                         interrupts = <0 52 1>;
> -                       reg = <0x0 0xfd4d0000 0x1000>;
> +                       reg = <0x0 0xfd4d0000 0x0 0x1000>;
>                         timeout-sec = <10>;
>                 };
>         };
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
