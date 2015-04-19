From: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH v2 09/12] devicetree: Add bindings for the ATH79 GPIO controllers
Date: Sun, 19 Apr 2015 16:27:38 +0200
Message-ID: <CAOiHx=n8a=HTR-cAQffRx2OaGxXzLDzmtwwy99xCFqty521CKw@mail.gmail.com>
References: <1429448288-20742-1-git-send-email-albeu@free.fr> <1429450936-21642-1-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429450936-21642-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Alban Bedel <albeu@free.fr>
Cc: MIPS Mailing List <linux-mips@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, Gabor Juhos <juhosg@openwrt.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 19, 2015 at 3:42 PM, Alban Bedel <albeu@free.fr> wrote:
> These bindings support the GPIO controllers found on the Qualcomm
> Atheros AR7xxx/AR9XXX SoC.
>
> Signed-off-by: Alban Bedel <albeu@free.fr>
> ---
> v2: * Add the ngpios property to have fewer fallbacks and simpler code
> ---
>  .../devicetree/bindings/gpio/gpio-ath79.txt        | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-ath79.txt
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-ath79.txt b/Documentation/devicetree/bindings/gpio/gpio-ath79.txt
> new file mode 100644
> index 0000000..e027864
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-ath79.txt
> @@ -0,0 +1,38 @@
> +Binding for Qualcomm  Atheros AR7xxx/AR9xxx GPIO controller
> +
> +Required properties:
> +- compatible: has to be "qca,<soctype>-gpio" and one of the following
> +  fallback:

maybe plural?

> +  - "qca,ar7100-gpio"
> +  - "qca,ar9340-gpio"
> +- reg: Base address and size of the controllers memory area
> +- gpio-controller : Marks the device node as a GPIO controller.
> +- #gpio-cells : Should be two. The first cell is the pin number and the
> +  second cell is used to specify optional parameters.
> +- ngpios: Should be set to the number of GPIOs available on the SoC.
> +
> +Optional properties:
> +- interrupt-parent: phandle of the parent interrupt controller.
> +- interrupts: Interrupt specifier for the controllers interrupt.
> +- interrupt-controller : Identifies the node as an interrupt controller
> +- #interrupt-cells : Specifies the number of cells needed to encode interrupt
> +                    source, should be 2
> +
> +Please refer to interrupts.txt in this directory for details of the common
> +Interrupt Controllers bindings used by client devices.
> +
> +Example:
> +
> +       gpio@18040000 {
> +               compatible = "qca,ar9132-gpio", "qca,ar9130-gpio";

You have neither "qca,ar7100-gpio" nor "qca,ar9340-gpio", so by your
own documentation this would be invalid.


Jonas
