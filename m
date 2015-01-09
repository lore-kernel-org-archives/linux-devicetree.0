From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 4/8] irqchip: devicetree: document Conexant Digicolor
 irq binding
Date: Fri, 09 Jan 2015 18:12:44 +0300
Message-ID: <54AFEFEC.5000300@cogentembedded.com>
References: <cover.1420744368.git.baruch@tkos.co.il> <3bdf8fa0bf971b4881024e72312c3c9d29298e79.1420744369.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3bdf8fa0bf971b4881024e72312c3c9d29298e79.1420744369.git.baruch@tkos.co.il>
Sender: linux-kernel-owner@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 1/8/2015 10:40 PM, Baruch Siach wrote:

> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>   .../bindings/interrupt-controller/digicolor-ic.txt   | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt
> new file mode 100644
> index 000000000000..fdf9a4c59bf3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt
> @@ -0,0 +1,20 @@
> +Conexant Digicolor Interrupt Controller
> +
> +Required properties:
> +
> +- compatible : should be "cnxt,cx92755-ic"
> +- reg : Specifies base physical address and size of the MISC area, that is
> +  where the interrupt controller registers are located
> +- interrupt-controller : Identifies the node as an interrupt controller
> +- #interrupt-cells : Specifies the number of cells needed to encode an
> +  interrupt source. The value shall be 1.
> +
> +Example:
> +
> +	intc: intc@f0000000 {

    The node name should be "interrupt-controller@f0000000", according to the 
ePAPR standard, section 2.2.2.

[...]

WBR, Sergei
