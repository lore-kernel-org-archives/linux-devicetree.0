From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 03/11] dt-bindings: interrupt-controller: RISC-V PLIC
 documentation
Date: Thu, 2 Aug 2018 15:08:15 -0700
Message-ID: <0093fadc-a150-3745-e73d-e579bfdfabfb@wdc.com>
References: <20180802115008.4031-1-hch@lst.de>
 <20180802115008.4031-4-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180802115008.4031-4-hch@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, "tglx@linutronix.de" <tglx@linutronix.de>, "palmer@sifive.com" <palmer@sifive.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "anup@brainfault.org" <anup@brainfault.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "shorne@gmail.com" <shorne@gmail.com>
List-Id: devicetree@vger.kernel.org

On 8/2/18 4:50 AM, Christoph Hellwig wrote:
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
> [hch: various fixes and updates]
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   .../interrupt-controller/sifive,plic0.txt     | 57 +++++++++++++++++++
>   1 file changed, 57 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sifive,plic0.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic0.txt b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic0.txt
> new file mode 100644
> index 000000000000..c756cd208a93
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic0.txt
> @@ -0,0 +1,57 @@
> +SiFive Platform-Level Interrupt Controller (PLIC)
> +-------------------------------------------------
> +
> +SiFive SOCs include an implementation of the Platform-Level Interrupt Controller
> +(PLIC) high-level specification in the RISC-V Privileged Architecture
> +specification.  The PLIC connects all external interrupts in the system to all
> +hart contexts in the system, via the external interrupt source in each hart.
> +
> +A hart context is a privilege mode in a hardware execution thread.  For example,
> +in an 4 core system with 2-way SMT, you have 8 harts and probably at least two
> +privilege modes per hart; machine mode and supervisor mode.
> +
> +Each interrupt can be enabled on per-context basis. Any context can claim
> +a pending enabled interrupt and then release it once it has been handled.
> +
> +Each interrupt has a configurable priority. Higher priority interrupts are
> +serviced first. Each context can specify a priority threshold. Interrupts
> +with priority below this threshold will not cause the PLIC to raise its
> +interrupt line leading to the context.
> +
> +While the PLIC supports both edge-triggered and level-triggered interrupts,
> +interrupt handlers are oblivious to this distinction and therefore it is not
> +specified in the PLIC device-tree binding.
> +
> +While the RISC-V ISA doesn't specify a memory layout for the PLIC, the
> +"sifive,plic0" device is a concrete implementation of the PLIC that contains a
> +specific memory layout, which is documented in chapter 8 of the SiFive U5
> +Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf>.
> +
> +Required properties:
> +- compatible : "sifive,plic0"
> +- #address-cells : should be <0>
> +- #interrupt-cells : should be <1>
> +- interrupt-controller : Identifies the node as an interrupt controller
> +- reg : Should contain 1 register range (address and length)

The one in the real device tree has two entries.
reg = <0x00000000 0x0c000000 0x00000000 0x04000000>;

Is it intentional or just incorrect entry left over from earlier days?

Regards,
Atish
> +- interrupts-extended : Specifies which contexts are connected to the PLIC,
> +  with "-1" specifying that a context is not present.  The nodes pointed
> +  to should be "riscv" HART nodes, or eventually be parented by such nodes.
> +- riscv,ndev: Specifies how many external interrupts are supported by
> +  this controller.
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
