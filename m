From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v4 1/2] dt-binding: timer: document NPCM7xx timer DT bindings
Date: Fri, 2 Mar 2018 12:21:57 +1030
Message-ID: <CACPK8Xeb3ryfi+FXr+mdpk2fPtSTwJXkuBjRhW76vx1SxGQfYQ@mail.gmail.com>
References: <1519655769-25836-1-git-send-email-tmaimon77@gmail.com> <1519655769-25836-2-git-send-email-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519655769-25836-2-git-send-email-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Avi Fishman <avifishman70@gmail.com>, Brendan Higgins <brendanhiggins@google.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Hi Tomer,

On Tue, Feb 27, 2018 at 1:06 AM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> Added device tree binding documentation for Nuvoton NPCM7xx timer.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> ---
>  .../bindings/timer/nuvoton,npcm7xx-timer.txt       | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
>
> diff --git a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
> new file mode 100644
> index 000000000000..c5150522e618
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
> @@ -0,0 +1,25 @@
> +Nuvoton NPCM7xx timer

Would it make more sense to all this Nuvoton NPCM Timer? This way the
name stays generic for when you add other systems.

> +
> +Nuvoton NPCM7xx have three timer modules, each timer module provides five 24-bit
> +timer counters.


I notice the timer has a register in the middle of it that is used for
the watchdog. Should we describe this in the same binding? Even if we
just add some text that adds

 ... and one watchdog register.

> +
> +Required properties:
> +- compatible      : "nuvoton,npcm750-timer" for Poleg NPCM750.
> +- reg             : Offset and length of the register set for the device.
> +- interrupts      : Contain the timer interrupt with flags for
> +                    falling edge.
> +
> +Required clocking property, have to be one of:
> +- clocks          : phandle of timer reference clock.
> +- clock-frequency : The frequency in Hz of the clock that drives the NPCM7xx
> +                    timer (usually 25000000).
> +
> +Example:
> +
> +timer@f0008000 {
> +    compatible = "nuvoton,npcm750-timer";
> +    interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +    reg = <0xf0008000 0x1000>;

This can probably be <0xf0008000 0x50>, as tthe timer hardware only
has registers up to base + 0x50.

> +    clocks = <&clk NPCM7XX_CLK_TIMER>;
> +};
> +
> --
> 2.14.1
>
