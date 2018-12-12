From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFT PATCH v1 2/4] dt-binding: cpu-topology: Move cpu-map to a
 common binding.
Date: Wed, 12 Dec 2018 10:23:24 -0800
Message-ID: <1d8fffe7-824e-9c2b-1444-491abe9056a4@wdc.com>
References: <1543534100-3654-1-git-send-email-atish.patra@wdc.com>
 <1543534100-3654-3-git-send-email-atish.patra@wdc.com>
 <20181212023122.GB14213@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212023122.GB14213@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Dmitriy Cherkasov <dmitriy@oss-tech.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, Juri Lelli <juri.lelli@arm.com>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Morten Rasmussen <morten.rasmussen@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Peter Z
List-Id: devicetree@vger.kernel.org

On 12/11/18 6:31 PM, Rob Herring wrote:
> On Thu, Nov 29, 2018 at 03:28:18PM -0800, Atish Patra wrote:
>> cpu-map binding can be used to described cpu topology for both
>> RISC-V & ARM. It makes more sense to move the binding to document
>> to a common place.
>>
>> The relevant discussion can be found here.
>> https://lkml.org/lkml/2018/11/6/19
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>   .../{arm/topology.txt => cpu/cpu-topology.txt}     | 81 ++++++++++++++++++----
>>   1 file changed, 67 insertions(+), 14 deletions(-)
>>   rename Documentation/devicetree/bindings/{arm/topology.txt => cpu/cpu-topology.txt} (86%)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/topology.txt b/Documentation/devicetree/bindings/cpu/cpu-topology.txt
>> similarity index 86%
>> rename from Documentation/devicetree/bindings/arm/topology.txt
>> rename to Documentation/devicetree/bindings/cpu/cpu-topology.txt
>> index 66848355..1de6fbce 100644
>> --- a/Documentation/devicetree/bindings/arm/topology.txt
>> +++ b/Documentation/devicetree/bindings/cpu/cpu-topology.txt
>> @@ -1,12 +1,12 @@
>>   ===========================================
>> -ARM topology binding description
>> +CPU topology binding description
>>   ===========================================
>>   
>>   ===========================================
>>   1 - Introduction
>>   ===========================================
>>   
>> -In an ARM system, the hierarchy of CPUs is defined through three entities that
>> +In a SMP system, the hierarchy of CPUs is defined through three entities that
>>   are used to describe the layout of physical CPUs in the system:
>>   
>>   - socket
>> @@ -14,9 +14,6 @@ are used to describe the layout of physical CPUs in the system:
>>   - core
>>   - thread
>>   
>> -The cpu nodes (bindings defined in [1]) represent the devices that
>> -correspond to physical CPUs and are to be mapped to the hierarchy levels.
>> -
>>   The bottom hierarchy level sits at core or thread level depending on whether
>>   symmetric multi-threading (SMT) is supported or not.
>>   
>> @@ -25,33 +22,37 @@ threads existing in the system and map to the hierarchy level "thread" above.
>>   In systems where SMT is not supported "cpu" nodes represent all cores present
>>   in the system and map to the hierarchy level "core" above.
>>   
>> -ARM topology bindings allow one to associate cpu nodes with hierarchical groups
>> +CPU topology bindings allow one to associate cpu nodes with hierarchical groups
>>   corresponding to the system hierarchy; syntactically they are defined as device
>>   tree nodes.
>>   
>> -The remainder of this document provides the topology bindings for ARM, based
>> -on the Devicetree Specification, available from:
>> +Currently, only ARM/RISC-V intend to use this cpu topology binding but it may be
>> +used for any other architecture as well.
>>   
>> -https://www.devicetree.org/specifications/
>> +The remainder of this document provides the topology bindings for ARM/RISC-V, based
> 
> You already said who are current users, why restrict it to ARM and
> RISC-V here?
> 
I will remove that. The examples are only for ARM/RISC-V specific.


