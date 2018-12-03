From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [RFT PATCH v1 2/4] dt-binding: cpu-topology: Move cpu-map to a
 common binding.
Date: Mon, 3 Dec 2018 17:33:06 +0000
Message-ID: <20181203173306.GF17883@e107155-lin>
References: <1543534100-3654-1-git-send-email-atish.patra@wdc.com>
 <1543534100-3654-3-git-send-email-atish.patra@wdc.com>
 <20181203165521.GB17883@e107155-lin>
 <f902086b-09e1-ad85-d191-137708f5b105@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f902086b-09e1-ad85-d191-137708f5b105@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Dmitriy Cherkasov <dmitriy@oss-tech.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, Juri Lelli <juri.lelli@arm.com>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Morten Rasmussen <morten.rasmussen@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Peter Z
List-Id: devicetree@vger.kernel.org

On Mon, Dec 03, 2018 at 09:23:42AM -0800, Atish Patra wrote:
> On 12/3/18 8:55 AM, Sudeep Holla wrote:
> > On Thu, Nov 29, 2018 at 03:28:18PM -0800, Atish Patra wrote:
> > > cpu-map binding can be used to described cpu topology for both
> > > RISC-V & ARM. It makes more sense to move the binding to document
> > > to a common place.
> > > 
> > > The relevant discussion can be found here.
> > > https://lkml.org/lkml/2018/11/6/19
> > > 
> > 
> > Looks good to me apart from a minor query below in the example.
> > 
> > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> > 
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > ---
> > >   .../{arm/topology.txt => cpu/cpu-topology.txt}     | 81 ++++++++++++++++++----
> > >   1 file changed, 67 insertions(+), 14 deletions(-)
> > >   rename Documentation/devicetree/bindings/{arm/topology.txt => cpu/cpu-topology.txt} (86%)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/arm/topology.txt b/Documentation/devicetree/bindings/cpu/cpu-topology.txt
> > > similarity index 86%
> > > rename from Documentation/devicetree/bindings/arm/topology.txt
> > > rename to Documentation/devicetree/bindings/cpu/cpu-topology.txt
> > > index 66848355..1de6fbce 100644
> > > --- a/Documentation/devicetree/bindings/arm/topology.txt
> > > +++ b/Documentation/devicetree/bindings/cpu/cpu-topology.txt
> > 
> > [...]
> > 
> > > +Example 3: HiFive Unleashed (RISC-V 64 bit, 4 core system)
> > > +
> > > +cpus {
> > > +	#address-cells = <2>;
> > > +	#size-cells = <2>;
> > > +	compatible = "sifive,fu540g", "sifive,fu500";
> > > +	model = "sifive,hifive-unleashed-a00";
> > > +
> > > +	...
> > > +
> > > +	cpu-map {
> > > +		cluster0 {
> > > +			core0 {
> > > +				cpu = <&L12>;
> > > +		 	};
> > > +			core1 {
> > > +				cpu = <&L15>;
> > > +			};
> > > +			core2 {
> > > +				cpu0 = <&L18>;
> > > +			};
> > > +			core3 {
> > > +				cpu0 = <&L21>;
> > > +			};
> > > +		};
> > > + 	};
> > > +
> > > +	L12: cpu@1 {
> > > +		device_type = "cpu";
> > > +		compatible = "sifive,rocket0", "riscv";
> > > +		reg = <0x1>;
> > > +	}
> > > +
> > > +	L15: cpu@2 {
> > > +		device_type = "cpu";
> > > +		compatible = "sifive,rocket0", "riscv";
> > > +		reg = <0x2>;
> > > +	}
> > > +	L18: cpu@3 {
> > > +		device_type = "cpu";
> > > +		compatible = "sifive,rocket0", "riscv";
> > > +		reg = <0x3>;
> > > +	}
> > > +	L21: cpu@4 {
> > > +		device_type = "cpu";
> > > +		compatible = "sifive,rocket0", "riscv";
> > > +		reg = <0x4>;
> > > +	}
> > > +};
> > 
> > The labels for the CPUs drew my attention. Is it intentionally random
> > (or even specific) or just chosen to show anything can be used as labels ?
> 
> SiFive generates the device tree from RTL directly. So I am not sure if they
> assign random numbers or a particular algorithm chooses the label. I tried
> to put the exact ones that is available publicly.
> 
> https://github.com/riscv/riscv-device-tree-doc/blob/master/examples/sifive-hifive_unleashed-microsemi.dts

Cool, love that. So you don't have the problem I was trying to explain.
But I still see the possibility of some other RISC-V vendor copy-pasting
from here ;). Anyways it's left to you.

--
Regards,
Sudeep
