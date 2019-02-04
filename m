From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFCv1 2/3] ARM: dts: meson8b: odroidc1: fix USB power supplies
 for phy
Date: Mon, 4 Feb 2019 14:29:13 +0100
Message-ID: <CAFBinCAdf0rtt-7tON_LRNH_cpvGJXX3LX8g-i4xsC3wahZSVA@mail.gmail.com>
References: <20190123151209.2080-1-linux.amoon@gmail.com>
 <20190123151209.2080-3-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190123151209.2080-3-linux.amoon@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hi Anand,

On Wed, Jan 23, 2019 at 4:12 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> This patch enables the USB Host controller (USB0) and the relative USB0 PHY.
> From the shematics GPIOAO.BIT5 gpio input for the PWREN signal of the
> USB_OTG controller (usb0) which is also linked to USB_HOST controller (usb1).
> Add missing phy-supply link to both  USB0 and USB1 phy controller
> This changes fixed the power issue on usb ports. Changes help fix usb reset warning.
I prefer to change the way patches 2 and 3 are split:
- this one should only add the regulators and link it with the USB controller
- patch 3 should enable usb0 and usb0_phy

the reason behind this is the "Fixes" tag below. it's good to have it,
so please keep it in this patch!
however, enabling usb0 is not a fix for a commit which enables the
"USB host controller on Odroid-C1/C1+" (which is why enabling usb0 and
usb0_phy should be part of patch 3)

> [  821.991470] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  825.243385] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  828.151310] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  830.991241] usb 1-1.2: reset high-speed USB device number 3 using dwc2
>
> Fixes: 2eb79a4d15ff ("ARM: dts: meson: enabling the USB Host controller on Odroid-C1/C1+ board")
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Changes from previous patch.
>
> Fix the subject and commit message as per Martin's request
>  --Add the signal name in the comment
>  --Replace vbus-supply with phy-supply linking the power supply to phy node as pointed by Marine
>    which a PWREN signal in the USB_HOST controller (usb1)
>
> USB_VBUS                      4    2      0 unknown  5000mV     0mA  5000mV  5000mV
>    phy-c1108820.phy.1         2                                 0mA     0mV     0mV
>    phy-c1108800.phy.0         2                                 0mA     0mV     0mV
> ---
>  arch/arm/boot/dts/meson8b-odroidc1.dts | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
> index 58669abda259..bfa472a679d9 100644
> --- a/arch/arm/boot/dts/meson8b-odroidc1.dts
> +++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
> @@ -83,6 +83,22 @@
>                 regulator-max-microvolt = <5000000>;
>         };
>
> +       usb_vbus: regulator-usb-vbus {
> +               compatible = "regulator-fixed";
> +
> +               regulator-name = "USB_VBUS";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +
> +               vin-supply = <&p5v0>;
> +
> +               /*
> +                * signal name from schematics: PWREN
> +                */
> +               gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +       };
> +
>         tflash_vdd: regulator-tflash_vdd {
>                 /*
>                  * signal name from schematics: TFLASH_VDD_EN
> @@ -295,8 +311,18 @@
>         pinctrl-names = "default";
>  };
>
> +&usb0_phy {
> +       status = "okay";
> +       phy-supply = <&usb_vbus>;
I'm not sure whether phy-supply is correct here
with the PHY framework and the dwc2 controller regulators can be set as:
- phy-supply (inside the PHY node)
- vbus-supply (inside the dwc2 controller node)

phy-supply is always enabled when the PHY is enabled.
vbus-supply is smarter: it's enabled whenever the controller is in
host mode (or OTG detects hosts mode), but disabled in
device/peripheral mode

as far as I understand we don't want to send power to the "Micro USB"
port if we're in device/peripheral mode.


Regards
Martin
