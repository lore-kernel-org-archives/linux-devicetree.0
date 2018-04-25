From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 4/7] dt-bindings: gnss: add u-blox binding
Date: Wed, 25 Apr 2018 13:16:58 -0500
Message-ID: <CAL_Jsq+mCp=geT8t_j+0fuTxAB7C9RYn6pESRpLc2GH273fM1Q@mail.gmail.com>
References: <20180424163458.11947-1-johan@kernel.org> <20180424163458.11947-5-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180424163458.11947-5-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Pavel Machek <pavel@ucw.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 24, 2018 at 11:34 AM, Johan Hovold <johan@kernel.org> wrote:
> Add binding for u-blox GNSS receivers.
>
> Note that the u-blox product names encodes form factor (e.g. "neo"),
> chipset (e.g. "8") and variant (e.g. "q"), but that only formfactor and
> chipset is used for the compatible strings (for now).
>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  .../devicetree/bindings/gnss/u-blox.txt       | 31 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt   |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gnss/u-blox.txt
>
> diff --git a/Documentation/devicetree/bindings/gnss/u-blox.txt b/Documentation/devicetree/bindings/gnss/u-blox.txt
> new file mode 100644
> index 000000000000..bb54b83a177f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gnss/u-blox.txt
> @@ -0,0 +1,31 @@
> +u-blox GNSS Receiver DT binding
> +
> +The u-blox GNSS receivers can use UART, DDC (I2C), SPI and USB interfaces.
> +
> +Please see Documentation/devicetree/bindings/gnss/gnss.txt for generic
> +properties.
> +
> +Required Properties:
> +
> +- compatible   : Must be one of
> +
> +                       "u-blox,neo-8"
> +                       "u-blox,neo-m8"
> +
> +- vcc-supply   : Main voltage regulator (VCC)

What about V_BCKP?

> +
> +Optional Properties:

reg is required if using I2C, SPI, or USB.

Datasheet also shows an interrupt pin.

> +
> +- timepulse-gpios      : Timepulse (e.g. 1PPS) GPIO (TIMEPULSE)

Why the 3rd "TIMEPULSE"?

> +
> +Example:
> +
> +serial@1234 {
> +       compatible = "ns16550a";
> +
> +       gnss {
> +               compatible = "u-blox,neo-8";
> +
> +               vcc-supply = <&gnss_reg>;
> +       };
> +};
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index b5f978a4cac6..2128dfdf73f1 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -374,6 +374,7 @@ tronsmart   Tronsmart
>  truly  Truly Semiconductors Limited
>  tsd    Theobroma Systems Design und Consulting GmbH
>  tyan   Tyan Computer Corporation
> +u-blox u-blox
>  ucrobotics     uCRobotics
>  ubnt   Ubiquiti Networks
>  udoo   Udoo
> --
> 2.17.0
>
