From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Use SoC compatible string instead
 of wildcard string
Date: Wed, 13 Feb 2019 13:57:47 +0100
Message-ID: <CAMpxmJX7WdtbN=w8D=ZPwAFsamoTm89KeC42ag_LoSoJBFjiRg@mail.gmail.com>
References: <b8101fd6d303c1993ee294eeee8bce4d24b9547f.1550061925.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b8101fd6d303c1993ee294eeee8bce4d24b9547f.1550061925.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Orson Zhai <orsonzhai@gmail.com>, Lyra Zhang <zhang.lyra@gmail.com>, Mark Brown <broonie@kernel.org>, linux-devicetree <devicetree@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

=C5=9Br., 13 lut 2019 o 13:49 Baolin Wang <baolin.wang@linaro.org> napisa=
=C5=82(a):
>
> Use SoC compatible string instead of wildcard string.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
>  .../devicetree/bindings/gpio/gpio-eic-sprd.txt     |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-eic-sprd.txt b/D=
ocumentation/devicetree/bindings/gpio/gpio-eic-sprd.txt
> index 93d98d0..54040a2 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-eic-sprd.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-eic-sprd.txt
> @@ -33,7 +33,7 @@ Required properties:
>    "sprd,sc9860-eic-latch",
>    "sprd,sc9860-eic-async",
>    "sprd,sc9860-eic-sync",
> -  "sprd,sc27xx-eic".
> +  "sprd,sc2731-eic".
>  - reg: Define the base and range of the I/O address space containing
>    the GPIO controller registers.
>  - gpio-controller: Marks the device node as a GPIO controller.
> @@ -86,7 +86,7 @@ Example:
>         };
>
>         pmic_eic: gpio@300 {
> -               compatible =3D "sprd,sc27xx-eic";
> +               compatible =3D "sprd,sc2731-eic";
>                 reg =3D <0x300>;
>                 interrupt-parent =3D <&sc2731_pmic>;
>                 interrupts =3D <5 IRQ_TYPE_LEVEL_HIGH>;
> --
> 1.7.9.5
>

Hi,

please indicate the module this concerns in the subject line.
Something like: "dt-bindings: gpio: sprd: ..."

Bartosz
