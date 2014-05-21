From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH RESEND 2/2] Documentation: add Broadcom STB Level-2
 interrupt controller binding
Date: Tue, 20 May 2014 21:30:27 -0400
Message-ID: <20140521013027.GD8664@titan.lakedaemon.net>
References: <1400613229-19049-1-git-send-email-f.fainelli@gmail.com>
 <1400613229-19049-3-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1400613229-19049-3-git-send-email-f.fainelli@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: arm@kernel.org, Brian Norris <computersforpeace@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, linux-arm-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, May 20, 2014 at 12:13:49PM -0700, Florian Fainelli wrote:
> This patch adds the Device Tree binding document for the Broadcom
> Set-top-box Level 2 interrupt controller hardware.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  .../bindings/interrupt-controller/brcm,l2-intc.txt | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt
> new file mode 100644
> index 000000000000..448273a30a11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt
> @@ -0,0 +1,29 @@
> +Broadcom Generic Level 2 Interrupt Controller
> +
> +Required properties:
> +
> +- compatible: should be "brcm,l2-intc"
> +- reg: specifies the base physical address and size of the registers
> +- interrupt-controller: identifies the node as an interrupt controller
> +- #interrupt-cells: specifies the number of cells needed to encode an
> +  interrupt source. Should be 1.
> +- interrupt-parent: specifies the phandle to the parent interrupt controller
> +  this controller is cacaded from
> +- interrupts: specifies the interrupt line in the interrupt-parent irq space
> +  to be used for cascading
> +
> +Optional properties:
> +
> +- brcm,irq-can-wake: If present, this means the L2 controller can be used as a
> +  wakeup source for system suspend/resume.

Do we need a vendor-specific property here?  I'd much prefer to see a
generic implementation.

thx,

Jason.
