From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] meson: Fix IRQ trigger type
Date: Thu, 06 Dec 2018 14:26:34 +0100
Message-ID: <8dd5d9da52d799f5b87272d276754e21a5e93464.camel@baylibre.com>
References: <20181204160447.27869-1-ccaione@baylibre.com>
 <CAFBinCDCE7RP4vgs25bqSZ8vBjrmcuB=qb3U92X6QfpmzeqrBg@mail.gmail.com>
 <20181206124347.GA10676@ingrassia.epigenesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181206124347.GA10676@ingrassia.epigenesys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Emiliano Ingrassia <ingrassia@epigenesys.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Carlo Caione <ccaione@baylibre.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@baylibre.com, robh+dt@kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 2018-12-06 at 13:43 +0100, Emiliano Ingrassia wrote:
> Hi all,
> 
> thank you for involving me.
> 
> I applied Carlo's patches[0] on a kernel vanilla 4.19.6
> and tested it with kernel packet generator, monitoring
> bandwidth usage with "nload".
> 
> All tests were conducted on an Odroid-C1+ Rev. 0.4-20150930 board
> with a short ethernet cable directly attached to a laptop with
> 1G ethernet interface, with "nload" running on the board.
> 
> The tests I performed are composed by the following steps:
> 
> 1) Start packet generator with "rate 1000M" on laptop;
> 
> 2) Keep packet generator active on the laptop and
>    start the packet generator on the board with "rate 1000M";
> 
> 3) Stop both packet generators;
> 
> 4) Start packet generator on the board;
> 
> 5) Keep packet generator active on the board and
>    start the packet generator on the laptop.
> 
> 
> Test results without Carlo's patches applied:
> 
> 1) "nload" shows an incoming traffic of ~950Mbps;
> 
> 2) "nload" shows an incoming traffic of ~400Mbps
>    and an outgoing traffic of ~250Mbps;
> 
> 3) "nload" shows 0Mbps both for incoming and outgoing traffic;
> 
> 4) "nload" shows an outgoing traffic of ~950Mbps from the board;
> 
> 5) "nload" shows incoming traffic of 0Mbps
>    and an outgoing traffic of ~950Mbps.
> 
> Applying only the first patch (change mac IRQ type) I got the same results.
> 
> Applying only the second patch (drop eee-broken-1000t) I got the same
> results!
> 
> With both patches applied I got the same results but with an incoming
> traffic
> of ~3Mbps on the board.

Are you sure you did not mix up the result ?
I would expect this kind of drop when only the eee patch is applied.

> 
> Consider that the described tests were performed for a few minutes.
> 
> 
> The tests I performed clearly show that currently the MAC does not
> perform as 1G full-duplex.

Do you really get 1G full duplex w/o any of these patch ?
I would be surprised if they had any meaningful impact on throughput


> I can't say if this depends on the hardware, the driver or
> the IP description in the board's device tree.
> 
> From the results shown above I think that the patches regarding 32 bit
> Meson SoCs should NOT be applied together, but you can consider to apply
> only the second one which remove the "eee-broken-1000t" flag
> from the board MAC IP description.

I would defenitely advise against that.

> In particular, I think that more tests are needed to better understand
> what's happening in the case of Meson8b SoC.
> 
> To better investigate the MAC behaviour on Odroid-C1+, should I use
> the Amlogic development kernel[1]? If yes, what branch should I use?

And bit of background:
The MAC found in all Amlogic SoC we have seen so far comes from Synopsys
(dwmac).

The kernel provided by the vendor use the IRQ type 'EDGE_RISING' for this IP
This means that the HW block is supposed to generate a rising edge on the irq
line every time there is an event. This is opposed to the Type "LEVEL_HIGH"
with keep the irq line high as long as their pending IRQs

Of course, when adding mainline support, we did the same as the vendor without
thinking about it

We started to investigate the network because, after a while, we noticed
severe performance drops on the AXG family: the throughput would drop from
900MBps to 30MBps after somethings 12+ hours of iperf tests.

We noticed that irqs were not triggered anymore. Manually acking the IRQ in
the register would revive the interface. Since the IRQ is supposed to be acked
in the ISR, we were clearly missing IRQs and as a consequence, never acking
them.

