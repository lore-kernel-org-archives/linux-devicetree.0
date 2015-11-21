From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 09/14] DEVICETREE: Add bindings for PIC32 usart driver
Date: Sat, 21 Nov 2015 18:20:53 +0300
Message-ID: <56508BD5.5050003@cogentembedded.com>
References: <1448065205-15762-1-git-send-email-joshua.henderson@microchip.com>
 <1448065205-15762-10-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448065205-15762-10-git-send-email-joshua.henderson@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joshua Henderson <joshua.henderson@microchip.com>, linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, Andrei Pistirica <andrei.pistirica@microchip.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello.

On 11/21/2015 3:17 AM, Joshua Henderson wrote:

> From: Andrei Pistirica <andrei.pistirica@microchip.com>
>
> Document the devicetree bindings for the USART peripheral found on
> Microchip PIC32 class devices.
>
> Signed-off-by: Andrei Pistirica <andrei.pistirica@microchip.com>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> ---
>   .../bindings/serial/microchip,pic32-usart.txt      |   29 ++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/serial/microchip,pic32-usart.txt
>
> diff --git a/Documentation/devicetree/bindings/serial/microchip,pic32-usart.txt b/Documentation/devicetree/bindings/serial/microchip,pic32-usart.txt
> new file mode 100644
> index 0000000..c87321c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/microchip,pic32-usart.txt
> @@ -0,0 +1,29 @@
> +* Microchip Universal Synchronous Asynchronous Receiver/Transmitter (USART)
> +
> +Required properties:
> +- compatible: Should be "microchip,pic32-usart"
> +- reg: Should contain registers location and length
> +- interrupts: Should contain interrupt
> +- pinctrl: Should contain pinctrl for TX/RX/RTS/CTS

    No such prop in the example.

> +
> +Optional properties:
> +- microchip,uart-has-rtscts : Indicate the uart has hardware flow control
> +- rts-gpios: RTS pin for USP-based UART if microchip,uart-has-rtscts
> +- cts-gpios: CTS pin for USP-based UART if microchip,uart-has-rtscts
> +
> +Example:
> +	usart0: serial@1f822000 {
> +		compatible = "microchip,pic32-usart";
> +		reg = <0x1f822000 0x50>;
> +		interrupts = <UART1_FAULT DEFAULT_INT_PRI IRQ_TYPE_NONE>,
> +			     <UART1_RECEIVE_DONE DEFAULT_INT_PRI IRQ_TYPE_NONE>,
> +			     <UART1_TRANSFER_DONE DEFAULT_INT_PRI IRQ_TYPE_NONE>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <
> +			&pinctrl_uart1
> +			&pinctrl_uart1_cts
> +			&pinctrl_uart1_rts>;

    The above 2 props are undocumented.

[...]

MBR, Sergei
