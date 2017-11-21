From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [patches] Re: [PATCH] dt-bindings: Add a RISC-V SBI firmware node
Date: Tue, 21 Nov 2017 09:37:02 -0800 (PST)
Message-ID: <mhng-dadf76d9-0823-4fc8-9177-1772629573b6@palmer-si-x1c4>
References: <20171120214520.dcaqvyncojwefmgt@rob-hp-laptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171120214520.dcaqvyncojwefmgt@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org, j.neuschaefer@gmx.net
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, patches@groups.riscv.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 20 Nov 2017 13:45:20 PST (-0800), robh@kernel.org wrote:
> On Mon, Nov 20, 2017 at 11:50:00AM -0800, Palmer Dabbelt wrote:
>> The RISC-V privileged ISA mandates the presence of an SBI, but there's
>> no reason not to put it in the device tree.  This would allow us to
>> possibly remove the SBI later.
>
> If it is mandatory, then it should not be in DT. DT is not a driver
> instantiation mechanism.
>
> If your ISA can vary, I'd recommend you make that discoverable. DT is
> for what we failed to make discoverable.

OK, that makes sense.  Since this the presence of an SBI is mandated by the ISA 
there's no way to discover it (just like there's no way to discover a load 
instruction).  For extensibility reasons you can, of course, determine which 
SBI calls are implemented, but this mechanism assumes you have something 
running to catch the SBI calls on the other end (SBI calls are just system 
calls from the Linux).  I think the original goal here was to avoid an SBI 
entirely, which isn't something the ISA is designed for.

This isn't really a big deal to me, as I'm only interested in RISC-V systems, 
but there's been some pushback on the concept of an SBI so it seemed like a 
simple way to allow people to build non-SBI (and there for not really RISC-V) 
systems.  One option that wouldn't require a device tree node would be to have 
Linux boot in machine mode (where the SBI implementation lives on systems 
without a hypervisor, if you've got a hypervisor then I assume the SBI isn't a 
problem) and then provide its own SBI implementation.  This wouldn't impose any 
additional burden: if there's no SBI then Linux will need to start in machine 
mode because that's where you need to be in order to do the things the SBI 
implementation needs to go.  This will be awkward to implement, but having a 
device tree entry won't help with any of that.

I think the right thing to do here is just not define a device tree entry.
