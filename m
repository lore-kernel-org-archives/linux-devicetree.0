From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCHv3 1/2] ARM64: dts: meson-gxbb-odroidc2: Fix usb phy reset warning
Date: Mon, 4 Feb 2019 14:58:58 +0100
Message-ID: <CAFBinCDj=Y9HWEhJYMjo9FviAosxpHW5d61CceZ7HPV4ObZ79Q@mail.gmail.com>
References: <20190129102521.4141-1-linux.amoon@gmail.com> <20190129102521.4141-2-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129102521.4141-2-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hi Anand,

On Tue, Jan 29, 2019 at 11:25 AM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Add missing vin-supply node 5.0V regulator setting to power
> to usb ports, changes help fix the usb reset warning.
>
> [  795.380156] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  798.356073] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  801.331999] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  804.307919] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  807.283844] usb 1-1.2: reset high-speed USB device number 3 using dwc2
>
> Fixes: 5a0803bd5ae (ARM64: dts: meson-gxbb-odroidc2: Enable USB Nodes)
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> changes from prevoius
>
>  regulator                      use open bypass  opmode voltage current     min     max
> ---------------------------------------------------------------------------------------
>  regulator-dummy                  5    4      0 unknown     0mV     0mA     0mV     0mV
>     c9100000.usb                  1                                 0mA     0mV     0mV
>     c9100000.usb                  1                                 0mA     0mV     0mV
>     c9000000.usb                  1                                 0mA     0mV     0mV
>     c9000000.usb                  1                                 0mA     0mV     0mV
>  P5V0                             1    1      0 unknown  5000mV     0mA  5000mV  5000mV
>     USB_OTG_PWR                   4    2      0 unknown  5000mV     0mA  5000mV  5000mV
>        phy-c0000020.phy.1         2                                 0mA     0mV     0mV
>        phy-c0000000.phy.0         2                                 0mA     0mV     0mV
> --
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 2e1cd5e3a246..da729ed00408 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -28,6 +28,13 @@
>                 reg = <0x0 0x0 0x0 0x80000000>;
>         };
>
> +       p5v0: regulator-p5v0 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "P5V0";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +       };
> +
>         usb_otg_pwr: regulator-usb-pwrs {
>                 compatible = "regulator-fixed";
>
> @@ -36,6 +43,8 @@
>                 regulator-min-microvolt = <5000000>;
>                 regulator-max-microvolt = <5000000>;
>
> +               vin-supply = <&p5v0>;
did you find out why this patch fixes the USB_OTG_PWR regulator?
based on just reading the patch I can't find an explanation myself

have you tested without this patch to rule out that you hit some bug
in the regulator framework back when you wrote the patch?
(I don't have an Odroid-C2 so I can't test this myself).


Regards
Martin
