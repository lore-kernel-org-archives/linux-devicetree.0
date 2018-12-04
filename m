From: Carlo Caione <ccaione@baylibre.com>
Subject: Re: [PATCH 0/2] meson: Fix IRQ trigger type
Date: Tue, 04 Dec 2018 20:51:21 +0000
Message-ID: <e152a2b038aa3e3e37e031eff5585008f4637ded.camel@baylibre.com>
References: <20181204160447.27869-1-ccaione@baylibre.com>
 <CAFBinCDCE7RP4vgs25bqSZ8vBjrmcuB=qb3U92X6QfpmzeqrBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAFBinCDCE7RP4vgs25bqSZ8vBjrmcuB=qb3U92X6QfpmzeqrBg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, ingrassia@epigenesys.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@baylibre.com, robh+dt@kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 2018-12-04 at 20:59 +0100, Martin Blumenstingl wrote:
> adding Emiliano because he experienced high packet loss on Odroid-C1
> without "eee-broken-1000t"

Yes, it would be nice to have confirmation. I tested this using an AXG
board with iperf3 both in TX/RX.

> I find it strange though that Amlogic's buildroot kernel (even the
> latest buildroot_openlinux_kernel_4.9_fbdev_20180706) uses:
>   interrupts = <0 8 1>
> which translates to:
>   interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>
> 
> does the datasheet give a hint that this IRQ should be level
> triggered
> or did you find out by trial and error?

The datasheet says nothing about that. Looking at the GMAC registers
you can get some clues but we confirmed that with long lasting tests.

> > Carlo Caione (2):
> >   arm64: dts: meson: Fix IRQ trigger type for macirq
> >   arm64: dts: meson: Remove eee-broken-1000t quirk
> > 
> >  arch/arm/boot/dts/meson.dtsi                        | 2 +-
> >  arch/arm/boot/dts/meson8b-odroidc1.dts              | 1 -
> these two should be in separate patches with "ARM: dts: " as prefix

Right, they slipped in after I had already written the commit message.

Kevin, Neil, let me push a V2 so that I can fix the commit messages.

> >  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts      | 1 -
> >  arch/arm64/boot/dts/amlogic/meson-axg.dtsi          | 2 +-
> >  arch/arm64/boot/dts/amlogic/meson-gx.dtsi           | 2 +-
> >  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 -
> >  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi   | 1 -
> >  7 files changed, 3 insertions(+), 7 deletions(-)
> > 
> > --
> > 2.19.1

Cheers,

--
Carlo Caione