>> +on the Devicetree Specification, available at [4].
>> +
>> +The cpu nodes (bindings defined in [1] for ARM or [2] for RISC-V) represent the devices that
>> +correspond to physical CPUs and are to be mapped to the hierarchy levels.
> 
> The cpu topology isn't dependent on anything beyond what the DT spec
> says for cpu nodes so I think this can be simplified to just refer to
> the spec.
> 

ok sure.

> Plus, shouldn't [2] (numa) be [3] here.
> 

My bad.

>>   If not stated otherwise, whenever a reference to a cpu node phandle is made its
>>   value must point to a cpu node compliant with the cpu node bindings as
>> -documented in [1].
>> +documented in [1] or [3] for respective ISA.
>>   A topology description containing phandles to cpu nodes that are not compliant
>> -with bindings standardized in [1] is therefore considered invalid.
>> +with bindings standardized in [1] or [3] is therefore considered invalid.
>>   
>>   ===========================================
>>   2 - cpu-map node
>>   ===========================================
>>   
>> -The ARM CPU topology is defined within the cpu-map node, which is a direct
>> +The ARM/RISC-V CPU topology is defined within the cpu-map node, which is a direct
>>   child of the cpus node and provides a container where the actual topology
>>   nodes are listed.
>>   
>>   - cpu-map node
>>   
>> -	Usage: Optional - On ARM SMP systems provide CPUs topology to the OS.
>> -			  ARM uniprocessor systems do not require a topology
>> +	Usage: Optional - On SMP systems provide CPUs topology to the OS.
>> +			  Uniprocessor systems do not require a topology
>>   			  description and therefore should not define a
>>   			  cpu-map node.
>>   
>> @@ -494,8 +495,60 @@ cpus {
>>   	};
>>   };
>>   
>> +Example 3: HiFive Unleashed (RISC-V 64 bit, 4 core system)
>> +
>> +cpus {
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>> +	compatible = "sifive,fu540g", "sifive,fu500";
>> +	model = "sifive,hifive-unleashed-a00";
> 
> This is wrong. Looks like the root node, but called 'cpus'.
> 
Yeah it got mixed up. I will fix it in v2.

>> +
>> +	...
>> +
>> +	cpu-map {
>> +		cluster0 {
>> +			core0 {
>> +				cpu = <&L12>;
>> +		 	};
> 
> Mixed space and tabs.
> 
>> +			core1 {
>> +				cpu = <&L15>;
>> +			};
>> +			core2 {
>> +				cpu0 = <&L18>;
>> +			};
>> +			core3 {
>> +				cpu0 = <&L21>;
>> +			};
>> +		};
>> + 	};
> 
> Mixed space and tab.
> 

Sorry. I will fix this.

Thanks for the review.

Regards,
Atish

>> +
>> +	L12: cpu@1 {
>> +		device_type = "cpu";
>> +		compatible = "sifive,rocket0", "riscv";
>> +		reg = <0x1>;
>> +	}
>> +
>> +	L15: cpu@2 {
>> +		device_type = "cpu";
>> +		compatible = "sifive,rocket0", "riscv";
>> +		reg = <0x2>;
>> +	}
>> +	L18: cpu@3 {
>> +		device_type = "cpu";
>> +		compatible = "sifive,rocket0", "riscv";
>> +		reg = <0x3>;
>> +	}
>> +	L21: cpu@4 {
>> +		device_type = "cpu";
>> +		compatible = "sifive,rocket0", "riscv";
>> +		reg = <0x4>;
>> +	}
>> +};
>>   ===============================================================================
>>   [1] ARM Linux kernel documentation
>>       Documentation/devicetree/bindings/arm/cpus.txt
>>   [2] Devicetree NUMA binding description
>>       Documentation/devicetree/bindings/numa.txt
>> +[3] RISC-V Linux kernel documentation
>> +    Documentation/devicetree/bindings/riscv/cpus.txt
>> +[4] https://www.devicetree.org/specifications/
>> -- 
>> 2.7.4
>>
> 
