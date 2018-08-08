From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 6/8] dt-bindings: interrupt-controller: RISC-V PLIC documentation
Date: Wed, 8 Aug 2018 08:29:50 -0600
Message-ID: <CAL_JsqKKCPhb1um_+68ya0ng_v2tSb5O+-8RQPqx7Od3sJ4FuA@mail.gmail.com>
References: <20180804082319.5711-1-hch@lst.de> <20180804082319.5711-7-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180804082319.5711-7-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@sifive.com>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Anup Patel <anup@brainfault.org>, atish.patra@wdc.com, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 4, 2018 at 2:23 AM Christoph Hellwig <hch@lst.de> wrote:
>
> From: Palmer Dabbelt <palmer@dabbelt.com>

Version numbers on the individual patches would be nice...

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
>  .../interrupt-controller/sifive,plic0.txt     | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sifive,plic0.txt
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic0.txt b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic0.txt
> new file mode 100644
> index 000000000000..bbfa61cf8d3f
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
> +Each interrupt can be enabled on per-context basis.  Any context can claim
> +a pending enabled interrupt and then release it once it has been handled.
> +
> +Each interrupt has a configurable priority.  Higher priority interrupts are
> +serviced first.  Each context can specify a priority threshold. Interrupts
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
> +- compatible : "sifive,plic0".
> +- #address-cells : should be <0>.
> +- #interrupt-cells : should be <1>.
> +- interrupt-controller : Identifies the node as an interrupt controller.
> +- reg : Should contain 1 register range (address and length).
> +- interrupts-extended : Specifies which contexts are connected to the PLIC,
> +  with "-1" specifying that a context is not present.  The nodes pointed
> +  to should be "riscv" HART nodes, or eventually be parented by such nodes.
> +- riscv,ndev: Specifies how many external interrupts are supported by
> +  this controller.
> +
> +Example:
> +
> +       plic: interrupt-controller@c000000 {
> +               #address-cells = <0>;
> +               #interrupt-cells = <1>;
> +               compatible = "riscv,plic0";
> +               interrupt-controller;
> +               interrupts-extended = <
> +                       &cpu0-intc 11
> +                       &cpu1-intc 11 &cpu1-intc 9
> +                       &cpu2-intc 11 &cpu2-intc 9
> +                       &cpu3-intc 11 &cpu3-intc 9
> +                       &cpu4-intc 11 &cpu4-intc 9>;

I'm confused why this is still here if you are dropping the cpu intc binding?

I also noticed the cpu binding refers to "riscv,cpu-intc" as well.
That needs to be fixed too if there's a change.

Rob
