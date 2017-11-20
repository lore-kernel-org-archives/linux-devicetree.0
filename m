From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [patches] Re: [PATCH] dt-bindings: Add a RISC-V SBI firmware node
Date: Mon, 20 Nov 2017 13:28:01 -0800 (PST)
Message-ID: <mhng-4a3ed3c5-a562-427c-817e-cd897789d5c0@palmer-si-x1c4>
References: <20171120202856.nptoirhm5luiamt7@latitude>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171120202856.nptoirhm5luiamt7@latitude>
Sender: linux-kernel-owner@vger.kernel.org
Cc: mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, patches@groups.riscv.org, linux-kernel@vger.kernel.org, j.neuschaefer@gmx.net
List-Id: devicetree@vger.kernel.org

On Mon, 20 Nov 2017 12:28:56 PST (-0800), j.neuschaefer@gmx.net wrote:
> On Mon, Nov 20, 2017 at 11:50:00AM -0800, Palmer Dabbelt wrote:
>> The RISC-V privileged ISA mandates the presence of an SBI, but there's
>> no reason not to put it in the device tree.  This would allow us to
>> possibly remove the SBI later.
>
> Thanks!
>
>> 
>> CC: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> ---
>>  .../devicetree/bindings/firmware/riscv.sbi.txt       | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/firmware/riscv.sbi.txt
>> 
>> diff --git a/Documentation/devicetree/bindings/firmware/riscv.sbi.txt b/Documentation/devicetree/bindings/firmware/riscv.sbi.txt
>> new file mode 100644
>> index 000000000000..42384d5d52cf
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/firmware/riscv.sbi.txt
>
> Nit: Other bindings use either a comma (as in the compatible string,
> "riscv,sbi.txt") or a dash (vendor-product.txt, "riscv-sbi.txt") in the
> file name.

That was just a typo, I'll fix it.

>> @@ -0,0 +1,20 @@
>> +RISC-V Supervisor Binary Interface (SBI)
>> +
>> +The RISC-V privileged ISA specification mandates the presence of a supervisor
>> +binary interface that performs some operations which might otherwise require
>> +particularly complicated instructions.  This interface includes
>> +inter-processor interrupts, TLB flushes, i-cache and TLB shootdowns, a
>> +console, and power management.
>> +
>> +Required properties:
>> +- compatible: must contain one of the following
>> + * "riscv,sbi" for the SBI defined by the privileged specification of the
>> +   system.
>
> "of the system" seems to imply that different RISC-V systems (different
> RISC-V implementations) can have different privileged specifications.

Actually, that was intentional -- I wrote it this way because different RISC-V 
systems do have different privileged specifications.  The RISC-V specifications 
aren't frozen in time, they're just guaranteed to be compatible in the future.  
For example, the user ISA document has been updated multiple times (the C spec, 
eliminating some unspecified behavior) and will continue to be updated (V and 
other extensions, the memory model).  The privileged spec will be updated in a 
compatible way just like the user spec will be -- I know there's at least 
hypervisor support in the works, and I saw some things to remove undefined 
behavior go past as well.

In a similar fashion, the ABI and SBI will continue to evolve.  For example, 
we'll probably add new system calls to extend the user ABI and new hyper calls 
to extend the SBI.

> I think it's better to refer to concrete documents, that don't depend on
> the rest of the system, instead. Either:
>
>  * "riscv,sbi" for the SBI defined by the RISC-V Privileged ISA Specification.
>
> Or something like:
>
>  * "sifive,sbi" for the SBI defined by SiFive document XYZ.
>
>
> [ I know that there currently is no SBI spec, because the chapter has
>   been removed from the Priv Spec, but this can be fixed later, once
>   the final name of the document describing the SBI is clear. ]

Ya, well, that's just a bug :).  There'll eventually be a spec, but I don't 
think it changes the wording here.

>
>> +
>> +Example:
>> +
>> +firmware {
>> +	sbi {
>> +		compatible = "riscv,sbi";
>> +	};
>> +};
>> -- 
>
>
> Thanks,
> Jonathan Neuschäfer
>
> -- 
> You received this message because you are subscribed to the Google Groups "RISC-V Patches" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to patches+unsubscribe@groups.riscv.org.
> To post to this group, send email to patches@groups.riscv.org.
> Visit this group at https://groups.google.com/a/groups.riscv.org/group/patches/.
> To view this discussion on the web visit https://groups.google.com/a/groups.riscv.org/d/msgid/patches/20171120202856.nptoirhm5luiamt7%40latitude.
> For more options, visit https://groups.google.com/a/groups.riscv.org/d/optout.
