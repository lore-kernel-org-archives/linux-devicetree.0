From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: mapping a PCI bus
Date: Thu, 12 Mar 2009 08:20:56 -1000
Message-ID: <49B95288.3060604@firmworks.com>
References: <49B8E583.3070108@fr.thalesgroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <49B8E583.3070108-s/S/64wAxt+H1Tvi1vFFB9BPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Nicolas Lavocat <nicolas.lavocat-s/S/64wAxt+H1Tvi1vFFB9BPR1lH4CV8@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

>  Hello!
> Thanks a lot for all these explanations! they are very helpful! I have 
> understood the meaning of each fields of "ranges", but I don't know 
> where find informations to fill it... I don't find any reference about 
> memory space and iopace ranges in my datasheets.


The information should be in the documentation for the chip that 
implements the host-to-PCI bridge function - a chip like Tundra Tsi110 .

The host bridge chip is probably programmable.  If so you must choose a 
range of system bus addresses to use for PCI.  The firmware will need to 
program the host bridge chip registers that control that address 
assignment.  The dts ranges property will then report that information.

> I have read in the PCI specification that the base address register 
> (BAR) permit to get the memory range needed by each device on the PCI 
> bus. Have I to get the memory range of every device in order to fill 
> the range property ? I feel that I missed something...
No, the ranges property is independent of BAR assignments on PCI devices.

The value of the ranges property is established once, as part of the 
system design process.  The values of individual device BARs can change 
from boot to boot, depending on which cards are plugged in.

>
> To finish, I have a question about the "reg" field. I have read in 
> documentations that it must contain the address of the PCI bridge's 
> configuration space: am I wrong?

For a PCI host bridge (the "/pci" node itself): the "reg" property 
contains the address of the bridge's register bank *in the system bus 
address space*.  In general, that is not a configuration space address, 
because the main system bus is usually not a PCI bus.  For PPC 74xx 
processors, the main system bus is the "60x bus" that comes out of the 
CPU chip.

For a PCI device (something that plugs into a PCI bus, with a name like 
/pci/ethernet): the reg property includes the device's PCI configuration 
address.  That configuration address depends on the PCI slot, so for 
plug-in cards, the reg property must be created dynamically during the 
probing process.

For a PCI-to-PCI bridge (a node like /pci/pci): the reg property of the 
lower bridge contains its configuration address in the upper PCI address 
space.

As you can see, the general rule is that the "reg" property specifies an 
address in the "parent" address space, whatever that is.  So a PCI host 
bridge's "reg" property does not have a PCI configuration address, 
because its parent is not a PCI bus, but rather the main system bus.

> Thanks for Your attention !
>
> Nicolas Lavocat
>
