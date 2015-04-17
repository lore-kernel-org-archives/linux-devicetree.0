From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 04/14] devicetree: Add bindings for the ATH79 interrupt
 controllers
Date: Fri, 17 Apr 2015 19:17:27 +0300
Message-ID: <55313217.1020604@cogentembedded.com>
References: <1429280669-2986-1-git-send-email-albeu@free.fr> <1429280669-2986-5-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429280669-2986-5-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Alban Bedel <albeu@free.fr>, linux-mips@linux-mips.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello.

On 04/17/2015 05:24 PM, Alban Bedel wrote:

> Signed-off-by: Alban Bedel <albeu@free.fr>
> ---
>   .../interrupt-controller/qca,ath79-cpu-intc.txt    | 45 ++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qca,ath79-cpu-intc.txt

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-cpu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-cpu-intc.txt
> new file mode 100644
> index 0000000..1548512
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-cpu-intc.txt
> @@ -0,0 +1,45 @@
> +Binding for Qualcomm Atheros AR7xxx/AR9XXX CPU interrupt controller
> +
> +On most SoC the IRQ controller need to flush the DDR FIFO before running
> +the interrupt handler of some devices. This is configured using the
> +qca,ddr-wb-channels and qca,ddr-wb-channel-interrupts properties.
> +
> +Required Properties:
> +
> +- compatible: has to be "qca,<soctype>-cpu-intc", "qca,ar7100-cpu-intc"
> +  as fallback
> +- interrupt-controller : Identifies the node as an interrupt controller
> +- #interrupt-cells : Specifies the number of cells needed to encode interrupt
> +		     source, should be 1 for intc
> +
> +Please refer to interrupts.txt in this directory for details of the common
> +Interrupt Controllers bindings used by client devices.
> +
> +Optional Properties:
> +
> +- qca,ddr-wb-channel-interrupts: List of the interrupts needing a write
> +  buffer flush
> +- qca,ddr-wb-channels: List of phandles to the write buffer channels for
> +  each interrupt. If qca,ddr-wb-channel-interrupts is not present the interrupt
> +  default to the entry's index.
> +
> +Example:
> +
> +	cpuintc@0 {

    @0 without the "reg" property?
    And if this is an interrupt controller, the name should be 
"interrupt-controller", not "cpuintc", according to the ePAPR standard.

> +		compatible = "qca,ar9132-cpu-intc", "qca,ar7100-cpu-intc";
> +
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +
> +		qca,ddr-wb-channel-interrupts = <2>, <3>, <4>, <5>;
> +		qca,ddr-wb-channels = <&ddr_ctrl 3>, <&ddr_ctrl 2>,
> +					<&ddr_ctrl 0>, <&ddr_ctrl 1>;
> +	};
> +
> +	...
> +
> +	ddr_ctrl: ddr-controller@18000000 {

    ePAPR standardized "memory-controller" node name in this case.

WBR, Sergei
