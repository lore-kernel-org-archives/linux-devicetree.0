From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCHv4-next 2/3] arm64: dts: meson: odroid-c2: Add missing
 linking regulator to usb bus
Date: Tue, 3 Sep 2019 20:57:23 +0200
Message-ID: <CAFBinCCyWn+3unD8Ch-UBRve6jt5FtE9r0dSpKV3izgh1a6URA@mail.gmail.com>
References: <20190902054935.4899-1-linux.amoon@gmail.com> <20190902054935.4899-3-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190902054935.4899-3-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 2, 2019 at 7:50 AM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Add missing linking regulator node to usb bus for power usb devices.
>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Re-base on linux-next
> Added Ack from Martin.
>
> Changes from previous patch
> [1] https://lore.kernel.org/patchwork/patch/1031243/
> split the changes and add the comments to power source
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 0cb5831d9daf..d4c8b896dd26 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -36,8 +36,15 @@
>                 regulator-min-microvolt = <5000000>;
>                 regulator-max-microvolt = <5000000>;
>
> +               /*
> +                * signal name from schematics: PWREN
> +                */
>                 gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
>                 enable-active-high;
> +               /*
> +                * signal name from sehematics: USB_POWER
nit-pick: should be "schematics"
I hope that Kevin can fix that up when applying
