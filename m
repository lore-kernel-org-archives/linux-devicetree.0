From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCHv1 3/3] arm64: dts: meson: odroid-c2: Add missing regulator
 linked to HDMI supply
Date: Sun, 1 Sep 2019 13:44:44 +0200
Message-ID: <CAFBinCB9NPtncyJCMWDbbzJnQafeaY5U3XHh=NuRZSCNDdO=Hg@mail.gmail.com>
References: <20190828202723.1145-1-linux.amoon@gmail.com> <20190828202723.1145-4-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828202723.1145-4-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Anand,

On Wed, Aug 28, 2019 at 10:27 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> As per shematics HDMI_P5V0 is supplied by P5V0 so add missing link.
typo: "schematics"

> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index a078a1ee5004..47789fd50415 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -213,6 +213,8 @@
>         status = "okay";
>         pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
>         pinctrl-names = "default";
> +       /* AP2331SA-7 */
> +       hdmi-supply = <&p5v0>;
>  };
my understanding based on odroid-c2_rev0.1_20150930.pdf is that:
- there's a (fixed) hdmi_p5v0 regulator using p5v0 as input
- the hdmi_p5v0 is the hdmi-supply

it doesn't change the functionality of this patch (since both supplies
are fixed regulators anyways)
you are already doing a nice cleanup with this series, so it would be
a shame to take a shortcut here


Martin
