From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 2/2] dt-binding: timer: document NPCM7xx timer DT
 bindings
Date: Tue, 10 Oct 2017 10:57:55 -0500
Message-ID: <20171010155755.wfklwchg4eg7u6p6@rob-hp-laptop>
References: <1506849098-18290-1-git-send-email-tmaimon77@gmail.com>
 <1506849098-18290-3-git-send-email-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1506849098-18290-3-git-send-email-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: mark.rutland@arm.com, daniel.lezcano@linaro.org, tglx@linutronix.de, avifishman70@gmail.com, brendanhiggins@google.com, raltherr@google.com, joel@jms.id.au, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Sun, Oct 01, 2017 at 12:11:38PM +0300, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton NPCM7xx timer.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/timer/nuvoton,npcm7xx-timer.txt       | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
> 
> diff --git a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
> new file mode 100644
> index 000000000000..d1beea901509
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
> @@ -0,0 +1,25 @@
> +Nuvoton NPCM7xx timer
> +
> +Nuvoton NPCM7xx have three timer modules, each timer module provides five 24-bit
> +timer counters.
> +
> +Required properties:
> +- compatible      : "nuvoton,npcm7xx-timer" for Poleg NPCM7xx.

Don't use wildcards in compatible strings. Use SoC specific compatible 
strings with a fallback (the string for the 1st SoC which the block 
appeared) if necessary.

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
> +    compatible = "nuvoton,npcm7xx-timer";
> +    interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +    reg = <0xf0008000 0x1000>;
> +    clocks = <&clk NPCM7XX_CLK_TIMER>;
> +};
> +
> -- 
> 2.14.1
> 
