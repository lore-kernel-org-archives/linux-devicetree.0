MIME-Version: 1.0
In-Reply-To: <mhng-53fb904e-d47e-4887-b661-560a8dd25313@palmer-si-x1c4>
References: <20171121110451.qm5cy5s4audfvwu5@lakrids.cambridge.arm.com>
	<mhng-53fb904e-d47e-4887-b661-560a8dd25313@palmer-si-x1c4>
Date: Tue, 28 Nov 2017 13:41:01 -0600
Message-ID: <CAL_Jsq+2U-Bz2_FEJWcdCAdHhvsF0MdDWPOP14wDj-4Wh2CYzw@mail.gmail.com>
Subject: Re: [patches] Re: [PATCH] dt-bindings: Add an enable method to RISC-V
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, patches@groups.riscv.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Nov 22, 2017 at 11:11 AM, Palmer Dabbelt <palmer@sifive.com> wrote:
> On Tue, 21 Nov 2017 03:04:52 PST (-0800), mark.rutland@arm.com wrote:
>>
>> Hi Palmer,
>>
>> On Mon, Nov 20, 2017 at 11:50:22AM -0800, Palmer Dabbelt wrote:
>>>
>>> RISC-V doesn't currently specify a mechanism for enabling or disabling
>>> CPUs.  Instead, we assume that all CPUs are enabled on boot, and if
>>> someone wants to save power we instead put a CPU to sleep via a WFI
>>> loop.
>>>
>>> This patch adds "enable-method" to the RISC-V CPU binding, which
>>> currently only has the value "none".  This allows us to change the
>>> enable method in the future.
>>
>>
>> I think you might want to be a bit more explicit about what this means,
>> and this could do with a better name, as "none" sounds like the CPU is
>> unusable, rather than it having been placed within the kernel already by
>> the FW/bootloader (which IIUC is what happens currently).
>
>
> It was proposed to make "enable-method" optional, and have the lack of an
> enable method signify the current scheme.  The current scheme is that the
> bootloader starts every hart at the kernel's entry point.
>
> Calling this "always-enabled" was also suggested, which seems fine to me.
>
>> As previosuly commented, I also really think you'll want to define a
>> simple boot protocol (like PPC spin-table) whereby the kernel can bring
>> each CPU into the kernel independently. That will save you a lot of pain
>> in future with things like kexec, suspend/resume, etc.
>>
>> For arm64 we had a spin-table clone (implemented in our boot-wrapper
>> firmware) that allowed us to bring CPUs into the kernel explicitly.
>> However, we made the mistake of allowing CPUs to share a mailbox, and we
>> couldn't tell how many CPUs were stuck in the kernel at any point in
>> time (rendering kexec, suspend, etc impossible).
>
>
> This is actually why I'm kind of pushing back on this: because we don't know
> how we're actually going to handle this, I don't want to go build an
> interface to the firmware that might be broken.  Essentially what we're
> doing now is just keeping the spin table entirely within Linux, so we can
> change this interface whenever we want.  The start of our kernel looks like
>
>  _start(char *dtb_pointer, long hartid)
>    if (atomic_increment_return(hart_lottery) == 0)
>      start_kernel()
>    else
>      while (READ_ONCE(__cpu_up_has_turned_on_hart[hartid]) == 0)
>        wait_for_interrupt()
>      smp_callin()
>
> If I understand correctly, this is essentially what the spin tables are
> doing in arm64.  Our mechanism is a bit different because we can expose a
> much more complicated interface here, but since the interface can change
> (it's a kernel-internal interface, not a firmware->kernel interface) that's
> the natural thing to do.
>
> While I haven't actually gone through and looked at any of this (and I admit
> I have only a vague idea of how it works), I think this should work fine for
> kexec, CPU hotplug, and suspend.  kexec is easy: the fresh kernel's image
> will boot exactly like a regular one, as all the harts can just jump to the
> entry point at the same time.  Since "hart_lottery" is initialized to 0 by
> the ELF there isn't anything special required to make it work.
>
> Actually turning off harts will require us to add an interface that does so,
> which will probably happen via an SBI call.  We haven't actually designed
> the interface yet, but I'm assuming it'll just reset the hart.  In general,
> we like to make any interface that sleeps also work as a NOP, so for now
> let's just pretend that this interface does nothing and go straight
> to_start.  This should map pretty well, our __cpu_down could just be the
> mirror of __cpu_up
>
>  __cpu_down(int hartid)
>    __cpu_up_has_turned_on_hart[hartid] = false;
>    atomic_decrement(hart_lottery);
>    __sbi_suspend_hart();
>    jump _start
>
> That should cover hotplug, and then suspend is just a matter of hotplugging
> out the last CPU.  I assume that lots of our stuff will blow up when we
> start removing harts at runtime, but that'll all happen regardless of how we
> wake them up.  There's also a bit of a race here (bringing up a hart while
> the last one is suspending), and that counter overflows, but those seem
> solvable.
>
> Does that sound sane?  If not, I'd be happy to go and design a spin table
> firmware interface.  We just like to avoid inventing external interfaces
> until we really know what we're doing :).
>
>
>> Thanks,
>> Mark.
>>
>>> CC: Mark Rutland <mark.rutland@arm.com>
>>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>>> ---
>>>  Documentation/devicetree/bindings/riscv/cpus.txt | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt
>>> b/Documentation/devicetree/bindings/riscv/cpus.txt
>>> index adf7b7af5dc3..dd9e1ae197e2 100644
>>> --- a/Documentation/devicetree/bindings/riscv/cpus.txt
>>> +++ b/Documentation/devicetree/bindings/riscv/cpus.txt
>>> @@ -82,6 +82,11 @@ described below.
>>>                  Value type: <string>
>>>                  Definition: Contains the RISC-V ISA string of this hart.
>>> These
>>>                              ISA strings are defined by the RISC-V ISA
>>> manual.
>>> +        - cpu-enable-method:
>>> +               Usage: required
>>> +               Value type: <stringlist>
>>> +               Definition: Must be one of
>>> +                       "none": This CPU's state cannot be changed.
>>>
>>>  Example: SiFive Freedom U540G Development Kit
>>>  ---------------------------------------------
>>> @@ -105,6 +110,7 @@ Linux is allowed to run on.
>>>                          reg = <0>;
>>>                          riscv,isa = "rv64imac";
>>>                          status = "disabled";
>>> +                        enable-method = "none";
>>>                          L10: interrupt-controller {
>>>                                  #interrupt-cells = <1>;
>>>                                  compatible = "riscv,cpu-intc";
>>> @@ -130,6 +136,7 @@ Linux is allowed to run on.
>>>                          reg = <1>;
>>>                          riscv,isa = "rv64imafdc";
>>>                          status = "okay";
>>> +                        enable-method = "none";
>>>                          tlb-split;
>>>                          L13: interrupt-controller {
>>>                                  #interrupt-cells = <1>;
>>> --
>>> 2.13.6
>>>
>
