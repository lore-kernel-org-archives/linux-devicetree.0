Return-Path: <eddie.cai.kernel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1440740808-15004-2-git-send-email-zhengxing@rock-chips.com>
References: <1440740808-15004-1-git-send-email-zhengxing@rock-chips.com>
	<1440740808-15004-2-git-send-email-zhengxing@rock-chips.com>
Date: Fri, 28 Aug 2015 16:11:51 +0800
Message-ID: <CANCyOWaJ9xtbC09rhNHjOhLXvJKKUAL0K5geH6uqQk8Lp-eYAg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] ARM: dts: rockchip: add core rk3036 dts
From: Eddie Cai <eddie.cai.kernel@gmail.com>
Content-Type: multipart/alternative; boundary=001a1133303ed6f4ad051e5aa26a
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: heiko@sntech.de, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

--001a1133303ed6f4ad051e5aa26a
Content-Type: text/plain; charset=UTF-8

Hi ZhengXing

You should have two file for dts part. One is rk3036.dtsi for soc. The
other one is rk3036-sdk.dts for board.

2015-08-28 13:46 GMT+08:00 Xing Zheng <zhengxing@rock-chips.com>:

> Initial release for rk3036, node definitions rk3036 sdk board.
>
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
> ---
>
> Changes in v1: None
>
>  arch/arm/boot/dts/Makefile       |    1 +
>  arch/arm/boot/dts/rk3036-sdk.dts |  362
> ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 363 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rk3036-sdk.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 6d7cec1..7014a3b 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -501,6 +501,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
>         rk3066a-bqcurie2.dtb \
>         rk3066a-marsboard.dtb \
>         rk3066a-rayeager.dtb \
> +       rk3036-sdk.dtb \
>         rk3188-radxarock.dtb \
>         rk3288-evb-act8846.dtb \
>         rk3288-evb-rk808.dtb \
> diff --git a/arch/arm/boot/dts/rk3036-sdk.dts
> b/arch/arm/boot/dts/rk3036-sdk.dts
> new file mode 100644
> index 0000000..0149c9a
> --- /dev/null
> +++ b/arch/arm/boot/dts/rk3036-sdk.dts
> @@ -0,0 +1,362 @@
> +/*
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/clock/rk3036-cru.h>
> +#include "skeleton.dtsi"
> +
> +/ {
> +       compatible = "rockchip,rk3036";
> +
> +       interrupt-parent = <&gic>;
> +
> +       aliases {
> +               serial0 = &uart0;
> +               serial1 = &uart1;
> +               serial2 = &uart2;
> +       };
> +
> +       memory {
> +               reg = <0x60000000 0x40000000>;
> +       };
> +
> +        arm-pmu {
> +                compatible = "arm,cortex-a7-pmu";
> +                interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
> +                             <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               //enable-method = "rockchip,rk3066-smp";
> +
> +               cpu@f00 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a7";
> +                       reg = <0xf00>;
> +                       operating-points = <
> +                               /* KHz    uV */
> +                                816000 1000000
> +                       >;
> +                       #cooling-cells = <2>; /* min followed by max */
> +                       clock-latency = <40000>;
> +                       clocks = <&cru ARMCLK>;
> +                       resets = <&cru SRST_CORE0>;
> +               };
> +               cpu@f01 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a7";
> +                       reg = <0xf01>;
> +                       resets = <&cru SRST_CORE1>;
> +               };
> +       };
> +
> +       amba {
> +               compatible = "arm,amba-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +                pdma: pdma@20078000 {
> +                        compatible = "arm,pl330", "arm,primecell";
> +                        reg = <0x20078000 0x4000>;
> +                        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +                                     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> +                        #dma-cells = <1>;
> +                        clocks = <&cru ACLK_DMAC2>;
> +                        clock-names = "apb_pclk";
> +                };
> +       };
> +
> +       xin24m: oscillator {
> +               compatible = "fixed-clock";
> +               clock-frequency = <24000000>;
> +               clock-output-names = "xin24m";
> +               #clock-cells = <0>;
> +       };
> +
> +       timer {
> +               compatible = "arm,armv7-timer";
> +               arm,cpu-registers-not-fw-configured;
> +               interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
> IRQ_TYPE_LEVEL_HIGH)>,
> +                            <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) |
> IRQ_TYPE_LEVEL_HIGH)>;
> +               clock-frequency = <24000000>;
> +               always-on;
> +       };
> +
> +       cru: clock-controller@20000000 {
> +               compatible = "rockchip,rk3036-cru";
> +               reg = <0x20000000 0x1000>;
> +               rockchip,grf = <&grf>;
> +               #clock-cells = <1>;
> +               #reset-cells = <1>;
> +               assigned-clocks = <&cru PLL_GPLL>;
> +               assigned-clock-rates = <594000000>;
> +       };
> +
> +       uart0: serial@20060000 {
> +               compatible = "rockchip,rk3036-uart", "snps,dw-apb-uart";
> +               reg = <0x20060000 0x100>;
> +               interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +               reg-shift = <2>;
> +               reg-io-width = <4>;
> +               clock-frequency = <24000000>;
> +               clocks = <&cru SCLK_UART0>, <&cru PCLK_UART0>;
> +               clock-names = "baudclk", "apb_pclk";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&uart0_xfer &uart0_cts &uart0_rts>;
> +       };
> +
> +       uart1: serial@20064000 {
> +               compatible = "rockchip,rk3036-uart", "snps,dw-apb-uart";
> +               reg = <0x20064000 0x100>;
> +               interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> +               reg-shift = <2>;
> +               reg-io-width = <4>;
> +               clock-frequency = <24000000>;
> +               clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
> +               clock-names = "baudclk", "apb_pclk";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&uart1_xfer>;
> +       };
> +
> +       uart2: serial@20068000 {
> +               compatible = "rockchip,rk3036-uart", "snps,dw-apb-uart";
> +               reg = <0x20068000 0x100>;
> +               interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> +               reg-shift = <2>;
> +               reg-io-width = <4>;
> +               clock-frequency = <24000000>;
> +               clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
> +               clock-names = "baudclk", "apb_pclk";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&uart2_xfer>;
> +       };
> +
> +       pwm0: pwm@20050000 {
> +               compatible = "rockchip,rk2928-pwm";
> +               reg = <0x20050000 0x10>;
> +               #pwm-cells = <3>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pwm0_pin>;
> +               clocks = <&cru PCLK_PWM>;
> +               clock-names = "pwm";
> +               status = "disabled";
> +       };
> +
> +       pwm1: pwm@20050010 {
> +               compatible = "rockchip,rk2928-pwm";
> +               reg = <0x20050010 0x10>;
> +               #pwm-cells = <3>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pwm1_pin>;
> +               clocks = <&cru PCLK_PWM>;
> +               clock-names = "pwm";
> +               status = "disabled";
> +       };
> +
> +       pwm2: pwm@20050020 {
> +               compatible = "rockchip,rk2928-pwm";
> +               reg = <0x20050020 0x10>;
> +               #pwm-cells = <3>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pwm2_pin>;
> +               clocks = <&cru PCLK_PWM>;
> +               clock-names = "pwm";
> +               status = "disabled";
> +       };
> +
> +       pwm3: pwm@20050030 {
> +               compatible = "rockchip,rk2928-pwm";
> +               reg = <0x20050030 0x10>;
> +               #pwm-cells = <2>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pwm3_pin>;
> +               clocks = <&cru PCLK_PWM>;
> +               clock-names = "pwm";
> +               status = "disabled";
> +       };
> +
> +       sram@10080000 {
> +               compatible = "mmio-sram";
> +               reg = <0x10080000 0x2000>;
> +               map-exec;
> +       };
> +
> +       gic: interrupt-controller@10139000 {
> +               compatible = "arm,gic-400";
> +               interrupt-controller;
> +               #interrupt-cells = <3>;
> +               #address-cells = <0>;
> +
> +               reg = <0x10139000 0x1000>,
> +                     <0x1013a000 0x1000>;
> +       };
> +
> +       grf: syscon@20008000 {
> +               compatible = "rockchip,rk3036-grf", "syscon";
> +               reg = <0x20008000 0x1000>;
> +       };
> +
> +       pinctrl: pinctrl {
> +               compatible = "rockchip,rk3036-pinctrl";
> +               rockchip,grf = <&grf>;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               gpio0: gpio0@2007c000 {
> +                       compatible = "rockchip,gpio-bank";
> +                       reg =   <0x2007c000 0x100>;
> +                       interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cru PCLK_GPIO0>;
> +
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +               };
> +
> +               gpio1: gpio1@20080000 {
> +                       compatible = "rockchip,gpio-bank";
> +                       reg = <0x20080000 0x100>;
> +                       interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cru PCLK_GPIO1>;
> +
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +               };
> +
> +               gpio2: gpio2@20084000 {
> +                       compatible = "rockchip,gpio-bank";
> +                       reg = <0x20084000 0x100>;
> +                       interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cru PCLK_GPIO2>;
> +
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +               };
> +
> +               pcfg_pull_up: pcfg-pull-up {
> +                       bias-pull-up;
> +               };
> +
> +               pcfg_pull_down: pcfg-pull-down {
> +                       bias-pull-down;
> +               };
> +
> +               pcfg_pull_none: pcfg-pull-none {
> +                       bias-disable;
> +               };
> +
> +               pcfg_pull_none_12ma: pcfg-pull-none-12ma {
> +                       bias-disable;
> +                       drive-strength = <12>;
> +               };
> +
> +               uart0 {
> +                       uart0_xfer: uart0-xfer {
> +                               rockchip,pins = <0 16 RK_FUNC_1
> &pcfg_pull_none>,
> +                                               <0 17 RK_FUNC_1
> &pcfg_pull_none>;
> +                       };
> +
> +                       uart0_cts: uart0-cts {
> +                               rockchip,pins = <0 18 RK_FUNC_1
> &pcfg_pull_none>;
> +                       };
> +
> +                       uart0_rts: uart0-rts {
> +                               rockchip,pins = <0 19 RK_FUNC_1
> &pcfg_pull_none>;
> +                       };
> +               };
> +
> +               uart1 {
> +                       uart1_xfer: uart1-xfer {
> +                               rockchip,pins = <2 22 RK_FUNC_1
> &pcfg_pull_none>,
> +                                               <2 23 RK_FUNC_1
> &pcfg_pull_none>;
> +                       };
> +                       /* no rts / cts for uart1 */
> +               };
> +
> +                uart2 {
> +                        uart2_xfer: uart2-xfer {
> +                                rockchip,pins = <1 18 RK_FUNC_2
> &pcfg_pull_none>,
> +                                                <1 19 RK_FUNC_2
> &pcfg_pull_none>;
> +                        };
> +                        /* no rts / cts for uart2 */
> +                };
> +
> +               pwm0 {
> +                       pwm0_pin: pwm0-pin {
> +                               rockchip,pins = <0 0 RK_FUNC_2
> &pcfg_pull_none>;
> +                       };
> +               };
> +
> +               pwm1 {
> +                       pwm1_pin: pwm1-pin {
> +                               rockchip,pins = <0 1 RK_FUNC_2
> &pcfg_pull_none>;
> +                       };
> +               };
> +
> +               pwm2 {
> +                       pwm2_pin: pwm2-pin {
> +                               rockchip,pins = <0 1 2 &pcfg_pull_none>;
> +                       };
> +               };
> +
> +               pwm3 {
> +                       pwm3_pin: pwm3-pin {
> +                               rockchip,pins = <0 27 1 &pcfg_pull_none>;
> +                       };
> +               };
> +       };
> +};
> --
> 1.7.9.5
>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>

