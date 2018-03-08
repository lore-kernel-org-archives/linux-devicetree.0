From: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add Nuvoton NPCM description
Date: Thu, 8 Mar 2018 09:46:59 +0200
Message-ID: <CAP6Zq1g44N_zzV18089m1MTeZqxCdiLddSunjqqA2fK0-TBfvA@mail.gmail.com>
References: <20180305114541.9917-1-joel@jms.id.au> <20180305114541.9917-2-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180305114541.9917-2-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marcus Folkesson <marcus.folkesson@gmail.com>, linux-watchdog@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Avi Fishman <avifishman70@gmail.com>, Brendan Higgins <brendanhiggins@google.com>
List-Id: devicetree@vger.kernel.org

On 5 March 2018 at 13:45, Joel Stanley <joel@jms.id.au> wrote:
> These bindings describe the watchdog IP as used by the Nuvoton NPCM750
> (Poleg) BMC SoC.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> V2: Add optional timeout property
> ---
>  .../bindings/watchdog/nuvoton,npcm-wdt.txt         | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
>
> diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
> new file mode 100644
> index 000000000000..615eacd0b9d6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
> @@ -0,0 +1,28 @@
> +Nuvoton NPCM Watchdog
> +
> +Nuvoton NPCM timer module provides five 24-bit timer counters, and a watchdog.
> +The watchdog supports a pre-timeout interrupt that fires 10ms before the
> +expiry.
> +
> +Required properties:
> +- compatible      : "nuvoton,npcm750-wdt" for NPCM750 (Poleg).
> +- reg             : Offset and length of the register set for the device.
> +- interrupts      : Contain the timer interrupt with flags for
> +                    falling edge.
> +
> +Required clocking property, have to be one of:
> +- clocks          : phandle of timer reference clock.
> +- clock-frequency : The frequency in Hz of the clock that drives the NPCM7xx
> +                    timer (usually 25000000).
> +
> +Optional properties:
> +- timeout-sec : Contains the watchdog timeout in seconds
> +
> +Example:
> +
> +timer@f00080c1 {
Little address mistake, suppose to be f000801c
> +    compatible = "nuvoton,npcm750-wdt";
> +    interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> +    reg = <0xf00080c1 0x4>;
Little address mistake, suppose to be  0xf000801c
> +    clocks = <&clk NPCM7XX_CLK_TIMER>;
> +};
> --
> 2.15.1
>
