From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/2] dt/bindings: Add bindings for the PIC32 SPI
 peripheral
Date: Tue, 2 Feb 2016 14:11:39 +0300
Message-ID: <56B08EEB.3050808@cogentembedded.com>
References: <1454366701-10847-1-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454366701-10847-1-git-send-email-joshua.henderson@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joshua Henderson <joshua.henderson@microchip.com>, linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, Purna Chandra Mandal <purna.mandal@microchip.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello.

On 2/2/2016 1:44 AM, Joshua Henderson wrote:

> From: Purna Chandra Mandal <purna.mandal@microchip.com>
>
> Document the devicetree bindings for the SPI peripheral found
> on Microchip PIC32 class devices.
>
> Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> ---
>   .../bindings/spi/microchip,spi-pic32.txt           |   44 ++++++++++++++++++++
>   1 file changed, 44 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt
>
> diff --git a/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt b/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt
> new file mode 100644
> index 0000000..a555618
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt
> @@ -0,0 +1,44 @@
> +* Microchip PIC32 SPI device
> +
> +Required properties:
> +- compatible: Should be "microchip,pic32mzda-spi".
> +- reg: Address and length of the register set for the device
> +- interrupts: Should contain all three spi interrupts in sequence
> +              of <fault-irq>, <receive-irq>, <transmit-irq>.
> +- interrupt-names: Should be "fault","rx","tx" in order.

    Please insert spaces after commas.

> +- clocks: phandles of baud generation clocks. Maximum two possible clocks

    Baud in the SPI context?

> +	  can be provided (&PBCLK2, &REFCLKO1).

    Please align.

> +          See: Documentation/devicetree/bindings/clock/clock-bindings.txt
> +- clock-names: Should be "mck0","mck1".

    Please insert space after comma.

[...]
> +Example:
> +
> +	spi1:spi@0x1f821000 {

     Please insert spaces after colon.

[...]

MBR, Sergei
