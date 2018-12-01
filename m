From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] arm64: dts: meson-axg: Fix and enable GPIO interrupt
 controller
Date: Sat, 1 Dec 2018 16:20:40 +0100
Message-ID: <CAFBinCDEJK-tJJJCd7wPLJHRCV0DegnSGO21XH3EXU7s7Om=Bw@mail.gmail.com>
References: <20181201145614.5381-1-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181201145614.5381-1-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: ccaione@baylibre.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@baylibre.com, robh+dt@kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
List-Id: devicetree@vger.kernel.org

Hi Carlo,

On Sat, Dec 1, 2018 at 3:56 PM Carlo Caione <ccaione@baylibre.com> wrote:
>
> The GPIO interrupt controller registers are mapped to the wrong
> offset in the DTSI. Fix the offset in the DTSI and enable the interrupt
> controller in the DTS of the only AXG board enabled.
>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 6 ++++++
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> index 18778ada7bd3..c3e4aac75782 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> @@ -374,6 +374,12 @@
>         status = "okay";
>  };
>
> +&gpio_intc {
> +       compatible = "amlogic,meson-gpio-intc",
> +                    "amlogic,meson-axg-gpio-intc";
multiple compatible strings should be ordered:
- use the most specific compatible (the AXG one) first
- the the less specific ones

also why did you add the AXG compatible string in the s400 board .dts
instead of meson-axg.dtsi (which makes it available for all AXG
boards)?

> +       status = "okay";
> +};
> +
>  &ir {
>         status = "okay";
>         pinctrl-0 = <&remote_input_ao_pins>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index df017dbd2e57..f1affc12e3e6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -1415,7 +1415,7 @@
>
>                         gpio_intc: interrupt-controller@f080 {
unit-address should match the reg property: ...@9880

>                                 compatible = "amlogic,meson-gpio-intc";
> -                               reg = <0x0 0xf080 0x0 0x10>;
> +                               reg = <0x0 0x9880 0x0 0x10>;
Amlogic's patched 4.9 buildroot kernel uses 0xf080 - can you add a
short sentence to the description on which board you have tested this
(I assume you used the s400)


Regards
Martin
