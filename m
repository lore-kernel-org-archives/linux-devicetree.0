From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH] dt-bindings: riscv,cpu-intc: Cleanups from a missed
 review
Date: Mon, 20 Aug 2018 16:10:04 -0700
Message-ID: <51924de4-4a16-07a0-f499-753e0df49678@wdc.com>
References: <20180820230011.25368-1-palmer@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180820230011.25368-1-palmer@sifive.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@sifive.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "jason@lakedaemon.net" <jason@lakedaemon.net>, Rob Herring <robh@kernel.org>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Karsten Merker <merker@debian.org>, "tglx@linutronix.de" <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On 8/20/18 4:01 PM, Palmer Dabbelt wrote:
> I managed to miss one of Rob's code reviews on the mailing list
> <http://lists.infradead.org/pipermail/linux-riscv/2018-August/001139.html>.
> The patch has already been merged, so I'm submitting a fixup.
> 
> Sorry!
> 
> Fixes: b67bc7cb4088 ("dt-bindings: interrupt-controller: RISC-V local interrupt controller")
> Cc: Rob Herring <robh@kernel.org>
> Cc: Christoph Hellwig <hch@infradead.org>
> Cc: Karsten Merker <merker@debian.org>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>   .../bindings/interrupt-controller/riscv,cpu-intc.txt       | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
> index b0a8af51c388..265b223cd978 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
> @@ -11,7 +11,7 @@ The RISC-V supervisor ISA manual specifies three interrupt sources that are
>   attached to every HLIC: software interrupts, the timer interrupt, and external
>   interrupts.  Software interrupts are used to send IPIs between cores.  The
>   timer interrupt comes from an architecturally mandated real-time timer that is
> -controller via Supervisor Binary Interface (SBI) calls and CSR reads.  External
> +controlled via Supervisor Binary Interface (SBI) calls and CSR reads.  External
>   interrupts connect all other device interrupts to the HLIC, which are routed
>   via the platform-level interrupt controller (PLIC).
>   
> @@ -25,7 +25,15 @@ in the system.
>   
>   Required properties:
>   - compatible : "riscv,cpu-intc"

Since this is a fix up patch, we should update the compatible string 
with the sifive specific one as well. no?

Regards,
Atish
> -- #interrupt-cells : should be <1>
> +- #interrupt-cells : should be <1>.  The interrupt sources are defined by the
> +  RISC-V supervisor ISA manual, with only the following three interrupts being
> +  defined for supervisor mode:
> +    - Source 1 is the supervisor software interrupt, which can be sent by an SBI
> +      call and is reserved for use by software.
> +    - Source 5 is the supervisor timer interrupt, which can be configured by
> +      SBI calls and implements a one-shot timer.
> +    - Source 9 is the supervisor external interrupt, which chains to all other
> +      device interrupts.
>   - interrupt-controller : Identifies the node as an interrupt controller
>   
>   Furthermore, this interrupt-controller MUST be embedded inside the cpu
> @@ -38,7 +46,7 @@ An example device tree entry for a HLIC is show below.
>   		...
>   		cpu1-intc: interrupt-controller {
>   			#interrupt-cells = <1>;
> -			compatible = "riscv,cpu-intc", "sifive,fu540-c000-cpu-intc";
> +			compatible = "sifive,fu540-c000-cpu-intc", "riscv,cpu-intc";
>   			interrupt-controller;
>   		};
>   	};
> 
