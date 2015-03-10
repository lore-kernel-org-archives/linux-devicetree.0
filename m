From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 3/3] ARM: dts: igep00x0: add wl18xx bindings
Date: Tue, 10 Mar 2015 16:54:40 +0100
Message-ID: <2231165.khxX6WSbaL@wuerfel>
References: <1425915402-10012-1-git-send-email-eliad@wizery.com> <9217056.Z3urqp19oZ@wuerfel> <CAB3XZEc_sjpA8kgfYCsO8FjGEc6O0xhE9aKO3VtgVbd+Meaakg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <CAB3XZEc_sjpA8kgfYCsO8FjGEc6O0xhE9aKO3VtgVbd+Meaakg@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
To: Eliad Peller <eliad@wizery.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 09 March 2015 23:03:30 Eliad Peller wrote:
> On Mon, Mar 9, 2015 at 9:50 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Monday 09 March 2015 17:36:42 Eliad Peller wrote:
> >> --- a/arch/arm/boot/dts/omap3-igep0030-rev-g.dts
> >> +++ b/arch/arm/boot/dts/omap3-igep0030-rev-g.dts
> >> @@ -64,4 +64,13 @@
> >>         vmmc-supply = <&lbep5clwmc_wlen>;
> >>         bus-width = <4>;
> >>         non-removable;
> >> +
> >> +       #address-cells = <1>;
> >> +       #size-cells = <0>;
> >> +       wlcore: wlcore@2 {
> >> +               compatible = "ti,wl1835";
> >> +               reg = <2>;
> >> +               interrupt-parent = <&gpio5>;
> >> +               interrupts = <8 IRQ_TYPE_NONE>;
> >> +       };
> >>
> >
> > Why IRQ_TYPE_NONE?
> >
> i simply mirrored the current board file (which only sets the irq number).

The irq type is set in this chunk of code from wlcore_nvs_cb:

        if (wl->platform_quirks & WL12XX_PLATFORM_QUIRK_EDGE_IRQ) {
                irqflags = IRQF_TRIGGER_RISING;
                hardirq_fn = wlcore_hardirq;
        } else {
                irqflags = IRQF_TRIGGER_HIGH | IRQF_ONESHOT;
        }

This means you would replace the platform_quirks with setting the
correct irq type.

	Arnd
