From: Nikolay Borisov <nborisov@suse.com>
Subject: Re: [PATCH 8/9] dt-bindings: interrupt-controller: RISC-V PLIC
 documentation
Date: Thu, 2 Aug 2018 10:24:26 +0300
Message-ID: <8cbdbd76-c152-f7d6-9f65-96b433a3f4ae@suse.com>
References: <20180726143723.16585-1-hch@lst.de>
 <20180726143723.16585-9-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726143723.16585-9-hch@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, tglx@linutronix.de, palmer@sifive.com, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: anup@brainfault.org, atish.patra@wdc.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
List-Id: devicetree@vger.kernel.org



On 26.07.2018 17:37, Christoph Hellwig wrote:
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
                ^^ missing 't'
> +with priority below this threshold will not cause the PLIC to raise its
> +interrupt line leading to the context.
> +
> +While the PLIC supports both edge-triggered and level-triggered interrupts,
> +interrupt handlers are oblivious to this distinction and therefor it is not
                                                                    ^^
missing 'e'
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
> +	};
> 
