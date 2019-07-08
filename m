MIME-Version: 1.0
Date: Mon, 8 Jul 2019 16:36:27 -0600
References: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
In-Reply-To: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
Message-ID: <CAL_Jsq+-xWLkvku-nLmJnFvbuS=dSD=9dG=GS4uBUqL50tdcDg@mail.gmail.com>
Subject: Re: [PATCH V4 2/2] gpio: inverter: document the inverter bindings
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Harish Jenny K N <harish_kandiga@mentor.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jun 28, 2019 at 3:31 AM Harish Jenny K N
<harish_kandiga@mentor.com> wrote:
>
> Document the device tree binding for the inverter gpio
> controller to configure the polarity of the gpio pins
> used by the consumers.
>
> Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
> ---
>  .../devicetree/bindings/gpio/gpio-inverter.txt     | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-inverter.txt
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-inverter.txt b/Documentation/devicetree/bindings/gpio/gpio-inverter.txt
> new file mode 100644
> index 0000000..8bb6b2e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-inverter.txt
> @@ -0,0 +1,29 @@
> +GPIO-INVERTER
> +======
> +This binding defines the gpio-inverter. The gpio-inverter is a driver that
> +allows to properly describe the gpio polarities on the hardware.

I don't understand. Please explain this in terms of the hardware, not a driver.

Rob
