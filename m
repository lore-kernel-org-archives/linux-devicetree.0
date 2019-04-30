From: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Fix spelling of bias-pull-up
Date: Tue, 30 Apr 2019 23:32:17 +0200
Message-ID: <2683948.V7X3pFLLSZ@debian64>
References: <20190428150822.13935-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190428150822.13935-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc: linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sunday, April 28, 2019 5:08:22 PM CEST Jonathan Neusch=E4fer wrote:
> The property is spelled 'bias-pull-up', as documented in
> pinctrl-bindings.txt.
>=20

I also sent out a patch for that... back in 2017:

https://patchwork.ozlabs.org/patch/763151/

It's marked Accepted and Archived.

@rob ?

> Signed-off-by: Jonathan Neusch=E4fer <j.neuschaefer@gmx.net>
> ---
>  .../devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt        | 2 +-
>  .../devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt        | 2 +-
>  .../devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt        | 2 +-
>  .../devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt        | 2 +-
>  .../devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt        | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinct=
rl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
> index c2dbb3e8d840..4e90ddd77784 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
> @@ -42,7 +42,7 @@ information about e.g. the mux function.
>  The following generic properties as defined in pinctrl-bindings.txt are =
valid
>  to specify in a pin configuration subnode:
>=20
> - pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-stren=
gth,
> + pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-stren=
gth,
>   output-low, output-high.
>=20
>  Non-empty subnodes must specify the 'pins' property.
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinct=
rl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
> index 991be0cd0948..84be0f2c6f3b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
> @@ -44,7 +44,7 @@ information about e.g. the mux function.
>=20
>  The following generic properties as defined in pinctrl-bindings.txt are =
valid
>  to specify in a pin configuration subnode:
> - pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-stren=
gth.
> + pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-stren=
gth.
>=20
>  Non-empty subnodes must specify the 'pins' property.
>  Note that not all properties are valid for all pins.
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinct=
rl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt
> index 7ed56a1b70fc..a7aaaa7db83b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt
> @@ -42,7 +42,7 @@ information about e.g. the mux function.
>  The following generic properties as defined in pinctrl-bindings.txt are =
valid
>  to specify in a pin configuration subnode:
>=20
> - pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-stren=
gth,
> + pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-stren=
gth,
>   output-low, output-high.
>=20
>  Non-empty subnodes must specify the 'pins' property.
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinct=
rl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt
> index cdc4787e59d2..f095209848c8 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt
> @@ -42,7 +42,7 @@ information about e.g. the mux function.
>  The following generic properties as defined in pinctrl-bindings.txt are =
valid
>  to specify in a pin configuration subnode:
>=20
> - pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-stren=
gth,
> + pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-stren=
gth,
>   output-low, output-high.
>=20
>  Non-empty subnodes must specify the 'pins' property.
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinct=
rl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt
> index c22e6c425d0b..004056506679 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt
> @@ -41,7 +41,7 @@ information about e.g. the mux function.
>=20
>  The following generic properties as defined in pinctrl-bindings.txt are =
valid
>  to specify in a pin configuration subnode:
> - pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-stren=
gth.
> + pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-stren=
gth.
>=20
>  Non-empty subnodes must specify the 'pins' property.
>  Note that not all properties are valid for all pins.
> --
> 2.20.1
>=20