All HW using the dwmac out there are using "LEVEL_HIGH", except amlogic.
Changing this fixes the problem.

Now regarding EEE: about 2 years ago, the network would break on the OC-2. We
noticed the EEE was generating a *LOT* of IRQs. Deactivating EEE solved the
problem ... or so we thought. Fact is, it was an un-acked IRQ as well, and we
just made it harder to trigger by disabling EEE.

So applying the EEE patch without the IRQ_LEVEL would clearly be a mistake,
you would be back in the situation we investigated 2 years, with a very
unstable ethernet connection.

Anyways, I have been able to test it on S905 and A113 and I think this series
should applied, at least for the arm64 family ... most likely of all.

If issues persist on meson8, maybe there is something else ? soemthing hidden
before ?

> 
> 
> On Tue, Dec 04, 2018 at 08:59:20PM +0100, Martin Blumenstingl wrote:
> > adding Emiliano because he experienced high packet loss on Odroid-C1
> > without "eee-broken-1000t"
> > 
> > On Tue, Dec 4, 2018 at 5:05 PM Carlo Caione <ccaione@baylibre.com> wrote:
> > > The wrong IRQ trigger type for the macirq was causing the connection
> > > speed to drop after a few hours when stress testing the DUT. The fix
> > > seems also to fix another long standing issue with EEE.
> 
> Carlo, can you describe precisely the tests you conducted
> on your board and the tools used?
> 
> 
> > the other two DesignWare controllers (2x dwc2) are also using
> > IRQ_TYPE_LEVEL_HIGH
> > so this is not unlikely - good job detective!
> > 
> 
> Consider that currently the USB ports do not work correctly.
> In particular, USB pendrive insertion is not recognized at runtime.
> 
> 
> > > The fixes are tested on a AXG board but we think that the same fix is
> > > valid also for all the others Amlogic SoC families.
> > I checked Amlogic's 3.10 kernel for the 32-bit SoCs and it seems they
> > are setting all IRQs to be edge triggered: [0]
> > however, Emiliano reported an issue with IRQ_TYPE_EDGE_RISING for the
> > dwc2 controllers as well. 291f45dd6da5fa6 "ARM: dts: meson: fixing USB
> > support on Meson6, Meson8 and Meson8b" fixed it for him whereas it
> > worked for me with IRQ_TYPE_EDGE_RISING
> > 
> > I find it strange though that Amlogic's buildroot kernel (even the
> > latest buildroot_openlinux_kernel_4.9_fbdev_20180706) uses:
> >   interrupts = <0 8 1>
> > which translates to:
> >   interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>
> > 
> > does the datasheet give a hint that this IRQ should be level triggered
> > or did you find out by trial and error?
> > 
> > > Carlo Caione (2):
> > >   arm64: dts: meson: Fix IRQ trigger type for macirq
> > >   arm64: dts: meson: Remove eee-broken-1000t quirk
> > > 
> > >  arch/arm/boot/dts/meson.dtsi                        | 2 +-
> > >  arch/arm/boot/dts/meson8b-odroidc1.dts              | 1 -
> > these two should be in separate patches with "ARM: dts: " as prefix
> > 
> > >  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts      | 1 -
> > >  arch/arm64/boot/dts/amlogic/meson-axg.dtsi          | 2 +-
> > >  arch/arm64/boot/dts/amlogic/meson-gx.dtsi           | 2 +-
> > >  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 -
> > >  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi   | 1 -
> > >  7 files changed, 3 insertions(+), 7 deletions(-)
> > > 
> > > --
> > > 2.19.1
> > > 
> > 
> > Regards
> > Martin
> > 
> > [0] 
> > https://github.com/endlessm/linux-meson/blob/cd4096c3ff4eb5b8a8a5581bb46508601c5470dc/drivers/irqchip/irq-gic.c#L400
> > 
> > _______________________________________________
> > linux-amlogic mailing list
> > linux-amlogic@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
> Best regards,
> 
> Emiliano
> 
> [0] 
> http://lists.infradead.org/pipermail/linux-amlogic/2018-December/009325.html
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git/
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
