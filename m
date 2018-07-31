From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/6] dt-bindings: interrupt-controller: RISC-V local
 interrupt controller docs
Date: Tue, 31 Jul 2018 16:37:14 -0600
Message-ID: <20180731223714.GA12168@rob-hp-laptop>
References: <20180725093649.32332-1-hch@lst.de>
 <20180725093649.32332-5-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180725093649.32332-5-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: tglx@linutronix.de, palmer@sifive.com, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 25, 2018 at 11:36:47AM +0200, Christoph Hellwig wrote:
> From: Palmer Dabbelt <palmer@dabbelt.com>
> 
> This patch adds documentation on the RISC-V local interrupt controller,
> which is a per-hart interrupt controller that manages all interrupts
> entering a RISC-V hart.  This interrupt controller is present on all
> RISC-V systems.
> 
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  .../interrupt-controller/riscv,cpu-intc.txt   | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt

My questions and comments on the prior version from Palmer remain.

> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
> new file mode 100644
> index 000000000000..61900e2e3868
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
> @@ -0,0 +1,41 @@
> +RISC-V Hart-Level Interrupt Controller (HLIC)
> +---------------------------------------------
> +
> +RISC-V cores include Control Status Registers (CSRs) which are local to each
> +hart and can be read or written by software. Some of these CSRs are used to
> +control local interrupts connected to the core.  Every interrupt is ultimately
> +routed through a hart's HLIC before it interrupts that hart.
> +
> +The RISC-V supervisor ISA manual specifies three interrupt sources that are
> +attached to every HLIC: software interrupts, the timer interrupt, and external
> +interrupts.  Software interrupts are used to send IPIs between cores.  The
> +timer interrupt comes from an architecturally mandated real-time timer that is
> +controller via SBI calls and CSR reads.  External interrupts connect all other
> +device interrupts to the HLIC, which are routed via the platform-level
> +interrupt controller (PLIC).
> +
> +All RISC-V systems that conform to the supervisor ISA specification are
> +required to have a HLIC with these three interrupt sources present.  Since the
> +interrupt map is defined by the ISA it's not listed in the HLIC's device tree
> +entry, though external interrupt controllers (like the PLIC, for example) will
> +need to define how their interrupts map to the relevant HLICs.
> +
> +Required properties:
> +- compatible : "riscv,cpu-intc"
> +- #interrupt-cells : should be <1>
> +- interrupt-controller : Identifies the node as an interrupt controller
> +
> +Furthermore, this interrupt-controller MUST be embedded inside the cpu
> +definition of the hart whose CSRs control these local interrupts.
> +
> +An example device tree entry for a HLIC is show below.
> +
> +	cpu1: cpu@1 {
> +		compatible = "riscv";
> +		...
> +		cpu1-intc: interrupt-controller {
> +			#interrupt-cells = <1>;
> +			compatible = "riscv,cpu-intc";
> +			interrupt-controller;
> +		};
> +	};
> -- 
> 2.18.0
> 
