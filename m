From: Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: Machine config files
Date: Fri, 14 Nov 2008 15:58:19 -0600
Message-ID: <491DF47B.9000602@codemonkey.ws>
References: <200811140332.14093.paul@codesourcery.com>
	<200811141351.40613.hollisb@us.ibm.com>
	<491DDB74.5070701@codemonkey.ws>
	<200811141539.23408.hollisb@us.ibm.com>
Reply-To: qemu-devel@nongnu.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
In-Reply-To: <200811141539.23408.hollisb@us.ibm.com>
List-Unsubscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/pipermail/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Errors-To: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
To: Hollis Blanchard <hollisb@us.ibm.com>
Cc: devicetree-discuss@ozlabs.org, qemu-devel@nongnu.org, Paul Brook <paul@codesourcery.com>
List-Id: devicetree@vger.kernel.org

Hollis Blanchard wrote:
> On Friday 14 November 2008 14:11:32 Anthony Liguori wrote:
>   
> Theoretically, nothing. If qemu were a clean and modular place, it would 
> probably be pretty straightforward.
>
> Some translation code would be required for compatibility. For example, when 
> the DTS has 128MB of memory, and the user invokes qemu with -m 256, now you 
> need to update the device tree in order to pass it into the guest. That's 
> pretty easy, but once you start talking about adding PCI devices it gets a 
> little more difficult. I seem to recall this conversation was had on 
> qemu-devel a little while back.
>   

The way I would expect that it would work is that you could invoke QEMU 
with a device tree or it would by default use a device tree "template".  
The options like '-m' would modify the device tree template.  There's 
probably no need to differentiate between a user supplied device tree 
and a device tree template.

> Of course, *some* code would still be needed *somewhere* to load the kernel, 
> initrd, set initial register state to point to those memory locations, etc. 
> In the case of KVM on 440, we also need to override the DTS with the real 
> host clock frequency. (This probably isn't necessary for qemu+TCG.)
>
> But yes, replacing all the pci_nic_init(), isa_mmio_init(), 
> cpu_register_physical_memory(), etc could be automated by walking the device 
> tree.
>   

Ok.  This is starting to look interesting.  Paul, what do you think of DTS?

Regards,

Anthony Liguori
