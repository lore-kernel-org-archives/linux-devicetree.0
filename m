From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: Interruption on PCI Bus
Date: Wed, 15 Apr 2009 22:50:18 -1000
Message-ID: <49E6F14A.9010800@firmworks.com>
References: <49E6E542.5090504@fr.thalesgroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <49E6E542.5090504-s/S/64wAxt+H1Tvi1vFFB9BPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Simon Desfarges <simon.desfarges-s/S/64wAxt+H1Tvi1vFFB9BPR1lH4CV8@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Hi everybody,
>
> I am working on a custom board and I started to map the Interruptions 
> of the PCI on the dts file as follow:
>
> pci@70000000 {
>     compatible = "abac-pci";
>     device_type = "pci";
>
>     #size-cells = <2>;
>     #address-cells = <3>;
>     #interrupt-cells = <1>;
>     reg = <0x20021000 0x1000>;
>     bus-range = <0 1>;
>     ranges = < /*Memory-space 1:1 mapping*/
>         0x2000000 0x0 0x90000000 0x90000000 0x0 0x10000000
>         /*No IO-space*/
>         0x1000000 0x0 0x00000000 0x00000000 0x0 0x00000000
>             >;
>     clock-frequency = <66666666>;
>     interrupt-parent = <&IT_controller>;
>
>     interrupts = <0xd>;
>     interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
>            
>     interrupt-map = <
>         /* IDSEL 15 - only 1 slot with 1 IT*/
>         0x7800 0x0 0x0 0x1 &IT_controller  0xd
>         >;
>         };
>
> I have some questions about interrupt mapping:
> - If I understood well, when Linux wants to map its internal 
> interruptions, it generates a PCI address, masks it with the 
> <interrupt-map-mask> field and compares the result with the 
> <interrupt-map> field. But where do this address come from ?


The PCI address that is applied to the interrupt map is the first entry 
in the PCI child device's "reg" property, i.e. the entry that represents 
the device's PCI config registers.  Since the first three components of 
interrupt-map-mask are 0xf800 0 0, the only bits within that address 
that matter correspond to the configuration space device# and 
function#.  So the important thing is the "slot" that the PCI device is 
"plugged into" - or for the case of soldered-down devices, the IDSEL 
line that's connected to the device.

> When in the startup the interrupt mapping is done (in which part of 
> code) ? Is it automatic or have I to do that manually during PCI 
> initialization ?

I can't say for sure what Linux does, but the working group's intention 
was to make it possible for platform-independent OS code to 
automatically discover the total interrupt routing plan for the platform 
by traversing the interrupt tree.  Ideally, an individual driver should 
not have to do anything special, just call a bus-relative interrupt 
attach function with a bus-relative interrupt token, and let the common 
code work out the details.

>
> - I have read that in the config. space of PCI device, there is a 
> "PCI_INTERRUPT_LINE" which gives to the driver the interrupt number. 
> So I wonder who (Linux or U-Boot ?) and when this field is filled ?

The intended use of the interrupt line register was that the BIOS or 
other platform firmware would work out, in a platform-dependent way, 
which system IRQ (i.e. an interrupt number resolved all the way back to 
the root interrupt controller) is used by this device.  The PCI bus was 
designed primarily by Intel and other companies in the PC space, so 
there's a lot of stuff that caters to particular requirements and 
restrictions of legacy PC systems and legacy software.

In a system with proper device tree support, there really should be no 
need for the interrupt line register.  The fundamental information is 
the interrupt pin that the device connects to, along with the slot#.  
 From that, plus the interrupt tree, common platform code can resolve 
the interrupt back to the root controller dynamically.  There should be 
no need for the "hint about the final answer" in the interrupt line 
register.

But legacy PC software didn't have the benefit of device trees with 
interrupt maps, so the solution was for the BIOS to figure it out from  
platform knowledge hardcoded into that platform's BIOS and stick the 
answer into the hardware register, where the driver could pick it up and 
hand it back to an OS routine to attach the interrupt.

Conventional BIOSes do that, or used to.  I don't know if U-Boot does.  
In the presence of interrupt-map properties and OS code to traverse the 
interrupt tree, the value in the interrupt line register shouldn't 
matter.  But software history dies hard, so perhaps it does matter.  It 
doesn't matter at the device hardware level - setting that register 
doesn't cause the hardware to do anything different.  The value is just 
there so the OS driver can pick up the value and know which root 
interrupt to ask for (i.e. the one that the device actually interrupts on).

On modern systems, the assignment of PCI slot interrupt pins to root 
IRQs can be dynamic, based on programmable interrupt mapping hardware.  
The OS can dynamically juggle the interrupt assignment according to 
whatever policy it chooses.  When that is the case, the OS might 
overwrite the value that the BIOS put there.

Sorry for being so vague.  As the person who originally devised this 
interrupt tree stuff, I'm pretty sure about the intention, but much less 
sure about what specific versions of Linux and U-Boot actually do.  
Hopefully someone else can give you a definitive answer about that.


>
> Thank you for your attention.
>
> Simon Desfarges
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
> https://ozlabs.org/mailman/listinfo/devicetree-discuss 
