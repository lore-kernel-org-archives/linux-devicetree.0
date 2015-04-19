From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 03/12] devicetree: Add bindings for the ATH79 DDR controllers
Date: Sun, 19 Apr 2015 16:52:00 +0300
Message-ID: <5533B300.2050805@cogentembedded.com>
References: <1429448288-20742-1-git-send-email-albeu@free.fr> <1429448288-20742-4-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429448288-20742-4-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Alban Bedel <albeu@free.fr>, linux-mips@linux-mips.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, Gabor Juhos <juhosg@openwrt.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello.

On 4/19/2015 3:57 PM, Alban Bedel wrote:

> The DDR controller of the ARxxx and AR9xxx famillies provides an
> interface to flush the FIFO between various devices and the DDR.
> This is mainly used by the IRQ controller to flush the FIFO before
> running the interrupt handler of such devices.

> Signed-off-by: Alban Bedel <albeu@free.fr>
> ---
> v2: * Fix the node names to respect ePAPR

    I don't see where you did this.

> ---
>   .../memory-controllers/ath79-ddr-controller.txt    | 35 ++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/memory-controllers/ath79-ddr-controller.txt
>
> diff --git a/Documentation/devicetree/bindings/memory-controllers/ath79-ddr-controller.txt b/Documentation/devicetree/bindings/memory-controllers/ath79-ddr-controller.txt
> new file mode 100644
> index 0000000..5541eed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/ath79-ddr-controller.txt
> @@ -0,0 +1,35 @@
> +Binding for Qualcomm  Atheros AR7xxx/AR9xxx DDR controller
> +
> +The DDR controller of the ARxxx and AR9xxx famillies provides an interface

    Families.

> +to flush the FIFO between various devices and the DDR. This is mainly used
> +by the IRQ controller to flush the FIFO before running the interrupt handler
> +of such devices.
> +
> +Required properties:
> +
> +- compatible: has to be "qca,<soc-type>-ddr-controller",
> +  "qca,[ar7100|ar7240]-ddr-controller" as fallback.
> +  On SoC with PCI support "qca,ar7100-ddr-controller" should be used as
> +  fallback, otherwise "qca,ar7240-ddr-controller" should be used.
> +- reg: Base address and size of the controllers memory area
> +- #qca,ddr-wb-channel-cells: has to be 1, the index of the write buffer
> +  channel
> +
> +Example:
> +
> +	ddr_ctrl: ddr-controller@18000000 {

    Should still be "memory-controller@18000000".

> +		compatible = "qca,ar9132-ddr-controller",
> +				"qca,ar7240-ddr-controller";
> +		reg = <0x18000000 0x100>;
> +
> +		#qca,ddr-wb-channel-cells = <1>;
> +	};
> +
> +	...
> +
> +	cpuintc@0 {

    "interrupt-controller" here?

> +		...
> +		qca,ddr-wb-channel-interrupts = <2>, <3>, <4>, <5>;
> +		qca,ddr-wb-channels = <&ddr_ctrl 3>, <&ddr_ctrl 2>,
> +					<&ddr_ctrl 0>, <&ddr_ctrl 1>;
> +	};

WBR, Sergei
