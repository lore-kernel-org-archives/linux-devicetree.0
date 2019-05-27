From: Mathieu Malaterre <malat@debian.org>
Subject: Re: Ingenic Timer/Counter Unit (TCU) patchset v12
Date: Mon, 27 May 2019 13:39:18 +0200
Message-ID: <CA+7wUszagtyMV3oMxAi4VqpDeFcBY5ohXZ3PrXe-X5JV21bjBw@mail.gmail.com>
References: <20190521145141.9813-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521145141.9813-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>, LKML <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-mips@vger.kernel.org, linux-doc@vger.kernel.org, linux-clk@vger.kernel.org, od@zcrc.me
List-Id: devicetree@vger.kernel.org

On Tue, May 21, 2019 at 4:51 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Hi,
>
> Here's the V12 of my patchset to add support for the Timer/Counter Unit
> (TCU) present on the JZ47xx SoCs from Ingenic.
>
> This patchset is much shorter at only 13 patches vs. 27 patches in V11;
> the remaining patches will be sent in parallel (if applicable) or as a
> follow-up patchset once this one is merged.
>
> In V11 the clocksource maintainers weren't happy with the size of the
> ingenic-timer driver, which included clocks and irqchip setup code.
> On the other hand, devicetree maintainers wanted one single node for
> the TCU hardware since it's effectively just one hardware block.
>
> In this patchset the functionality is cut in four different drivers:
> a MFD one to provide the regmap, probe the children and which provides
> several API functions; a clocks driver; a irqchip driver; a clocksource
> driver. All these drivers work with the same regmap, have the same
> compatible strings, and will probe _with the same devicetree node_.

For the series:

Tested-by: Mathieu Malaterre <malat@debian.org>

System: MIPS Creator CI20

For reference, here is my local patch:

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi
b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index 1bfac58da5df..e7b7da32f278 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dt-bindings/clock/jz4780-cgu.h>
+#include <dt-bindings/clock/ingenic,tcu.h>
 #include <dt-bindings/dma/jz4780-dma.h>

 / {
@@ -80,6 +81,15 @@

                interrupt-parent = <&intc>;
                interrupts = <27 26 25>;
+
+               watchdog: watchdog@0 {
+                       compatible = "ingenic,jz4780-watchdog";
+                       reg = <0x0 0xc>;
+
+                       clocks = <&tcu TCU_CLK_WDT>;
+                       clock-names = "wdt";
+               };
+
        };

        rtc_dev: rtc@10003000 {
@@ -287,14 +297,6 @@
                status = "disabled";
        };

-       watchdog: watchdog@10002000 {
-               compatible = "ingenic,jz4780-watchdog";
-               reg = <0x10002000 0x10>;
-
-               clocks = <&cgu JZ4780_CLK_RTCLK>;
-               clock-names = "rtc";
-       };
-
        nemc: nemc@13410000 {
                compatible = "ingenic,jz4780-nemc";
                reg = <0x13410000 0x10000>;



> Regards,
> -Paul
>
>
