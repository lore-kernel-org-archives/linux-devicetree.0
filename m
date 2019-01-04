From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 0/4] Add driver for globaltop GNSS receivers
Date: Fri, 4 Jan 2019 11:51:51 -0600
Message-ID: <CAL_JsqLvSWF60eqLsXUcP5GL0ijgfE6XwvectiM1D1Y9LPpOkA@mail.gmail.com>
References: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Loys Ollivier <lollivier@baylibre.com>
Cc: devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 28, 2018 at 4:51 AM Loys Ollivier <lollivier@baylibre.com> wrote:
>
> Hello !
>
> This patch series adds a new GNSS driver for the globaltop GNSS receivers.
> These receivers transmits NMEA output sequence as soon as they have booted.
> Power management can be done via the main supply and optional backup supply
> as defined in the device tree.
>
> The driver has been tested using a GlobalTop pa6h chipset on a Libretech-cc
> board using the expansion header. Changes made in the board device tree can
> be found below for reference and testing.
>
> Loys
>
> Loys Ollivier (4):
>   dt-bindings: Add vendor prefix for "GlobalTop Technology, Inc."
>   dt-bindings: gnss: add gtop binding
>   gnss: add gtop receiver type support
>   gnss: add driver for globaltop receivers
>
>  Documentation/devicetree/bindings/gnss/gtop.txt    |  33 +++++
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  drivers/gnss/Kconfig                               |  13 ++
>  drivers/gnss/Makefile                              |   3 +
>  drivers/gnss/core.c                                |   1 +
>  drivers/gnss/gtop.c                                | 152 +++++++++++++++++++++
>  include/linux/gnss.h                               |   1 +
>  7 files changed, 204 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gnss/gtop.txt
>  create mode 100644 drivers/gnss/gtop.c
>
> ---
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> index 90a56af967a7..3b3d4dcc47aa 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> @@ -17,6 +17,7 @@
>
>         aliases {
>                 serial0 = &uart_AO;
> +               serial1 = &uart_A;

You should not need this as the UART is not used as a tty. It could be
that the serial driver requires aliases, but that should be fixed.
There should be some examples of fixing this in other serial drivers.

>                 ethernet0 = &ethmac;
>         };
