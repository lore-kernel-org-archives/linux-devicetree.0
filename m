From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 5/6] dt-bindings: mailbox: Add support for secure proxy
 threads
Date: Tue, 26 Jun 2018 15:09:32 -0600
Message-ID: <20180626210932.GA16131@rob-hp-laptop>
References: <20180619194337.31522-1-nm@ti.com>
 <20180619194337.31522-6-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180619194337.31522-6-nm@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 19, 2018 at 02:43:36PM -0500, Nishanth Menon wrote:
> Secure Proxy is another communication scheme in Texas Instrument's
> devices intended to provide an unique communication path from various
> processors in the System on Chip(SoC) to a central System Controller.
> 
> Secure proxy is, in effect, an evolution of current generation Message
> Manager hardware block found in K2G devices. However the following
> changes have taken place:
> 
> Secure Proxy instance exposes "threads" or "proxies" which is
> primary representation of "a" communication channel. Each thread is
> preconfigured by System controller configuration based on SoC usage
> requirements. Secure proxy by itself represents a single "queue" of
> communication but allows the proxies to be independently operated.
> 
> Each Secure proxy thread can uniquely have their own error and threshold
> interrupts allowing for more fine control of IRQ handling.
> 
> Provide an hardware description of the same for device tree
> representation.
> 
> See AM65x Technical Reference Manual (SPRUID7, April 2018)
> for further details: http://www.ti.com/lit/pdf/spruid7
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> 
> Changes since RFC:
>  * DT binding have been seperated into it's own file following Rob's feedback.
> 
> RFC: https://patchwork.kernel.org/patch/10447695/
> 
>  .../bindings/mailbox/ti,secure-proxy.txt           | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/ti,secure-proxy.txt
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.txt b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.txt
> new file mode 100644
> index 000000000000..ea2ccc607b35
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.txt
> @@ -0,0 +1,50 @@
> +Texas Instruments' Secure Proxy
> +========================================
> +
> +The Texas Instruments' secure proxy is a mailbox controller that has
> +configurable queues selectable at SoC(System on Chip) integration. The
> +Message manager is broken up into different address regions that are
> +called "threads" or "proxies" - each instance is unidirectional and is
> +instantiated at SoC integration level by system controller to indicate
> +receive or transmit path.
> +
> +Message Manager Device Node:
> +===========================
> +Required properties:
> +--------------------
> +- compatible:		Shall be "ti,am654-secure-proxy"
> +- reg-names 		target_data - Map the proxy data region
> +			rt - Map the realtime status region
> +			scfg - Map the configuration region
> +- reg:			Contains the register map per reg-names.
> +- #mbox-cells		Shall be 1 and shall refer to the transfer path
> +			called thread.
> +- interrupt-names:	Contains interrupt names matching the rx transfer path
> +			for a given SoC. Receive interrupts shall be of the
> +			format: "rx_<PID>".
> +- interrupts:		Contains the interrupt information corresponding to
> +			interrupt-names property.
> +
> +Example(AM654):
> +------------
> +
> +	secure_proxy: secure_proxy@32c00000 {

mailbox@...

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
