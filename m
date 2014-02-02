From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 RESEND 2/3] ARM: dts: clps711x: Add bindings
 documentation for CLPS711X irqchip driver
Date: Sun, 2 Feb 2014 15:48:26 -0600
Message-ID: <CAL_JsqJPSsdT2zgXyvzQjYfyVbgZKG0Bt9b-7NGCgbT3Fuhq1A@mail.gmail.com>
References: <1391328520-30923-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391328520-30923-1-git-send-email-shc_work-JGs/UdohzUI@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 2, 2014 at 2:08 AM, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org> wrote:
> Add OF document for Cirrus Logic CLPS711X irqchip driver.
>
> Signed-off-by: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
> ---
>  .../interrupt-controller/cirrus,clps711x-intc.txt  | 41 ++++++++++++++++++++++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>


>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/cirrus,clps711x-intc.txt
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/cirrus,clps711x-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/cirrus,clps711x-intc.txt
> new file mode 100644
> index 0000000..759339c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/cirrus,clps711x-intc.txt
> @@ -0,0 +1,41 @@
> +Cirrus Logic CLPS711X Interrupt Controller
> +
> +Required properties:
> +
> +- compatible: Should be "cirrus,clps711x-intc".
> +- reg: Specifies base physical address of the registers set.
> +- interrupt-controller: Identifies the node as an interrupt controller.
> +- #interrupt-cells: Specifies the number of cells needed to encode an
> +  interrupt source. The value shall be 1.
> +
> +The interrupt sources are as follows:
> +ID     Name    Description
> +---------------------------
> +1:     BLINT   Battery low (FIQ)
> +3:     MCINT   Media changed (FIQ)
> +4:     CSINT   CODEC sound
> +5:     EINT1   External 1
> +6:     EINT2   External 2
> +7:     EINT3   External 3
> +8:     TC1OI   TC1 under flow
> +9:     TC2OI   TC2 under flow
> +10:    RTCMI   RTC compare match
> +11:    TINT    64Hz tick
> +12:    UTXINT1 UART1 transmit FIFO half empty
> +13:    URXINT1 UART1 receive FIFO half full
> +14:    UMSINT  UART1 modem status changed
> +15:    SSEOTI  SSI1 end of transfer
> +16:    KBDINT  Keyboard
> +17:    SS2RX   SSI2 receive FIFO half or greater full
> +18:    SS2TX   SSI2 transmit FIFO less than half empty
> +28:    UTXINT2 UART2 transmit FIFO half empty
> +29:    URXINT2 UART2 receive FIFO half full
> +32:    DAIINT  DAI interface (FIQ)
> +
> +Example:
> +       intc: interrupt-controller {
> +               compatible = "cirrus,clps711x-intc";
> +               reg = <0x80000000 0x4000>;
> +               interrupt-controller;
> +               #interrupt-cells = <1>;
> +       };
> --
> 1.8.3.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