--001a1133303ed6f4ad051e5aa26a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGkgWmhlbmdYaW5nPGRpdj48YnI+PC9kaXY+PGRpdj5Zb3Ugc2hvdWxk
IGhhdmUgdHdvIGZpbGUgZm9yIGR0cyBwYXJ0LiBPbmUgaXMgcmszMDM2LmR0c2kgZm9yIHNvYy4g
VGhlIG90aGVyIG9uZSBpcyByazMwMzYtc2RrLmR0cyBmb3IgYm9hcmQuwqA8L2Rpdj48ZGl2IGNs
YXNzPSJnbWFpbF9leHRyYSI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj4yMDE1LTA4LTI4
IDEzOjQ2IEdNVCswODowMCBYaW5nIFpoZW5nIDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0i
bWFpbHRvOnpoZW5neGluZ0Byb2NrLWNoaXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnpoZW5neGlu
Z0Byb2NrLWNoaXBzLmNvbTwvYT4mZ3Q7PC9zcGFuPjo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9Imdt
YWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdp
ZHRoOjFweDtib3JkZXItbGVmdC1jb2xvcjpyZ2IoMjA0LDIwNCwyMDQpO2JvcmRlci1sZWZ0LXN0
eWxlOnNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPkluaXRpYWwgcmVsZWFzZSBmb3IgcmszMDM2LCBu
b2RlIGRlZmluaXRpb25zIHJrMzAzNiBzZGsgYm9hcmQuPGJyPg0KPGJyPg0KU2lnbmVkLW9mZi1i
eTogWGluZyBaaGVuZyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnpoZW5neGluZ0Byb2NrLWNoaXBzLmNv
bSI+emhlbmd4aW5nQHJvY2stY2hpcHMuY29tPC9hPiZndDs8YnI+DQotLS08YnI+DQo8YnI+DQpD
aGFuZ2VzIGluIHYxOiBOb25lPGJyPg0KPGJyPg0KwqBhcmNoL2FybS9ib290L2R0cy9NYWtlZmls
ZcKgIMKgIMKgIMKgfMKgIMKgIDEgKzxicj4NCsKgYXJjaC9hcm0vYm9vdC9kdHMvcmszMDM2LXNk
ay5kdHMgfMKgIDM2MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKzxicj4N
CsKgMiBmaWxlcyBjaGFuZ2VkLCAzNjMgaW5zZXJ0aW9ucygrKTxicj4NCsKgY3JlYXRlIG1vZGUg
MTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL3JrMzAzNi1zZGsuZHRzPGJyPg0KPGJyPg0KZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlIGIvYXJjaC9hcm0vYm9vdC9kdHMvTWFr
ZWZpbGU8YnI+DQppbmRleCA2ZDdjZWMxLi43MDE0YTNiIDEwMDY0NDxicj4NCi0tLSBhL2FyY2gv
YXJtL2Jvb3QvZHRzL01ha2VmaWxlPGJyPg0KKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZp
bGU8YnI+DQpAQCAtNTAxLDYgKzUwMSw3IEBAIGR0Yi0kKENPTkZJR19BUkNIX1JPQ0tDSElQKSAr
PSBcPGJyPg0KwqAgwqAgwqAgwqAgcmszMDY2YS1icWN1cmllMi5kdGIgXDxicj4NCsKgIMKgIMKg
IMKgIHJrMzA2NmEtbWFyc2JvYXJkLmR0YiBcPGJyPg0KwqAgwqAgwqAgwqAgcmszMDY2YS1yYXll
YWdlci5kdGIgXDxicj4NCivCoCDCoCDCoCDCoHJrMzAzNi1zZGsuZHRiIFw8YnI+DQrCoCDCoCDC
oCDCoCByazMxODgtcmFkeGFyb2NrLmR0YiBcPGJyPg0KwqAgwqAgwqAgwqAgcmszMjg4LWV2Yi1h
Y3Q4ODQ2LmR0YiBcPGJyPg0KwqAgwqAgwqAgwqAgcmszMjg4LWV2Yi1yazgwOC5kdGIgXDxicj4N
CmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9yazMwMzYtc2RrLmR0cyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3JrMzAzNi1zZGsuZHRzPGJyPg0KbmV3IGZpbGUgbW9kZSAxMDA2NDQ8YnI+DQpp
bmRleCAwMDAwMDAwLi4wMTQ5YzlhPGJyPg0KLS0tIC9kZXYvbnVsbDxicj4NCisrKyBiL2FyY2gv
YXJtL2Jvb3QvZHRzL3JrMzAzNi1zZGsuZHRzPGJyPg0KQEAgLTAsMCArMSwzNjIgQEA8YnI+DQor
Lyo8YnI+DQorICogVGhpcyBmaWxlIGlzIGR1YWwtbGljZW5zZWQ6IHlvdSBjYW4gdXNlIGl0IGVp
dGhlciB1bmRlciB0aGUgdGVybXM8YnI+DQorICogb2YgdGhlIEdQTCBvciB0aGUgWDExIGxpY2Vu
c2UsIGF0IHlvdXIgb3B0aW9uLiBOb3RlIHRoYXQgdGhpcyBkdWFsPGJyPg0KKyAqIGxpY2Vuc2lu
ZyBvbmx5IGFwcGxpZXMgdG8gdGhpcyBmaWxlLCBhbmQgbm90IHRoaXMgcHJvamVjdCBhcyBhPGJy
Pg0KKyAqIHdob2xlLjxicj4NCisgKjxicj4NCisgKsKgIGEpIFRoaXMgZmlsZSBpcyBmcmVlIHNv
ZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3I8YnI+DQorICrCoCDCoCDCoG1v
ZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGFzPGJyPg0KKyAqwqAgwqAgwqBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRh
dGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGU8YnI+DQorICrCoCDCoCDCoExpY2Vuc2UsIG9y
IChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uPGJyPg0KKyAqPGJyPg0KKyAqwqAg
wqAgwqBUaGlzIGZpbGUgaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJl
IHVzZWZ1bCw8YnI+DQorICrCoCDCoCDCoGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91
dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mPGJyPg0KKyAqwqAgwqAgwqBNRVJDSEFOVEFC
SUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuwqAgU2VlIHRoZTxicj4N
CisgKsKgIMKgIMKgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy48
YnI+DQorICo8YnI+DQorICogT3IsIGFsdGVybmF0aXZlbHksPGJyPg0KKyAqPGJyPg0KKyAqwqAg
YikgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBw
ZXJzb248YnI+DQorICrCoCDCoCDCoG9idGFpbmluZyBhIGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBh
bmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uPGJyPg0KKyAqwqAgwqAgwqBmaWxlcyAodGhlICZx
dW90O1NvZnR3YXJlJnF1b3Q7KSwgdG8gZGVhbCBpbiB0aGUgU29mdHdhcmUgd2l0aG91dDxicj4N
CisgKsKgIMKgIMKgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRpb24gdGhl
IHJpZ2h0cyB0byB1c2UsPGJyPg0KKyAqwqAgwqAgwqBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJs
aXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLCBhbmQvb3I8YnI+DQorICrCoCDCoCDCoHNlbGwg
Y29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhl
PGJyPg0KKyAqwqAgwqAgwqBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3Qg
dG8gdGhlIGZvbGxvd2luZzxicj4NCisgKsKgIMKgIMKgY29uZGl0aW9uczo8YnI+DQorICo8YnI+
DQorICrCoCDCoCDCoFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Np
b24gbm90aWNlIHNoYWxsIGJlPGJyPg0KKyAqwqAgwqAgwqBpbmNsdWRlZCBpbiBhbGwgY29waWVz
IG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS48YnI+DQorICo8YnI+DQor
ICrCoCDCoCDCoFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAmcXVvdDtBUyBJUyZxdW90OywgV0lU
SE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCw8YnI+DQorICrCoCDCoCDCoEVYUFJFU1MgT1IgSU1Q
TElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUzxicj4NCisg
KsKgIMKgIMKgT0YgTUVSQ0hBTlRBQklMSVRZLCBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVS
UE9TRSBBTkQ8YnI+DQorICrCoCDCoCDCoE5PTklORlJJTkdFTUVOVC4gSU4gTk8gRVZFTlQgU0hB
TEwgVEhFIEFVVEhPUlMgT1IgQ09QWVJJR0hUPGJyPg0KKyAqwqAgwqAgwqBIT0xERVJTIEJFIExJ
QUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SIE9USEVSIExJQUJJTElUWSw8YnI+DQorICrC
oCDCoCDCoFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lT
RSwgQVJJU0lORzxicj4NCisgKsKgIMKgIMKgRlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04g
V0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUjxicj4NCisgKsKgIMKgIMKgT1RIRVIgREVB
TElOR1MgSU4gVEhFIFNPRlRXQVJFLjxicj4NCisgKi88YnI+DQorPGJyPg0KKy9kdHMtdjEvOzxi
cj4NCis8YnI+DQorI2luY2x1ZGUgJmx0O2R0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oJmd0Ozxicj4N
CisjaW5jbHVkZSAmbHQ7ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmgmZ3Q7
PGJyPg0KKyNpbmNsdWRlICZsdDtkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0t
Z2ljLmgmZ3Q7PGJyPg0KKyNpbmNsdWRlICZsdDtkdC1iaW5kaW5ncy9waW5jdHJsL3JvY2tjaGlw
LmgmZ3Q7PGJyPg0KKyNpbmNsdWRlICZsdDtkdC1iaW5kaW5ncy9jbG9jay9yazMwMzYtY3J1Lmgm
Z3Q7PGJyPg0KKyNpbmNsdWRlICZxdW90O3NrZWxldG9uLmR0c2kmcXVvdDs8YnI+DQorPGJyPg0K
Ky8gezxicj4NCivCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtyb2NrY2hpcCxyazMwMzYm
cXVvdDs7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGludGVycnVwdC1wYXJlbnQgPSAmbHQ7JmFt
cDtnaWMmZ3Q7Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBhbGlhc2VzIHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBzZXJpYWwwID0gJmFtcDt1YXJ0MDs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBzZXJpYWwxID0gJmFtcDt1YXJ0MTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBzZXJpYWwyID0gJmFtcDt1YXJ0Mjs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqBtZW1vcnkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9
ICZsdDsweDYwMDAwMDAwIDB4NDAwMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoH07PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoCBhcm0tcG11IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgY29tcGF0aWJsZSA9ICZxdW90O2FybSxjb3J0ZXgtYTctcG11JnF1b3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBpbnRlcnJ1cHRzID0gJmx0O0dJQ19TUEkgNzYgSVJRX1RZUEVf
TEVWRUxfSElHSCZndDssPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgJmx0O0dJQ19TUEkgNzcgSVJRX1RZUEVfTEVWRUxfSElHSCZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGNwdXMgezxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoC8vZW5hYmxlLW1ldGhvZCA9ICZxdW90O3JvY2tjaGlwLHJrMzA2Ni1zbXAm
cXVvdDs7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNwdUBmMDAgezxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRldmljZV90eXBlID0gJnF1b3Q7
Y3B1JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBh
dGlibGUgPSAmcXVvdDthcm0sY29ydGV4LWE3JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweGYwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3BlcmF0aW5nLXBvaW50cyA9ICZsdDs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBLSHrCoCDCoCB1
ViAqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCA4MTYwMDAgMTAwMDAwMDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2Nvb2xpbmct
Y2VsbHMgPSAmbHQ7MiZndDs7IC8qIG1pbiBmb2xsb3dlZCBieSBtYXggKi88YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1sYXRlbmN5ID0gJmx0OzQwMDAwJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7
JmFtcDtjcnUgQVJNQ0xLJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByZXNldHMgPSAmbHQ7JmFtcDtjcnUgU1JTVF9DT1JFMCZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjcHVAZjAxIHs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkZXZpY2VfdHlwZSA9ICZx
dW90O2NwdSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBj
b21wYXRpYmxlID0gJnF1b3Q7YXJtLGNvcnRleC1hNyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHhmMDEmZ3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlc2V0cyA9ICZsdDsmYW1wO2NydSBTUlNUX0NP
UkUxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCivCoCDCoCDCoCDC
oH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGFtYmEgezxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthcm0sYW1iYS1idXMmcXVvdDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmFuZ2VzOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgcGRtYTogcGRtYUAyMDA3ODAwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGNvbXBhdGlibGUgPSAmcXVvdDthcm0scGwzMzAmcXVvdDssICZxdW90O2FybSxw
cmltZWNlbGwmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHJlZyA9ICZsdDsweDIwMDc4MDAwIDB4NDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGludGVycnVwdHMgPSAmbHQ7R0lDX1NQSSAwIElSUV9UWVBFX0xF
VkVMX0hJR0gmZ3Q7LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCZsdDtHSUNfU1BJIDEgSVJRX1RZUEVfTEVWRUxfSElHSCZndDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICNkbWEtY2VsbHMgPSAm
bHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNsb2Nr
cyA9ICZsdDsmYW1wO2NydSBBQ0xLX0RNQUMyJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgY2xvY2stbmFtZXMgPSAmcXVvdDthcGJfcGNsayZxdW90Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCis8
YnI+DQorwqAgwqAgwqAgwqB4aW4yNG06IG9zY2lsbGF0b3Igezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtmaXhlZC1jbG9jayZxdW90Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1mcmVxdWVuY3kgPSAmbHQ7MjQwMDAwMDAmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLW91dHB1dC1uYW1lcyA9ICZxdW90O3hp
bjI0bSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjY2xvY2stY2VsbHMgPSAm
bHQ7MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdGlt
ZXIgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthcm0s
YXJtdjctdGltZXImcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXJtLGNwdS1y
ZWdpc3RlcnMtbm90LWZ3LWNvbmZpZ3VyZWQ7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
aW50ZXJydXB0cyA9ICZsdDtHSUNfUFBJIDEzIChHSUNfQ1BVX01BU0tfU0lNUExFKDQpIHwgSVJR
X1RZUEVfTEVWRUxfSElHSCkmZ3Q7LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCAmbHQ7R0lDX1BQSSAxNCAoR0lDX0NQVV9NQVNLX1NJTVBMRSg0KSB8IElS
UV9UWVBFX0xFVkVMX0hJR0gpJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9j
ay1mcmVxdWVuY3kgPSAmbHQ7MjQwMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGFsd2F5cy1vbjs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqBjcnU6IGNsb2NrLWNvbnRyb2xsZXJAMjAwMDAwMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtyb2NrY2hpcCxyazMwMzYtY3J1JnF1b3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDIwMDAwMDAwIDB4MTAwMCZndDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcm9ja2NoaXAsZ3JmID0gJmx0OyZhbXA7Z3Jm
Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjY2xvY2stY2VsbHMgPSAmbHQ7MSZn
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3Jlc2V0LWNlbGxzID0gJmx0OzEmZ3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFzc2lnbmVkLWNsb2NrcyA9ICZsdDsmYW1w
O2NydSBQTExfR1BMTCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXNzaWduZWQt
Y2xvY2stcmF0ZXMgPSAmbHQ7NTk0MDAwMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4N
Cis8YnI+DQorwqAgwqAgwqAgwqB1YXJ0MDogc2VyaWFsQDIwMDYwMDAwIHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7cm9ja2NoaXAscmszMDM2LXVhcnQm
cXVvdDssICZxdW90O3NucHMsZHctYXBiLXVhcnQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcmVnID0gJmx0OzB4MjAwNjAwMDAgMHgxMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7R0lDX1NQSSAyMCBJUlFfVFlQRV9MRVZFTF9I
SUdIJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWctc2hpZnQgPSAmbHQ7MiZn
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnLWlvLXdpZHRoID0gJmx0OzQmZ3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsyNDAw
MDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7
Y3J1IFNDTEtfVUFSVDAmZ3Q7LCAmbHQ7JmFtcDtjcnUgUENMS19VQVJUMCZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stbmFtZXMgPSAmcXVvdDtiYXVkY2xrJnF1b3Q7LCAm
cXVvdDthcGJfcGNsayZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJs
LW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDt1YXJ0MF94ZmVyICZhbXA7dWFydDBfY3RzICZhbXA7dWFy
dDBfcnRzJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqB1
YXJ0MTogc2VyaWFsQDIwMDY0MDAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21w
YXRpYmxlID0gJnF1b3Q7cm9ja2NoaXAscmszMDM2LXVhcnQmcXVvdDssICZxdW90O3NucHMsZHct
YXBiLXVhcnQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4
MjAwNjQwMDAgMHgxMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVw
dHMgPSAmbHQ7R0lDX1NQSSAyMSBJUlFfVFlQRV9MRVZFTF9ISUdIJmd0Ozs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZWctc2hpZnQgPSAmbHQ7MiZndDs7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmVnLWlvLXdpZHRoID0gJmx0OzQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsyNDAwMDAwMCZndDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7Y3J1IFNDTEtfVUFSVDEmZ3Q7LCAm
bHQ7JmFtcDtjcnUgUENMS19VQVJUMSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y2xvY2stbmFtZXMgPSAmcXVvdDtiYXVkY2xrJnF1b3Q7LCAmcXVvdDthcGJfcGNsayZxdW90Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVs
dCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFt
cDt1YXJ0MV94ZmVyJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAg
wqAgwqB1YXJ0Mjogc2VyaWFsQDIwMDY4MDAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBjb21wYXRpYmxlID0gJnF1b3Q7cm9ja2NoaXAscmszMDM2LXVhcnQmcXVvdDssICZxdW90O3Nu
cHMsZHctYXBiLXVhcnQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0g
Jmx0OzB4MjAwNjgwMDAgMHgxMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlu
dGVycnVwdHMgPSAmbHQ7R0lDX1NQSSAyMiBJUlFfVFlQRV9MRVZFTF9ISUdIJmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWctc2hpZnQgPSAmbHQ7MiZndDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmVnLWlvLXdpZHRoID0gJmx0OzQmZ3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsyNDAwMDAwMCZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7Y3J1IFNDTEtfVUFSVDIm
Z3Q7LCAmbHQ7JmFtcDtjcnUgUENMS19VQVJUMiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgY2xvY2stbmFtZXMgPSAmcXVvdDtiYXVkY2xrJnF1b3Q7LCAmcXVvdDthcGJfcGNsayZx
dW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7
ZGVmYXVsdCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAgPSAm
bHQ7JmFtcDt1YXJ0Ml94ZmVyJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqBwd20wOiBwd21AMjAwNTAwMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNvbXBhdGlibGUgPSAmcXVvdDtyb2NrY2hpcCxyazI5MjgtcHdtJnF1b3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDIwMDUwMDAwIDB4MTAmZ3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNwd20tY2VsbHMgPSAmbHQ7MyZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZhbXA7cHdtMF9w
aW4mZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2Ny
dSBQQ0xLX1BXTSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stbmFtZXMg
PSAmcXVvdDtwd20mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0g
JnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgcHdtMTogcHdtQDIwMDUwMDEwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBjb21wYXRpYmxlID0gJnF1b3Q7cm9ja2NoaXAscmsyOTI4LXB3bSZxdW90Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgyMDA1MDAxMCAweDEwJmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjcHdtLWNlbGxzID0gJmx0OzMmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtbmFtZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtMCA9ICZsdDsmYW1wO3B3bTFfcGlu
Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjcnUg
UENMS19QV00mZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLW5hbWVzID0g
JnF1b3Q7cHdtJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZx
dW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoHB3bTI6IHB3bUAyMDA1MDAyMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y29tcGF0aWJsZSA9ICZxdW90O3JvY2tjaGlwLHJrMjkyOC1wd20mcXVvdDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MjAwNTAwMjAgMHgxMCZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgI3B3bS1jZWxscyA9ICZsdDszJmd0Ozs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtwd20yX3BpbiZn
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7Y3J1IFBD
TEtfUFdNJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1uYW1lcyA9ICZx
dW90O3B3bSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVv
dDtkaXNhYmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAg
wqAgwqBwd20zOiBwd21AMjAwNTAwMzAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNv
bXBhdGlibGUgPSAmcXVvdDtyb2NrY2hpcCxyazI5MjgtcHdtJnF1b3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDIwMDUwMDMwIDB4MTAmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCNwd20tY2VsbHMgPSAmbHQ7MiZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZhbXA7cHdtM19waW4mZ3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2NydSBQQ0xL
X1BXTSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stbmFtZXMgPSAmcXVv
dDtwd20mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7
ZGlzYWJsZWQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgc3JhbUAxMDA4MDAwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJs
ZSA9ICZxdW90O21taW8tc3JhbSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
ZWcgPSAmbHQ7MHgxMDA4MDAwMCAweDIwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoG1hcC1leGVjOzxicj4NCivCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oGdpYzogaW50ZXJydXB0LWNvbnRyb2xsZXJAMTAxMzkwMDAgezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthcm0sZ2ljLTQwMCZxdW90Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHQtY29udHJvbGxlcjs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAjaW50ZXJydXB0LWNlbGxzID0gJmx0OzMmZ3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxMDEzOTAwMCAweDEwMDAmZ3Q7LDxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDsweDEwMTNhMDAwIDB4MTAw
MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgZ3JmOiBz
eXNjb25AMjAwMDgwMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUg
PSAmcXVvdDtyb2NrY2hpcCxyazMwMzYtZ3JmJnF1b3Q7LCAmcXVvdDtzeXNjb24mcXVvdDs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MjAwMDgwMDAgMHgxMDAwJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBwaW5jdHJsOiBw
aW5jdHJsIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7
cm9ja2NoaXAscmszMDM2LXBpbmN0cmwmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcm9ja2NoaXAsZ3JmID0gJmx0OyZhbXA7Z3JmJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByYW5nZXM7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW8wOiBn
cGlvMEAyMDA3YzAwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y29tcGF0aWJsZSA9ICZxdW90O3JvY2tjaGlwLGdwaW8tYmFuayZxdW90Ozs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPcKgIMKgJmx0OzB4MjAwN2MwMDAgMHgx
MDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVw
dHMgPSAmbHQ7R0lDX1NQSSAzNiBJUlFfVFlQRV9MRVZFTF9ISUdIJmd0Ozs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjcnUgUENMS19H
UElPMCZndDs7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGdwaW8tY29udHJvbGxlcjs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAjZ3Bpby1jZWxscyA9ICZsdDsyJmd0Ozs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0LWNvbnRyb2xsZXI7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2ludGVycnVwdC1jZWxscyA9ICZsdDsyJmd0Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBncGlvMTogZ3BpbzFAMjAwODAwMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtyb2NrY2hpcCxncGlvLWJhbmsmcXVv
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4
MjAwODAwMDAgMHgxMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGludGVycnVwdHMgPSAmbHQ7R0lDX1NQSSAzNyBJUlFfVFlQRV9MRVZFTF9ISUdIJmd0Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFt
cDtjcnUgUENMS19HUElPMSZndDs7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGdwaW8tY29udHJvbGxlcjs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAjZ3Bpby1jZWxscyA9ICZsdDsyJmd0Ozs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0LWNvbnRyb2xsZXI7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2ludGVycnVwdC1jZWxscyA9ICZs
dDsyJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvMjogZ3BpbzJAMjAwODQwMDAgezxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtyb2NrY2hpcCxn
cGlvLWJhbmsmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmVnID0gJmx0OzB4MjAwODQwMDAgMHgxMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7R0lDX1NQSSAzOCBJUlFfVFlQRV9MRVZF
TF9ISUdIJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9j
a3MgPSAmbHQ7JmFtcDtjcnUgUENMS19HUElPMiZndDs7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW8tY29udHJvbGxlcjs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjZ3Bpby1jZWxscyA9ICZsdDsyJmd0Ozs8YnI+DQor
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0LWNvbnRy
b2xsZXI7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2ludGVycnVw
dC1jZWxscyA9ICZsdDsyJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4N
Cis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwY2ZnX3B1bGxfdXA6IHBjZmctcHVsbC11
cCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYmlhcy1wdWxsLXVw
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHBjZmdfcHVsbF9kb3duOiBwY2ZnLXB1bGwtZG93biB7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYmlhcy1wdWxsLWRvd247PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cGNmZ19wdWxsX25vbmU6IHBjZmctcHVsbC1ub25lIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBiaWFzLWRpc2FibGU7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGNmZ19wdWxsX25vbmVf
MTJtYTogcGNmZy1wdWxsLW5vbmUtMTJtYSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgYmlhcy1kaXNhYmxlOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGRyaXZlLXN0cmVuZ3RoID0gJmx0OzEyJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1YXJ0MCB7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdWFydDBfeGZlcjogdWFy
dDAteGZlciB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcm9ja2NoaXAscGlucyA9ICZsdDswIDE2IFJLX0ZVTkNfMSAmYW1wO3BjZmdfcHVsbF9u
b25lJmd0Oyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7MCAxNyBSS19GVU5DXzEgJmFtcDtwY2Zn
X3B1bGxfbm9uZSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdWFydDBf
Y3RzOiB1YXJ0MC1jdHMgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJvY2tjaGlwLHBpbnMgPSAmbHQ7MCAxOCBSS19GVU5DXzEgJmFtcDtwY2Zn
X3B1bGxfbm9uZSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdWFydDBf
cnRzOiB1YXJ0MC1ydHMgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJvY2tjaGlwLHBpbnMgPSAmbHQ7MCAxOSBSS19GVU5DXzEgJmFtcDtwY2Zn
X3B1bGxfbm9uZSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB1YXJ0MSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgdWFydDFfeGZlcjogdWFydDEteGZlciB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcm9ja2NoaXAscGlucyA9ICZsdDsyIDIyIFJLX0ZV
TkNfMSAmYW1wO3BjZmdfcHVsbF9ub25lJmd0Oyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7MiAy
MyBSS19GVU5DXzEgJmFtcDtwY2ZnX3B1bGxfbm9uZSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAvKiBubyBydHMgLyBjdHMgZm9yIHVhcnQxICovPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHVhcnQyIHs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdWFydDJfeGZlcjogdWFy
dDIteGZlciB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHJvY2tjaGlwLHBpbnMgPSAmbHQ7MSAxOCBSS19GVU5DXzIgJmFtcDtwY2ZnX3B1bGxf
bm9uZSZndDssPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDsxIDE5IFJLX0ZVTkNfMiAmYW1wO3Bj
ZmdfcHVsbF9ub25lJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgfTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogbm8gcnRz
IC8gY3RzIGZvciB1YXJ0MiAqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Ozxicj4N
Cis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwd20wIHs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwd20wX3BpbjogcHdtMC1waW4gezxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJvY2tjaGlwLHBpbnMgPSAm
bHQ7MCAwIFJLX0ZVTkNfMiAmYW1wO3BjZmdfcHVsbF9ub25lJmd0Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHB3bTEgezxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHB3bTFfcGluOiBwd20xLXBpbiB7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcm9ja2NoaXAs
cGlucyA9ICZsdDswIDEgUktfRlVOQ18yICZhbXA7cGNmZ19wdWxsX25vbmUmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcHdtMiB7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcHdtMl9waW46IHB3bTItcGlu
IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
b2NrY2hpcCxwaW5zID0gJmx0OzAgMSAyICZhbXA7cGNmZ19wdWxsX25vbmUmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcHdtMyB7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcHdtM19waW46IHB3bTMtcGlu
IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
b2NrY2hpcCxwaW5zID0gJmx0OzAgMjcgMSAmYW1wO3BjZmdfcHVsbF9ub25lJmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoH07PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorfTs8YnI+DQo8c3BhbiBjbGFz
cz0iIj48Zm9udCBjb2xvcj0iIzg4ODg4OCI+LS08YnI+DQoxLjcuOS41PGJyPg0KPGJyPg0KPGJy
Pg0KPGJyPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188
YnI+DQpMaW51eC1yb2NrY2hpcCBtYWlsaW5nIGxpc3Q8YnI+DQo8YSBocmVmPSJtYWlsdG86TGlu
dXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZyI+TGludXgtcm9ja2NoaXBAbGlzdHMuaW5m
cmFkZWFkLm9yZzwvYT48YnI+DQo8YSBocmVmPSJodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJvY2tjaGlwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJvY2tjaGlwPC9hPjxicj4NCjwvZm9udD48L3NwYW4+PC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48
L2Rpdj48L2Rpdj4NCg==
--001a1133303ed6f4ad051e5aa26a--
