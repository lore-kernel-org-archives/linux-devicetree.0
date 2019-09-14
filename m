From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RESEND PATCH v3 3/3] arm64: dts: meson-g12b-ugoos-am6: add
 initial device-tree
Date: Sat, 14 Sep 2019 19:40:42 +0200
Message-ID: <CAFBinCANaKMHRuwaFwubZcDjZaGYcLcVuHjJsakR0uJkmZxRMw@mail.gmail.com>
References: <1567780354-59472-1-git-send-email-christianshewitt@gmail.com>
 <1567780354-59472-4-git-send-email-christianshewitt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1567780354-59472-4-git-send-email-christianshewitt@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Oleg Ivanov <balbes-150@yandex.ru>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Christian,

my nit-picks below

On Fri, Sep 6, 2019 at 4:34 PM Christian Hewitt
<christianshewitt@gmail.com> wrote:
[...]
> +       spdif_dit: audio-codec-1 {
> +               #sound-dai-cells = <0>;
> +               compatible = "linux,spdif-dit";
> +               status = "okay";
> +               sound-name-prefix = "DIT";
> +       };
please move it below sdio_pwrseq (or at least somewhere below the memory node)

[...]
> +       vcc_3v3: regulator-vcc_3v3 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "VCC_3V3";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               vin-supply = <&vddao_3v3>;
> +               regulator-always-on;
> +               /* FIXME: actually controlled by VDDCPU_B_EN */
can we add the enable GPIO here now that we know how to describe the
VDDCPU_B regulator?

[...]
> +       usb1_pow: regulator-usb1_pow {
for consistency with the regulators above: regulator-usb1-pow

[...]
> +       usb_pwr_en: regulator-usb_pwr_en {
for consistency with the regulators above: regulator-usb-pwr-en

[...]
> +       vddao_1v8: regulator-vddao_1v8 {
for consistency with the regulators above: regulator-vddao-1v8

[...
> +       vddao_3v3: regulator-vddao_3v3 {
for consistency with the regulators above: regulator-vddao-3v3

[...]
> +&cpu0 {
> +       cpu-supply = <&vddcpu_b>;
> +       operating-points-v2 = <&cpu_opp_table_0>;
> +       clocks = <&clkc CLKID_CPU_CLK>;
> +       clock-latency = <50000>;
> +};
> +
> +&cpu1 {
> +       cpu-supply = <&vddcpu_b>;
> +       operating-points-v2 = <&cpu_opp_table_0>;
> +       clocks = <&clkc CLKID_CPU_CLK>;
> +       clock-latency = <50000>;
> +};
> +
> +&cpu100 {
> +       cpu-supply = <&vddcpu_a>;
> +       operating-points-v2 = <&cpub_opp_table_1>;
> +       clocks = <&clkc CLKID_CPUB_CLK>;
> +       clock-latency = <50000>;
> +};
> +
> +&cpu101 {
> +       cpu-supply = <&vddcpu_a>;
> +       operating-points-v2 = <&cpub_opp_table_1>;
> +       clocks = <&clkc CLKID_CPUB_CLK>;
> +       clock-latency = <50000>;
> +};
> +
> +&cpu102 {
> +       cpu-supply = <&vddcpu_a>;
> +       operating-points-v2 = <&cpub_opp_table_1>;
> +       clocks = <&clkc CLKID_CPUB_CLK>;
> +       clock-latency = <50000>;
> +};
> +
> +&cpu103 {
> +       cpu-supply = <&vddcpu_a>;
> +       operating-points-v2 = <&cpub_opp_table_1>;
> +       clocks = <&clkc CLKID_CPUB_CLK>;
> +       clock-latency = <50000>;
> +};
(not limited to this patch: there's a lot of redundancy with the CPU
nodes across the G12B .dts)

[...]
> +&sd_emmc_a {
all nodes starting here should use alphabetical sorting


Martin
