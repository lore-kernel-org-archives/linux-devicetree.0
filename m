MIME-Version: 1.0
Date: Wed, 10 Jul 2019 09:55:39 -0600
References: <1561115855-4186-1-git-send-email-open.sudheer@gmail.com>
	<1561115855-4186-6-git-send-email-open.sudheer@gmail.com>
In-Reply-To: <1561115855-4186-6-git-send-email-open.sudheer@gmail.com>
Message-ID: <CAL_JsqKTKrPWJcajC9DB2pY4BBM3NFu00s0S0xx9aAZmcrtFqw@mail.gmail.com>
Subject: Re: [patch 5/5] Documentation: DT bindings AST2500 DMA UART driver
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: "sudheer.v" <open.sudheer@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Mark Rutland <mark.rutland@arm.com>, ShivahShankar Shakarnarayan rao <shivahshankar.shankarnarayanrao@aspeedtech.com>, shivahshankar@gmail.com, Sudheer V <sudheer.veliseti@aspeedtech.com>, sudheer veliseti <sudheer.open@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-ID: <devicetree@vger.kernel.org>


On Fri, Jun 21, 2019 at 5:16 AM sudheer.v <open.sudheer@gmail.com> wrote:
>
> From: sudheer veliseti <sudheer.open@gmail.com>
>
> Signed-off-by: sudheer veliseti <sudheer.open@gmail.com>
> ---
>  .../bindings/serial/ast2500-dma-uart.txt      | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serial/ast2500-dma-uart.txt
>
> diff --git a/Documentation/devicetree/bindings/serial/ast2500-dma-uart.txt b/Documentation/devicetree/bindings/serial/ast2500-dma-uart.txt
> new file mode 100644
> index 000000000000..6f01ddecba56
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/ast2500-dma-uart.txt
> @@ -0,0 +1,40 @@
> +
> +node for DMA controller:
> +                       ast_uart_sdma: uart_sdma@1e79e000 {
> +                               compatible = "aspeed,ast-uart-sdma";
> +                               reg = <0x1e79e000 0x400>;
> +                               interrupts = <50>;
> +                               status = "disabled";
> +                       };
> +this node  doesn't binds with any driver.
> +DMA controller is handled as a separate SW layer,and is included in the same driver.
> +This DMA controller node is included in DT just for Register base and interrupt details
> +
> +
> +
> +node for DMA-UART :
> +
> +
> +Required properties:
> +
> +- compatible: "aspeed,ast-sdma-uart"
> +- reg: The base address of the UART register bank
> +- interrupts: should contain interrupt specifier.
> +- clocks: Clock driving the hardware;
> +- pinctrl-0 : list of pinconfigurations
> +- dma-channel: channel of DMA-controller which is used
> +
> +Example:
> +
> +                 dma_uart1: dma_uart1@1e783000{
> +                          compatible = "aspeed,ast-sdma-uart";
> +                          reg = <0x1e783000 0x1000>;
> +                          reg-shift = <2>;
> +                          interrupts = <9>;
> +                          clocks = <&syscon ASPEED_CLK_GATE_UART1CLK>;
> +                          dma-channel = <0>;
> +                          no-loopback-test;
> +                          pinctrl-names = "default";
> +                          pinctrl-0 = <&pinctrl_txd1_default &pinctrl_rxd1_default>;
> +                          status = "disabled";
> +                       };
> --
> 2.17.1
>
