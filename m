From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC 1/2] dt-bindings: topology: Add RISC-V cpu topology.
Date: Fri, 2 Nov 2018 08:09:39 -0500
Message-ID: <CAL_Jsq+wProNynprMjQnrz1jmbZT9TmmA-_=vPUxCEED_8xONg@mail.gmail.com>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com> <1541113468-22097-2-git-send-email-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541113468-22097-2-git-send-email-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>, Anup Patel <anup@brainfault.org>, Christoph Hellwig <hch@infradead.org>, Damien.LeMoal@wdc.com, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, alankao@andestech.com, Zong Li <zong@andestech.com>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 1, 2018 at 6:04 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> Define a RISC-V cpu topology. This is based on cpu-map in ARM world.
> But it doesn't need a separate thread node for defining SMT systems.
> Multiple cpu phandle properties can be parsed to identify the sibling
> hardware threads. Moreover, we do not have cluster concept in RISC-V.
> So package is a better word choice than cluster for RISC-V.

There was a proposal to add package info for ARM recently. Not sure
what happened to that, but we don't need 2 different ways.

There's never going to be clusters for RISC-V? What prevents that?
Seems shortsighted to me.

>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  .../devicetree/bindings/riscv/topology.txt         | 154 +++++++++++++++++++++
>  1 file changed, 154 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/topology.txt
>
> diff --git a/Documentation/devicetree/bindings/riscv/topology.txt b/Documentation/devicetree/bindings/riscv/topology.txt
> new file mode 100644
> index 00000000..96039ed3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/topology.txt
> @@ -0,0 +1,154 @@
> +===========================================
> +RISC-V cpu topology binding description
> +===========================================
> +
> +===========================================
> +1 - Introduction
> +===========================================
> +
> +In a RISC-V system, the hierarchy of CPUs can be defined through following nodes that
> +are used to describe the layout of physical CPUs in the system:
> +
> +- packages
> +- core
> +
> +The cpu nodes (bindings defined in [1]) represent the devices that
> +correspond to physical CPUs and are to be mapped to the hierarchy levels.
> +Simultaneous multi-threading (SMT) systems can also represent their topology
> +by defining multiple cpu phandles inside core node. The details are explained
> +in paragraph 3.

I don't see a reason to do this differently than ARM. That said, I
don't think the thread part is in use on ARM, so it could possibly be
changed.

> +
> +The remainder of this document provides the topology bindings for ARM, based

for ARM?

> +on the Devicetree Specification, available from:
> +
> +https://www.devicetree.org/specifications/
> +
> +If not stated otherwise, whenever a reference to a cpu node phandle is made its
> +value must point to a cpu node compliant with the cpu node bindings as
> +documented in [1].
> +A topology description containing phandles to cpu nodes that are not compliant
> +with bindings standardized in [1] is therefore considered invalid.
> +
> +This cpu topology binding description is mostly based on the topology defined
> +in ARM [2].
> +===========================================
> +2 - cpu-topology node

cpu-map. Why change this?

What I would like to see is the ARM topology binding reworked to be
common or some good reasons why it doesn't work for RISC-V as-is.

Rob
