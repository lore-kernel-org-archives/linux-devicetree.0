From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/2] meson: Fix IRQ trigger type
Date: Tue, 4 Dec 2018 20:59:20 +0100
Message-ID: <CAFBinCDCE7RP4vgs25bqSZ8vBjrmcuB=qb3U92X6QfpmzeqrBg@mail.gmail.com>
References: <20181204160447.27869-1-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204160447.27869-1-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: ccaione@baylibre.com, ingrassia@epigenesys.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@baylibre.com, robh+dt@kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

adding Emiliano because he experienced high packet loss on Odroid-C1
without "eee-broken-1000t"

On Tue, Dec 4, 2018 at 5:05 PM Carlo Caione <ccaione@baylibre.com> wrote:
>
> The wrong IRQ trigger type for the macirq was causing the connection
> speed to drop after a few hours when stress testing the DUT. The fix
> seems also to fix another long standing issue with EEE.
the other two DesignWare controllers (2x dwc2) are also using
IRQ_TYPE_LEVEL_HIGH
so this is not unlikely - good job detective!

> The fixes are tested on a AXG board but we think that the same fix is
> valid also for all the others Amlogic SoC families.
I checked Amlogic's 3.10 kernel for the 32-bit SoCs and it seems they
are setting all IRQs to be edge triggered: [0]
however, Emiliano reported an issue with IRQ_TYPE_EDGE_RISING for the
dwc2 controllers as well. 291f45dd6da5fa6 "ARM: dts: meson: fixing USB
support on Meson6, Meson8 and Meson8b" fixed it for him whereas it
worked for me with IRQ_TYPE_EDGE_RISING

I find it strange though that Amlogic's buildroot kernel (even the
latest buildroot_openlinux_kernel_4.9_fbdev_20180706) uses:
  interrupts = <0 8 1>
which translates to:
  interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>

does the datasheet give a hint that this IRQ should be level triggered
or did you find out by trial and error?

> Carlo Caione (2):
>   arm64: dts: meson: Fix IRQ trigger type for macirq
>   arm64: dts: meson: Remove eee-broken-1000t quirk
>
>  arch/arm/boot/dts/meson.dtsi                        | 2 +-
>  arch/arm/boot/dts/meson8b-odroidc1.dts              | 1 -
these two should be in separate patches with "ARM: dts: " as prefix

>  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts      | 1 -
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi          | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi           | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 -
>  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi   | 1 -
>  7 files changed, 3 insertions(+), 7 deletions(-)
>
> --
> 2.19.1
>

Regards
Martin

[0] https://github.com/endlessm/linux-meson/blob/cd4096c3ff4eb5b8a8a5581bb46508601c5470dc/drivers/irqchip/irq-gic.c#L400
