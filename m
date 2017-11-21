From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [patches] Re: [PATCH] dt-bindings: Add a RISC-V SBI firmware node
Date: Tue, 21 Nov 2017 09:41:15 -0800 (PST)
Message-ID: <mhng-d0210e77-9069-4eb2-885e-812ee9af4d8c@palmer-si-x1c4>
References: <20171121010843.4nmndskaoslqcyyh@latitude>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171121010843.4nmndskaoslqcyyh@latitude>
Sender: linux-kernel-owner@vger.kernel.org
Cc: patches@groups.riscv.org, j.neuschaefer@gmx.net, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 20 Nov 2017 17:08:44 PST (-0800), j.neuschaefer@gmx.net wrote:
> On Mon, Nov 20, 2017 at 01:28:01PM -0800, Palmer Dabbelt wrote:
>> > > @@ -0,0 +1,20 @@
>> > > +RISC-V Supervisor Binary Interface (SBI)
>> > > +
>> > > +The RISC-V privileged ISA specification mandates the presence of a supervisor
>> > > +binary interface that performs some operations which might otherwise require
>> > > +particularly complicated instructions.  This interface includes
>> > > +inter-processor interrupts, TLB flushes, i-cache and TLB shootdowns, a
>> > > +console, and power management.
>> > > +
>> > > +Required properties:
>> > > +- compatible: must contain one of the following
>> > > + * "riscv,sbi" for the SBI defined by the privileged specification of the
>> > > +   system.
>> > 
>> > "of the system" seems to imply that different RISC-V systems (different
>> > RISC-V implementations) can have different privileged specifications.
>> 
>> Actually, that was intentional -- I wrote it this way because different
>> RISC-V systems do have different privileged specifications.  The RISC-V
>> specifications aren't frozen in time, they're just guaranteed to be
>> compatible in the future.  For example, the user ISA document has been
>> updated multiple times (the C spec, eliminating some unspecified behavior)
>> and will continue to be updated (V and other extensions, the memory model).
>> The privileged spec will be updated in a compatible way just like the user
>> spec will be -- I know there's at least hypervisor support in the works, and
>> I saw some things to remove undefined behavior go past as well.
>> 
>> In a similar fashion, the ABI and SBI will continue to evolve.  For example,
>> we'll probably add new system calls to extend the user ABI and new hyper
>> calls to extend the SBI.
>
> My problem with the wording was that the OS somehow has to know which
> version and variant of the SBI it is talking to -- either through
> in-band communication (an SBI call to request SBI information, etc.), or
> through devicetree or similar mechanisms.

The idea here is that rather than checking for a version of the SBI, you just 
check for various features as you need them.
