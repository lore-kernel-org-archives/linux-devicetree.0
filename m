From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson: libretech-cc: switch eMMC to 1.8v
Date: Sat, 22 Dec 2018 18:01:18 +0100
Message-ID: <CAFBinCBQkpLxUZYp2NQoXEA=8t_XCJMHauM+DwTz-p0FA57CrA@mail.gmail.com>
References: <20181220161037.23756-1-jbrunet@baylibre.com> <20181220161037.23756-3-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181220161037.23756-3-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jerome,

On Thu, Dec 20, 2018 at 5:11 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> While some 3.3v eMMC 4.0 are available from libretech, the default
> option for the aml-s905x-cc seems to 1.8v 5.0 modules.
nit-pick:
can you please state which module (storage size) you used for testing?
you probably still remember that we had some confusion on Odroid-C2
which eMMC module works and which doesn't, so let's be explicit here

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts    | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> index daad007fac1f..d0d202cf7161 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> @@ -118,8 +118,8 @@
>         vddio_boot: regulator-vddio_boot {
>                 compatible = "regulator-fixed";
>                 regulator-name = "VDDIO_BOOT";
> -               regulator-min-microvolt = <3300000>;
> -               regulator-max-microvolt = <3300000>;
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
is there a 3.3V -> 1.8V regulator on the eMMC module?
I'm not sure about the schematics but it seems to be that the board
itself supplies only 3.3V to the eMMC connector, so I'm not sure where
1.8V come from in this case
can you please add a comment to the .dts about this?


Regards
Martin
