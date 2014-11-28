From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] devicetree: add a binding for GPIOs going though a
 level shifter
Date: Fri, 28 Nov 2014 14:39:01 +0100
Message-ID: <CACRpkdbRtqSeEayrZ6sZPM6g65q=zmkhJKpz=n8X311DNGe5pw@mail.gmail.com>
References: <1416837696-28066-1-git-send-email-alban.bedel@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1416837696-28066-1-git-send-email-alban.bedel@avionic-design.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Alban Bedel <alban.bedel@avionic-design.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 24, 2014 at 3:01 PM, Alban Bedel
<alban.bedel@avionic-design.de> wrote:

> Signed-off-by: Alban Bedel <alban.bedel@avionic-design.de>
> ---
>  .../devicetree/bindings/gpio/gpio-level-shifter.txt       | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-level-shifter.txt
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-level-shifter.txt b/Documentation/devicetree/bindings/gpio/gpio-level-shifter.txt
> new file mode 100644
> index 0000000..e108c43
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-level-shifter.txt
> @@ -0,0 +1,15 @@
> +GPIO level shifter
> +
> +This binding allow supporting GPIOs going though a level shifter.
> +
> +Required properties:
> +- compatible : should be "gpio-level-shifter"
> +- data-gpios : list of the data GPIO phandles
> +- #gpio-cells : should be 2
> +- gpio-controller : marks the device node as a GPIO controller
> +
> +Optional properties:
> +- enable-gpio : phandle of the GPIO that control the level shifter enable pin
> +- direction-gpio : phandle of the GPIO that control the level shifter direction
> +- vcca-supply : phandle of the regulator for side A of the level shifter
> +- vccb-supply : phandle of the regulator for side B of the level shifter

It must be clear which side is facing the parent GPIO controller,
A or B.

It must be clear which one of these two should be used if the level shifter
has ony VCC.

And isn't the proper terminology VCC+VDD?

An example must be provided.

Yours,
Linus Walleij
