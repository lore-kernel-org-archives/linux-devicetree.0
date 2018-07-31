From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 6/6] dt-bindings: interrupt-controller: RISC-V PLIC
 documentation
Date: Tue, 31 Jul 2018 16:46:30 -0600
Message-ID: <20180731224630.GB12168@rob-hp-laptop>
References: <20180725093649.32332-1-hch@lst.de>
 <20180725093649.32332-7-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180725093649.32332-7-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: tglx@linutronix.de, palmer@sifive.com, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 25, 2018 at 11:36:49AM +0200, Christoph Hellwig wrote:
> From: Palmer Dabbelt <palmer@dabbelt.com>
> 
> This patch adds documentation for the platform-level interrupt
> controller (PLIC) found in all RISC-V systems.  This interrupt
> controller routes interrupts from all the devices in the system to each
> hart-local interrupt controller.
> 
> Note: the DTS bindings for the PLIC aren't set in stone yet, as we might
> want to change how we're specifying holes in the hart list.
> 
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  .../interrupt-controller/riscv,plic0.txt      | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,plic0.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,plic0.txt b/Documentation/devicetree/bindings/interrupt-controller/riscv,plic0.txt
> new file mode 100644
> index 000000000000..99cd359dbd43
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,plic0.txt
> @@ -0,0 +1,55 @@
> +RISC-V Platform-Level Interrupt Controller (PLIC)
> +-------------------------------------------------
> +
> +The RISC-V supervisor ISA specification allows for the presence of a
> +platform-level interrupt controller (PLIC).   The PLIC connects all external
> +interrupts in the system to all hart contexts in the system, via the external
> +interrupt source in each hart's hart-local interrupt controller (HLIC).  A hart
> +context is a privilege mode in a hardware execution thread.  For example, in
> +an 4 core system with 2-way SMT, you have 8 harts and probably at least two
> +privilege modes per hart; machine mode and supervisor mode.
> +
> +Each interrupt can be enabled on per-context basis. Any context can claim
> +a pending enabled interrupt and then release it once it has been handled.
> +
> +Each interrupt has a configurable priority. Higher priority interrupts are
> +serviced firs. Each context can specify a priority threshold. Interrupts
> +with priority below this threshold will not cause the PLIC to raise its
> +interrupt line leading to the context.
> +
> +While the PLIC supports both edge-triggered and level-triggered interrupts,
> +interrupt handlers are oblivious to this distinction and therefor it is not
> +specific in the PLIC device-tree binding.
> +
> +While the RISC-V ISA doesn't specify a memory layout for the PLIC, the
> +"riscv,plic0" device is a concrete implementation of the PLIC that contains a
> +specific memory layout.  More details about the memory layout of the
> +"riscv,plic0" device can be found as a comment in the device driver, or as part
> +of the SiFive U5 Coreplex Series Manual (page 22 of the PDF of version 1.0)
> +<https://www.sifive.com/documentation/coreplex/u5-coreplex-series-manual/>
> +
> +Required properties:
> +- compatible : "riscv,plic0"

Perhaps this should be 'sifive,plic0'

Normally this would have an SoC specific compatible too. Sometimes we 
can get away without, but it doesn't seem like the PLIC is very tightly 
specified nor has common implementations.

> +- #address-cells : should be <0>
> +- #interrupt-cells : should be <1>
> +- interrupt-controller : Identifies the node as an interrupt controller
> +- reg : Should contain 1 register range (address and length)
> +- interrupts-extended : Specifies which contexts are connected to the PLIC,
> +  with "-1" specifying that a context is not present.
> +
> +Example:
> +
> +	plic: interrupt-controller@c000000 {
> +		#address-cells = <0>;
> +		#interrupt-cells = <1>;
> +		compatible = "riscv,plic0";
> +		interrupt-controller;
> +		interrupts-extended = <
> +			&cpu0-intc 11
> +			&cpu1-intc 11 &cpu1-intc 9
> +			&cpu2-intc 11 &cpu2-intc 9
> +			&cpu3-intc 11 &cpu3-intc 9
> +			&cpu4-intc 11 &cpu4-intc 9>;
> +		reg = <0xc000000 0x4000000>;
> +		riscv,ndev = <10>;

Not documented.

> +	};
> -- 
> 2.18.0
> 
