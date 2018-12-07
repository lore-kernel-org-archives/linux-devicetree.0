From: Emiliano Ingrassia <ingrassia@epigenesys.com>
Subject: Re: [PATCH v2 2/2] arm: dts: meson: Fix IRQ trigger type for macirq
Date: Fri, 7 Dec 2018 19:51:36 +0100
Message-ID: <20181207185136.GB17435@ingrassia.epigenesys.com>
References: <20181207105231.25593-1-ccaione@baylibre.com>
 <20181207105231.25593-3-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181207105231.25593-3-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <ccaione@baylibre.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, martin.blumenstingl@googlemail.com, khilman@baylibre.com, robh+dt@kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Carlo,

tests[0] conducted on an Odroid-C1+ board equipped with a Meson8b SoC
have shown an high packet loss (90% and more) during a simple ping
test from a laptop to the board.
Testing the two patches separately clearly showed that this depends on the
removal of the "eee-broken-1000t" flag from the board PHY description
in the relative device tree.

About the first patch (MAC IRQ type), no tests have shown an evidence
that it is needed. I suggest you to conduct some test on real hardware
as I do to confirm or disprove my tests.

Thanks for your work,

Emiliano

[0] http://lists.infradead.org/pipermail/linux-amlogic/2018-December/009397.html

On Fri, Dec 07, 2018 at 10:52:31AM +0000, Carlo Caione wrote:
> A long running stress test on a custom board shipping an AXG SoCs and a
> Realtek RTL8211F PHY revealed that after a few hours the connection
> speed would drop drastically, from ~1000Mbps to ~3Mbps. At the same time
> the 'macirq' (eth0) IRQ would stop being triggered at all and as
> consequence the GMAC IRQs never ACKed.
>
> After a painful investigation the problem seemed to be due to a wrong
> defined IRQ type for the GMAC IRQ that should be LEVEL_HIGH instead of
> EDGE_RISING.
>
> The change in the macirq IRQ type also solved another long standing
> issue affecting this SoC/PHY where EEE was causing the network
> connection to die after stressing it with iperf3 (even though much
> sooner). It's now possible to remove the 'eee-broken-1000t' quirk as
> well.
>
> Fixes: 9c15795a4f96 ("ARM: dts: meson8b-odroidc1: ethernet support")
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  arch/arm/boot/dts/meson.dtsi           | 2 +-
>  arch/arm/boot/dts/meson8b-odroidc1.dts | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
> index 0d9faf1a51ea..a86b89086334 100644
> --- a/arch/arm/boot/dts/meson.dtsi
> +++ b/arch/arm/boot/dts/meson.dtsi
> @@ -263,7 +263,7 @@
>  			compatible = "amlogic,meson6-dwmac", "snps,dwmac";
>  			reg = <0xc9410000 0x10000
>  			       0xc1108108 0x4>;
> -			interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
> +			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "macirq";
>  			status = "disabled";
>  		};
> diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
> index 58669abda259..a951a6632d0c 100644
> --- a/arch/arm/boot/dts/meson8b-odroidc1.dts
> +++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
> @@ -221,7 +221,6 @@
>  		/* Realtek RTL8211F (0x001cc916) */
>  		eth_phy: ethernet-phy@0 {
>  			reg = <0>;
> -			eee-broken-1000t;
>  			interrupt-parent = <&gpio_intc>;
>  			/* GPIOH_3 */
>  			interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
> --
> 2.19.1
>
