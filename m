From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v9 03/12] dt-bindings: RISC-V CPU Bindings
Date: Thu, 5 Oct 2017 11:16:33 +0100
Message-ID: <20171005101633.GA4929@leverpostej>
References: <20170927015638.19443-1-palmer@dabbelt.com>
 <20170927015638.19443-4-palmer@dabbelt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170927015638.19443-4-palmer@dabbelt.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Arnd Bergmann <arnd@arndb.de>, sfr@canb.auug.org.au, Olof Johansson <olof@lixom.net>, linux-kernel@vger.kernel.org, patches@groups.riscv.org, robh+dt@kernel.org, albert@sifive.com, yamada.masahiro@socionext.com, mmarek@suse.com, will.deacon@arm.com, peterz@infradead.org, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Palmer,

Sorry for the delay in getting round to this.

On Tue, Sep 26, 2017 at 06:56:29PM -0700, Palmer Dabbelt wrote:
> This patch adds device tree bindings for RISC-V CPUs, patterned after
> the ARM device tree CPU bindings.

[...]

> +- cpu node
> +
> +        Description: Describes a hart context
> +
> +        PROPERTIES
> +
> +        - device_type
> +                Usage: required
> +                Value type: <string>
> +                Definition: must be "cpu"
> +        - reg
> +                Usage: required
> +                Value type: <u32>
> +                Definition: The hart ID of this CPU node
> +        - compatible:
> +                Usage: required
> +                Value type: <stringlist>
> +                Definition: must contain "riscv", may contain one of
> +                            "sifive,rocket0"

It might make sense to have "riscv,cpu" as your genric RISC-V CPU
compatible string, to avoid ambiguity with the vendor-prefix.

> +        - mmu-type:
> +                Usage: optional
> +                Value type: <string>
> +                Definition: Specifies the CPU's MMU type.  Possible values are
> +                            "riscv,sv32"
> +                            "riscv,sv39"
> +                            "riscv,sv48"

I would *strongly* recommend that from day one, you determine the SMP
bringup mechanism via an enable-method property, and document the
contract with FW/bootloader somewhere in the kernel tree.

For arm64 we started by documenting our spin-table in
Documentation/arm64/booting.txt, and later added PSCI support.

Using an explicit enable-method property from day one makes it easier to
extend thigns without ambiguity. e.g. an old kernel that doesn't know of
some new enable-method can just give up on SMP and continue as UP,
rather than doing something wrong for that system.

Generally, making things explicit in the DT will make support /
extension easier, and help to avoid painful-to-debug bugs.

> +        - riscv,isa:
> +                Usage: required
> +                Value type: <string>
> +                Definition: Contains the RISC-V ISA string of this hart.  These
> +                            ISA strings are defined by the RISC-V ISA manual.
> +

IIUC from the example, this describes a number of ISA extenstions in a
single string. It might make mroe sense to have separate flags for each
extension. will be easier for the kernel to parse as new extensions
are added, and minimized ambiguity / typo problems.

[...]

> +Example: Spike ISA Simulator with 1 Hart
> +----------------------------------------
> +
> +This device tree matches the Spike ISA golden model as run with `spike -p1`.
> +
> +        cpus {
> +                cpu@0 {
> +                        device_type = "cpu";
> +                        reg = <0x00000000>;
> +                        status = "okay";
> +                        compatible = "riscv";
> +                        riscv,isa = "rv64imafdc";
> +                        mmu-type = "riscv,sv48";
> +                        clock-frequency = <0x3b9aca00>;
> +                        interrupt-controller {
> +                                #interrupt-cells = <0x00000001>;

Trivial nit: this would be nicer as:

	#interrupt-cells = <1>;


Thanks,
Mark.
