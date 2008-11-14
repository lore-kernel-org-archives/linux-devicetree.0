From: Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Qemu-devel] Machine config files
Date: Fri, 14 Nov 2008 15:39:23 -0600
Message-ID: <200811141539.23408.hollisb@us.ibm.com>
References: <200811140332.14093.paul@codesourcery.com>
	<200811141351.40613.hollisb@us.ibm.com>
	<491DDB74.5070701@codemonkey.ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <491DDB74.5070701-rdkfGonbjUSkNkDKm+mE6A@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Anthony Liguori <anthony-rdkfGonbjUSkNkDKm+mE6A@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 14 November 2008 14:11:32 Anthony Liguori wrote:
> Hollis Blanchard wrote:
> > We do; PLB, OPB, and EBC are all on-chip busses found on IBM PowerPC SoCs. 
For 
> > example, you can see devices representing the UARTs and PCI controller in 
our 
> > bamboo.dts file. Qemu only modifies the device tree at runtime with 
> > information not known until then (memory size, clock frequency, etc).
> >   
> 
> Yes, but you don't build the machine based on the device tree.  What 
> would be useful would be to be able to simply write a device tree 
> description and that would fully represent the board such that you 
> didn't need a ppc440_bamboo.c file at all.
> 
> So what I'm getting at is, what is preventing us from being able to do 
> this today?

Theoretically, nothing. If qemu were a clean and modular place, it would 
probably be pretty straightforward.

Some translation code would be required for compatibility. For example, when 
the DTS has 128MB of memory, and the user invokes qemu with -m 256, now you 
need to update the device tree in order to pass it into the guest. That's 
pretty easy, but once you start talking about adding PCI devices it gets a 
little more difficult. I seem to recall this conversation was had on 
qemu-devel a little while back.

Of course, *some* code would still be needed *somewhere* to load the kernel, 
initrd, set initial register state to point to those memory locations, etc. 
In the case of KVM on 440, we also need to override the DTS with the real 
host clock frequency. (This probably isn't necessary for qemu+TCG.)

But yes, replacing all the pci_nic_init(), isa_mmio_init(), 
cpu_register_physical_memory(), etc could be automated by walking the device 
tree.

-- 
Hollis Blanchard
IBM Linux Technology Center
